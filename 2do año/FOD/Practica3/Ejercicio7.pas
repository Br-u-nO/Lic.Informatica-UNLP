{
7. Se cuenta con un archivo que almacena información sobre especies de aves en vía 
de extinción, para ello se almacena: código, nombre de la especie, familia de ave, 
descripción y zona geográfica. El archivo no está ordenado por ningún criterio. Realice 
un programa que permita borrar especies de aves extintas. Este programa debe 
disponer de dos procedimientos:  
a. Un procedimiento que dada una especie de ave (su código) marque la misma 
como borrada (en caso de querer borrar múltiples especies de aves, se podría 
invocar este procedimiento repetidamente). 
b. Un procedimiento que compacte el archivo, quitando definitivamente las 
especies de aves marcadas como borradas.  Para quitar los registros se deberá 
copiar el último registro del archivo en la posición del registro a borrar y luego 
eliminar del archivo el último registro de forma tal de evitar registros duplicados.  
i. 
Implemente una variante de este procedimiento de compactación del 
archivo (baja física) donde el archivo se trunque una sola vez. 	
}

program Ejercicio7;
const
	line=('---------------------');
	valorImp=-20;
type
	ave=record
		cod:integer;
		nombre:string;
		familia:string;
		desc:string;
		zona:string;
	end;
	maestro=file of ave;
	
	
procedure leer(var mae:maestro;var a:ave);
begin
	if(not eof(mae))then
		read(mae,a)
	else
		a.cod:=valorImp;
end;


procedure borrarEspecie (var mae:maestro);
var
	nom:string;
	a:ave;
begin
	reset(mae);
	readln(nom);
	leer(mae,a);
	while(nom<>'fin')do begin
		while((a.nombre<>nom)and(a.cod<>valorImp))do 
			leer(mae,a);
		if(a.nombre=nom)then begin
			a.nombre:='*'+a.nombre;
			seek(mae,filePos(mae)-1);
			write(mae,a);
			writeln('Borrado correctamente');
		end else
			writeln('No existe tal ave');
		readln(nom);
	end;
	close(mae);
end;

procedure compactarArchivo (var mae:maestro);
var
	a,temp:ave;
	i,act:integer;
begin
	reset(mae);
	leer(mae,a);
	i:=0;act:=0;
	while(a.cod<>valorImp)do begin
		if(a.nombre[1]='*')then begin
			i+=1;
			seek(mae,filesize(mae)-i);
			read(mae,temp);
			seek(mae,filePos(mae)-1);
			write(mae,a);
			seek(mae,act);
			write(mae,temp);
		end;
		act+=1;
		leer(mae,a);
	end;
	close(mae);
end;

var
	mae:maestro;
	nom:string;
begin
	readln(nom);
	assign(mae,nom);
	borrarEspecie(mae);
	compactarArchivo(mae);
end.
