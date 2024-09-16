<?php

namespace Botble\Theme\Http\Controllers;

use Botble\Base\Facades\Assets;
use Botble\Base\Facades\BaseHelper;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Supports\Breadcrumb;
use Botble\Setting\Http\Controllers\Concerns\InteractsWithSettings;
use Botble\Theme\Events\RenderingThemeOptionSettings;
use Botble\Theme\Facades\Manager;
use Botble\Theme\Facades\Theme;
use Botble\Theme\Facades\ThemeOption;
use Botble\Theme\Forms\CustomCSSForm;
use Botble\Theme\Forms\CustomHTMLForm;
use Botble\Theme\Forms\CustomJSForm;
use Botble\Theme\Http\Requests\CustomCssRequest;
use Botble\Theme\Http\Requests\CustomHtmlRequest;
use Botble\Theme\Http\Requests\CustomJsRequest;
use Botble\Theme\Services\ThemeService;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\File;

class ThemeController extends BaseController
{
    use InteractsWithSettings;

    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('packages/theme::theme.appearance'));
    }

    public function index()
    {
        $this->pageTitle(trans('packages/theme::theme.name'));

        if (File::exists(theme_path('.DS_Store'))) {
            File::delete(theme_path('.DS_Store'));
        }

        Assets::addScriptsDirectly('vendor/core/packages/theme/js/theme.js');

        $themes = Manager::getThemes();

        return view('packages/theme::list', compact('themes'));
    }

    public function getOptions()
    {
        $this->pageTitle(trans('packages/theme::theme.theme_options'));

        Assets::addScripts(['are-you-sure', 'jquery-ui'])
            ->addStylesDirectly([
                'vendor/core/packages/theme/css/theme-options.css',
            ])
            ->addScriptsDirectly([
                'vendor/core/packages/theme/js/theme-options.js',
            ]);

        RenderingThemeOptionSettings::dispatch();

        do_action(RENDERING_THEME_OPTIONS_PAGE);

        return view('packages/theme::options');
    }

    public function postUpdate(Request $request)
    {
        RenderingThemeOptionSettings::dispatch();

        foreach ($request->except(['_token', 'ref_lang', 'ref_from']) as $key => $value) {
            if (is_array($value)) {
                $value = json_encode($value);

                $field = ThemeOption::getField($key);

                if ($field && Arr::get($field, 'clean_tags', true)) {
                    $value = BaseHelper::clean(strip_tags((string)$value));
                }
            }

            ThemeOption::setOption($key, $value);
        }

        ThemeOption::saveOptions();

        return $this
            ->httpResponse()
            ->withUpdatedSuccessMessage();
    }

    public function postActivateTheme(Request $request, ThemeService $themeService)
    {
        if (! config('packages.theme.general.display_theme_manager_in_admin_panel', true)) {
            abort(404);
        }

        $result = $themeService->activate($request->input('theme'));

        if ($result['error']) {
            return $this
                ->httpResponse()
                ->setError()->setMessage($result['message']);
        }

        return $this
            ->httpResponse()
            ->setMessage(trans('packages/theme::theme.active_success'));
    }

    public function getCustomCss()
    {
        $this->pageTitle(trans('packages/theme::theme.custom_css'));

        return CustomCSSForm::create()->renderForm();
    }

    public function postCustomCss(CustomCssRequest $request)
    {
        File::delete(theme_path(Theme::getThemeName() . '/public/css/style.integration.css'));

        $file = Theme::getStyleIntegrationPath();
        $css = $request->input('custom_css');
        $css = strip_tags((string)$css);

        if (empty($css)) {
            File::delete($file);
        } else {
            $saved = BaseHelper::saveFileData($file, $css, false);

            if (! $saved) {
                return $this
                    ->httpResponse()
                    ->setError()
                    ->setMessage(
                        trans('packages/theme::theme.folder_is_not_writeable', ['name' => File::dirname($file)])
                    );
            }
        }

        return $this
            ->httpResponse()
            ->withUpdatedSuccessMessage();
    }

    public function getCustomJs()
    {
        if (! config('packages.theme.general.enable_custom_js')) {
            abort(404);
        }

        $this->pageTitle(trans('packages/theme::theme.custom_js'));

        return CustomJSForm::create()->renderForm();
    }

    public function postCustomJs(CustomJsRequest $request)
    {
        if (! config('packages.theme.general.enable_custom_js')) {
            abort(404);
        }

        return $this->performUpdate($request->validated());
    }

    public function postRemoveTheme(Request $request, ThemeService $themeService)
    {
        if (! config('packages.theme.general.display_theme_manager_in_admin_panel', true)) {
            abort(404);
        }

        $theme = strtolower($request->input('theme'));

        if (in_array($theme, BaseHelper::scanFolder(theme_path()))) {
            try {
                $result = $themeService->remove($theme);

                if ($result['error']) {
                    return $this
                        ->httpResponse()
                        ->setError()->setMessage($result['message']);
                }

                return $this
                    ->httpResponse()
                    ->setMessage(trans('packages/theme::theme.remove_theme_success'));
            } catch (Exception $exception) {
                return $this
                    ->httpResponse()

                    ->setError()
                    ->setMessage($exception->getMessage());
            }
        }

        return $this
            ->httpResponse()
            ->setError()
            ->setMessage(trans('packages/theme::theme.theme_is_not_existed'));
    }

    public function getCustomHtml()
    {
        if (! config('packages.theme.general.enable_custom_html')) {
            abort(404);
        }

        $this->pageTitle(trans('packages/theme::theme.custom_html'));

        return CustomHTMLForm::create()->renderForm();
    }

    public function postCustomHtml(CustomHtmlRequest $request)
    {
        if (! config('packages.theme.general.enable_custom_html')) {
            abort(404);
        }

        $data = [];

        foreach ($request->validated() as $key => $value) {
            $data[$key] = BaseHelper::clean($value);
        }

        return $this->performUpdate($data);
    }
}
