{
 Una empresa posee un archivo con información de los ingresos percibidos por diferentes 
empleados en concepto de comisión, de cada uno de ellos se conoce: código de empleado, 
nombre y monto de la comisión. La información del archivo se encuentra ordenada por 
código de empleado y cada empleado puede aparecer más de una vez en el archivo de 
comisiones.  
Realice un procedimiento que reciba el archivo anteriormente descrito y lo compacte. En 
consecuencia, deberá generar un nuevo archivo en el cual, cada empleado aparezca una 
única vez con el valor total de sus comisiones. 
NOTA: No se conoce a priori la cantidad de empleados. Además, el archivo debe ser 
recorrido una única vez.
}


program untitled;
const
	linea=('----------------------------');
	valorImp=-1;
type
	empleado=record
		cod:integer;
		nomb:string;
		monto:real;
	end;
	avo1=file of empleado;
procedure leer(var emp:avo1;var e:empleado);
begin
	if(not eof(emp))then
		read(emp,e)
	else
		e.cod:=valorImp;
end;
procedure resumirArchivo(var detalle:avo1;var maestro:avo1);
var
	ant,e:empleado;
	suma:real;
	act:integer;
begin
	reset(detalle);
	rewrite(maestro);
	leer(detalle,e);
	while(e.cod<>valorImp)do begin
		suma:=0;
		act:=e.cod;
		while((e.cod<>valorImp)and(e.cod=act))do begin
			suma:=suma+e.monto;
			ant:=e;
			leer(detalle,e);
			end;
		ant.monto:=suma;
		write(maestro,ant);
	end;
	close(detalle);
	close(maestro);
end;
var
	detalle,maestro:avo1;
begin
	resumirArchivo(detalle,maestro);
end.
