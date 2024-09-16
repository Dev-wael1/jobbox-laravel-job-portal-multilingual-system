<?php

namespace Botble\JobBoard\Forms;

use Botble\Base\Facades\Assets;
use Botble\Base\Facades\BaseHelper;
use Botble\Base\Forms\FieldOptions\DescriptionFieldOption;
use Botble\Base\Forms\Fields\TextareaField;
use Botble\Base\Forms\FormAbstract;
use Botble\JobBoard\Enums\AccountGenderEnum;
use Botble\JobBoard\Enums\AccountTypeEnum;
use Botble\JobBoard\Facades\JobBoardHelper;
use Botble\JobBoard\Http\Requests\AccountCreateRequest;
use Botble\JobBoard\Models\Account;
use Botble\Location\Fields\Options\SelectLocationFieldOption;
use Botble\Location\Fields\SelectLocationField;
use Botble\Slug\Facades\SlugHelper;

class AccountForm extends FormAbstract
{
    public function setup(): void
    {
        Assets::addScriptsDirectly('vendor/core/plugins/job-board/js/account-admin.js');

        $this
            ->setupModel(new Account())
            ->setValidatorClass(AccountCreateRequest::class)
            ->template('plugins/job-board::accounts.form')
            ->add('first_name', 'text', [
                'label' => trans('plugins/job-board::account.form.first_name'),
                'required' => true,
                'attr' => [
                    'placeholder' => trans('core/base::forms.name_placeholder'),
                    'data-counter' => 120,
                ],
            ])
            ->add('last_name', 'text', [
                'label' => trans('plugins/job-board::account.form.last_name'),
                'required' => true,
                'attr' => [
                    'placeholder' => trans('core/base::forms.name_placeholder'),
                    'data-counter' => 120,
                ],
            ])
            ->add('email', 'text', [
                'label' => trans('plugins/job-board::account.form.email'),
                'required' => true,
                'attr' => [
                    'placeholder' => __('Ex: example@gmail.com'),
                    'data-counter' => 60,
                ],
            ])
            ->add('description', TextareaField::class, DescriptionFieldOption::make()->toArray())
            ->add('bio', 'editor', [
                'label' => __('Bio'),
            ])
            ->when(is_plugin_active('location'), function (FormAbstract $form) {
                $form->add(
                    'location_data',
                    SelectLocationField::class,
                    SelectLocationFieldOption::make()->toArray()
                );
            })
            ->add('address', 'text', [
                'label' => trans('plugins/job-board::account.form.address'),
                'attr' => [
                    'data-counter' => 120,
                ],
            ])
            ->add('phone', 'text', [
                'label' => trans('plugins/job-board::account.form.phone'),
                'attr' => [
                    'data-counter' => 20,
                ],
            ])
            ->add('dob', 'datePicker', [
                'label' => trans('plugins/job-board::account.form.date_of_birth'),
                'value' => $this->getModel()->id ? BaseHelper::formatDate($this->getModel()->dob) : '',
            ])
            ->add('is_change_password', 'onOff', [
                'label' => trans('plugins/job-board::account.form.change_password'),
                'value' => false,
                'attr' => [
                    'data-bb-toggle' => 'collapse',
                    'data-bb-target' => '#change-password',
                ],
            ])
            ->add('openRow', 'html', [
                'html' => '<div id="change-password" class="row"' . ($this->getModel(
                )->id ? ' style="display: none"' : null) . '>',
            ])
            ->add('password', 'password', [
                'label' => trans('plugins/job-board::account.form.password'),
                'required' => true,
                'attr' => [
                'data-counter' => 60,
                ],
                'wrapper' => [
                'class' => $this->formHelper->getConfig('defaults.wrapper_class') . ' col-md-6',
                ],
            ])
            ->add('password_confirmation', 'password', [
                'label' => trans('plugins/job-board::account.form.password_confirmation'),
                'required' => true,
                'attr' => [
                'data-counter' => 60,
                ],
                'wrapper' => [
                'class' => $this->formHelper->getConfig('defaults.wrapper_class') . ' col-md-6',
                ],
            ])
            ->add('closeRow', 'html', [
                'html' => '</div>',
            ])
            ->add('type', 'customSelect', [
                'label' => trans('plugins/job-board::account.type'),
                'required' => true,
                'choices' => AccountTypeEnum::labels(),
            ])
            ->add('available_for_hiring', 'onOff', [
                'label' => trans('plugins/job-board::account.form.available_for_hiring'),
            ])
            ->when(! JobBoardHelper::isDisabledPublicProfile(), function (FormAbstract $form) {
                $form
                    ->add('is_public_profile', 'onOff', [
                        'label' => trans('plugins/job-board::account.form.is_public_profile'),
                    ])
                    ->add('hide_cv', 'onOff', [
                        'label' => trans('plugins/job-board::account.form.hide_cv'),
                    ]);
            })
            ->setBreakFieldPoint('type')
            ->add('is_featured', 'onOff', [
                'label' => trans('core/base::forms.is_featured'),
                'default_value' => false,
            ])
            ->add('gender', 'customSelect', [
                'label' => trans('plugins/job-board::account.form.gender'),
                'choices' => AccountGenderEnum::labels(),
                'empty_value' => __('-- select --'),
            ])
            ->add('avatar_image', 'mediaImage', [
                'label' => trans('plugins/job-board::account.form.avatar_image'),
                'value' => $this->getModel()->avatar->url,
            ])
            ->add('resume', 'mediaFile', [
                'label' => trans('plugins/job-board::account.form.resume'),
                'value' => $this->getModel()->resume,
            ]);

        if ($this->model->id && $this->model->isJobSeeker()) {
            $this->addMetaBoxes([
                'educations' => [
                    'title' => __('Educations'),
                    'content' => view('plugins/job-board::accounts.educations', [
                        'educations' => $this->model->educations()->get(),
                    ])->render(),
                    'attributes' => [
                        'id' => 'educations-table',
                    ],
                    'header_actions' => view('plugins/job-board::accounts.header-actions-button', [
                        'modalTarget' => '#add-education-modal',
                        'label' => trans('plugins/job-board::account.add_education'),
                    ])->render(),
                    'has_table' => true,
                ],
            ]);

            $this->addMetaBoxes([
                'experiences' => [
                    'title' => __('Experiences'),
                    'content' => view('plugins/job-board::accounts.experiences', [
                        'experiences' => $this->model->experiences()->get(),
                    ])->render(),
                    'attributes' => [
                        'id' => 'experiences-table',
                    ],
                    'header_actions' => view('plugins/job-board::accounts.header-actions-button', [
                        'modalTarget' => '#add-experience-modal',
                        'label' => trans('plugins/job-board::account.add_experience'),
                    ])->render(),
                    'has_table' => true,
                ],
            ]);
        }

        if ($this->model->id && $this->model->isEmployer()) {
            SlugHelper::removeModule(Account::class);

            $this->addMetaBoxes([
                'credits' => [
                    'attributes' => [
                        'id' => 'credit-histories',
                    ],
                    'title' => trans('plugins/job-board::account.transactions'),
                    'subtitle' => __('Credits: :count', ['count' => number_format($this->getModel()->credits)]),
                    'header_actions' => view('plugins/job-board::accounts.header-actions-button', [
                        'modalTarget' => '#add-credit-modal',
                        'label' => trans('plugins/job-board::account.add_credit'),
                    ])->render(),
                    'content' => view('plugins/job-board::accounts.credits', [
                        'account' => $this->model,
                        'transactions' => $this->model->transactions()->orderByDesc('created_at')->get(),
                    ])->render(),
                ],
            ]);
        }
    }
}
