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
        Schema::create('jumuiya', function (Blueprint $table) {
            $table->id();
            $table->string('jina');
            $table->string('kanda');
            $table->string('Idadi_ya_wanajumuiya');
            $table->string('wanaume');
            $table->string('wanawake');
            $table->string('vijana');
            $table->string('watoto');
            $table->string('cheo');
            $table->string('namba_ya_sim');
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
        Schema::dropIfExists('jumuiya');
    }
};
