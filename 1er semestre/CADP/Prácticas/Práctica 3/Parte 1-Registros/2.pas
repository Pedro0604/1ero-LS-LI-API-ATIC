program Registros;
type
  fecha = record
  dia,mes,ano:integer;
end;
procedure leerFecha(var fechaC :fecha);
begin
  writeln('Ingrese el ano: ');
  read(fechaC.ano);
  if (fechaC.ano<>2020)then begin
    writeln('Ingrese el mes: '); readln(fechaC.mes);
    writeln('Ingrese el dia: '); read(fechaC.dia);
  end;
end;
function cumpleV(fechaC:fecha):boolean;
begin
  cumpleV:=(fechaC.mes=1) or (fechaC.mes=2) or((fechaC.mes=12)and(fechaC.dia>=21)) or ((fechaC.mes=3)and(fechaC.dia<21));
end;
function cumple10(dia:integer):boolean;
begin
  cumple10:=(dia<=10);
end;
var
  fechaC:fecha;
  cantV,cant10:integer;
begin
  cantV:=0;
  cant10:=0;
  leerFecha(fechaC);
  while (fechaC.ano<>2020)do begin
    if (cumpleV(fechaC))then
      cantV:=cantV+1;
    if (cumple10(fechaC.dia))then
      cant10:=cant10+1;
    leerFecha(fechaC);
  end;
  writeln('La cantidad de casamientos realizados durante los meses de verano fue de: ',cantV);
  writeln('La cantidad de casamientos realizados en los primeros 10 días de cada mes fue de: ',cant10);
  writeln('');
  writeln('');
end.











