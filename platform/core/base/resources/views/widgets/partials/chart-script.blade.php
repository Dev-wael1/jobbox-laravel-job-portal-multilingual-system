@php
    Assets::addScripts('apexchart')->addStyles('apexchart');
@endphp

@push('footer')
    <script>
        $(document).ready(function() {
            (new ApexCharts(document.querySelector("#{{ $id }}"), {{ Js::from($options) }})).render()
        })
    </script>
@endpush

@if (request()->ajax())
    <script>
        (new ApexCharts(document.querySelector("#{{ $id }}"), {{ Js::from($options) }})).render()
    </script>
@endif
