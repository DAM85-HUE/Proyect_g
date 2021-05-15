<?php

namespace App\Http\Controllers;

use App\PasswordResets;
use App\Person;
use App\User;
use Illuminate\Http\Request;
use Session;

class ResetPasswordController extends Controller
{
  /**
   * Display a listing of the resource.
   *
   * @return \Illuminate\Http\Response
   */
  public function index(Request $request)
  {
    $token = $request->token;
    $resetPassword = PasswordResets::where('token', $token)->first();
    if ($resetPassword) {
      $person = User::where("username", $resetPassword->username)->first();
      Session()->put('user_id', $person->id);
      Session()->put('token', $token);
      return view('auth.reset');
    } else {
      return redirect()->route('login');
    }
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
   * @param \Illuminate\Http\Request $request
   * @return \Illuminate\Http\Response
   */
  public function store(Request $request)
  {
    $data = [];
    $user = User::find(Session()->get('user_id'));

    $person = Person::find($user->id);
    $person->password = bcrypt($request->new_password);
    $user->save();
    Session()->forget('user_id');
    PasswordResets::where("token", Session::get('token'))->delete();
    Session()->forget('token');

    $data['status'] = true;

    return response()->json($data);
  }

  /**
   * Display the specified resource.
   *
   * @param int $id
   * @return \Illuminate\Http\Response
   */
  public function show($id)
  {
    //
  }

  /**
   * Show the form for editing the specified resource.
   *
   * @param int $id
   * @return \Illuminate\Http\Response
   */
  public function edit($id)
  {
    //
  }

  /**
   * Update the specified resource in storage.
   *
   * @param \Illuminate\Http\Request $request
   * @param int $id
   * @return \Illuminate\Http\Response
   */
  public function update(Request $request)
  {

  }

  /**
   * Remove the specified resource from storage.
   *
   * @param int $id
   * @return \Illuminate\Http\Response
   */
  public function destroy($id)
  {
    //
  }
}
