
<?php

$sql = "select * from formulariorecomendacion where nroTramite='$tramite'";
$res = mysqli_query($conn, $sql);
$fila = mysqli_fetch_array($res);

// print_r($fila);
$nombre = $fila['nombre'];
$paterno = $fila['aPaterno'];
$materno = $fila['aMaterno'];
$ci = $fila['ci'];
$codigoPersonal = $fila['codigoPersonal'];
$profesion = $fila['profesion'];
$experienciaLaboral = $fila['experienciaLaboral'];
$ciudad = $fila['ciudad'];

?>