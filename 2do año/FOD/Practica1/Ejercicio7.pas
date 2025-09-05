{
   7. Realizar un programa que permita:
a) Crear un archivo binario a partir de la información almacenada en un archivo de
texto. El nombre del archivo de texto es: “novelas.txt”. La información en el
archivo de texto consiste en: código de novela, nombre, género y precio de
diferentes novelas argentinas. Los datos de cada novela se almacenan en dos
líneas en el archivo de texto. La primera línea contendrá la siguiente información:
código novela, precio y género, y la segunda línea almacenará el nombre de la
novela.

b) Abrir el archivo binario y permitir la actualización del mismo. Se debe poder
agregar una novela y modificar una existente. Las búsquedas se realizan por
código de novela.
NOTA: El nombre del archivo binario es proporcionado por el usuario desde el teclado.
   
}


program untitled;
const
	linea=('----------------------------');
	valorImp=-1;
type
	novela=record
		cod:integer;
		nombre:string;
		genero:string;
		precio:real;
	end;
	avo1=file of novela;
	
procedure menu (var a:integer);
begin
	writeln;
	writeln(linea);
	writeln('Menu de opciones');
	writeln('1:Crear rchivo');
	writeln('2:Exportar archivo');
	writeln('3:Agregar novela');
	writeln('4:Actualizar precio');
	writeln('5:Listar archivo');
	writeln('6:Terminar programa');
	writeln(linea);
	writeln;
	writeln('Elige una de las anteriores opciones');
	readln(a);
end;
procedure leer (var novelas:avo1;var n:novela);
begin
	if(not eof(novelas))then 
		read(novelas,n)
	else
		n.cod:=valorImp;
end;

procedure crearArchivo(var nov:avo1;var txt:text);
var
	n:novela;
begin
	reset(txt);
	rewrite(nov);
	while(not eof(txt))do begin
		readln(txt,n.cod,n.precio,n.genero);
		readln(txt,n.nombre);
		write(nov,n);
	end;
	close(txt);
	close(nov);
end;

procedure exportarArchivo (var nov:avo1; var txt:text);
var
	n:novela;
begin
	reset(nov);
	rewrite(txt);
	leer(nov,n);
	while(n.cod<>valorImp)do begin
		writeln(txt,n.cod,'',n.precio,'',n.genero);
		writeln(txt,n.nombre);
		leer(nov,n);
	end;
	close(txt);
	close(nov);
end;

procedure leerNovela (var n:novela);
begin
	writeln('Nombre:');
	readln(n.nombre);
	if(n.nombre<>'fin')then begin
		writeln('Codigo:');
		readln(n.cod);
		writeln('Precio:');
		readln(n.precio);
		writeln('Genero:');
		readln(n.genero);
	end;
end;


function qExiste (var nov:avo1;s:string):boolean;
var
	ok:boolean;
	n:novela;
begin
	ok:=false;
	seek(nov,0);
	leer(nov,n);
	while(n.cod<>valorImp)and(not ok)do begin
		if(n.nombre=s)then
			ok:=true
	    else
			leer(nov,n)
	end;
	qExiste:=ok;
end;

procedure agregarNovela(var nov:avo1);
var
	n:novela;
begin
    writeln(linea);
    writeln('Agregar novela');
    writeln;
	reset(nov);
	leerNovela(n);
	if(not qExiste(nov,n.nombre))then begin
		while(n.nombre<>'fin')do begin
			seek(nov,filesize(nov));
			write(nov,n);
			leerNovela(n);
		end;
	end else
		writeln('Ya existe este libro');
	writeln;
	close(nov);
end;

procedure cambiarPrecio (var nov:avo1);
var
	p:real;
	s:string;
	n:novela;
begin
    reset(nov);
	writeln('Nombre de la novela');
	readln(s);
	if(qExiste(nov,s))then begin
		seek(nov,filepos(nov)-1);
		read(nov,n);
		writeln('Nuevo precio:');
		readln(p);
		n.precio:=p;
		seek(nov,filepos(nov)-1);
		write(nov,n)
	end;
	close(nov);
end;

procedure listarNovelas (var nov:avo1);
var
	n:novela;
begin
	reset(nov);
	leer(nov,n);
	writeln(linea);
	while(n.cod<>valorImp)do begin
		writeln('Codigo: ', n.cod, ' Nombre: ', n.nombre, ' Genero: ', n.genero, ' Precio: ', n.precio);
		leer(nov,n);
	end;
	writeln(linea);
	writeln;
	close(nov);
end;

var
	novelas:avo1;
	novtexto:text;
	a:integer;
	nom:string;
begin
	assign(novtexto,'novelas.txt');
	menu(a);
	if(a<>6)then
	  writeln('Elige un nombre');
	  readln(nom);
	  assign(novelas,nom);
	while(a<>6)do begin
		case a of
			1:crearArchivo(novelas,novtexto);
			2:exportarArchivo(novelas,novtexto);
			3:agregarNovela(novelas);
			4:cambiarPrecio(novelas);
			5:listarNovelas(novelas);
		end;
		menu(a);
	end;
end.
