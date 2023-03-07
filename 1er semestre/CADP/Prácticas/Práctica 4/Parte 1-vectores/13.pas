program trece;
const
  dimF=101;
  dimFA=50;
type
año=array[1..dimF] of temps;
años=array[1..dimFA] of puntos;
procedure leerAño(var a:año);
var
  i:integer;
begin
  writeln('Promedio: ');
  read(a[1])
  for i:=2 to dimF do begin
    writeln('Temperatura: ');
    read(a[i]);
  end;
end;
procedure leerAños(var a:años;);
var
  i:integer;
  puntos:año;
begin
  for i:=1 to dimFA do begin
    leerAño(puntos);
    a[i]:=puntos;
  end;
end;
procedure maxPromedio(a:años);
var
  i:integer;
  max:real;
  añoMax:integer;
begin
  max:=-1;
  for i:=1 to dimFA do begin
    if (a[i][1]>max)then begin
      max:=a[i][1];
      añoMax:=1971+i;
    end;
  end;
  writeln('El año con mayor temperatura promedio a nivel mundial fue: ',añoMax,'.');
end;
var
  a:años;
BEGIN
  leerAños(a);
  maxPromedio(a);
  
  
  
  readln();
  writeln('');
  readln();
  writeln('');
  readln();
  writeln('');
  readln();
  writeln('');
  readln();
END.



















