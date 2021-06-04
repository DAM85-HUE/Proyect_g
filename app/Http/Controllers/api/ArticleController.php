<?php

namespace App\Http\Controllers\api;

use App\Article;
use App\ArticleImage;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ArticleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
      $text_search     = $request->search;
      $search_criteria = $request->criteria;

      if($text_search == '')

        $articles = Article::join('categories','articles.category_id', '=', 'categories.id')
          ->select('articles.id','articles.category_id', 'articles.code','articles.name','articles.sale_price','articles.description', 'articles.stock', 'articles.active', 'categories.name as category_name')
          ->with('ArticlesImages')
          ->paginate(10);
      else
        $articles = Article::join('categories','articles.category_id', '=', 'categories.id')
          ->select('articles.id','articles.category_id', 'articles.code','articles.name','articles.sale_price','articles.description', 'articles.stock', 'articles.active', 'categories.name as category_name')
          ->where('articles.'.$search_criteria, 'like', '%'. $text_search . '%')
          ->with('ArticlesImages')
          ->paginate(10);
      $article = [
        'pagination' => [
          'total'         =>  $articles->total(),
          'current_page'  =>  $articles->currentPage(),
          'per_page'      =>  $articles->perPage(),
          'last_page'     =>  $articles->lastPage(),
          'from'          =>  $articles->firstItem(),
          'to'            =>  $articles->lastItem(),
        ],
        'articles' => $articles

      ];
      return response()->json(['success' => true, 'data' => $article]);


    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            $article = Article::create($request->all());
            if($files = $request->file('image')){
                $article->uploadImageCar($article->id,$files);
            }
            $article->images = ArticleImage::where('article_id',$article->id)->get();
            return response()->json(['success' => true, 'articles' => $article]);
        }catch (Exception $exception){
          return response()->json(['error' => true, 'message' => $exception]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
