<div class="mb-3">
    <div class="mb-3">
        <label class="form-label">{{ __('Quantity') }}</label>
        {!! Form::customSelect('quantity', $choices, $current, [
            'id' => $selector,
            'data-max' => $max,
            'class' => 'shortcode-tabs-quantity-select',
        ]) !!}
    </div>

    <div
        class="accordion"
        id="accordion-tab-shortcode mt-2"
        style="--bs-accordion-btn-padding-y: .7rem;"
    >
        @for ($i = 1; $i <= $max; $i++)
            <div
                class="accordion-item @if ($i > $current) d-none @endif"
                data-tab-id="{{ $i }}"
            >
                <h2
                    class="accordion-header"
                    id="heading-{{ $i }}"
                >
                    <button
                        class="accordion-button collapsed"
                        data-bs-toggle="collapse"
                        data-bs-target="#collapse-{{ $i }}"
                        type="button"
                        aria-expanded="false"
                        aria-controls="collapse-{{ $i }}"
                    >
                        {{ __('Tab #:number', ['number' => $i]) }}
                    </button>
                </h2>
                <div
                    class="accordion-collapse collapse"
                    id="collapse-{{ $i }}"
                    data-bs-parent="#accordion-tab-shortcode"
                    aria-labelledby="heading-{{ $i }}"
                >
                    <div class="accordion-body bg-light">
                        <div class="section">
                            @foreach ($fields as $k => $field)
                                @php
                                    $key = $k . '_' . $i;
                                    $name = $i <= $current ? $key : '';
                                    $title = Arr::get($field, 'title');
                                    $placeholder = Arr::get($field, 'placeholder', $title);
                                    $defaultValue = Arr::get($field, 'value', Arr::get($field, 'default_value'));
                                    $value = Arr::get($attributes, $key, $defaultValue);
                                    $fieldAttributes = [...Arr::get($field, 'attributes', []), 'data-name' => $key];

                                    $options = [];
                                    if (Arr::has($field, 'options')) {
                                        $options = Arr::get($field, 'options', []);
                                    }
                                @endphp

                                <div class="mb-3">
                                    <label @class(['form-label', 'required' => Arr::get($field, 'required')])>{{ $title }}</label>
                                    @switch(Arr::get($field, 'type'))
                                        @case('image')
                                            {!! Form::mediaImage($name, $value, $fieldAttributes) !!}
                                            @break

                                        @case('file')
                                            {!! Form::mediaFile($name, $value, $fieldAttributes) !!}
                                            @break

                                        @case('color')
                                            {!! Form::customColor($name, $value, $fieldAttributes) !!}
                                            @break

                                        @case('icon')
                                            {!! Form::themeIcon($name, $value, $fieldAttributes) !!}
                                            @break

                                        @case('number')
                                            {!! Form::number($name, $value, [
                                                'class' => 'form-control',
                                                'placeholder' => $placeholder,
                                                'data-name' => $key,
                                            ]) !!}
                                            @break

                                        @case('textarea')
                                            {!! Form::textarea($name, $value, [
                                                'class' => 'form-control',
                                                'placeholder' => $placeholder,
                                                'rows' => 3,
                                                ...$fieldAttributes,
                                            ]) !!}
                                            @break

                                        @case('checkbox')
                                            @php($options =  ['no' => __('No'), 'yes' => __('Yes')])

                                        @case('select')
                                            {!! Form::customSelect($name, $options, $value, $fieldAttributes) !!}
                                            @break

                                        @case('onOff')
                                            {!! Form::onOff($name, $value, [...$options, ...$fieldAttributes]) !!}
                                            @break

                                        @case('coreIcon')
                                            {!! Form::coreIcon($name, $value, [...$options, ...$fieldAttributes]) !!}
                                            @break

                                        @default
                                            {!! Form::text($name, $value, [
                                                'class' => 'form-control',
                                                'placeholder' => $placeholder,
                                                ...$fieldAttributes,
                                            ]) !!}
                                    @endswitch

                                    @if ($helper = Arr::get($field, 'helper'))
                                        {{ Form::helper($helper) }}
                                    @endif
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        @endfor
    </div>
</div>
<script src="{{ asset('vendor/core/packages/shortcode/js/shortcode-fields.js') }}?v={{ time() }}"></script>
