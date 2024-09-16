<?php

namespace Botble\Table\BulkActions;

use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Exceptions\DisabledInDemoModeException;
use Botble\Base\Facades\BaseHelper;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Base\Models\BaseModel;
use Botble\Table\Abstracts\TableBulkActionAbstract;
use Illuminate\Database\Eloquent\Model;

class DeleteBulkAction extends TableBulkActionAbstract
{
    public function __construct()
    {
        $this
            ->label(trans('core/table::table.delete'))
            ->confirmationModalButton(trans('core/table::table.delete'))
            ->beforeDispatch(function () {
                if (BaseHelper::hasDemoModeEnabled()) {
                    throw new DisabledInDemoModeException();
                }
            });
    }

    public function dispatch(BaseModel|Model $model, array $ids): BaseHttpResponse
    {
        $model->newQuery()->whereKey($ids)->each(function (BaseModel $item) {
            $item->delete();

            DeletedContentEvent::dispatch($item::class, request(), $item);
        });

        return BaseHttpResponse::make()
            ->withDeletedSuccessMessage();
    }
}
