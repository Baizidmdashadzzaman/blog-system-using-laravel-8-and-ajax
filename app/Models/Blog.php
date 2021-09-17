<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Blog extends Model
{
    use HasFactory;
    protected $fillable = [
        'category_id',
        'blog_title',
        'blog_thumnail',
        'blog_short_description',
        'blog_description',
        'status',
        'blog_type',
        'wistia_link',
        'read_count'
    ];
}
