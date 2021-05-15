<?php
function createTokenUser() {
  $generatedKey = sha1(mt_rand(10000,99999));
  return $generatedKey;
}

function sendEmail($email,$subject,$message){
  $to      = $email;
  $subject = $subject ;
  $message = $message;
  $header = "From: noreply@tictaccar.es\r\n";
  $header.= "MIME-Version: 1.0\r\n";
  $header.= "X-Priority: 1\r\n";
  $header.= "Content-Type: text/html; charset=ISO-8859-1\r\n";
  mail($to, $subject, $message, $header);
}
