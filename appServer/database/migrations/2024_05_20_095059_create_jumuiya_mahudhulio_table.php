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
        Schema::create('jumuiya_mahudhulio', function (Blueprint $table) {
            $table->id();
            $table->string('tarehe');
            $table->string('siku');
            $table->string('jina_kamili');
            $table->string('mahudhulio');
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
        Schema::dropIfExists('jumuiya_mahudhulio');
    }
};
