@props([
    'label',
    'value' => 0,
    'icon' => null,
    'url' => null,
    'color' => 'primary',
    'column' => null,
])

@php
    $tag = $url ? 'a' : 'div';

    $classes = Arr::toCssClasses([
        'text-white d-block rounded position-relative overflow-hidden text-decoration-none',
        "bg-$color" => !str_contains($color, '#'),
    ]);

    Assets::addScripts(['counterup']);
@endphp

<div @class(['col dashboard-widget-item', $column])>
    <{{ $tag }}
        {{ $attributes->merge([
            'class' => $classes,
            'href' => $url,
        ]) }}
        @if(str_contains($color, '#'))
            style="background-color: {{ $color }}"
        @endif
    >
        <div class="d-flex justify-content-between align-items-center">
            <div class="details px-4 py-3 d-flex flex-column justify-content-between">
                <div class="desc fw-medium">{{ $label }}</div>
                <div class="number fw-bolder">
                    <span data-counter="counterup" data-value="{{ $value }}">0</span>
                </div>
            </div>
            <div class="visual ps-1 position-absolute end-0">
                @if($icon)
                    <x-core::icon :name="$icon" class="me-n2" style="opacity: .1; --bb-icon-size: 80px;"></x-core::icon>
                @endif
            </div>
        </div>
    </{{ $tag }}>
</div>
