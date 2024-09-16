<?php

use Botble\Base\Facades\AdminHelper;
use Botble\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'Botble\Contact\Http\Controllers'], function () {
    AdminHelper::registerRoutes(function () {
        Route::group(['prefix' => 'contacts', 'as' => 'contacts.'], function () {
            Route::resource('', 'ContactController')->except(['create', 'store'])->parameters(['' => 'contact']);

            Route::post('reply/{contact}', [
                'as' => 'reply',
                'uses' => 'ContactController@postReply',
                'permission' => 'contacts.edit',
            ])->wherePrimaryKey();
        });

        Route::group(['prefix' => 'settings'], function () {
            Route::get('contact', [
                'as' => 'contact.settings',
                'uses' => 'Settings\ContactSettingController@edit',
            ]);

            Route::put('contact', [
                'as' => 'contact.settings.update',
                'uses' => 'Settings\ContactSettingController@update',
                'permission' => 'contact.settings',
            ]);
        });
    });

    if (defined('THEME_MODULE_SCREEN_NAME')) {
        Theme::registerRoutes(function () {
            Route::post('contact/send', [
                'as' => 'public.send.contact',
                'uses' => 'PublicController@postSendContact',
            ]);
        });
    }
});
