<?php
require('fpdf.php');

include '../conexion.inc.php';

$sql = "select * from formulariorecomendacion where nroTramite='140'";
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
$firma = $fila['firmaGerente'];

// datos del destinatario

$nombres = $nombre." ".$paterno." ".$materno;
// crear el objeto PDF
$pdf = new FPDF('P');
$pdf->AddPage();


//$pdf->Image('logo.jpeg', 10, 10, 30, 0); // Inserta la imagen en el PDF
//$pdf->Image('logoinfo.jpeg', 235, 10, 60, 0); // Inserta la imagen en el PDF

// establecer la fuente y el tamaño del texto
$pdf->SetFont('Arial', 'B', 20); // Establece la fuente gótica como la fuente actual
$pdf->Ln(20);
// insertar el título
$pdf->Cell(0, 10, 'CARTA DE RECOMENDACION', 0, 1, 'C');
$pdf->Cell(0, 10, 'LABORAL', 0, 1, 'C');
// espacio en blanco
$pdf->Ln(20);

// establecer la fuente y el tamaño del texto
$pdf->SetFont('Arial', '', 15);
$hoy = date('d/m/Y');
$pdf->Cell(0, 10, "La Paz, Bolivia en fecha: $hoy", 0, 1, 'I');
// insertar el nombre del destinatario
$pdf->Cell(0, 10, "Emperesa de inmuebles MULTIMEDIAL", 0, 1, 'I');
$pdf->Cell(0, 10, "Calle 23 con Av. Insurgentes transversal 23, Monterrey, Nuevo Leon", 0, 1, 'I');
$pdf->Cell(0, 10, "Telefono: 123456789", 0, 1, 'I');
$pdf->Cell(0, 10, "multimedial123@gmail.com", 0, 1, 'I');
// espacio en blanco
$pdf->Ln(10);

// insertar la felicitación
$pdf->SetFont('Arial', '', 15);
$pdf->MultiCell(0, 10, "A quien pueda interesar:", 0, 'I');
$pdf->Ln(2);
$pdf->Cell(0, 10, "Reciba un cordial saludo. Atraves de la presente me complace recomendar a", 0, 1, 'I');
$pdf->Cell(0, 10, "Nombre: $nombres", 0, 1, 'I');
$pdf->Cell(0, 10, "Con carnet de identidad: $ci", 0, 1, 'I');
$pdf->Cell(0, 10, "Con codigo de empleado: $codigoPersonal", 0, 1, 'I');
$pdf->Cell(0, 10, "Con la profesion: $profesion", 0, 1, 'I');
$pdf->Cell(0, 10, "Año de experiencia: 1 anio", 0, 1, 'I');
$pdf->Cell(0, 10, "Nacido en la ciudad de: $ciudad", 0, 1, 'I');
$pdf->Cell(0, 10, "Durante este tiempo que $nombre laboro en  esta empresa", 0, 1, 'I');
$pdf->Cell(0, 10, "puedo asegurar que es un exelente trabajador, con mucha responsabilidad,", 0, 1, 'I');
$pdf->Cell(0, 10, "compromiso, y fidelidad, por lo que la empresa confia plenamente en el.", 0, 1, 'I');


$pdf->SetFont('Arial', '', 12);
$pdf->Ln(13);
// insertar las firmas
$pdf->Image('firmaGerente.png', 90, 250, 30, 0);
$pdf->Cell(0, 10, '_____________________________ ', 0, 1, 'C');
$pdf->Cell(0, 10, 'Firma del Gerente ', 0, 1, 'C');
$pdf->Output('Prueba1.pdf', 'I');

?>