<?php

namespace Botble\Installer\Http\Controllers;

use Botble\Base\Http\Controllers\BaseController;
use Botble\Installer\Http\Requests\ChooseThemeRequest;
use Botble\Installer\Services\ImportDatabaseService;
use Botble\Theme\Facades\Manager;
use Botble\Theme\Facades\Theme;
use Carbon\Carbon;
use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\URL;

class ThemeController extends BaseController
{
    public function __construct()
    {
        $this->middleware(function (Request $request, Closure $next) {
            if (count(Manager::getThemes()) < 2) {
                abort(404);
            }

            return $next($request);
        });
    }

    public function index(Request $request): View|RedirectResponse
    {
        if (! URL::hasValidSignature($request)) {
            return redirect()->route('installers.requirements.index');
        }

        $themes = collect(Manager::getThemes())->mapWithKeys(function ($theme, $key) {
            return [$key => [
                'label' => $theme['name'],
                'image' => Theme::getThemeScreenshot($key),
            ]];
        })->all();

        return view('packages/installer::theme', compact('themes'));
    }

    public function store(ChooseThemeRequest $request, ImportDatabaseService $importDatabaseService): RedirectResponse
    {
        $databaseToImport = base_path(sprintf('database-%s.sql', $request->input('theme')));

        if (! File::exists($databaseToImport)) {
            $databaseToImport = base_path('database.sql');
        }

        $importDatabaseService->handle($databaseToImport);

        return redirect()
            ->to(URL::temporarySignedRoute('installers.accounts.index', Carbon::now()->addMinutes(30)));
    }
}
