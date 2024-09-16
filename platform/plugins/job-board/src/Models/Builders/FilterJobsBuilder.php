<?php

namespace Botble\JobBoard\Models\Builders;

use Botble\Base\Models\BaseQueryBuilder;
use Botble\JobBoard\Facades\JobBoardHelper;
use Botble\Language\Facades\Language;
use Botble\Location\Facades\Location;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Arr;

class FilterJobsBuilder extends BaseQueryBuilder
{
    public function filterJobs(array $filters = []): self
    {
        $filters = array_merge([
            'keyword' => null,
            'location' => null,
            'city_id' => null,
            'state_id' => null,
            'job_categories' => [],
            'job_tags' => [],
            'job_types' => [],
            'job_experiences' => [],
            'job_skills' => [],
            'offered_salary_from' => null,
            'offered_salary_to' => null,
            'date_posted' => null,
            'page' => null,
            'per_page' => null,
        ], $filters);

        if ($keyword = Arr::get($filters, 'keyword')) {
            if (
                is_plugin_active('language') &&
                is_plugin_active('language-advanced') &&
                Language::getCurrentLocale() != Language::getDefaultLocale()
            ) {
                $this
                    ->where(function (BaseQueryBuilder $query) use ($keyword) {
                        $query
                            ->whereHas('translations', function (BaseQueryBuilder $query) use ($keyword) {
                                $query->addSearch('name', $keyword, false, false);
                            })
                            ->where(function (BaseQueryBuilder $query) use ($keyword) {
                                $query
                                    ->where('hide_company', false)
                                    ->orWhereHas('company', function (BaseQueryBuilder $query) use ($keyword) {
                                        $query->addSearch('name', $keyword, false, false);
                                    });
                            })
                            ->orWhereHas('tags.translations', function (BaseQueryBuilder $query) use ($keyword) {
                                $query->addSearch('name', $keyword, false, false);
                            })
                            ->orWhereHas('skills.translations', function (BaseQueryBuilder $query) use ($keyword) {
                                $query->addSearch('name', $keyword, false, false);
                            });
                    });
            } else {
                $this
                    ->where(function (BaseQueryBuilder $query) use ($keyword) {
                        $query
                            ->addSearch('name', $keyword, false, false)
                            ->where(function (BaseQueryBuilder $query) use ($keyword) {
                                $query
                                    ->where('hide_company', false)
                                    ->orWhereHas('company', function (BaseQueryBuilder $query) use ($keyword) {
                                        $query->addSearch('name', $keyword, false, false);
                                    });
                            })
                            ->orWhereHas('tags', function (BaseQueryBuilder $query) use ($keyword) {
                                $query->addSearch('name', $keyword, false, false);
                            })
                            ->orWhereHas('skills', function (BaseQueryBuilder $query) use ($keyword) {
                                $query->addSearch('name', $keyword, false, false);
                            });
                    });
            }
        }

        if (
            is_plugin_active('location')
            && ((int)Arr::get($filters, 'city_id') || (int)Arr::get($filters, 'state_id') || Arr::get($filters, 'location'))
        ) {
            Location::filter($this, (int)$filters['city_id'], $filters['location'], (int)$filters['state_id']);
        }

        $filters['job_categories'] = array_map('intval', array_filter($filters['job_categories']));

        if ($filters['job_categories']) {
            $this->whereHas('categories', function (Builder $query) use ($filters) {
                $query->whereIn('jb_categories.id', $filters['job_categories']);
            });
        }

        // Filter jobs by tag
        $filters['job_tags'] = array_map('intval', array_filter($filters['job_tags']));
        if ($filters['job_tags']) {
            $this->whereHas('tags', function (Builder $query) use ($filters) {
                $query->whereIn('jb_tags.id', $filters['job_tags']);
            });
        }
        // Filter job by types
        $filters['job_types'] = array_map('intval', array_filter($filters['job_types']));
        if ($filters['job_types']) {
            $this->whereHas('jobTypes', function ($query) use ($filters) {
                return $query->whereIn('jb_job_types.id', $filters['job_types']);
            });
        }

        // Filter job by experiences
        $filters['job_experiences'] = array_map('intval', array_filter($filters['job_experiences']));
        if ($filters['job_experiences']) {
            $this->whereIn('job_experience_id', $filters['job_experiences']);
        }

        // Filter job by offered salary
        if ($filters['offered_salary_from'] && $filters['offered_salary_from'] > 0) {
            $this
                ->where(function ($query) use ($filters) {
                    $query
                        ->whereNull('salary_from')
                        ->orWhere('salary_from', '>=', $filters['offered_salary_from']);
                });
        }

        if ($filters['offered_salary_to'] && $filters['offered_salary_to'] > 0) {
            $this
                ->where(function ($query) use ($filters) {
                    $query
                        ->whereNull('salary_to')
                        ->orWhere('salary_to', '<=', $filters['offered_salary_to']);
                });
        }

        // Filter job by skills
        $filters['job_skills'] = array_map('intval', array_filter($filters['job_skills']));
        if ($filters['job_skills']) {
            $this->whereHas('skills', function ($query) use ($filters) {
                return $query->whereIn('jb_job_skills.id', $filters['job_skills']);
            });
        }

        if ($filters['date_posted'] && $date = Arr::get(JobBoardHelper::postedDateRanges(), $filters['date_posted'])) {
            if ($start = Arr::get($date, 'start')) {
                $this->whereDate('jb_jobs.created_at', '<=', $start);
            }
            if ($end = Arr::get($date, 'end')) {
                $this->whereDate('jb_jobs.created_at', '>=', $end);
            }
        }

        $this->addSavedApplied();

        return $this;
    }
}
