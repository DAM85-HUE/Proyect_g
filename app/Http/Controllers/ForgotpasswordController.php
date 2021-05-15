<?php

namespace App\Http\Controllers;
use Mail;
use App\PasswordResets;
use App\Person;
use App\User;
use Illuminate\Http\Request;

class ForgotpasswordController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      return view('auth.forgotpassword');
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
      if ($user = User::where('username', $request->username)->first()):
        $token = createTokenUser();
        while (PasswordResets::where('token', $token)->first()) {
          $token = createTokenUser();
        }
        $resetpassword = new PasswordResets();
        $resetpassword->token = $token;
        $resetpassword->username = $request->username;
        $resetpassword->created_at = date("Y-m-d H:i:s", time());
        $resetpassword->save();
        $personal = Person::find($user->id);
        $data = [
          'link' => env('APP_URL') . 'resetPassword/' . $token,
          'email' => $personal->email
        ];
        Mail::send("templates.mails.forgotPassword", ["data" => $data], function ($mail) use ($data) {
          $mail->subject('Recuperar accesso');
          $mail->to($data['email'], "eccomerce");
        });
        $data['status'] = true;
      else:
        $data['status'] = false;
      endif;
      return response()->json($data);
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
