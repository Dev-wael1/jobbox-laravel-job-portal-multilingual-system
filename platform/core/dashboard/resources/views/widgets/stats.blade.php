@if (empty($widgetSetting) || $widgetSetting->status == 1)
    <x-core::stat-widget.item
        :label="$widget->title"
        :value="$widget->statsTotal"
        :url="$widget->route"
        :icon="$widget->icon"
        :color="$widget->color"
        :column="$widget->column"
    />
@endif
