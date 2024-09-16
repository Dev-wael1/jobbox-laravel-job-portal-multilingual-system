<?php

use Botble\Base\Enums\BaseStatusEnum;
use Botble\JobBoard\Models\Category;
use Botble\JobBoard\Models\Job;
use Botble\JobBoard\Repositories\Interfaces\JobInterface;

if (! function_exists('get_latest_jobs')) {
    function get_latest_jobs(int $limit = 10)
    {
        $with = ['slugable'];

        if (is_plugin_active('location')) {
            $with = array_merge($with, ['city', 'state']);
        }

        return Job::query()
            ->active()
            ->orderBy('jb_jobs.created_at', 'DESC')
            ->with($with)
            ->take($limit)
            ->get();
    }
}

if (! function_exists('count_active_jobs')) {
    function count_active_jobs()
    {
        return app(JobInterface::class)->countActiveJobs();
    }
}

if (! function_exists('get_job_categories')) {
    function get_job_categories(int $limit = 10)
    {
        return Category::query()
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->orderBy('order', 'DESC')
            ->orderBy('created_at', 'DESC')
            ->take($limit)
            ->with(['slugable'])
            ->get();
    }
}
