program untitled;
var
  legajo,promedio,porcentaje:real;
  alumnos,alumnosApr,alumnosDestacados:integer;
BEGIN
  AlumnosApr:=0;
  alumnosDestacados:=0;
  alumnos:=0;
  writeln('Introduzca su numero de legajo: ');
  readln(legajo);
  while (legajo<>-1) do
   begin
    writeln('Introduzca su promedio: ');
    read(promedio);
    alumnos:=alumnos+1;
    if (promedio>6.5) then
      alumnosApr:=AlumnosApr+1;
    if (promedio>8.5) and (legajo<2500) then
      alumnosDestacados:=alumnosDestacados+1;
    writeln('Introduzca su numero de legajo: ');
    readln(legajo);
   end;
   if alumnos<>0 then
     porcentaje:=alumnosDestacados*100/alumnos
   else
     porcentaje:=0;
   writeln('Se leyo una cantidad de ',alumnos,' alumnos. De esta cifra, ', alumnosApr,' tienen un promedio superior a 6.5 y un ',porcentaje:1:2,'% son alumnos destacados con un legajo inferior a 2500.');
  END.
