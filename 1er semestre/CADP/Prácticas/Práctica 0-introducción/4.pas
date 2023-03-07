
program untitled;
var
  x,y:integer;
BEGIN
  read(x,y);
  write('La cantidad de caramelos que le toca a cada cliente es: ',x DIV y);
  write(' y el kiosquero se queda con ',x MOD y,' caramelos.');
END.

