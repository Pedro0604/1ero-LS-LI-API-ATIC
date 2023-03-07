program nueve;
const
  dimF=300;
  porcAu=1.15;
type
  empleados=array[1..dimF] of real;
procedure cargarSalarios(var emp:empleados;var dimL:integer);
var
  salario:real;
begin
  dimL:=0;
  readln(salario);
  while (dimL<=dimF)and(salario<>0)do begin
    dimL:=dimL+1;
    emp[dimL]:=salario;
    readln(salario);
  end;
end;
procedure aumento(var emp:empleados;dimL:integer);
var
  i:integer;
begin
  for i:=1 to dimL do begin
    emp[i]:=emp[i]*porcAu;
  end;
end;
function promedio(emp:empleados;dimL:integer):real;
var
  suma:real;
  i:integer;
begin
  suma:=0;
  for i:=1 to dimL do begin
    suma:=suma+emp[i];
  end;
  promedio:=suma/dimL;
end;
var
  emp:empleados;
  dimL:integer;
BEGIN
  cargarSalarios(emp,dimL);
  aumento(emp,dimL);
  writeln('El sueldo promedio de los empleados de la empresa es de: ',promedio(emp,dimL):1:2);
END.


















