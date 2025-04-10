{
3. A partir de información sobre la alfabetización en la Argentina, se necesita actualizar un 
archivo que contiene los siguientes datos: nombre de provincia, cantidad de personas 
alfabetizadas y total de encuestados. Se reciben dos archivos detalle provenientes de dos 
agencias de censo diferentes, dichos archivos contienen: nombre de la provincia, código de 
localidad, cantidad de alfabetizados y cantidad de encuestados. Se pide realizar los módulos 
necesarios para actualizar el archivo maestro a partir de los dos archivos detalle. 
NOTA: Los archivos están ordenados por nombre de provincia y en los archivos detalle      
pueden venir 0, 1 ó más registros por cada provincia. 
}

program ejercicio3;
const
	liena='------------------------';
	valorImp='fin';
type
	arch=record
		nombre:string;
		cant:integer;
		tot:integer;
	end;
	arch_censo=record
		nombre:string;
		cod:integer;
		cant:integer;
		tot:integer;
	end;
	detalle=file of arch_censo;
	maestro=file of arch;

procedure leer (var mae:maestro;var a:arch);
begin
	if (not eof(mae))then
		read(mae,a)
	else
		a.nombre:=valorImp;
end;

procedure leer2 (var det:detalle;var a:arch_censo);
begin
	if (not eof(det))then
		read(det,a)
	else
		a.nombre:=valorImp;
end;

procedure archivoMinimo (var det1,det2:detalle ;var ac1,ac2,min:arch_censo;prov:string);
begin
	if(ac1.nombre=prov)then begin
		min:=ac1;
		leer2(det1,ac1);
	end else 
		if (ac2.nombre=prov)then begin
			min:=ac2;
			leer2(det2,ac2);
	end else
		min.nombre:=valorImp;
end;
procedure actualizarMaestro (var mae:maestro;var det1,det2:detalle);
var
	a:arch;
	ac1,ac2:arch_censo;
	min:arch_censo;
	cant,tot:integer;
begin
	reset(mae);
	reset(det1);
	reset(det2);
	leer(mae,a);
	leer2(det1,ac1);
	leer2(det2,ac2);
	while((ac2.nombre<>valorImp) or (ac1.nombre<>valorImp))do begin
		archivoMinimo(det1,det2,ac1,ac2,min,a.nombre);
		cant:=0;tot:=0;
		while(min.nombre<>valorImp)do begin
			cant:=cant+min.cant;
			tot:=tot+min.tot;
			archivoMinimo(det1,det2,ac1,ac2,min,a.nombre);
		end;
		seek(mae,filePos(mae)-1);
		a.cant:=cant;
		a.tot:=tot;
		write(mae,a);
		leer(mae,a);
	end;	
	close(mae);
	close(det1);
	close(det2);
end;

var
	det1,det2:detalle;
	mae:maestro;
	nombre:string;
Begin
	readln(nombre);
	assign(mae,nombre);
	readln(nombre);
	assign(det1,nombre);
	readln(nombre);
	assign(det2,nombre);
	actualizarMaestro(mae,det1,det2);
End.
