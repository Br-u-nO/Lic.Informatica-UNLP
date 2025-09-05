program Examen;
const
	vA = -1;
type
	profesional = record
		dni:integer;
		nombre:string;
		apellido:string;
		sueldo:real;
	end;
	tArchivo = file of profesional;
	
procedure leer (var mae:tArchivo; var dato:profesional);
begin
	if(not eof(mae))then
		read(mae,dato)
	else
		dato.dni := vA;
end;

procedure agregar (var mae:tArchivo; p : profesional);
var
	temp:profesional;
begin
	reset(mae);
	leer(mae,temp);
	if(temp.dni = 0)then begin
		seek(mae,fileSize(mae));
		write(mae,p);
	end else begin
		seek(mae,temp.dni * -1);
		write(mae,temp);
		seek(mae,filePos(mae)-1);
		write(mae,p);
		seek(mae,0);
		write(mae,temp);
	end;
	close(mae);
end;

procedure eliminar (var mae:tArchivo;dni:integer; var bajas:text);
var
	cab,temp:profesional;
	
begin
	reset(mae);
	reset(bajas);
	leer(mae,cab);
	leer(mae,temp);
	while(temp.dni <> vA)and(temp.dni <> dni)do
		leer(mae,temp);
	if(temp.dni = dni)then begin
		writeln(bajas,'DNI: ',temp.dni,' sueldo: ',temp.sueldo:0:2,' Nombre: ',temp.nombre);
		writeln(bajas,'Apellido',temp.apellido);
		seek(mae,filePos(mae) - 1);
		temp.dni := filePos(mae) * -1;
		write(mae,cab);
		seek(mae,0);
		write(mae,temp);
	end;
	close(bajas);
	close(mae);
end;

procedure crear (var mae:tArchivo;var texto:text);
var
	nuevo:profesional;
begin
	reset(mae);
	reset(texto);
	nuevo.dni:=0;
	write(mae,nuevo);
	while(not eof(texto))do begin
		readln(texto,nuevo.dni,nuevo.sueldo,nuevo.nombre);
		readln(texto,nuevo.apellido);
		write(mae,nuevo);
	end;
	close(mae);
	close(texto);
end;

begin

end.
