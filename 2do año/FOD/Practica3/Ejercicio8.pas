{
	8. Se cuenta con un archivo con información de las diferentes distribuciones de linux 
existentes. De cada distribución se conoce: nombre, año de lanzamiento, número de 
versión del kernel, cantidad de desarrolladores y descripción. El nombre de las 
distribuciones no puede repetirse. Este archivo debe ser mantenido realizando bajas 
lógicas y utilizando la técnica de reutilización de espacio libre llamada lista invertida. 
Escriba la definición de las estructuras de datos necesarias y los siguientes 
procedimientos: 

	a. BuscarDistribucion: módulo que recibe por parámetro el archivo, un 
		nombre de distribución y devuelve la posición dentro del archivo donde se 
		encuentra el registro correspondiente a la distribución dada (si existe) o 
		devuelve -1 en caso de que no exista.. 

	b. AltaDistribucion: módulo que recibe como parámetro el archivo y el registro 
		que contiene los datos de una nueva distribución, y se encarga de agregar 
		la distribución  al archivo reutilizando espacio disponible en caso de que 
		exista. (El control de unicidad lo debe realizar utilizando el módulo anterior). 
		En caso de que la distribución que se quiere agregar ya exista se debe 
		informar “ya existe la distribución”. 

	c. BajaDistribucion: módulo que recibe como parámetro el archivo y el 
		nombre de una distribución, y se encarga de dar de baja lógicamente la 
		distribución dada. Para marcar una distribución como borrada se debe 
		utilizar el campo cantidad de desarrolladores para mantener actualizada 
		la lista invertida. Para verificar que la distribución a borrar exista debe utilizar 
		el módulo BuscarDistribucion. En caso de no existir se debe informar 
		“Distribución no existente”. 
}

program Ejercicio8;
const
	linea=('-------------------------');
	valorImp='fin';
type
	distribucion=record
		nombre:string;
		anio:string;
		num:integer;
		cant:integer;
		desc:string;
	end;
	maestro=file of distribucion;
	
procedure leer (var mae:maestro;var d:distribucion);
begin
	if(not eof(mae))then
		read(mae,d)
	else
		d.nombre:='fin';
end;

procedure leerDistribucion (var d:distribucion);
begin
	writeln('Nueva Distribucion');
	writeln('Nombre:');
	readln(d.nombre);
	if(d.nombre<>'fin')then begin
		writeln('Año de lanzamiento:');
		readln(d.anio);
		writeln('Numero de version de kernel:');
		readln(d.num);
		writeln('Cantidad de desarrolladores:');
		readln(d.cant);
		writeln('Descripcion:');
		readln(d.desc);
	end;
end;

function BuscarDistribucion (var mae:maestro;nom:string):integer;
var
	d:distribucion;
	result:integer;
begin
	reset(mae);
	leer(mae,d);
	while((d.nombre<>valorImp) and (d.nombre<>nom))do 
		leer(mae,d);
	if(d.nombre<>nom)then
		 result:=-1
	else
		if(d.cant>0)then
			result:=filePos(mae)-1;
	close(mae);	
	BuscarDistribucion:= result;
end;

procedure BajaDistribucion (var mae:maestro;nom:string);
var
	primer,temp:distribucion;
	pos:integer;
begin
	pos:=BuscarDistribucion(mae,nom);
	if(pos=-1)then
		writeln('Distribución no existente')
	else begin
		reset(mae);
		leer(mae,primer);
		
		seek(mae,pos);
		leer(mae,temp);
		temp.cant:=pos*-1;
		seek(mae,filePos(mae)-1);
		write(mae,primer);
		
		seek(mae,0);
		write(mae,temp);
		close(mae);
	end;
end;

procedure AltaDistribucion (var mae:maestro;agregar:distribucion);
var
	pos:integer;
	d:distribucion;
begin
	pos:=BuscarDistribucion(mae,agregar.nombre);
	reset(mae);
	if(pos<>-1)then
		writeln('ya existe la distribución')
	else begin
		leer(mae,d);
		if(d.cant=0)then begin
			seek(mae,fileSize(mae));
			write(mae,agregar);
		end else begin
			seek(mae,d.cant*-1);
			leer(mae,d);
			seek(mae,filePos(mae)-1);
			write(mae,agregar);
			seek(mae,0);
			write(mae,d);
		end;
	end;
	close(mae);
end;

procedure CrearArchivo (var mae:maestro);
var
	d:distribucion;
begin
	rewrite(mae);
	d.cant:=0;
	write(mae,d);
	close(mae);
end;

var
	mae:maestro;
	d:distribucion;
begin
	assign(mae,'linux');
    BajaDistribucion(mae,'bruno');
end.
