<?php

namespace Botble\Base\Forms\FieldTypes;

use Botble\Base\Traits\Forms\CanSpanColumns;

class CheckableType extends \Kris\LaravelFormBuilder\Fields\CheckableType
{
    use CanSpanColumns;
}
