program Examen;
const
	vA = 9999999;
	carreras = 5;
type
	corredor = record
		dni:integer;
		ape:string[20];
		nom:string[20];
		kms:integer;
		resul:0..1;
	end;
	corredorRed = record
		dni:integer;
		ape:string[20];
		nom:string[20];
		kms:integer;
		carreras:integer;
	end;
	maestro = file of corredorRed;
	detalle = file of corredor;
	
	regVec = record
		archivo : detalle;
		reg : corredor;
	end;
	vecDetalles = array [1 .. carreras] of regVec;
	

procedure leer (var det:detalle; var reg:corredor);
begin
	if(not eof(det))then
		read(det,reg)
	else
		reg.dni:=vA;
end;

procedure minimo (var detalles:vecDetalles; var min:corredor);
var
	i,pos:integer;
begin
	min.dni:=vA;
	for i:=0 to carreras do 
		if(detalles[i].reg.dni<min.dni)then begin
			min:=detalles[i].reg;
			pos:=i;
		end;
	if(min.dni<>vA)then
		leer(detalles[pos].archivo,detalles[pos].reg);
end;

procedure crearMaestro (var mae:maestro; var detalles:vecDetalles);
var
	regMae : corredorRed;
	act : corredor;
	i:integer;
begin
	rewrite(mae);
	for i:=0 to carreras do begin
		reset(detalles[i].archivo);
		leer(detalles[i].archivo, detalles[i].reg);
	end;
	
	minimo(detalles, act);
	while(act.dni<>vA)do begin
		regMae.dni:=act.dni; 
		regMae.ape:=act.ape; 
		regMae.nom:=act.nom;
		regMae.kms:=0;
		regMae.carreras:=0;
		
		while(regMae.dni = act.dni)do begin
			if(act.resul = 1)then
				regMae.carreras:= regMae.carreras + 1;
			regMae.kms:= regMae.kms + act.kms;
			minimo(detalles,act);
		end;
		
		write(mae,regMae);
	end;
	close(mae);
	for i:=0 to carreras do
		close(detalles[i].archivo);
end;

var 
	mae:maestro;
	detalles:vecDetalles;
	nom:string;
	i:integer;
begin
	writeln('Escribir nombre del maestro');
	readln(nom);
	assign(mae,nom);
	
	for i:=1 to carreras do begin
		writeln('Escribir nombre del detalle ', i);
		readln(nom);
		assign(detalles[i].archivo, nom);
	end;
	crearMaestro(mae, detalles);
end.
