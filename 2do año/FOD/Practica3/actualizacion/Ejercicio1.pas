program Ejercicio1;
const
	valorImp=-1;
type
	producto=record
		cod:integer;
		nombre:string;
		precio:real;
		stockAct:integer;
		stockMin:integer;
	end;
	producto_red=record
		cod:integer;
		cant:integer;
	end;
	maestro=file of producto;
	detalle=file of producto_red;
	
procedure leer (var mae:maestro;var p:producto);
begin
	if(not eof(mae))then
		read(mae,p)
	else
		p.stockAct:=valorImp;
end;

procedure leer1 (var det:detalle;var p:producto_red);
begin
	if(not eof(det))then
		read(det,p)
	else
		p.cant:=valorImp;
end;

procedure actualizar (var mae:maestro;var det:detalle);
var
	p:producto;
	p_red:producto_red;
begin
	reset(mae);
	reset(det);
	leer(mae,p);
	
	while(p.stockAct<>valorImp)do begin
		leer1(det,p_red);
		while(p_red.cant<>valorImp)do begin
			leer1(det,p_red);
			if(p_red.cod=p.cod)then
				p.stockAct:=p.stockAct - p_red.cant;
		end;
		seek(mae,filePos(mae)-1);
		write(mae,p);
		leer(mae,p);
		seek(det,0);
	end;
	close(mae);
	close(det);
end;

var
	mae:maestro;
	det:detalle;
begin
	actualizar(mae,det);
end.
