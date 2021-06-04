<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ArticleImage extends Model
{

  protected $fillable = ['format', 'name', 'dir', 'size', 'article_id'];
  public $timestamps = false;

  public function Article()
  {
    return $this->belongsTo(Article::class);
  }

}
