program Examen;
const
    vA = -12;
type
    producto = record
        codp:integer;
        nom:string;
        desc:string;
        precioc:real;
        preciov:real;
        ubi:string;
    end;
    maestro = file of producto;

procedure leer(var mae:maestro; var p:producto);
begin
    if(not eof(mae))then
        read(mae, p)
    else
        p.preciov := vA;
end;

procedure leerProducto(var p:producto);
begin
    write('Codigo: '); readln(p.codp);
    write('Nombre: '); readln(p.nom);
    write('Descripcion: '); readln(p.desc);
    write('Precio de venta: '); readln(p.preciov);
    write('Precio de compra: '); readln(p.precioc);
    write('Ubicacion: '); readln(p.ubi);
end;

function existeProducto(var mae:maestro; cod:integer):boolean;
var
    p:producto;
    ok:boolean;
begin
    ok := false;
    reset(mae);
    while(not eof(mae))do begin
        leer(mae, p);
        if(p.preciov <> vA)and(p.codp = cod)then begin
            ok := true;
            break;
        end;
    end;
    close(mae);
    existeProducto := ok;
end;

procedure agregarProducto(var mae:maestro);
var
    p,nuevo:producto;
begin
    leerProducto(nuevo);
    if(not existeProducto(mae,nuevo.codp))then begin
        reset(mae);
        if(fileSize(mae) = 0)then begin
            write(mae,nuevo);
        end else begin
            leer(mae,p);
            if(p.codp = 0)then begin
                seek(mae,fileSize(mae));
                write(mae,nuevo);
            end else begin
                seek(mae,p.codp * -1);
                leer(mae,p);
                seek(mae,filePos(mae)-1);
                write(mae,nuevo);
                seek(mae,0);
                write(mae,p);
            end;
        end;
        close(mae);
    end else 
        writeln('Ya existe este producto');
end;

procedure quitarProducto (var mae:maestro);
var
	cod,pos:integer;
	temp:producto;
begin
	writeln('Codigo a borrar');
	read(cod);
	if(existeProducto(mae,cod))then begin
		reset(mae);
		leer(mae,temp);
		pos:=temp.codp;
		while(temp.codp<>cod)do
			leer(mae,temp);
		seek(mae,filePos(mae)-1);
		temp.codp := pos;
		pos:=filePos(mae) * -1;
		write(mae,temp);
		seek(mae,0);
		temp.codp:=pos;
		write(mae,temp);
	end else
		writeln('No existe este producto');
end;


procedure listarProductos(var mae:maestro);
var
    p:producto;
begin
    reset(mae);
    while(not eof(mae))do begin
        leer(mae, p);
        if(p.preciov <> vA)then begin
            writeln('Código: ', p.codp);
            writeln('Nombre: ', p.nom);
            writeln('Descripción: ', p.desc);
            writeln('Precio compra: ', p.precioc:0:2);
            writeln('Precio venta: ', p.preciov:0:2);
            writeln('Ubicación: ', p.ubi);
            writeln('--------------------------');
        end;
    end;
    close(mae);
end;

var
    a:integer;
    mae:maestro;
begin
    assign(mae,'productos');
     rewrite(mae);
     close(mae);
    a := 0;
    while(a <> -1)do begin
        writeln;
        writeln('--- MENÚ ---');
        writeln('1 - Agregar producto');
        writeln('2 - Quitar producto');
        writeln('3 - Listar productos');
        writeln('-1 - Salir');
        write('Seleccione una opción: ');
        readln(a);
        case a of 
            1: agregarProducto(mae);
            2: quitarProducto(mae);
            3: listarProductos(mae);
        end;
    end;
end.
