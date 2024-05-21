<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('jumuiya_michango', function (Blueprint $table) {
            $table->id();
            $table->string('aina_ya_mchango');
            $table->string('kiasi_kilichotolewa');
            $table->string('kiasi_kilichobaki');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('jumuiya_michango');
    }
};
