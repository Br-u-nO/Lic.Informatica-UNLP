{
  Realizar un algoritmo, que utilizando el archivo de números enteros no ordenados
creado en el ejercicio 1, informe por pantalla cantidad de números menores a 1500 y el
promedio de los números ingresados. El nombre del archivo a procesar debe ser
proporcionado por el usuario una única vez. Además, el algoritmo deberá listar el
contenido del archivo en pantalla.
   
   
}


program untitled;

type
  numeros=file of integer;
  

procedure crearArchivo(var archivo:numeros);
var
  num:integer;
  nombre:string;
begin
 writeln('Escribir un nombre');
	writeln();
	readln(nombre);
    assign(archivo,nombre);
    rewrite(archivo);
    writeln();
	writeln('Escribir varios numeros');
	writeln();
	readln(num);
	while(num<>30000)do begin
	  write(archivo,num);
	  readln(num);
	end;
  close(archivo);
end;

procedure Calcular (var archivo:numeros;var cant:integer;var promedio:real);
var
  num,suma:integer;
begin
    cant:=0;
    suma:=0;
    reset(archivo);
    while(not eof(archivo))do begin
      read(archivo,num);
      if(num<1500)then
        cant:=cant+1;
      suma:=suma+num;
    end;
    promedio:=suma/FileSize(archivo);
end;
var
  archivo:numeros;
  cant:integer;
  promedio:real;
BEGIN
	crearArchivo(archivo);
	Calcular(archivo,cant,promedio);
	writeln('Numeros menores a 1500: ', cant);
	writeln('Promedio: ', promedio);
	
END.

