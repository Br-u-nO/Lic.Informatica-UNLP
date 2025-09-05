program Examen;
const 
	vA = 'fin';
type 
	partido = record
		codE:integer;
		nombre:string;
		anio:integer;
		codT:integer;
		codRival:integer;
		golF:integer;
		golC:integer;
		puntos:0..3;
	end;
	maestro = file of partido;
	
procedure leer(var mae:maestro;var p :partido);
begin
	if(not eof(mae))then
		read(mae,p)
	else
		p.nombre:=vA;
end;

procedure Analisis(var mae:maestro);
var
	anioact,torneoact,
	empates,victorias,derrotas,puntos,puntosMax,golesF,golesC:integer;
	campeon,equipoact:string;
	p:partido;
begin
	reset(mae);
	leer(mae,p);
	while(p.nombre <> vA)do begin
		anioact:=p.anio;  
		writeln('Año ',anioAct);
		while(p.nombre <> vA)and(anioact = p.anio)do begin
			torneoact := p.codT; puntosMax:=0;
			writeln(torneoact);
			while(p.nombre <> vA)and(anioact = p.anio) and (torneoact = p.codT)do begin
				equipoact:= p.nombre; empates:=0; victorias:=0; derrotas:=0; puntos:=0; 
				golesF:=0;golesC:=0;
				writeln(p.codE, ' ',equipoact);
				while(p.nombre <> vA)and(equipoact = p.nombre)and(anioact = p.anio) and (torneoact = p.codT)do begin
					puntos:=puntos + p.puntos;
					golesF:=golesF + p.golF;
					golesC:=golesC + p.golC;
					if(p.puntos = 0)then
						derrotas := derrotas +1
					else if(p.puntos = 1)then
						empates:=empates + 1
					else
						victorias := victorias +1;
					leer(mae,p);
				end;
				writeln('Cantidad total de goles a favor: ',golesF);
				writeln('Cantidad total de goles en contra: ',golesC);
				writeln('Diferencia de gol: ',golesF-golesC);
				writeln('Cantidad de partidos ganados: ',victorias);
				writeln('Cantidad de partidos perdidos: ',derrotas);
				writeln('Cantidad de partidos empatados: ',empates);
				writeln('Cantidad de puntos en el torneo: ',puntos);
				if(puntos>puntosMax)then begin
					puntosMax := puntos;
					campeon:= equipoact;
				end;
			end;
			writeln('El equipo ',campeon,' fue campeon del torneo ',torneoact,' del año ', anioact);
		end;
	end;
	close(mae)
end;

begin

end.
