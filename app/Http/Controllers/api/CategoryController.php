<?php

namespace App\Http\Controllers\api;

use App\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CategoryController extends Controller
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

      /*  - si no hay texto de busqueda la paginacion se hace normal.
          - si lo hay, el texto de busqueda puede estar al inicio, en el medio o al final,
          de cualquier registro de la columna del criterio (nombre o descripcion)
      */
      if($text_search == '')
        $categories = Category::paginate(6);
      else
        $categories = Category::where($search_criteria, 'like', '%'. $text_search . '%')->paginate(6);

      # retornamos un array con los metodos necesarios
      # para controlar la paginacion
      $data =  [
        'pagination' => [
          'total'         =>  $categories->total(),
          'current_page'  =>  $categories->currentPage(),
          'per_page'      =>  $categories->perPage(),
          'last_page'     =>  $categories->lastPage(),
          'from'          =>  $categories->firstItem(),
          'to'            =>  $categories->lastItem(),
        ],
        'categories' => $categories
      ];
      return response()->json(['success' => true, 'data' => $data]);
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
        //
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
