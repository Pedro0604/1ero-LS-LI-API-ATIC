program Registros;
type
str20 = string[20];
alumno = record
codigo : integer;
nombre : str20;
promedio : real;
end;
procedure leer(var alu : alumno);
begin
writeln('Ingrese el codigo del alumno');
read(alu.codigo);
if (alu.codigo <> 0) then begin
writeln('Ingrese el nombre del alumno'); readln(alu.nombre);read(alu.nombre);
writeln('Ingrese el promedio del alumno'); read(alu.promedio);
end;
end;
procedure maxPr (alu:alumno; var max:real; var nomMax:str20);
begin
  if (alu.promedio>max)then begin
    max:=alu.promedio;
    nomMax:=alu.nombre;
  end;
end;
var
a : alumno;
cantA:integer;
nomMax:str20;
max:real;
begin
  cantA:=0;
  max:=-1;
  leer(a);
  while (a.codigo<>0) do begin
    cantA:=cantA+1;
    maxPr(a,max,nomMax);
    leer(a);
  end;
  writeln('La cantidad de alumnos es de: ',cantA);
  writeln('El alumno con el mejor promedio fue: ',nomMax);
end.


