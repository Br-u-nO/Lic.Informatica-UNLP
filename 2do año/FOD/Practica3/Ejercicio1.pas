{
   
   
}


program untitled;
const
	linea='_______________________________________';
	valorImp=-1;
type
	asistente=Record	
		nro:integer;
		apeynom:string;
		email:string;
		tel:integer;
		dni:integer;
	end;
	avo1=file of asistente;
	
	
procedure leer (var avo:avo1;var a:asistente);
begin
	if(not eof(avo))then
		read(avo,a)
	else
		a.nro:=valorImp;
end;

procedure leerAsistente (var a:asistente);
begin
	writeln(linea);
	writeln('Ingrese el numero de asistente: ');
	readln(a.nro);
	if(a.nro<>valorImp)then begin
		writeln('Ingrese el nombre y apellido: ');
		readln(a.apeynom);
		writeln('Ingrese el email: ');
		readln(a.email);
		writeln('Ingrese el telefono: ');
		a.tel:=Random(300)+100; writeln(a.tel);
		writeln('Ingrese el dni: ');
		a.dni:=Random(300)+100; writeln(a.dni);
	end;
	writeln(linea);
end;

procedure cargarArchivo (var avo:avo1);
var
	a:asistente;
begin
	rewrite(avo);
	leerAsistente(a);
	while(a.nro<>valorImp)do begin
		write(avo,a);
		leerAsistente(a);
	end;
	close(avo);
end;

procedure baja_logica (var avo:avo1);
var
	a:asistente;
begin
	reset(avo);
	leer(avo,a);
	while(a.nro<>valorImp)do begin
		if(a.nro<1000)then begin
			a.apeynom:='*'+a.apeynom;
			seek(avo,filePos(avo)-1);
			write(avo,a);
		end;
		leer(avo,a);
	end;
	close(avo);
end;

procedure imprimirArchivo (var avo:avo1);
var
	a:asistente;
begin
	reset(avo);
	leer(avo,a);
	writeln('linea');
	while(a.nro<>valorImp)do begin
		writeln('Numero: ', a.nro, ', Nombre: ', a.apeynom, ', Email: ', a.email, ', Telefono: ', a.tel, ', DNI: ', a.dni);
		leer(avo,a);
	end;
	writeln(linea);

end;
var 
	mae:avo1;
BEGIN
	randomize;
	assign(mae,'archivo');
	cargarArchivo(mae);
	baja_logica(mae);
	imprimirArchivo(mae);
END.

