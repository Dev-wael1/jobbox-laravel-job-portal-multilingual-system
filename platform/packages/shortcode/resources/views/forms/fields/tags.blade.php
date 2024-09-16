@if ($showLabel && $showField)
    @if ($options['wrapper'] !== false)
        <div {!! $options['wrapperAttrs'] !!}>
            @endif
            @endif

            @if ($showLabel && $options['label'] !== false && $options['label_show'])
                {!! Form::customLabel($name, $options['label'], $options['label_attr']) !!}
            @endif

            @if ($showField)
                @php
                    $options['attr']['class'] = (rtrim(Arr::get($options, 'attr.class'), ' ') ?: '') . ' list-tagify';

                    if (Arr::has($options, 'choices')) {
                        $choices = $options['choices'];

                        if ($choices instanceof \Illuminate\Support\Collection) {
                            $choices = $choices->toArray();
                        }

                        if ($choices) {
                            $options['attr']['data-list'] = json_encode($choices);
                        }
                    }
                @endphp
                {!! Form::text($name, $options['value'], $options['attr']) !!}
                @include('core/base::forms.partials.help-block')
            @endif

            @include('core/base::forms.partials.errors')

            @if ($showLabel && $showField)
                @if ($options['wrapper'] !== false)
        </div>
    @endif
@endif
