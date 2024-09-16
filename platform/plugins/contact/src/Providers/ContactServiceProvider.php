<?php

namespace Botble\Contact\Providers;

use Botble\Base\Facades\DashboardMenu;
use Botble\Base\Facades\EmailHandler;
use Botble\Base\Facades\PanelSectionManager;
use Botble\Base\PanelSections\PanelSectionItem;
use Botble\Base\Supports\ServiceProvider;
use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\Contact\Models\Contact;
use Botble\Contact\Models\ContactReply;
use Botble\Contact\Repositories\Eloquent\ContactReplyRepository;
use Botble\Contact\Repositories\Eloquent\ContactRepository;
use Botble\Contact\Repositories\Interfaces\ContactInterface;
use Botble\Contact\Repositories\Interfaces\ContactReplyInterface;
use Botble\Setting\PanelSections\SettingOthersPanelSection;
use Illuminate\Routing\Events\RouteMatched;

class ContactServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(ContactInterface::class, function () {
            return new ContactRepository(new Contact());
        });

        $this->app->bind(ContactReplyInterface::class, function () {
            return new ContactReplyRepository(new ContactReply());
        });
    }

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/contact')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['permissions', 'email'])
            ->loadRoutes()
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadMigrations()
            ->publishAssets();

        DashboardMenu::default()->beforeRetrieving(function () {
            DashboardMenu::make()
                ->registerItem([
                    'id' => 'cms-plugins-contact',
                    'priority' => 120,
                    'name' => 'plugins/contact::contact.menu',
                    'icon' => 'ti ti-mail',
                    'route' => 'contacts.index',
                ]);
        });

        PanelSectionManager::default()->beforeRendering(function () {
            PanelSectionManager::registerItem(
                SettingOthersPanelSection::class,
                fn () => PanelSectionItem::make('contact')
                    ->setTitle(trans('plugins/contact::contact.settings.title'))
                    ->withIcon('ti ti-mail-cog')
                    ->withPriority(140)
                    ->withDescription(trans('plugins/contact::contact.settings.description'))
                    ->withRoute('contact.settings')
            );
        });

        $this->app['events']->listen(RouteMatched::class, function () {
            EmailHandler::addTemplateSettings(CONTACT_MODULE_SCREEN_NAME, config('plugins.contact.email', []));
        });

        $this->app->booted(function () {
            $this->app->register(HookServiceProvider::class);
        });
    }
}
