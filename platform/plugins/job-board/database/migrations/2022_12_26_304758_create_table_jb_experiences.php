<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        Schema::create('jb_account_experiences', function (Blueprint $table) {
            $table->id();
            $table->string('company');
            $table->foreignId('account_id');
            $table->string('position')->nullable();
            $table->date('started_at');
            $table->date('ended_at')->nullable();
            $table->text('description')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('jb_account_experiences');
    }
};
