<?php

namespace Botble\JobBoard\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class CustomFieldOption extends BaseModel
{
    protected $table = 'jb_custom_field_options';

    protected $fillable = [
        'custom_field_id',
        'label',
        'value',
        'order',
    ];

    protected $casts = [
        'order' => 'int',
        'label' => SafeContent::class,
        'value' => SafeContent::class,
    ];

    public function customField(): BelongsTo
    {
        return $this->belongsTo(CustomField::class);
    }
}
