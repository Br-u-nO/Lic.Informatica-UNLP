{
   3. Realizar un programa que presente un menú con opciones para:
a. Crear un archivo de registros no ordenados de empleados y completarlo con
datos ingresados desde teclado. De cada empleado se registra: número de
empleado, apellido, nombre, edad y DNI. Algunos empleados se ingresan con
DNI 00. La carga finaliza cuando se ingresa el String ‘fin’ como apellido.
b. Abrir el archivo anteriormente generado y
i. Listar en pantalla los datos de empleados que tengan un nombre o apellido
determinado, el cual se proporciona desde el teclado.
ii. Listar en pantalla los empleados de a uno por línea.
iii. Listar en pantalla los empleados mayores de 70 años, próximos a jubilarse.
NOTA: El nombre del archivo a crear o utilizar debe ser proporcionado por el usuario.
   
   
}
program untitled;
const
  linea=('----------------------------');
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
    e.dni:=9999
end;
procedure buscarnom (var emp:avo1);
var
  nom:string50;
  e:empleado;
begin
   write('nombre o apellido a buscar ');
   writeln();
   readln(nom);
   reset(emp);
   leer(emp,e);
   while(e.dni<>9999)do begin
     if (e.nombre=nom)or(e.apellido=nom)then 
       writeln('nro: ',e.nro,' nombre: ',e.nombre,' apellido: ',e.apellido,' edad: ',e.edad,' dni: ',e.dni);
     leer(emp,e);
   end;
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
   while(e.dni<>9999)do begin
     writeln('nro: ',e.nro,' nombre: ',e.nombre,' apellido: ',e.apellido,' edad: ',e.edad,' dni: ',e.dni);
     leer(emp,e);
   end;
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
   while(e.dni<>9999)do begin
     if (e.edad>70)then
       writeln('nro: ',e.nro,' nombre: ',e.nombre,' apellido: ',e.apellido,' edad: ',e.edad,' dni: ',e.dni);
     leer(emp,e);
   end;
   close(emp);
end;
procedure analizar (var emp:avo1);
begin
   buscarnom(emp);
   listarArchivo(emp);
   listar70(emp);
end;
var
  empleados:avo1;
  a:integer;
  nombre:string[20];
begin
    a:=0;
    while(a<>6)do begin
        menu();
        writeln('Elige una de las anteriores');
        readln(a);
	if (a<>6)then begin
		writeln('Escribir nombre del archivo');
		readln(nombre);
		assign(empleados,nombre);
	end;
	case a of    
		1:armarArchivo(empleados);
		2:buscarnom(empleados);
		3:listar70(empleados);
		4:listarArchivo(empleados);
	end;
  end;
end. 
