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
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('namba_ya_simu');
            $table->string('majina_kamili');
            $table->string('jinsia');
            $table->string('umri');
            $table->string('jumuiya');
            $table->string('tarehe_ya_kuzaliwa');
            $table->string('ubatizo');
            $table->string('ekaristi');
            $table->string('kipaimara');
            $table->string('ndoa');
            $table->string('password');
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
        Schema::dropIfExists('users');
    }
};
