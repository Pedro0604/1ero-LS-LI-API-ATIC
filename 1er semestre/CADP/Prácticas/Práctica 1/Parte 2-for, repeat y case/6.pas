program untitled;
type
  codigos=1..200;
var
  barato1,barato2,precio,pr16,i:integer;
  codigo,CB1,CB2:codigos;
BEGIN
  barato1:=32000;
  barato2:=32000;
  CB1:=1;
  pr16:=0;
  for i:=1 to 200 do
    begin
      write('Ingrese el codigo del producto: ');
      readln(codigo);
      write('Ingrese el precio del producto: ');
      read(precio);
      if (precio>16) and (codigo mod 2=0) then
        pr16:=pr16+1;
      if (precio<barato1)then
        begin
          barato2:=barato1;
          barato1:=precio;
          CB2:=CB1;
          CB1:=codigo;
        end
      else if (precio<barato2) then
        begin
          barato2:=precio;
          CB2:=codigo;
        end;
    end;
  writeln('Los codigos de los dos productos mas baratos fueron: ',CB1,' y ',CB2);
  writeln('La cantidad de productos de mas de 16 pesos con codigo par fue de ',pr16,'.');
END.
