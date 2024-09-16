<?php

namespace Botble\Location\Listeners;

use Botble\Language\Facades\Language;
use Botble\Location\Events\ImportedCityEvent;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class CreateCityTranslationListener
{
    public function handle(ImportedCityEvent $event): void
    {
        if (! defined('LANGUAGE_MODULE_SCREEN_NAME')) {
            return;
        }

        $languages = Language::getActiveLanguage(['lang_code', 'lang_is_default']);

        /** @var \Botble\Language\Models\Language $language */
        foreach ($languages as $language) {
            if ($language->lang_is_default) {
                continue;
            }

            $row = $event->row;

            DB::table('cities_translations')->insertOrIgnore([
                'cities_id' => $event->city->getKey(),
                'lang_code' => $language->lang_code,
                'name' => $name = Arr::get($row, "name_$language->lang_code", Arr::get($row, 'name')),
                'slug' => Str::slug($name),
            ]);
        }
    }
}
