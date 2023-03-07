program ocho;
const
  cantA=400;
type
alumno=record
  nroIns,dni,nacim:integer;
  nombre,apellido:string;
end;
alumnos=array[1..cantA]of alumno;
procedure leerAl(var al:alumno);
begin
  writeln('nroIns');
  readln(al.nroIns);
  writeln('dni');
  readln(al.dni);
  writeln('nacim');
  readln(al.nacim);
  writeln('nombre');
  readln(al.nombre);
  writeln('apellido');
  readln(al.apellido);
end;
procedure leerTodo(var alu:alumnos);
var
  i:integer;
begin
  for i:=1 to cantA do
    leerAl(alu[i])
end;
function todoPar (alu:alumnos):real;
var
  i,cantSoloP,digito:integer;
  soloPar:boolean;
begin
  cantSoloP:=0;
  for i:=1 to cantA do begin
    digito:=1;
    soloPar:=true;
    digito:=alu[i].dni;
    while (digito<>0)do begin
      if (((digito mod 10) mod 2)=1)then
        soloPar:=false;
      digito:=digito div 10;
    end;
    if (soloPar)then
      cantSoloP:=cantSoloP+1;
  end;
  todoPar:=cantSoloP*100/cantA;
end;
procedure maxAl (alu:alumnos);
var
  men1,men2,i:integer;
  nomM1,nomM2,apM1,apM2:string;
begin
  men1:=32767;
  men2:=32767;
  for i:=1 to cantA do begin
    if (alu[i].dni<men1)then begin
      men2:=men1;
      men1:=alu[i].dni;
      nomM2:=nomM1;
      nomM1:=alu[i].nombre;
      apM2:=apM1;
      apM1:=alu[i].apellido;
    end
    else if (alu[i].dni<men2) then begin
      men2:=alu[i].dni;
      nomM2:=alu[i].nombre;
      apM2:=alu[i].apellido;
    end;
  end;
  writeln('Apellido y nombre de los dos alumnos de mayor edad: ',apM1,' ',nomM1,' y ',apM2,' ',nomM2,'.');
end;
var
  alu:alumnos;
  porc:real;
BEGIN
  leerTodo(alu);
  maxAl(alu);
  porc:=todoPar(alu);
  writeln('El porcentaje de alumnos con DNI compuesto solo por dígitos pares es de: ',porc:1:2);
  writeln('');
END.

















