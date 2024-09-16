<?php

namespace Botble\Setting\Http\Controllers\Concerns;

use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Setting\Facades\Setting;

trait InteractsWithSettings
{
    protected bool $forceSaveSettings = false;

    protected function saveSettings(array $data, string $prefix = ''): void
    {
        foreach ($data as $settingKey => $settingValue) {
            if (is_array($settingValue)) {
                $settingValue = json_encode(array_filter($settingValue));
            }

            Setting::set($prefix . $settingKey, (string) $settingValue, $this->forceSaveSettings);
        }

        Setting::save();
    }

    protected function performUpdate(array $data, string $prefix = ''): BaseHttpResponse
    {
        $this->saveSettings($data, $prefix);

        if (! method_exists($this, 'httpResponse')) {
            return BaseHttpResponse::make();
        }

        return $this
            ->httpResponse()
            ->withUpdatedSuccessMessage();
    }
}
