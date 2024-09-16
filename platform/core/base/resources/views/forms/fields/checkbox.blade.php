<x-core::form.field
    :showLabel="false"
    :showField="$showField"
    :options="$options"
    :name="$name"
    :prepend="$prepend ?? null"
    :append="$append ?? null"
    :showError="$showError"
    :nameKey="$nameKey"
>
    <x-core::form.checkbox
        :label="($showLabel && $options['label'] !== false && $options['label_show']) ? $options['label'] : null"
        :name="$name"
        :checked="$options['value']"
        :attributes="new Illuminate\View\ComponentAttributeBag((array) $options['attr'])"
    />
</x-core::form.field>
