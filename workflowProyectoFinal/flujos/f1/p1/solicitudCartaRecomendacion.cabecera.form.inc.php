<?php
$sql="select * from academico.trabajador where id=".$_SESSION["IdUser"];
$resCab=mysqli_query($conn, $sql);
$filCab=mysqli_fetch_array($resCab);
$nombre=$filCab["nombre"];
$ci=$filCab["ci"];
$codigoPersonal=$filCab["codigoPersonal"];
// print_r($filCab);
?>