program cinco;
type
  auto=record
    marca:string;
    modelo:string;
    precio:real;
  end;
procedure leerA (var marcaActual:string;var car:auto);
begin
  writeln('Marca');
  readln(car.marca);
  if (car.marca<>'ZZZ')and(car.marca=marcaActual) then begin
    writeln('Modelo');
    readln(car.modelo);
    writeln('Precio');
    readln(car.precio);
  end;
end;
procedure masCaro (car:auto; var max:real;var marca1,modelo1:string);
begin
  if (car.precio>max)then begin
    marca1:=car.marca;
    modelo1:=car.modelo;
  end;
end;
var
  car:auto;
  marca1,modelo1,marcaActual:string;
  promedio,total,max:real;
  cantA:integer;
BEGIN
  cantA:=0;
  total:=0;
  max:=-1;
  marcaActual:='';
  leerA(marcaActual,car);
  marcaActual:=car.marca;
  while (car.marca<>'ZZZ')do begin
    total:=0;
    cantA:=0;
    while (car.marca=marcaActual)do begin
      masCaro(car,max,marca1,modelo1);
      total:=car.precio+total;
      cantA:=cantA+1;
      leerA(marcaActual,car);
    end;
    promedio:=total/cantA;
    writeln('Promedio de la marca ',marcaActual,': ',promedio:1:2);
    marcaActual:=car.marca;
  end;
  writeln('Marca y modelo del auto más caro: ',marca1,' y ',modelo1,'.');
  writeln('');
  writeln('');
END.



































