@extends('auth.content')

@section('login')

  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="card-group mb-0">
        <div class="card p-4" style="border-color:red">

          <form class="form-horizontal was-validated forgotPassword" method="post" action="{{ route('reset.password') }}">
            {{ csrf_field() }}
            <div class="card-body">
              <h1>Recuperar contraseña</h1>

              <p class="text-muted">Recuperar acceso al sistema</p>

              <!--agregamos una verificacion si se lanza una excepcion en el campo usuario -->
              <div class="form-group mb-3">
                <span class="form-group-addon"><i class="icon-lock"></i></span>
                <input type="text" name="password" id="password" class="form-control" placeholder="Nueva Contraseña" value="" style="border-color:red">
              </div>
              <div class="form-group mb-3">
                <span class="form-group-addon"><i class="icon-lock"></i></span>
                <input type="text" name="rptpassword" id="rptpassword" class="form-control" placeholder="Repetir Contraseña" value="" style="border-color:red">
              </div>
              <!-- Verificacion de errores de laravel -->

              <div class="row">
                <div class="col-6">
                  <button type="submit" class="btn btn-danger px-4">Recuperar</button>
                </div>

                <div class="col-6 text-right" >
                  <button type="button" class="btn btn-link px-0" style="color:red">Iniciar Seccion</button>
                </div>
              </div>
          </form>

        </div>
      </div>

      <div class="card text-white bg-danger py-5 d-md-down-none" style="width:44%" >
        <div class="card-body text-center">
          <div>
            <h2>Jobline | Sistema de acceso para vendedores y proveedores</h2>
            <p>Tienda de comercio electronico</p>
          </div>

        </div>
      </div>
    </div>
  </div>
  </div>

@endsection
