<!DOCTYPE html>
<html lang="es">
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Sistema de administración y almacén de compras y ventas">
  <meta name="author" content="Gabriel Antonio">
  <meta name="keyword" content="Sistema de administración y almacén de compras y ventas">

  <title>Iniciar Sesión</title>

  <!-- Icons -->
{!!Html::style('css/font-awesome.min.css')!!}
{!!Html::style('css/simple-line-icons.min.css')!!}

<!-- Main styles for this application -->
  {!!Html::style('css/style.css')!!}


</head>

<body class="app flex-row align-items-center">
<div class="container">
@yield('login')
</div>
<!-- Bootstrap and necessary plugins -->
{!!Html::script('js/app.js')!!}
<!-- Bootstrap and necessary plugins -->
{!!Html::script('js/jquery.min.js')!!}
{!!Html::script('js/popper.min.js')!!}
{!!Html::script('js/bootstrap.min.js')!!}
{!!Html::script('js/pace.min.js')!!}
<!-- Plugins and scripts required by all views -->
{!!Html::script('js/Chart.min.js')!!}
<!-- GenesisUI main scripts -->
{!!Html::script('js/template.js')!!}

</body>
</html>
