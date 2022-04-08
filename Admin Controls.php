<!DOCTYPE HTML>  
<html>
<head>
<style>
.error {color: #FF0000;}
.success {color: #008000;}
</style>
</head>
<body>  

<?php


$serverName = 'ERICK';
$connectionInfo = array('Database'=>'ProyectoBD');
$conn = sqlsrv_connect($serverName, $connectionInfo);

$name = $filtro = $insertN = $insertS = "";


?>
<div id="info" class="container">
<h1>Admin Controls</h1>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>"> 
  <h3>Listar Puestos/Empleados</h3>
  <input type="submit" name="submit" value="Listar Puestos">
  <br><br>
  <input type="submit" name="submit" value="Listar Empleados">
  <br><br>
  Listar Empleados (Nombre): <input type="text" name="nameI" value="<?php echo $filtro;?>">
  <input type="submit" name="submit" value="Listar Filtro">
  <br><br>
  <h3>Insertar Nuevo Puesto</h3>
  Nombre: <input type="text" name="nameI" value="<?php echo $insertN;?>">
  <br><br>
  Salario por Hora: <input type="number" name="priceI" value="<?php echo $insertS;?>">
  <br><br>
  <input type="submit" name="submit" value="Insertar">
  <h3>Salir</h3>
  <input type="submit" name="submit" value="Log Off">
</form>
</div>
<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  if($_POST['submit'] == 'Log Off'){
    header("Location: http://localhost/php_program/Log%20In%20Admin.php");
    exit();
  }
}

function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
?>
</body>
</html>