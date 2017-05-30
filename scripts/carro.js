var anchoCarritoOriginal = 483;
var anchoExtraCarrito = 120;		

//Falta crear la nuevqa pagina donde se muestra la compra realizada
$(function() {	
	//Escondemos los botones	
	$("#nav_left").children("button").hide();	
	$.getJSON("scripts/carrito.php/producto", function(result) {
			$.each(result, function(i, producto){
				$imgArticulo = producto.imagen;
				if($imgArticulo == "img/no_img.png"){
					$imgArticulo = "img/NoImg.png"
				}else{
					$imgArticulo = producto.imagen +".jpg";
				}
				$divArticulo = '<div class="item" id="'+producto.cod+'"><img src="'+$imgArticulo+'" alt="'+producto.nombre+'"/><label class="title" title="'+producto.nombre+'">'+producto.nombre_corto+'</label><label class="price">'+producto.PVP+' € </label><label class="stock">Stock '+producto.stock+'</label></div>'
            	$("#item_container").prepend($divArticulo);
       		});
   		//Agregamos listener click a el elemento que se ha pulsado
		$(".item").on("dblclick",agregarElemento);
		//Cuando arrastramos
		$(".item").draggable({		
			//Clonamos
			helper:"clone",
			//Cuando se arrastra
			start : function (event,ui){
				//Incluimos clase
				$("#cart_items").addClass('drop-active');
			},
			stop : function (event,ui){
				//Incluimos clase
				$("#cart_items").removeClass('drop-active');
			}
		});

		//Cuando soltamos 
		$("#cart_items").droppable({
			hoverClass: "drop-hover",
			//CUando se suelta elemento encima del div
			drop: function(event, ui){
				//lanzamos triger
				$(ui.draggable).trigger("dblclick");
				//Quitamos clase
				$(this).removeClass('drop-hover');
				return false;
			}
		});

	});
	
	//Cuando se pulse sobre el boton + 
	$("#cart_items").on("click","a.add",function(event){
		event.preventDefault();		
		var $articuloOriginal = $("#"+$(event.target).parent().parent().attr("id").substring(2));		
		$($articuloOriginal).trigger("dblclick");
	});

	//Cuando se pulse sobre el boton -
	$("#cart_items").on("click","a.minus",function(event){
		event.preventDefault();
		if($(this).parent().find(".cantidad").val() > 1){
			//Restamos -1 al input de c-item
			$(this).parent().find(".cantidad").val($(this).parent().find(".cantidad").val()-1);
			//Restamos -1 al numero de compras
			$("#citem").val($("#citem").val()-1);
			//Ahora restamos el precio del articulo - unidades en cprice
			var precioCompra = parseFloat($("#cprice").val().substring(0,$("#cprice").val().length-1));
			var precioArticulo = parseFloat($(this).parent().find(".price").text().substring(0,$(this).parent().find(".price").text().length-2));
			$("#cprice").val(parseFloat(precioCompra-precioArticulo)+" €");
			//Buscamos el articulo original
			var articuloOriginal = $(this).parent().attr("id").substring(2);
			//Cogemos el numero de stock
			var numeroStockArticuloOriginal = parseInt($("#"+articuloOriginal).find(".stock").text().substring($("#"+articuloOriginal).find(".stock").text().length-1));
			//sumamos +1
			$("#"+articuloOriginal).find(".stock").text("stock "+(numeroStockArticuloOriginal+1));
			checkStock($(this).parent());
		}else{			
			$(this).parent().find(".delete").trigger("click")	;
		}
		
	});

	//Cuando se pulsa sobre el botón de vaciar cesta 
	$("#btn_clear").on("click", function(event) {		
		var $cuadroConfirmacion = $('<div id="dialog-modal" title="Confirmar vaciado"></div>');
		$cuadroConfirmacion.dialog({
			resizable: false,
			height: "auto",
			width: 400,
			modal: true,
			show: {effect: "bounce", duration: 600},
			hide: {effect: "explode", duration: 600},
			open: function(event, ui){ $(".ui-dialog-titlebar-close").hide();},
			buttons: {
				"Si": function() {
					$("a.delete").trigger("click");
					$("#btn_comprar, #btn_clear").hide();
					$( this ).dialog( "close" );
				},
				"No": function(event) {
					$( this ).dialog( "close" );
				}
			}	
		});
	});

	//Cuando pulsamos sobre el boton x de los articulos de la cesta
	$("#cart_items").on("click","a.delete",function(event){		
		var numeroArticulos = parseInt($(this).parent().find(".cantidad").val());		
		$("#citem").val($("#citem").val()-numeroArticulos);		
		var precioTotalCompra = $("#cprice").val();		
		var costeTotalCompraLimpio = parseFloat(precioTotalCompra.substring(0,(precioTotalCompra.length-2)).replace(",","."));		
		var costeArticulo = $(this).parent().find(".price").text();		
		var costeArticuloLimpio = parseFloat(costeArticulo.substring(0,(costeArticulo.length-2)).replace(",","."));		
		$("#cprice").val((costeTotalCompraLimpio-(costeArticuloLimpio*numeroArticulos)).toFixed(2)+" € ");
		
		//Actualizar stock del articulo original
		$nombre = $(this).parent().attr("id").substring(2,$(this).parent().attr("id").length);
		$arrayStock = $("#"+$nombre).find(".stock").text().split(" ");
		$arrayStock[1]=parseInt($arrayStock[1])+numeroArticulos;		
		$("#"+$nombre).find(".stock").text($arrayStock[0]+$arrayStock[1]);
		event.preventDefault();		
		$(this).parent().remove();
		checkStock($(this).parent());		
		checkDivSize();
	});
	
	

	//Boton del carro hacia la derecha
	$("#btn_next").on("click", function(){		
		var pos = $("#cart_items").offset();		
		var posicionDiv = $("#cart_items").position();		
		if(posicionDiv.left != $("#cart_items").position()){
			$("#cart_items").offset({left:(pos.left+anchoExtraCarrito)});	
		}		
	});


	$("#btn_prev").on("click", function(){
		var pos = $("#cart_items").offset();		
		var posicionDiv = $("#cart_items").position();	
		if(posicionDiv.left != $("#cart_items").position()){
			$("#cart_items").offset({left:(pos.left-anchoExtraCarrito)});
		}			
	});

});


function agregarElemento(event){		
	var $cantidad = $('<input class="cantidad" type="text" value="1" readonly="true" />');
	var $delete = $('<a href="" class="delete" style="padding:0px;"></a>').button({
					icons: {primary: "ui-icon-circle-close"},
					text: false
				});			;				
	var $add = $('<a href="" class="add" style="padding:0px;"></a>').button({
					icons: {primary: "ui-icon-circle-plus"},
					text: false
				});		;
	var $minus = $('<a href="" class="minus" style="padding:0px;"></a>').button({
					icons: {primary: "ui-icon-circle-minus"},
					text: false
				});
	var $butonComprar = $("#btn_comprar").button({
							icons: {primary:"ui-icon-cart"},
							text: false
						}).show().on("click", confirmarCompra);;		
	
	var $butonClear = $("#btn_clear").button({
							icons: {primary: "ui-icon-trash"},
							text: false
						}).show();;	
	var $arrayStock = $(this).find(".stock").text().split(" ");
	if(parseInt($arrayStock[1]) > 0){
		//Si hay en stock restamos 1 al stock que havia		
		$(this).find(".stock").text("Stock "+($arrayStock[1]-1));
		//Comprobamos que el articulo que vamos a introducir en la cesta no existe ya			
		if($("#cart_items").children().last().is("#c-"+$(this).attr("id"))){
			var itemIdClone = $("#cart_items").children().last().attr("id");				
			var numeroArticulosEnCesta = $("#"+itemIdClone).find(".cantidad").val();
			numeroArticulosEnCesta++;
			$("#"+itemIdClone).find(".cantidad").val(numeroArticulosEnCesta);			
		}else{			
			var articleClone = $(this).clone().appendTo("#cart_items");			
			articleClone.attr("id","c-"+$(this).attr("id"));			
			articleClone.find(".stock").hide();					
			articleClone.prepend($minus, $add, $delete, $cantidad);				
			articleClone.css("cursor", "default");			
		}		
		checkStock($(this));
		checkNumeroArticulos($(this));				
	}				
};


function confirmarCompra(event){
	var $cuadroCompra = $('<div id="confirma-compra" title="Confirmar compra"></div>');
	$cuadroCompra.dialog({
		resizable: false,
		height: "auto",
		width: 400,
		modal: true,
		show: {effect: "bounce", duration: 600},
		hide: {effect: "explode", duration: 600},
		open: function(event, ui){ $(".ui-dialog-titlebar-close").hide();},
		buttons: {
			"Si": function() {
				var arrayArticulos = [];
				$("#cart_items").children(".item").each(function() {
					var $articulosId = $(this).attr("id");	
					var $articulosUnidades = $(this).find(".cantidad").val();
					arrayArticulos.push({cod : $articulosId.substring(2), uds : $articulosUnidades});					
				});
				$.post('scripts/compra.php', {
				//Como el php espera un objeto metemos el array dentro de uno y se lo enviamos
									articulos : arrayArticulos
									}).done(function(data) {										
										//console.log(data)
										var resultadoCompra = jQuery.parseJSON(data);					
										var udsArticulos = resultadoCompra.num;
										var precioArticulos = resultadoCompra.total;
										//Remplazamos del precio del carrito la coma por el punto
										var totalCarrito = $("#cprice").val().replace(",",".").split(" ");
										//Comparamos el precio de compra.php con el del carrito
										if(precioArticulos.toFixed(1) == (parseFloat(totalCarrito[0]))){
											//Abrimos página con agradecimiento
											//window.open("scripts/final.php?num="+udsArticulos+"&total="+precioArticulos);
											window.location.replace("scripts/final.php?num="+udsArticulos+"&total="+precioArticulos)
										}else{
											//mostramos alert
											alert("Ha ocurrido un error, hable con el administrador del sitio por favor");
										}
				});				
				$( this ).dialog( "close" );
				
				
			},
			"No": function(event) {
				$( this ).dialog( "close" );
			}
		}	
	});
}



function checkNumeroArticulos($articleCLone){	
	//Incrementamos en +1 en la cesta de la compra, obtenemos el valor,				
	$("#nav_right").find("#citem").val(parseFloat(($("#nav_right").find("#citem").val()))+1);			
	//Creamos una variable con el precio del articulo		
	var precioArticulo = parseFloat($articleCLone.find(".price").text().substr(0, $articleCLone.find(".price").text().length-2).replace(",","."));		
	//Sumamos el precio de los articulos que se van pulsando	
	var precioTotal = $("#cprice").val();
	var precioTotalLimpio = parseFloat(precioTotal.substring(0,precioTotal.length-2).replace(",","."));
	//Incrementamos el precio de la compra
	$("#cprice").val((precioTotalLimpio+precioArticulo).toFixed(2)+" €");
	var numeroArticulos = $("#cart_items").children().length;
	//Ahora si hay más de 4 articulos en el carro ....
	if(numeroArticulos > 4){		
		var anchoCarrito = $("#cart_items").css("width");		
		var anchoCarritoLimpio = parseInt(anchoCarrito.substring(0,anchoCarrito.length-2));
		anchoCarrito = anchoCarritoLimpio + anchoExtraCarrito;
		$("#cart_items").css("width", anchoCarrito + "px");
		$("#btn_next").show();			
		$("#btn_prev").show();			
	}		
}






//Aquí comprobamos el numero de articulos en stock
function checkStock(articulo){	
	var arrayStock = $(articulo).find(".stock").text().split(" ");
	if(arrayStock[1] == 0){
		$(".add").hide();
		$(articulo).find(".stock").addClass("agotado");
		$("#item_container").find("#"+$(articulo).attr("id")).off("dblclick",agregarElemento);
	}else{
		$(".add").show();		
		$("#item_container").find("#"+$(articulo).attr("id").substring(2)).find(".stock").removeClass("agotado");	
		if($("#item_container").find("#"+$(articulo).attr("id")).off("dblclick",agregarElemento)){
			$("#item_container").find("#"+$(articulo).attr("id")).on("dblclick",agregarElemento);	
		}		
	}
}


function checkDivSize(){
	var $btnNext = $("btn_next").button({
							icons: {primary: "ui-icon-circle-triangle-e"},
							text: false
						});;
					
	var $btnPrev = $("btn_prev").button({
						icons: {primary: "ui-icon-circle-triangle-w"},			
						text: false
					});
	//AHora vamos a comprobar el numero de items del div para recortar el tamaño del div
	var numeroArticulos = $("#cart_items").find(".item").length;	
	//Si el numero de items es igual a 4 o menor se vuelve a su tamaño normal
	if(numeroArticulos < 5){
		$("#cart_items").css("width",anchoCarritoOriginal+"px");						
		$("#btn_next").hide();
		$("#btn_prev").hide();
	}		
	if(numeroArticulos<1){
		//Escondemos los botones cuando existta menos de 1 articulo en la cesta			
		$("#btn_comprar").hide();
		$("#btn_clear").hide();
	}
};
