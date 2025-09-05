program untitled;
const
	vA = 9898;
type
	dinosaurio = record
		cod,altura:integer;
		peso:real;
		tipo,desc,zona:string;
	end;
	maestro = file of dinosaurio;
	
procedure leer (var mae:maestro; var reg:dinosaurio);
begin
	if(not eof(mae))then
		read(mae,reg)
	else
		reg.cod:=vA;
end;

procedure agregarDinosaurios (var mae:maestro; reg:dinosaurio);
var
	temp:dinosaurio;
begin
	reset(mae);
	read(mae,temp);
	if(temp.cod = 0 )then begin
		seek(mae,fileSize(mae));
		write(mae,reg);
	end else begin
		seek(mae,temp.cod * -1);
		read(mae,temp);
		seek(mae,filePos(mae)-1);
		write(mae,reg);
		seek(mae,0);
		write(mae,temp);
	end;
	close(mae);
end;

procedure Eliminar (var mae:maestro);
var
	temp,cab:dinosaurio;
	cod,pos:integer;
begin
	reset(mae);
	writeln('Escriba codigo a eliminar');
	readln(cod);
	leer(mae,cab);
	leer(mae,temp);
	while(temp.cod <> vA)and(temp.cod <> cod)do
		leer(mae,temp);
	if(temp.cod<>vA)then begin
		pos:=filePos(mae)-1;
		seek(mae,pos);
		write(mae,cab);
		
		seek(mae,0);
		temp.cod:=pos * -1;
		write(mae,temp);
	end;
	close(mae);
end;
	
	
procedure Listar (var mae:maestro; var info:text);
var
	dino:dinosaurio;
begin
	reset(mae);
	rewrite(info);
	seek(mae,1);
	leer(mae,dino);
	while(dino.cod<>vA)do begin
		if(dino.cod >= 0)then begin
			writeln(info,dino.cod,'',dino.altura,'',dino.peso,'',dino.tipo,'',dino.desc);
			writeln(info,dino.zona);
		end;
		leer(mae,dino);
	end;
	close(mae);
	close(info);
end;

var
	mae:maestro;
	texto:text;
BEGIN
	
END.

