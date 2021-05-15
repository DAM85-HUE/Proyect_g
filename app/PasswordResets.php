<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PasswordResets extends Model
{
  protected $fillable = [
    'username',
    'token'
  ];
  public $timestamps = false;
  protected $hidden = ['updated_at'];
}
