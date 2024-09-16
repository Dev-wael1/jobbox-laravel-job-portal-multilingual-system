@extends(BaseHelper::getAdminMasterLayoutTemplate())

@section('content')
    <x-core::alert type="warning">
        {{ trans('plugins/translation::translation.theme_translations_instruction') }}
    </x-core::alert>

    <x-core::card class="theme-translation">
        <x-core::card.header>
            <x-core::card.title>{{ trans('plugins/translation::translation.theme-translations') }}</x-core::card.title>
        </x-core::card.header>
        <x-core::card.body class="box-translation">
            <div class="row">
                <div class="col-md-6">
                    <p>{{ trans('plugins/translation::translation.translate_from') }}
                        <strong class="text-info">{{ $defaultLanguage ? $defaultLanguage['name'] : 'en' }}</strong>
                        {{ trans('plugins/translation::translation.to') }}
                        <strong class="text-info">{{ $group['name'] }}</strong>
                    </p>
                </div>
                <div class="col-md-6">
                    <div class="text-end">
                        @include(
                            'plugins/translation::partials.list-theme-languages-to-translate',
                            ['groups' => $groups, 'group' => $group, 'route' => 'translations.theme-translations']
                        )
                    </div>
                </div>
            </div>

            @if (count($groups) < 1)
                <p class="text-warning">{{ trans('plugins/translation::translation.no_other_languages') }}</p>
            @endif
        </x-core::card.body>

        @if (count($groups) > 0 && $group)
            {!! apply_filters('translation_theme_translation_header', null, $groups, $group) !!}

            {!! $translationTable->renderTable() !!}
        @endif
    </x-core::card>
@endsection
