<?php

namespace Database\Seeders;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Facades\MetaBox;
use Botble\Base\Supports\BaseSeeder;
use Botble\JobBoard\Enums\ModerationStatusEnum;
use Botble\JobBoard\Enums\SalaryRangeEnum;
use Botble\JobBoard\Models\Account;
use Botble\JobBoard\Models\CareerLevel;
use Botble\JobBoard\Models\Company;
use Botble\JobBoard\Models\Currency;
use Botble\JobBoard\Models\DegreeLevel;
use Botble\JobBoard\Models\FunctionalArea;
use Botble\JobBoard\Models\Job;
use Botble\JobBoard\Models\JobApplication;
use Botble\JobBoard\Models\JobShift;
use Botble\JobBoard\Models\JobSkill;
use Botble\JobBoard\Models\JobType;
use Botble\JobBoard\Models\Tag;
use Botble\Slug\Facades\SlugHelper;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;

class JobSeeder extends BaseSeeder
{
    public function run(): void
    {
        $this->uploadFiles('jobs');

        Job::query()->truncate();
        Tag::query()->truncate();
        JobApplication::query()->truncate();
        DB::table('jb_jobs_categories')->truncate();
        DB::table('jb_jobs_skills')->truncate();
        DB::table('jb_jobs_types')->truncate();
        DB::table('jb_jobs_tags')->truncate();

        $data = [
            'UI / UX Designer full-time',
            'Full Stack Engineer',
            'Java Software Engineer',
            'Digital Marketing Manager',
            'Frontend Developer',
            'React Native Web Developer',
            'Senior System Engineer',
            'Products Manager',
            'Lead Quality Control QA',
            'Principal Designer, Design Systems',
            'DevOps Architect',
            'Senior Software Engineer, npm CLI',
            'Senior Systems Engineer',
            'Software Engineer Actions Platform',
            'Staff Engineering Manager, Actions',
            'Staff Engineering Manager: Actions Runtime',
            'Staff Engineering Manager, Packages',
            'Staff Software Engineer',
            'Systems Software Engineer',
            'Senior Compensation Analyst',
            'Senior Accessibility Program Manager',
            'Analyst Relations Manager, Application Security',
            'Senior Enterprise Advocate, EMEA',
            'Deal Desk Manager',
            'Director, Revenue Compensation',
            'Program Manager',
            'Sr. Manager, Deal Desk - INTL',
            'Senior Director, Product Management, Actions Runners and Compute Services',
            'Alliances Director',
            'Corporate Sales Representative',
            'Country Leader',
            'Customer Success Architect',
            'DevOps Account Executive - US Public Sector',
            'Enterprise Account Executive',
            'Senior Engineering Manager, Product Security Engineering - Paved Paths',
            'Customer Reliability Engineer III',
            'Support Engineer (Enterprise Support Japanese)',
            'Technical Partner Manager',
            'Sr Manager, Inside Account Management',
            'Services Sales Representative',
            'Services Delivery Manager',
            'Senior Solutions Engineer',
            'Senior Service Delivery Engineer',
            'Senior Director, Global Sales Development',
            'Partner Program Manager',
            'Principal Cloud Solutions Engineer',
            'Senior Cloud Solutions Engineer',
            'Senior Customer Success Manager',
            'Inside Account Manager',
            'UX Jobs Board',
            'Senior Laravel Developer (TALL Stack)',
        ];

        $tags = [
            'Illustrator',
            'Adobe XD',
            'Figma',
            'Sketch',
            'Lunacy',
            'PHP',
            'Python',
            'JavaScript',
        ];

        foreach ($tags as $tag) {
            $tag = Tag::query()->create([
                'name' => $tag,
                'description' => '',
                'status' => BaseStatusEnum::PUBLISHED,
            ]);

            SlugHelper::createSlug($tag);
        }

        $jobTypeCount = JobType::query()->count();
        $jobExperienceCount = JobType::query()->count();
        $jobSkillCount = JobSkill::query()->count();
        $jobTagCount = Tag::query()->count();
        $careerLevelCount = CareerLevel::query()->count();
        $currencyCount = Currency::query()->count();
        $degreeLevelCount = DegreeLevel::query()->count();
        $jobShiftCount = JobShift::query()->count();
        $functionalAreaCount = FunctionalArea::query()->count();

        $fake = $this->fake();

        $content = '<h5>Responsibilities</h5>
                <div>
                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>
                    <ul>
                        <li>Have sound knowledge of commercial activities.</li>
                        <li>Build next-generation web applications with a focus on the client side</li>
                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>
                        <li>have already graduated or are currently in any year of study</li>
                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>
                    </ul>
                </div>
                <h5>Qualification </h5>
                <div>
                    <ul>
                        <li>B.C.A / M.C.A under National University course complete.</li>
                        <li>3 or more years of professional design experience</li>
                        <li>have already graduated or are currently in any year of study</li>
                        <li>Advanced degree or equivalent experience in graphic and web design</li>
                    </ul>
                </div>';

        $companies = Company::all();
        foreach ($data as $index => $item) {
            $company = $companies->random();
            $data = [
                'name' => $item,
                'description' => $fake->text(),
                'content' => $content,
                'company_id' => $company->id,
                'city_id' => $company->city_id,
                'state_id' => $company->state_id,
                'country_id' => $company->country_id,
                'latitude' => $company->latitude,
                'longitude' => $company->longitude,
                'job_experience_id' => rand(1, $jobExperienceCount),
                'career_level_id' => rand(1, $careerLevelCount),
                'currency_id' => rand(1, $currencyCount),
                'degree_level_id' => rand(1, $degreeLevelCount),
                'job_shift_id' => rand(1, $jobShiftCount),
                'functional_area_id' => rand(1, $functionalAreaCount),
                'salary_from' => $salaryFrom = round(rand(500, 10000), -2),
                'salary_to' => $salaryFrom + round(rand(500, 10000), -2),
                'salary_range' => Arr::random(SalaryRangeEnum::values()),
                'number_of_positions' => rand(2, 10),
                'never_expired' => rand(0, 1),
                'is_featured' => rand(0, 1),
                'moderation_status' => ModerationStatusEnum::APPROVED,
                'author_id' => 1,
                'author_type' => Account::class,
                'created_at' => $fake->dateTimeBetween('-2 months'),
                'apply_url' => $index == 1 ? 'https://google.com' : null,
                'hide_company' => false,
                'expire_date' => $fake->dateTimeBetween('+5 days', '+2 months'),
            ];

            $job = Job::query()->create($data);

            $job->categories()->attach([1, rand(2, 5), rand(6, 10)]);
            $job->skills()->attach([rand(1, $jobSkillCount)]);
            $job->jobTypes()->attach([rand(1, $jobTypeCount)]);
            $job->tags()->sync([rand(1, $jobTagCount / 2), rand(($jobTagCount / 2) + 1, $jobTagCount)]);

            SlugHelper::createSlug($job);

            MetaBox::saveMetaBoxData(
                $job,
                'featured_image',
                'jobs/img' . (($index + 1) > 9 ? rand(1, 9) : ($index + 1)) . '.png'
            );
        }
    }
}
