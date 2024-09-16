<?php

namespace Database\Seeders;

use Botble\Base\Models\BaseModel;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Models\Category;
use Botble\Blog\Models\Post;
use Botble\Setting\Models\Setting;
use Botble\Slug\Facades\SlugHelper;
use Botble\Slug\Models\Slug;

class SettingSeeder extends BaseSeeder
{
    public function run(): void
    {
        $settings = [
            [
                'key' => 'media_random_hash',
                'value' => md5(time()),
            ],
            [
                'key' => SlugHelper::getPermalinkSettingKey(Post::class),
                'value' => 'blog',
            ],
            [
                'key' => SlugHelper::getPermalinkSettingKey(Category::class),
                'value' => 'blog',
            ],
            [
                'key' => 'payment_cod_status',
                'value' => 1,
            ],
            [
                'key' => 'payment_cod_description',
                'value' => 'Please pay money directly to the postman, if you choose cash on delivery method (COD).',
            ],
            [
                'key' => 'payment_bank_transfer_status',
                'value' => 1,
            ],
            [
                'key' => 'payment_bank_transfer_description',
                'value' => 'Please send money to our bank account: ACB - 69270 213 19.',
            ],
            [
                'key' => 'payment_stripe_payment_type',
                'value' => 'stripe_checkout',
            ],
        ];

        Setting::query()->whereIn('key', collect($settings)->pluck('key')->all())->delete();

        if (BaseModel::determineIfUsingUuidsForId()) {
            $settings = array_map(function ($item) {
                $item['id'] = BaseModel::newUniqueId();

                return $item;
            }, $settings);
        }

        Setting::query()->insert($settings);

        Slug::query()->where('reference_type', Post::class)->update(['prefix' => 'blog']);
        Slug::query()->where('reference_type', Category::class)->update(['prefix' => 'blog']);
    }
}
