{
 2. El encargado de ventas de un negocio de productos de limpieza desea administrar el stock 
de los productos que vende. Para ello, genera un archivo maestro donde figuran todos los 
productos que comercializa. De cada producto se maneja la siguiente información: código de 
producto, nombre comercial, precio de venta, stock actual y stock mínimo. Diariamente se 
genera un archivo detalle donde se registran todas las ventas de productos realizadas. De 
cada venta se registran: código de producto y cantidad de unidades vendidas. Se pide 
realizar un programa con opciones para: 
	a. Actualizar el archivo maestro con el archivo detalle, sabiendo que: 
	● Ambos archivos están ordenados por código de producto. 
	● Cada registro del maestro puede ser actualizado por 0, 1 ó más registros del 
	archivo detalle. 
	● El archivo detalle sólo contiene registros que están en el archivo maestro. 
	b. Listar en un archivo de texto llamado “stock_minimo.txt” aquellos productos cuyo 
	stock actual esté por debajo del stock mínimo permitido.
}


program untitled;
const
	linea=('----------------------------');
	valorImp=-1;
type
	venta=record
		cod:integer;
		nombre:string;
		precio:real;
		stockact:integer;
		stockmin:integer;
	end;
	ventared=record
		cod:integer;
		cant:integer;
	end;
	
	maestro=file of venta;
	avo2=file of ventared;
	
procedure leer(var mae:maestro;var v:venta);
begin
	if(not eof(mae))then
		read(mae,v)
	else
		v.cod:=valorImp;
end;
procedure leer2(var ven:avo2;var v:ventared);
begin
	if(not eof(ven))then
		read(ven,v)
	else
		v.cod:=valorImp;
end;

procedure actualizarArchivo(var detalle:avo2;var mae:maestro);
var
	v2:venta;
	ant,v:ventared;
	suma:integer;
	act:integer;
begin
	reset(detalle);
	reset(mae);
	leer2(detalle,v);
	leer(mae,v2);
	while(v.cod<>valorImp)do begin
		suma:=0;
		act:=v.cod;
		while((v.cod<>valorImp)and(v.cod=act))do begin
			suma:=suma+v.cant;
			ant:=v;
			leer2(detalle,v);
			end;
		
		while((v2.cod<>valorImp)and(v2.cod<ant.cod))do 
			leer(mae,v2);
		seek(mae,filePos(mae)-1);
		v2.stockact:=v2.stockact-suma;
		write(mae,v2);
	end;
	close(detalle);
	close(mae);
end;

procedure bajoStock (var mae:maestro; var texto:text);
var
	v:venta;
begin
	leer(mae,v);
	while(v.cod<>valorImp)do begin
		if(v.stockact<v.stockmin)then
			writeln(texto,v.cod,v.precio,v.stockact,v.stockmin,v.nombre);
	end;
end;

procedure menu(var a:integer);
begin
	writeln(linea);
	writeln('1:Actualizar ventas');
	writeln('2:Archivar productos con pocas existencias');
	writeln(linea);
	writeln;
	writeln('Elige una de las opciones anteriores: ');
	readln(a);
end;
var
	detalle:avo2;
	a:integer;
	mae:maestro;
	texto:text;
begin
	assign(texto,'stock_minimo.txt');
	menu(a);
	case a of 
		1:actualizarArchivo(detalle,mae);
		2:bajoStock(mae,texto);
	end;
end.
