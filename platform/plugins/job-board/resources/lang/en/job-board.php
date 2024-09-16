<?php

return [
    'name' => 'Job Board',
    'settings' => 'Settings',
    'emails' => [
        'title' => 'Job Board',
        'description' => 'Job Board email configuration',
        'templates' => [
            'admin_new_job_application_title' => 'New job application (to admin users)',
            'admin_new_job_application_description' => 'Email template to send notice to administrators when system get new job application',
            'employer_new_job_application_title' => 'New job application (to employer and colleagues)',
            'employer_new_job_application_description' => 'Email template to send notice to employer and colleagues when system get new job application',
        ],
    ],
    'job-attributes' => 'Job Attributes',
    'theme_options' => [
        'name' => 'Job Board',
        'description' => 'Theme options for Job Board',
        'logo_employer_dashboard' => 'Logo in the employer dashboard (Default is the main logo)',
        'default_company_cover_image' => 'Default company cover image',
        'default_company_logo' => 'Default company logo (Default is the main logo)',
        'job_companies_page_id' => 'Job companies page',
        'job_categories_page_id' => 'Job categories page',
        'job_candidates_page_id' => 'Job candidates page',
        'job_list_page_id' => 'Job list page',
    ],
    'jobs_page' => 'Jobs Page',
    'categories_page' => 'Job Categories Page',
    'companies_page' => 'Job Companies Page',
    'candidates_page' => 'Job Candidates Page',
];
