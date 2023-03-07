program untitled;
type
  notas=0..10;
var
  nombre: string;
  alumnosAp,Alumnos7:integer;
  nota: notas;
BEGIN
  alumnosAp:=0;
  alumnos7:=0;
    repeat
      writeln('Introduzca su nota: ');
      readln(nota);
      writeln('Introduzca su nombre: ');
      read(nombre);
      if nota>=8 then
        begin
          alumnosAp:=alumnosAp+1;
        end
      else if nota=7 then
        alumnos7:=alumnos7+1;
    until (nombre='Zidane Zinedine');
  writeln('Hay ',alumnosAp,' alumnos aprobados y ',alumnos7,' alumnos con 7.');
END.
