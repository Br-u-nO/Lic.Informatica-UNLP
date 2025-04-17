{
	Se cuenta con un archivo de productos de una cadena de venta de alimentos congelados. 
	De cada producto se almacena: código del producto, nombre, descripción, stock disponible, 
	stock mínimo y precio del producto. 
	Se recibe diariamente un archivo detalle de cada una de las 30 sucursales de la cadena. Se 
	debe realizar el procedimiento que recibe los 30 detalles y actualiza el stock del archivo 
	maestro. La información que se recibe en los detalles es: código de producto y cantidad 
	vendida. Además, se deberá informar en un archivo de texto: nombre de producto, 
	descripción, stock disponible y precio de aquellos productos que tengan stock disponible por 
	debajo del stock mínimo. Pensar alternativas sobre realizar el informe en el mismo 
	procedimiento de actualización, o realizarlo en un procedimiento separado (analizar 
	ventajas/desventajas en cada caso). 
	Nota: todos los archivos se encuentran ordenados por código de productos. En cada detalle 
	puede venir 0 o N registros de un determinado producto.
 }
 
program Ejercicio4;
const
	linea=('---------------------------------------');
	valorImp=-1;
type
	producto=record
		cod:integer;
		nom:string;
		desc:string;
		stockAct:integer;
		stockMin:integer;
		precio:real;
	end;
	productoRed=record
		cod:integer;
		cant:integer;
	end;
	maestro=file of producto;
	detalle=file of productoRed;
	
Procedure leer (var mae:maestro;var p:producto);
begin
	if(not eof(mae))then
		read(mae,p)
	else
		p.cod:=valorImp;
end;

Procedure leer2 (var det:detalle; var p:productoRed);
begin
	if(not eof(det))then
		read(det,p)
	else
		p.cod:=valorImp;
end;

procedure calcularMin (var det1,det2,det3,det4..det30:detalle;var p1,p2,p3,p4..p30:productoRed;var min:productoRed);
begin
	if(det1.cod<=det2.cod and det1.cod<=det3.cod .. and det1.cod<=det30.cod)then begin
		min:=p1;
		read(det1,p1);
	end else
	.
	.
	if(det29.cod<=det30.cod)then begin
		min:=p29;
		read(det29,p29);
	end else begin
		min:=p30;
		read(det30,p30)
	end;
end;

Procedure ActualizacionMae (var mae:maestro;var det1..det30:detalle;txt:text);
var
	p:producto;
	p1,p2,p3,p4..p30,min:productoRed;	
	cod:integer;
	vendido:integer;
begin
	reset(mae);
	reset(det1)..reset(det30);
	leer(mae,p);
	leer2(det1,p1)..leer2(det30,p30);
	while (min.cod<>valorImp)do begin
		calcularMin(det1..det30,p1..p30,min);
		vendido:=0;
		while(min.cod<>valorImp)and(min.cod=cod)do begin
			vendido:=vendido + min.cant;
			calcularMin(det1..det30,p1..p30,min);
		end;
		while(p.cod<min.cod)do 
			read(mae,p);
		p.stockAct:=p.stockAct-vendido;
		seek(mae,filePos(mae)-1);
		write(mae,p);
		if(p.stockAct<p.stockMin)then
			writeln(txt, p.stockAct ,'', p.nom,'',p.precio,'',p.desc);
	end;
end;
var
	mae:maestro;
	det1..det30:detalle;
	producto_texto:text;
Begin
	actualizarMae(mae,det1..det30,productos_text);
End.
