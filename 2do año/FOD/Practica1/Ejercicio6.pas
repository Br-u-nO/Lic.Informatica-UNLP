{
  6. Agregar al menú del programa del ejercicio 5, opciones para:
a. Añadir uno o más celulares al final del archivo con sus datos ingresados por
teclado.
b. Modificar el stock de un celular dado.
c. Exportar el contenido del archivo binario a un archivo de texto denominado:
”SinStock.txt”, con aquellos celulares que tengan stock 0.

NOTA: Las búsquedas deben realizarse por nombre de celular.}
	
Program untitled;
const
	linea=('----------------------------');
	valorAlto=-1;
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

procedure leer(var cel:avo1;var c:celular);
begin
	if not (eof(cel))then
		read(cel,c)
	else
		c.cod:=valorAlto;
end;

procedure menu (var a:integer);
begin
	writeln;
	writeln(linea);
	writeln('Menu de opciones');
	writeln('1:Importar datos de texto a un nuevo archivo');
	writeln('2:Listar celulares con stock bajo');
	writeln('3:Listar celulares con descripcion');
	writeln('4:Exportar datos a un archivo de texto');
	writeln('5:Agregar celular/es');
	writeln('6:Modificar stock');
	writeln('7:Listar celulares sin stock');
	writeln('8:Terminar programa');
	writeln(linea);
	writeln;
	writeln('Elige una de las anteriores opciones');
	readln(a);
end;

procedure impDatos(var cel:avo1;var txt:text);
var
	c:celular;
begin
	reset(txt);
	rewrite(cel);
	while(not eof(txt))do begin
		readln(txt,c.cod,c.precio,c.marca);
		readln(txt,c.stock,c.dispo,c.desc);
		readln(txt,c.nombre);
		write(cel,c);
	end;
	close(txt);
	close(cel);
end;

procedure leerCelular (var c:celular);
begin
writeln('Nombre:');
	readln(c.nombre);
	if(c.nombre<>'fin')then begin
		writeln('Codigo:');
		readln(c.cod);
		writeln('Precio:');
		readln(c.precio);
		writeln('Marca:');
		readln(c.marca);
		writeln('Stock:');
		readln(c.stock);
		writeln('Stock disponible: ');
		readln(c.dispo);	
		writeln('Descripcion:');
		readln(c.desc);
	end;
end;

procedure agregarCel(var cel:avo1);
var
	c:celular;
begin
	reset(cel);
	seek(cel,filesize(cel));
	leerCelular(c);
	while(c.nombre<>'fin')do begin
		write(cel,c);
		leerCelular(c);
	end;
	close(cel);
end;

procedure cambiarStock (var cel:avo1);
var
	nom:string;
	c:celular;
	s:integer;
begin
	reset(cel);
	writeln('Escribe el nombre a buscar');
	readln(nom);
	leer(cel,c);
	while(c.cod<>valorAlto) and (c.nombre<>nom)do
		leer(cel,c);
	if(c.cod<>valorAlto)then begin
		seek(cel,filepos(cel)-1);
		writeln('Escribe el nuevo stock');
		readln(s);
		c.stock:=s;
		write(cel,c)
	end else
		writeln('No existe un celular con ese nombre');
	close(cel);
end;

procedure listarSinStock(var cel:avo1);
var
	c:celular;
begin
	reset(cel);
	leer(cel,c);
	writeln;
	writeln(linea);
	writeln('Celulares sin stock');
	while (c.cod<>valorAlto)do begin
		if(c.stock=0)then
			writeln('cod: ',c.cod,' $',c.precio,' marca: ',c.marca,' stock: ',c.stock,' stock min:',c.dispo,' nombre: ',c.nombre,' descripcion: ',c.desc);
		leer(cel,c);
	end;
	writeln(linea);
	writeln;
	close(cel);
end;

procedure listarStockBajo(var cel:avo1);
var
	c:celular;
begin
	reset(cel);
	leer(cel,c);
	writeln;
	writeln(linea);
	writeln('Celulares con stock bajo');
	while (c.cod<>valorAlto)do begin
		if(c.stock<c.dispo)then
			writeln('cod: ',c.cod,' $',c.precio,' marca: ',c.marca,' stock: ',c.stock,' stock min:',c.dispo,' nombre: ',c.nombre,' descripcion: ',c.desc);
		leer(cel,c);
	end;
	writeln(linea);
	writeln;
	close(cel);
end;

procedure listarDescripcion(var cel:avo1);
var
	c:celular;
begin
	reset(cel);
	leer(cel,c);
	writeln;
	writeln(linea);
	writeln('Celulares con descripcion');
	while (c.cod<>valorAlto)do begin
		if(c.desc<>' ')then
			writeln('cod: ',c.cod,' $',c.precio,' marca: ',c.marca,' stock: ',c.stock,' stock min:',c.dispo,' nombre: ',c.nombre,' descripcion: ',c.desc);
		leer(cel,c);
	end;
	writeln(linea);
	writeln;
	close(cel);
end;

procedure expDatos (var cel:avo1;var txt:text);
var
	c:celular;
begin
	reset(cel);
	rewrite(txt);
	leer(cel,c);
	while(c.cod<>valorAlto)do begin
		writeln(txt,c.cod,' ',c.precio,' ',c.marca);
		writeln(txt,c.stock,' ',c.dispo,' ',c.desc);
		writeln(txt,c.nombre);
		leer(cel,c);
	end;
	close(cel);
	close(txt);
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
			2:listarStockBajo(celulares);
			3:listarDescripcion(celulares);
			4:expDatos(celulares,celtexto);
			5:agregarCel(celulares);
			6:cambiarStock(celulares);
			7:ListarSinStock(celulares)
		end;
		menu(a);
	end;
end.
