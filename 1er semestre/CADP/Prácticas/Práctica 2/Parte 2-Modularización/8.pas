program Hello;
procedure pantalonCaro(codigo:integer;precio:real;var codigoMax:integer;var max:real);
begin
  if (precio>max) then begin
    codigoMax:=codigo;
    max:=precio;
  end;
end;
procedure baratos(codigo:integer;precio:real;var codigoB1,codigoB2:integer;var barato1,barato2:real);
begin
  if (precio<barato1)then begin
    barato2:=barato1;
    barato1:=precio;
    codigoB2:=codigoB1;
    codigoB1:=codigo;
  end
  else if (precio<barato2) then begin
    barato2:=precio;
    codigoB2:=codigo;
  end;
end;
var
  precio,pantalonMax,promedio,barato1,barato2,suma:real;
  codigo,codigoPMax,codigoB1,codigoB2,i:integer;
  tipo:string;
begin
  pantalonMax:=-1;
  barato1:=99999;
  barato2:=99999;
  suma:=0;
  for i:=1 to 5 do
    begin
      writeln('Introduzca el codigo del producto: ');
      read(codigo);
      writeln('Introduzca el precio del producto: ');
      read(precio);
      writeln('Introduzca el tipo del producto: ');
      readln(tipo);
      read(tipo);
      if (tipo='pantalon') then
        pantalonCaro(codigo,precio,codigoPMax,pantalonMax);
      baratos(codigo,precio,codigoB1,codigoB2,barato1,barato2);
      suma:=suma+precio;
    end;
  promedio:=suma/5;
  writeln('El codigo de los dos productos mas baratos es: ',codigoB1,' y ',codigoB2);
  writeln('El codigo del producto de tipo “pantalon” mas caro es: ',codigoPMax);
  writeln('El precio promedio es de ',promedio:1:2);
end.
