{
Dada la siguiente estructura:  
	type 
	reg_flor = record 
	nombre: String[45]; 
	codigo: integer; 
	end; 
	tArchFlores = file of reg_flor; 
	
Las bajas se realizan apilando registros borrados y las altas reutilizando registros 
borrados. El registro 0 se usa como cabecera de la pila de registros borrados: el 
número 0 en el campo código implica que no hay registros borrados y -N indica que el 
próximo registro a reutilizar es el N, siendo éste un número relativo de registro válido. 
 
a. Implemente el siguiente módulo: 
Abre el archivo y agrega una flor, recibida como parámetro 
manteniendo la política descrita anteriormente

	procedure agregarFlor (var a: tArchFlores ; nombre: string; 
	codigo:integer); 

b. Liste el contenido del archivo omitiendo las flores eliminadas. Modifique lo que 
considere necesario para obtener el listado.
}

program ejercicio4;
const
	linea=('---------------------------------------------');
	valorImp=-1;
type 
	reg_flor = record 
	nombre: String[45]; 
	cod: integer; 
	end; 
	tArchFlores = file of reg_flor; 

procedure leer (var a:tArchFlores;var f:reg_flor);
begin
	if(not eof(a))then
		read(a,f)
	else
		f.cod:=valorImp;
end;

procedure leerFlor (var f:reg_flor);
begin
	writeln('Codigo de la Flor: ');
	readln(f.cod);
	if(f.cod<>valorImp)then begin
		writeln('Nombre de la Flor: ');
		readln(f.nombre);
	end;
end;

procedure crearArchivo (var a:tArchFlores);
var
	f:reg_flor;
begin
	writeln('-------------- Crear Archivo --------------');
	writeln;
	rewrite(a);
	
	f.cod:=0;
	write(a,f);
	
	leerFlor(f);
	while(f.cod<>valorImp)do begin
		write(a,f);
		leerFlor(f);
	end;
	close(a);
end;
procedure agregarFlor (var a: tArchFlores ; nombre: string; codigo:integer); 
var
	f,borrados:reg_flor;
begin
	reset(a);
	leer(a,borrados);
	f.cod:=codigo; f.nombre:=nombre;
	if(borrados.cod=0)then begin
		seek(a,fileSize(a));
		write(a,f);
	end else begin
		seek(a,borrados.cod*(-1));
		read(a,borrados);
		seek(a,filePos(a)-1);
		write(a,f);
		seek(a,0);
		write(a,borrados);
	end;
	close(a);
end;

procedure eliminarFlor (var a:tArchFlores);
var
	cod:integer;
	flor,borrados:reg_flor;
begin
	reset(a);
	writeln('------------- Eliminar Flores -------------');
	writeln;
	writeln('Escribe el codigo de la flor a eliminar: ');
	readln(cod);
	leer(a,borrados);
	leer(a,flor);
	while((flor.cod<>valorImp)and(flor.cod<>cod))do begin
		leer(a,flor);
	end;
	if(flor.cod<>cod)then
		writeln('No existe una flor con ese codigo')
	else begin
		seek(a,filePos(a)-1);
		flor.cod:=filePos(a)*(-1);
		write(a,borrados);
		seek(a,0);
		write(a,flor);
	end;
	writeln;
	writeln(linea);
	close(a);
end;

procedure listarFlores (var a:tArchFlores);
var
	f:reg_flor;
begin
	reset(a);
	seek(a,1);
	leer(a,f);
	writeln('------------------ Flores ------------------');
	while(f.cod<>valorImp)do begin
		if(f.cod>=1)then 
			writeln('Nombre: ',f.nombre,' Codigo: ',f.cod,'.');
		leer(a,f);
	end;
	writeln(linea);
	close(a);
end;

procedure menu (var a:integer);
begin
	writeln('------------- Menu de opciones -------------');
	writeln;
	writeln('1:Crear Archivo');
	writeln('2:Agregar Flor');
	writeln('3:Borrar Flor');
	writeln('4:Listar Flores');
	writeln('5:Finalizar Programa');
	writeln();	
	writeln;
	writeln('Elige una de las opciones anteriores:');
	readln(a);
	writeln(linea);
	writeln;
end;
var
	a:tArchFlores;
	b,cod:integer;
	nombre:string;
begin
	menu(b);
	writeln('Escribe nombre del archivo');
	readln(nombre);
	assign(a,nombre);
	while(b<5)do begin
		case b of
			1:crearArchivo(a);
			2:begin
				writeln('-------------- Agregar Flores --------------');
				writeln('Escribir nombre de la flor:');
				readln(nombre);
				writeln('Escribir codigo de la flor:');
				readln(cod);
				agregarFlor(a,nombre,cod);
				writeln(linea);
			end;
			3:eliminarFlor(a);
			4:listarFlores(a);
		end;
		menu(b);
	end;
end.
