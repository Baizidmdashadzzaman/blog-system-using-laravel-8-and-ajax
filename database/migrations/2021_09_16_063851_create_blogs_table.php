<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBlogsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * 
     * 
     * @return void
     */
    public function up()
    {
        Schema::create('blogs', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('category_id')->nullable();
            $table->string('blog_title')->nullable();
            $table->string('blog_thumnail')->nullable();
            $table->longText('blog_short_description')->nullable();
            $table->longText('blog_description')->nullable();
            $table->longText('wistia_link')->nullable();
            $table->boolean('status')->default(0);
            $table->boolean('blog_type')->default(0);
            $table->bigInteger('read_count')->nullable();
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
        Schema::dropIfExists('blogs');
    }
}
