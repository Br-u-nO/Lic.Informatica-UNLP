{
	Una cadena de tiendas de indumentaria posee un archivo maestro no ordenado con 
la información correspondiente a las prendas que se encuentran a la venta. De cada 
prenda se registra: cod_prenda, descripción, colores, tipo_prenda, stock y 
precio_unitario. Ante un eventual cambio de temporada, se deben actualizar las 
prendas a la venta. Para ello reciben un archivo conteniendo: cod_prenda de las 
prendas que quedarán obsoletas. Deberá implementar un procedimiento que reciba 
ambos archivos y  realice la baja lógica de las prendas, para ello deberá modificar el 
stock de la prenda correspondiente a valor negativo. 
Adicionalmente, deberá implementar otro procedimiento que se encargue de 
efectivizar las bajas lógicas que se realizaron sobre el archivo maestro con la 
información de las prendas a la venta. Para ello se deberá utilizar una estructura 
auxiliar (esto es, un archivo nuevo),  en el cual se copien únicamente aquellas prendas 
que no están marcadas como borradas. Al finalizar este proceso de compactación 
del archivo, se deberá renombrar el archivo nuevo con el nombre del archivo maestro 
original.
}

program Ejercicio6;
const 
	linea =('-----------------------------');
	valorImp=-12;
type
	prenda=record
		cod:integer;
		desc:string;
		colores:string;
		tipo_prenda:string;
		stock:integer;
		precio_unitario:real;
	end;
	maestro=file of prenda;
	contenido=file of integer;
	
	
procedure leer (var mae:maestro;var p:prenda);
begin
	if(not eof(mae))then
		read(mae,p)
	else
		p.cod:=valorImp;
end;

procedure leer2 (var det:contenido;var cod:integer);
begin
	if(not eof(det))then
		read(det,cod)
	else
		cod:=valorImp;
end;
procedure bajaLogica (var mae:maestro;var det:contenido);
var
	cod:integer;
	p:prenda;
begin
	reset(mae);
	reset(det);
	leer(mae,p);
	leer2(det,cod);
	while(cod<>valorImp)do begin
		while((p.cod<>cod) and (p.cod <>valorImp))do
			leer(mae,p);
		if(p.cod=cod)then begin
			seek(mae,filePos(mae)-1);
			p.stock:=p.stock*-1;
			write(mae,p);
			writeln('Se elimino correctamente');
		end else 
			writeln('No existe tal producto');
		seek(mae,0)
	end;
	close(mae);
	close(det);
end;

procedure nuevoArchivo (var mae,nue:maestro;nom:string);
var
	p:prenda;
begin
	reset(mae);
	rewrite(nue);
	leer(mae,p);
	while(p.cod<>valorImp)do begin
		if(p.stock>=0)then
			write(nue,p);
		leer(mae,p)
	end;
	Rename(mae,'maestro_viejo');
	assign(nue,nom);
	close(mae);
	close(nue);
end;

var
	mae,nue:maestro;
	det:contenido;
	nom:string;
begin
	readln(nom);
	assign(mae,nom);
	bajaLogica(mae,det);
	nuevoArchivo(mae,nue,nom);
	
end.
	
