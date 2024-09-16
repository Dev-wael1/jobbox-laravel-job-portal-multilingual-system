<?php

namespace Botble\Translation\Services;

use Botble\Base\Facades\BaseHelper;
use Botble\Theme\Facades\Theme;
use Botble\Translation\Manager;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\File;

class CreateLocaleService
{
    public function handle(string $locale): void
    {
        $manager = app(Manager::class);

        $result = $manager->downloadRemoteLocale($locale);

        $manager->publishLocales();

        if ($result['error']) {
            $defaultLocale = lang_path('en');

            if (File::exists($defaultLocale)) {
                File::copyDirectory($defaultLocale, lang_path($locale));
            }

            $this->createLocaleFiles(lang_path('vendor/core'), $locale);
            $this->createLocaleFiles(lang_path('vendor/packages'), $locale);
            $this->createLocaleFiles(lang_path('vendor/plugins'), $locale);

            $themeLocale = Arr::first(BaseHelper::scanFolder(theme_path(Theme::getThemeName() . '/lang')));

            if ($themeLocale) {
                File::copy(
                    theme_path(Theme::getThemeName() . '/lang/' . $themeLocale),
                    lang_path($locale . '.json')
                );
            }
        }
    }

    protected function createLocaleFiles(string $locale, string $path): void
    {
        $folders = File::directories($path);

        foreach ($folders as $module) {
            foreach (File::directories($module) as $item) {
                if (File::name($item) == 'en') {
                    File::copyDirectory($item, $module . '/' . $locale);
                }
            }
        }
    }
}
