<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Category;

class Article extends Model
{
  protected $fillable = ['code', 'name', 'sale_price', 'stock', 'description', 'active', 'category_id'];

  # Creando relacion de pertenencia, pertenece a una categoria ...
  public function category()
  {
    return $this->belongsTo(Category::class);
  }

  public function uploadImageCar($article_id, $images)
  {
    $allowedfileExtension = ['pdf', 'jpg', 'png'];

    $path_url = "/img/articles/article_" . $article_id;
    $path_name = public_path() . $path_url;
    if (!file_exists($path_name)) {
      mkdir($path_name, 0777, true);
    }

    foreach ($images as $image) {
      $extension = $image->getClientOriginalExtension();
      $check = in_array($extension, $allowedfileExtension);
      if ($check) {
        $nameArticle = md5($image->getClientOriginalName());

        $image->move($path_name, $nameArticle);

        $image_art = new ArticleImage();
        $image_art->article_id = $article_id;
        $image_art->name = $nameArticle.".".$extension;
        $image_art->size = $image->getSize();
        $image_art->format = $extension;
        $image_art->dir = $path_url."/".$nameArticle.".".$extension;
        $image_art->save();
      }

    }
  }
}
