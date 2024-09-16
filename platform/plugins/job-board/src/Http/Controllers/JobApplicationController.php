<?php

namespace Botble\JobBoard\Http\Controllers;

use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Http\Controllers\BaseController;
use Botble\JobBoard\Forms\JobApplicationForm;
use Botble\JobBoard\Http\Requests\EditJobApplicationRequest;
use Botble\JobBoard\Models\JobApplication;
use Botble\JobBoard\Tables\JobApplicationTable;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class JobApplicationController extends BaseController
{
    public function index(JobApplicationTable $table)
    {
        $this->pageTitle(trans('plugins/job-board::job-application.name'));

        return $table->renderTable();
    }

    public function edit(JobApplication $jobApplication)
    {
        $this->pageTitle(trans('plugins/job-board::job-application.edit'));

        return JobApplicationForm::createFromModel($jobApplication)->renderForm();
    }

    public function update(JobApplication $jobApplication, EditJobApplicationRequest $request)
    {
        $jobApplication->fill($request->input());
        $jobApplication->save();

        event(new UpdatedContentEvent(JOB_APPLICATION_MODULE_SCREEN_NAME, $request, $jobApplication));

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('job-applications.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(JobApplication $jobApplication, Request $request)
    {
        try {
            $jobApplication->delete();
            event(new DeletedContentEvent(JOB_APPLICATION_MODULE_SCREEN_NAME, $request, $jobApplication));

            return $this
                ->httpResponse()
                ->setMessage(trans('core/base::notices.delete_success_message'));
        } catch (Exception $exception) {
            return $this
                ->httpResponse()
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    public function downloadCv(int|string $id)
    {
        $jobApplication = JobApplication::query()->findOrFail($id);

        if ($jobApplication->resume) {
            return Storage::download($jobApplication->resume);
        }

        $account = $jobApplication->account;

        if ($account->id && $account->resume) {
            return Storage::download($account->resume);
        }

        return Storage::download($jobApplication->resume);
    }
}
