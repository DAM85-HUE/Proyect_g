<?php

namespace App\Http\Controllers\api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Utils\CoordinadoraService;

class TrackingController extends Controller
{
  private $serviceCoordinadora;

  private $apikey = '3977c504-acff-11eb-8529-0242ac130003'; // your apikey of Coordinadora
  private $password = 'yD4wN9rZ5eD3sF7h'; // your password of Coordinadora
  private $nit = '901339708';
//guides
  private $id_client = '35765'; //your id client
  private $user_guide = 'joblinefree.ws'; //your user
  private $password_guide = 'Jnh65!se'; //your password

  public function __contruct()
  {

  }

  public function index()
  {
    $this->serviceCoordinadora = new CoordinadoraService($this->apikey, $this->password, $this->nit, $this->id_client, $this->user_guide, $this->password_guide);
    $this->serviceCoordinadora->sandbox_mode(true);
    $params = [
      'codigo_remision'=>$this->nit,
      'fecha'=>'',
      'id_cliente'=>1,
      'id_remitente'=>'televisor',
      'nit_remitente'=>'Bogota',
      'nombre_remitente'=>'Ibague',
      'direccion_remitente'=>3,
      'telefono_remitente'=>[3],
      'ciudad_remitente'=>'',
      'nit_destinatario'=>'',
      'div_destinatario'=>'',
      'nombre_destinatario'=>'',
      'direccion_destinatario'=>'',
      'ciudad_destinatario'=>'',
      'telefono_destinatario'=>'',
      'valor_declarado'=>'',
      'codigo_cuenta'=>'',
      'codigo_producto'=>'',
      'nivel_servicio'=>'',
      'linea'=>'',
      'contenido'=>'',
      'referencia'=>'',
      'observaciones'=>'',
      'estado'=>'',
      'detalle'=>[
        'ubl'=>'',
        'alto'=>'',
        'ancho'=>'',
        'largo'=>'',
        'peso'=>'',
        'unidades'=>'',
        'referencia'=>'',
        'nombre_empaque'=>''
      ],
      'margen_izquierdo'=>'',
      'margen_superior'=>'',
      'usuario_vmi'=>'',
      'formato_impresion'=>'',

    ];
    dd($this->serviceCoordinadora->Guias_generarGuia($params));
  }

  public function store()
  {

  }
}
