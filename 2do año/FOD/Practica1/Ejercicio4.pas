{
  4. Agregar al menú del programa del ejercicio 3, opciones para:
a. Añadir uno o más empleados al final del archivo con sus datos ingresados por
teclado. Tener en cuenta que no se debe agregar al archivo un empleado con
un número de empleado ya registrado (control de unicidad).
b. Modificar la edad de un empleado dado.
c. Exportar el contenido del archivo a un archivo de texto llamado
“todos_empleados.txt”.
d. Exportar a un archivo de texto llamado: “faltaDNIEmpleado.txt”, los empleados
que no tengan cargado el DNI (DNI en 00).
NOTA: Las búsquedas deben realizarse por número de empleado.
}
program untitled;
const
  linea=('----------------------------');
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
procedure menu ();
begin
  writeln(linea);
  writeln('Menu de opciones');
  writeln('1:Armar o sobreescribir archivo.');
  writeln('2:Buscar empleados por nombre o apellido.');
  writeln('3:Buscar empleados prontos a jubilarse.');
  writeln('4:Listar el total de empleados');
  writeln('5:Agregar empleado/s');
  writeln('6:Cambiar edad de empleado');
  writeln('7:Exportar datos a archivo de texto');
  writeln('8:Exportar empleados sin dni a archivo de texto');
  writeln('9:Terminar el programa');
  writeln(linea);
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
	leerEmpleado(e);
	reset(emp);
	while(e.apellido<>'fin')do begin
		if(not (qExiste(emp,e.nro)))then begin
			write(emp,e)
		end else
		  writeln('¡Ese numero ya esta asociado con un empleado!');
		leerEmpleado(e);
	end;
	close(emp);
end;

procedure cambiarEdad (var emp:avo1);
var
	n:integer;
	e:empleado;
begin
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
var
  empleados:avo1;
  a:integer;
  nombre:string50;
  emptexto,dnitexto:text;
begin
    assign(emptexto,'todos_empleados.txt');
    assign(dnitexto,'faltaDNIEmpleado.txt');
    a:=0;
    menu();
    writeln('Elige una de las anteriores');
    readln(a);
    if (a<>9)then begin
		writeln('Escribir nombre del archivo');
		readln(nombre);
		assign(empleados,nombre);
	end;
    while(a<>9)do begin
   		case a of    
			1:armarArchivo(empleados);
			2:buscarnom(empleados);
			3:listar70(empleados);
			4:listarArchivo(empleados);
			5:agregarEmpleados(empleados);
			6:cambiarEdad(empleados);
			7:exportarTexto(empleados,emptexto);
			8:dniNulo(empleados,dnitexto)
		end;
		menu();
        writeln('Elige una de las anteriores');
        readln(a);
	end;
end. 
