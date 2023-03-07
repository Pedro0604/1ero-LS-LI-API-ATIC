program untitled;
var
  precioA,precioN:real;
  codigo:integer;
BEGIN
  repeat
    write('Introduzca el codigo del producto: ');
    read(codigo);
    write('Introduzca el precio actual del producto: ');
    read(precioA);
    write('Introduzca el nuevo precio del producto: ');
    read(precioN);
    if (precioA+0.1*precioA<precioN) then
      writeln('El aumento de precio del producto ',codigo,' supera el 10%')
    else
      writeln('El aumento de precio del producto ',codigo,' no supera el 10%');
    until (codigo=32767)
END.
