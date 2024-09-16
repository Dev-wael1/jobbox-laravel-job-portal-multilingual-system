<?php

namespace Botble\Widget\Forms;

use Botble\Base\Forms\FormAbstract;
use Botble\Base\Models\BaseModel;

class WidgetForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(BaseModel::class)
            ->contentOnly();
    }

    public function renderForm(array $options = [], $showStart = false, $showFields = true, $showEnd = false): string
    {
        return parent::renderForm($options, $showStart, $showFields, $showEnd);
    }
}
