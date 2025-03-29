{
  5. Realizar un programa para una tienda de celulares, que presente un menú con
	opciones para:
   a. Crear un archivo de registros no ordenados de celulares y cargarlo con datos
	ingresados desde un archivo de texto denominado “celulares.txt”. Los registros
	correspondientes a los celulares deben contener: código de celular, nombre,
	descripción, marca, precio, stock mínimo y stock disponible.
   b. Listar en pantalla los datos de aquellos celulares que tengan un stock menor al
	stock mínimo.
   c. Listar en pantalla los celulares del archivo cuya descripción contenga una
	cadena de caracteres proporcionada por el usuario.
   d. Exportar el archivo creado en el inciso a) a un archivo de texto denominado
	“celulares.txt” con todos los celulares del mismo. El archivo de texto generado
	podría ser utilizado en un futuro como archivo de carga (ver inciso a), por lo que
	debería respetar el formato dado para este tipo de archivos en la NOTA 2.

	NOTA 1: El nombre del archivo binario de celulares debe ser proporcionado por el
	usuario.
	NOTA 2: El archivo de carga debe editarse de manera que cada celular se especifique
	en tres líneas consecutivas. En la primera se especifica: código de celular, el precio y
	marca, en la segunda el stock disponible, stock mínimo y la descripción y en la tercera
	nombre en ese orden. Cada celular se carga leyendo tres líneas del archivo
	celulares.txt”.}
	
Program untitled;
const
	linea=('----------------------------');
	valorAlto=30001;
type
	celular=record
		cod:integer;
		nombre:string;
		desc:string;
		marca:string;
		precio:real;
		stock:integer;
		dispo:integer;
	end;
	avo1=file of celular;

procedure menu (var a:integer);
begin
	writeln;
	writeln(linea);
	writeln('Menu de opciones');
	writeln('1:Importar datos de texto a un nuevo archivo');
	writeln('2:Listar celulares con stock bajo');
	writeln('3:Listar celulares con descripcion');
	writeln('4:Exportar datos a un archivo de texto');
	writeln('8:Terminar programa');
	writeln(linea);
	writeln;
	writeln('Elige una de las anteriores opciones');
	readln(a);
end;
var
	celulares:avo1;
	celtexto:text;
	a:integer;
	nom:string;
begin
	assign(celtexto,'celulares.txt');
	menu(a);
	if(a<>8)then
	  writeln('Elige un nombre');
	  readln(nom);
	  assign(celulares,nom);
	while(a<>8)do begin
		case a of
			1:impDatos(celulares,celtexto);
			2:listarSinStock(celulares);
			3:listarDescripcion(celulares);
			4:expDatos(celulares,celtexto)
		end;
		menu(a);
end.
