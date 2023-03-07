
program untitled;
var
  x,y:integer;
  dinero:real;
BEGIN
  read(x,y);
  dinero:=1.6*((x DIV y) * y);
  write('La cantidad de caramelos que le toca a cada cliente es: ',x DIV y);
  writeln(' y el kiosquero se queda con ',x MOD y,' caramelos.');
  write('Por lo tanto, el kisquero debera cobrar ',dinero:5:2,' pesos.');
END.

