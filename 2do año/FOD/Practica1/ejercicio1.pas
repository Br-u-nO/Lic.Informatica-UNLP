{
   Realizar un algoritmo que cree un archivo de números enteros no ordenados y permita
incorporar datos al archivo. Los números son ingresados desde teclado. La carga finaliza
cuando se ingresa el número 30000, que no debe incorporarse al archivo. El nombre del
archivo debe ser proporcionado por el usuario desde teclado.
   
}


program untitled;

type
  numeros=file of integer;
var
  num:integer;
  archivo:numeros;
  nombre:string;
BEGIN
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
	end
END.

