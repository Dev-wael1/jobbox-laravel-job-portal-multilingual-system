<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        if (! Schema::hasTable('jb_custom_fields_translations')) {
            Schema::create('jb_custom_fields_translations', function (Blueprint $table) {
                $table->string('lang_code');
                $table->foreignId('jb_custom_fields_id');
                $table->string('name')->nullable();
                $table->string('type', 60)->nullable();

                $table->primary(['lang_code', 'jb_custom_fields_id'], 'jb_custom_fields_translations_primary');
            });
        }

        if (! Schema::hasTable('jb_custom_field_options_translations')) {
            Schema::create('jb_custom_field_options_translations', function (Blueprint $table) {
                $table->string('lang_code');
                $table->foreignId('jb_custom_field_options_id');
                $table->string('label')->nullable();
                $table->string('value')->nullable();

                $table->primary(['lang_code', 'jb_custom_field_options_id'], 'jb_custom_field_options_translations_primary');
            });
        }

        if (! Schema::hasTable('jb_custom_field_values_translations')) {
            Schema::create('jb_custom_field_values_translations', function (Blueprint $table) {
                $table->string('lang_code');
                $table->foreignId('jb_custom_field_values_id');
                $table->string('name')->nullable();
                $table->string('value')->nullable();

                $table->primary(['lang_code', 'jb_custom_field_values_id'], 'jb_custom_field_values_translations_primary');
            });
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('jb_custom_fields_translations');
        Schema::dropIfExists('jb_custom_field_options_translations');
        Schema::dropIfExists('jb_custom_field_values_translations');
    }
};
