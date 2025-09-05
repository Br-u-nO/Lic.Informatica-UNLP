{
Modificar el ejercicio 4 de la práctica 1 (programa de gestión de empleados), 
agregándole una opción para realizar bajas copiando el último registro del archivo en 
la posición del registro a borrar y luego truncando el archivo en la posición del último 
registro de forma tal de evitar duplicados.
}

program untitled;
const
	corte=10;
	linea=('--------------------------------------------------------');
	valorAlto=30001;
type
string50=string[50];
empleado=record
	nro:integer;
	apellido:string50;
	nombre:string50;
    edad:integer;
    dni:integer;
end;
avo1=file of empleado;

procedure leerEmpleado(var e:empleado);
begin
    writeln('Escribir apellido');
	readln(e.apellido);
	if (e.apellido<>'fin')then begin
	  writeln('Escribir nombre');
		readln(e.nombre);
   	  writeln('Escribir numero de empleado ');
		readln(e.nro);
	  writeln('Escribir edad');
		readln(e.edad);
	  writeln('Escribir dni');
		readln(e.dni);
    end;
end;
procedure menu (var a:integer);
begin
  writeln(linea);
  writeln;
  writeln('Menu de opciones');
  writeln('1:Armar o sobreescribir archivo.');
  writeln('2:Buscar empleados por nombre o apellido.');
  writeln('3:Buscar empleados prontos a jubilarse.');
  writeln('4:Listar el total de empleados');
  writeln('5:Agregar empleado/s');
  writeln('6:Cambiar edad de empleado');
  writeln('7:Exportar datos a archivo de texto');
  writeln('8:Exportar empleados sin dni a archivo de texto');
  writeln('9:Eliminar un empleado');
  writeln(corte,':Terminar el programa');
  writeln;
  writeln(linea);
  writeln('Elige una de las anteriores');
  readln(a);
end;
procedure armarArchivo(var emp:avo1);
var
  e:empleado;
  nombre:string50;
  i:integer;
BEGIN
    i:=0;
    writeln('Escribir nombre del archivo');
    readln(nombre);
    assign(emp,nombre);
    rewrite(emp);
	leerEmpleado(e);
	while (e.apellido<>'fin')do begin
	   write(emp,e);
	   leerEmpleado(e);
	   i:=i+1;
	   if(i=30)then
	     e.apellido:='fin';
	end;	
	writeln(linea);
	writeln();
    close(emp);
END;
procedure leer(var emp:avo1;var e:empleado);
begin
  if (not eof(emp))then 
    read(emp,e)
  else
    e.dni:=valorAlto
end;

procedure buscarnom (var emp:avo1);
var
  nom:string50;
  e:empleado;
begin
   write('nombre o apellido a buscar ');
   writeln();
   readln(nom);
   writeln;
   reset(emp);
   leer(emp,e);
   writeln('--------------------- Busqueda ---------------------');
   writeln();
   while(e.dni<>valorAlto)do begin
     if (e.nombre=nom)or(e.apellido=nom)then 
       writeln('nro: ',e.nro,' nombre: ',e.nombre,' apellido: ',e.apellido,' edad: ',e.edad,' dni: ',e.dni);
     leer(emp,e);
   end;
   writeln(linea);
   writeln;
   close(emp);
end;

procedure listarArchivo (var emp:avo1);
var
  e:empleado;
begin
   reset(emp);
   leer(emp,e);
   writeln();
   writeln('--------------------- Empleados ---------------------');
   writeln();
   while(e.dni<>valorAlto)do begin
     writeln('nro: ',e.nro,' nombre: ',e.nombre,' apellido: ',e.apellido,' edad: ',e.edad,' dni: ',e.dni);
     leer(emp,e);
   end;
   writeln(linea);
   writeln;
   close(emp);
end;

procedure listar70(var emp:avo1);
var
  e:empleado;
begin
   reset(emp);
   leer(emp,e);
   writeln();
   writeln('--------------------- Empleados +70 ---------------------');
   writeln();
   while(e.dni<>valorAlto)do begin
     if (e.edad>70)then
       writeln('nro: ',e.nro,' nombre: ',e.nombre,' apellido: ',e.apellido,' edad: ',e.edad,' dni: ',e.dni);
     leer(emp,e);
   end;
   writeln(linea);
   writeln;
   close(emp);
end;

function qExiste (var emp:avo1;num:integer):boolean;
var
	ok:boolean;
	e:empleado;
begin
	ok:=false;
	seek(emp,0);
	leer(emp,e);
	while(e.dni<>valorAlto)and(not ok)do begin
		if(e.nro=num)then
			ok:=true
	    else
			leer(emp,e)
	end;
	qExiste:=ok;
end;

procedure agregarEmpleados(var emp:avo1);
var
  e:empleado;
begin
	writeln('--------------------- Agregar Empleados ---------------------');
	writeln();
	leerEmpleado(e);
	reset(emp);
	while(e.apellido<>'fin')do begin
		if(not (qExiste(emp,e.nro)))then 
			write(emp,e)
	    else
		    writeln('¡Ese numero ya esta asociado con un empleado!');
		leerEmpleado(e);
	end;
	close(emp);
	writeln(linea);
	writeln();
end;

procedure cambiarEdad (var emp:avo1);
var
	n:integer;
	e:empleado;
begin
	writeln('--------------------- Cambiar Edad ---------------------');
	writeln();
	reset(emp);
	writeln('Escribe el nro de empleado:');
	readln(n);
	if(qExiste(emp,n))then begin
		seek(emp,filePos(emp)-1);
		leer(emp,e);
		writeln('Escriba la edad:');
		readln(n);
		e.edad:=n;
		seek(emp,filePos(emp)-1);
		write(emp,e);
	end else
		writeln('¡Ese numero no esta asociado con un empleado!');
    close(emp);
    writeln(linea);
	writeln();
end;

procedure exportarTexto (var emp:avo1;var txt:text);
var
	apeynom:string50;
	e:empleado;
begin
	reset(emp);
	rewrite(txt);
	leer(emp,e);
	while(e.dni<>valorAlto)do begin
		apeynom:=e.nombre+' '+e.apellido;
		writeln(e.nro,e.edad,e.dni,apeynom);
		leer(emp,e);
	end;
	close(emp);
	close(txt)
end;

procedure dniNulo (var emp:avo1;var txt:text);
var
	e:empleado;
	apeynom:string50;
begin
	reset(emp);
	rewrite(txt);
	leer(emp,e);
	while(e.dni<>valorAlto)do begin
		if(e.dni=00)then  begin
			apeynom:=e.nombre+' '+e.apellido;
			writeln(e.nro,e.edad,e.dni,apeynom);
		end;
		leer(emp,e);
	end;
	close(emp);
	close(txt)
end;

procedure borrarEmpleado (var mae:avo1);
var
	emp:empleado;
	borrador:integer;
	nro:integer;
begin
	reset(mae);
	writeln('--------------------- Borrar Empleado ---------------------');
	writeln();
	writeln('numero de empleado a borrar');
	readln(nro);
	leer(mae,emp);
	while (emp.nro<>nro)and(emp.dni<>valorAlto) do 
		leer(mae,emp);
	if(emp.nro=nro)then begin
		borrador := filePos(mae)-1;
		seek(mae,fileSize(mae)-1);
		leer(mae,emp);
		seek(mae,borrador);
		write(mae,emp);
		seek(mae,fileSize(mae)-1);
		truncate(mae);
		writeln('Se a borrado al empleado correctamente');
	end else
		writeln('No existe empleado con ese numero');
	close(mae);
	writeln(linea);
	writeln();
end;
var
  empleados:avo1;
  a:integer;
  nombre:string50;
  emptexto,dnitexto:text;
begin
    assign(emptexto,'todos_empleados.txt');
    assign(dnitexto,'faltaDNIEmpleado.txt');
    menu(a);
    if((a<>1)and(a<10))then begin
		writeln('Escribir nombre del archivo');
		readln(nombre);
		assign(empleados,nombre);
	end;
    while(a<corte)do begin
   		case a of    
			1:armarArchivo(empleados);
			2:buscarnom(empleados);
			3:listar70(empleados);
			4:listarArchivo(empleados);
			5:agregarEmpleados(empleados);
			6:cambiarEdad(empleados);
			7:exportarTexto(empleados,emptexto);
			8:dniNulo(empleados,dnitexto);
			9:borrarEmpleado(empleados)
		end;
		menu(a);
	end;
end. 
