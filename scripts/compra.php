<?php
ini_set("display_errors", 0);

// connect to the mysql database
include_once("config.php");
$link = mysqli_connect('localhost', '*** INSERT -MYSQL - USER', '*** INSERT -MYSQL - PASSWORD', 'tienda');
mysqli_set_charset($link,'utf8');

$numArt=0;
$precioArt=0;
foreach ($_POST['articulos'] as $articulo) {
	# code...
	$query="SELECT PVP, stock FROM producto WHERE cod='".$articulo['cod']."'";
	$result = mysqli_query($link,$query) or die("Error BBDD ".$query);	 
	// die if SQL statement failed
	if (!$result) {
		http_response_code(404);
		die(mysqli_error());
	}
	if (mysqli_num_rows($result)==0) {
		http_response_code(404);
		die("Error BBDD producto no encontrado ".$articulo['cod']);
	}
	$art=mysqli_fetch_assoc($result);
	if ($art['stock']<$articulo['uds']) {
		http_response_code(404);
		die("Error BBDD sin suficiente stock de producto ".$articulo['cod']);		
	}
	$numArt+=$articulo['uds'];
	$precioArt+=($art['PVP']*$articulo['uds']);

	$nuevaCtdad=$art['stock']-$articulo['uds'];
	$query="UPDATE producto SET stock=".$nuevaCtdad." WHERE cod='".$articulo['cod']."'";
	$result = mysqli_query($link,$query) or die("Error BBDD ".$query);	 

}
$respuesta=[];
$respuesta['resultado']='Ok';
$respuesta['num']=$numArt;
$respuesta['total']=$precioArt;
echo json_encode($respuesta);
?>
 
