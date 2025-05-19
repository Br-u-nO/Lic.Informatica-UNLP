{mae
	3. Realizar un programa que genere un archivo de novelas filmadas durante el presente 
	año. De cada novela se registra: código, género, nombre, duración, director  y precio.
}
program Eercicio3;
const
	linea=('-------------------------------------------');
	valorImp='fin';
	corte=4;
type
	novela=record
		cod:integer;
		genero:string;
		nombre:string;
		duracion:integer;
		director:string;
		precio:real;
	end;
	maestro=file of novela;

procedure leerNovela (var nov:novela;i:integer);
begin
	writeln('-------- Novela n°',i,' --------');
	writeln('Nombre de la novela:');
	readln(nov.nombre);
	if(nov.nombre<>valorImp)then begin
		writeln('Codigo de la novela:');
		readln(nov.cod);
		writeln('Genero de la novela:');
		readln(nov.genero);
		writeln('Duracion de la novela:');
		readln(nov.duracion);
		writeln('Director de la novela:');
		readln(nov.director);
		writeln('Precio de la novela:');
		readln(nov.precio);
	end;
	writeln(linea);
	i:=i+1;
end;

procedure modificacionNovela (var nov:novela);
begin
	writeln('Nombre de la novela:');
	readln(nov.nombre);
	writeln('Genero de la novela:');
	readln(nov.genero);
	writeln('Duracion de la novela:');
	readln(nov.duracion);
	writeln('Director de la novela:');
	readln(nov.director);
	writeln('Precio de la novela:');
	readln(nov.precio);
end;

procedure leer (var mae:maestro;var nov:novela);
begin
	if(not eof(mae))then
		read(mae,nov)
	else
		nov.nombre:=valorImp;
end;

procedure menu (var a:integer);
begin
	writeln('------------- Menu de opciones -------------');
	writeln('1: Crear archivo');
	writeln('2: Mantenimiento del archivo');
	writeln('3: Exportar a archivo de texto');
	writeln('4: Finalizar el programa');
	writeln(linea);
	writeln;
	writeln('Elige una de las opciones anteriores: ');
	readln(a);
end;

function qExiste (var mae:maestro;num:integer):boolean;
var
	ok:boolean;
	nov:novela;
begin
	ok:=false;
	seek(mae,1);
	leer(mae,nov);
	while(nov.nombre<>valorImp)and(not ok)do begin
		if(nov.cod=num)then
			ok:=true
	    else
			leer(mae,nov)
	end;
	qExiste:=ok;
end;

procedure agregarNovela (var mae:maestro);
var
	nov,indice:novela;
begin
	writeln('------------- Agregar Novela -------------');
	reset(mae);
	leer(mae,indice);
	leerNovela(nov,1);
	if(not qExiste(mae,nov.cod))then 
		if(indice.cod=0)then begin
			seek(mae,fileSize(mae));
			write(mae,nov);
		end else begin
			seek(mae,indice.cod*(-1));
			leer(mae,indice);
			seek(mae,filePos(mae)-1);
			write(mae,nov);
			seek(mae,0);
			write(mae,indice);
		end
	else
		writeln('Ya existe una novela con este codigo');
	close(mae);
	writeln(linea);
end;

procedure modificarNovela (var mae:maestro);
var
	cod:integer;
	nov:novela;
begin
	reset(mae);
	writeln('------------- Modificar Novela -------------');
	writeln;
	writeln('Codigo de novela a modificar: ');
		readln(cod);
	seek(mae,1);
	leer(mae,nov);
	while(nov.nombre<>valorImp)and (nov.cod<>cod)do 
		leer(mae,nov);
	if(nov.cod=cod)then begin
		modificacionNovela(nov);
		seek(mae,filePos(mae)-1);
		write(mae,nov);
	end else
		writeln('No existe tal novela');
	close(mae);
end;

procedure eliminarNovela (var mae:maestro);
var
	cod:integer;
	nov,indice:novela;
begin
	reset(mae);
	writeln('------------- Eliminar Novela -------------');
	writeln;
	writeln('Codigo de novela a eliminar: ');
		readln(cod);
	leer(mae,indice);
	leer(mae,nov);
	while(nov.nombre<>valorImp)and (nov.cod<>cod)do 
		leer(mae,nov);
	if(nov.cod=cod)then begin
		seek(mae,filePos(mae)-1);
		nov.cod:=filePos(mae)*(-1);
		write(mae,indice);
		seek(mae,0);
		write(mae,nov);
	end else
		writeln('No existe tal novela');
	close(mae);
end;

procedure menuMantenimiento (var mae:maestro);
var
	a:integer;
	nom:string;
begin
	writeln('Escriba nombre del archivo: ');
		readln(nom);
		assign(mae,nom);
	writeln('------------- Menu de mantenimiento -------------');
	writeln('1: Agregar novela');
	writeln('2: Modificar novela');
	writeln('3: Eliminar novela');
	writeln(linea);
	writeln;
	writeln('Elige una de las opciones anteriores: ');
	readln(a);
	case a of
		1:agregarNovela(mae);
		2:modificarNovela(mae);
		3:eliminarNovela(mae);
	end;
end;


procedure crearArchivo (var mae:maestro);
var
	nov:novela;
	i:integer;
	nom:string;
begin
	i:=1; nov.cod:=0;
	writeln('Escriba nombre del archivo');
	readln(nom);
	assign(mae,nom);
	rewrite(mae);
	write(mae,nov);
	leerNovela(nov,i);
	while(nov.nombre<>valorImp)do begin
		write(mae,nov);
		i:=i+1;
		leerNovela(nov,i);
	end;
	close(mae);
end;

procedure expArchivo (var mae:maestro;var texto:text);
var
	nov:novela;
	nom:string;
begin
	writeln('Escriba nombre del archivo: ');
		readln(nom);
		assign(mae,nom);
	reset(mae);
	rewrite(texto);
	leer(mae,nov);
	while(nov.nombre<>valorImp)do begin
		writeln(texto,nov.cod,'',nov.genero,'',nov.nombre,'',nov.duracion,'',nov.director,'',nov.precio);
		leer(mae,nov);
	end;
	close(mae);
end;
var
	a:integer;
	mae:maestro;
	novtexto:text;
BEGIN
	assign(novtexto,'novelas.txt');
	menu(a);
	while(a<corte)do begin
		case a of
			1:crearArchivo(mae);
			2:menuMantenimiento(mae);
			3:expArchivo(mae,novtexto);
		end;
		menu(a);
	end;
END.
