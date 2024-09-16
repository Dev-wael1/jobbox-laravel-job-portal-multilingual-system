<?php

namespace Botble\JobBoard\Http\Controllers;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Events\BeforeEditContentEvent;
use Botble\Base\Events\CreatedContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Facades\Assets;
use Botble\Base\Forms\FormAbstract;
use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Requests\UpdateTreeCategoryRequest;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\JobBoard\Forms\CategoryForm;
use Botble\JobBoard\Http\Requests\CategoryRequest;
use Botble\JobBoard\Models\Category;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CategoryController extends BaseController
{
    public function index(Request $request)
    {
        $this->pageTitle(trans('plugins/job-board::job-category.name'));

        $categories = Category::query()
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->orderBy('order')
            ->orderByDesc('created_at')
            ->get();

        $categories->loadMissing('slugable')->loadCount(['jobs']);

        if ($request->ajax()) {
            $data = view('core/base::forms.partials.tree-categories', $this->getOptions(compact('categories')))->render();

            return $this
                ->httpResponse()
                ->setData($data);
        }

        Assets::addStylesDirectly(['vendor/core/core/base/css/tree-category.css'])
            ->addScriptsDirectly(['vendor/core/core/base/js/tree-category.js']);

        $form = CategoryForm::create(['template' => 'core/base::forms.form-tree-category']);
        $form = $this->setFormOptions($form, null, compact('categories'));

        return $form->renderForm();
    }

    public function create(Request $request)
    {
        $this->pageTitle(trans('plugins/job-board::job-category.create'));

        if ($request->ajax()) {
            return $this
                ->httpResponse()
                ->setData($this->getForm());
        }

        return CategoryForm::create()->renderForm();
    }

    public function store(CategoryRequest $request)
    {
        if ($request->input('is_default')) {
            Category::query()->where('id', '>', 0)->update(['is_default' => 0]);
        }

        $category = Category::query()->create($request->input());

        event(new CreatedContentEvent(JOB_CATEGORY_MODULE_SCREEN_NAME, $request, $category));

        $repsonse = $this->httpResponse();

        if ($request->ajax()) {
            /** @var \Botble\JobBoard\Models\Category $category */
            $category = Category::query()->findOrFail($category->id);

            if ($request->input('submit') === 'save') {
                $form = $this->getForm();
            } else {
                $form = $this->getForm($category);
            }

            $repsonse->setData([
                'model' => $category,
                'form' => $form,
            ]);
        }

        return $repsonse
            ->setPreviousUrl(route('job-categories.index'))
            ->setNextUrl(route('job-categories.edit', $category->id))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    public function edit(Category $jobCategory, Request $request)
    {
        event(new BeforeEditContentEvent($request, $jobCategory));

        if ($request->ajax()) {
            return $this
                ->httpResponse()
                ->setData($this->getForm($jobCategory));
        }

        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $jobCategory->name]));

        return CategoryForm::createFromModel($jobCategory)->renderForm();
    }

    public function update(Category $jobCategory, CategoryRequest $request)
    {
        if ($request->input('is_default')) {
            Category::query()->where('id', '!=', $jobCategory->getKey())->update(['is_default' => 0]);
        }

        $jobCategory->fill($request->input());
        $jobCategory->save();

        event(new UpdatedContentEvent(JOB_CATEGORY_MODULE_SCREEN_NAME, $request, $jobCategory));

        $response = $this->httpResponse();

        if ($request->ajax()) {
            if ($request->input('submit') === 'save') {
                $form = $this->getForm();
            } else {
                $form = $this->getForm($jobCategory);
            }

            $response->setData([
                'model' => $jobCategory,
                'form' => $form,
            ]);
        }

        return $response
            ->setPreviousUrl(route('job-categories.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(Category $jobCategory, Request $request)
    {
        try {
            $jobCategory->delete();

            event(new DeletedContentEvent(JOB_CATEGORY_MODULE_SCREEN_NAME, $request, $jobCategory));

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

    public function updateTree(UpdateTreeCategoryRequest $request): BaseHttpResponse
    {
        Category::updateTree($request->validated('data'));

        return $this
            ->httpResponse()
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    protected function getForm(?Category $model = null)
    {
        $options = ['template' => 'core/base::forms.form-no-wrap'];

        if ($model) {
            $options['model'] = $model;
        }

        $form = app(FormBuilder::class)->create(CategoryForm::class, $options);

        $form = $this->setFormOptions($form, $model);

        return $form->renderForm();
    }

    protected function setFormOptions(FormAbstract $form, ?Category $model = null, array $options = [])
    {
        if (! $model) {
            $form->setUrl(route('job-categories.create'));
        }

        if (! Auth::user()->hasPermission('job-categories.create') && ! $model) {
            $class = $form->getFormOption('class');
            $form->setFormOption('class', $class . ' d-none');
        }

        $form->setFormOptions($this->getOptions($options));

        return $form;
    }

    protected function getOptions(array $options = [])
    {
        return array_merge([
            'canCreate' => Auth::user()->hasPermission('job-categories.create'),
            'canEdit' => Auth::user()->hasPermission('job-categories.edit'),
            'canDelete' => Auth::user()->hasPermission('job-categories.destroy'),
            'createRoute' => 'job-categories.create',
            'editRoute' => 'job-categories.edit',
            'deleteRoute' => 'job-categories.destroy',
            'updateTreeRoute' => 'job-categories.update-tree',
        ], $options);
    }
}
