<?php

namespace Botble\JobBoard\Http\Resources;

use Botble\JobBoard\Models\CustomField;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * @mixin CustomField
 */
class CustomFieldResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'type' => $this->type->getValue(),
            'options' => $this->options,
        ];
    }
}
