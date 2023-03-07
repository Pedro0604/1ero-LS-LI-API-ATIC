program Hello;
procedure maxMin (nroIns:integer;apellido,nombre:string;var minNum1,minNum2,maxNum1,maxNum2:integer;var apellidoMinNum1,apellidoMinNum2,nombreMaxNum1,nombreMaxNum2:string);             
begin
  if (nroIns<minNum1) then begin
    minNum2:=minNum1;
    minNum1:=nroIns;
    apellidoMinNum2:=apellidoMinNum1;
    apellidoMinNum1:=apellido;
  end
  else if (nroIns<minNum2) then begin
    minNum2:=nroIns;
    apellidoMinNum2:=apellido;
  end;
  if (nroIns>maxNum1) then begin
    maxNum2:=maxNum1;
    maxNum1:=nroIns;
    nombreMaxNum2:=nombreMaxNum1;
    nombreMaxNum1:=nombre;
  end
  else if (nroIns>minNum2) then begin
    maxNum2:=nroIns;
    nombreMaxNum2:=nombre;
  end;
end;
var
  nroIns,minNum1,minNum2,maxNum1,maxNum2,cantAl,cantNumPar:integer;
  porcNumPar:real;
  apellido,apellidoMinNum1,apellidoMinNum2,nombreMaxNum1,nombreMaxNum2,nombre:string;
begin
  minNum1:=32000;
  minNum2:=32000;
  maxNum1:=-32000;
  maxNum2:=-32000;
  cantAl:=0;
  cantNumPar:=0;
  repeat
    writeln('Introduzca su numero de inscripcion: ');
    read(nroIns);
    writeln('Introduzca su apellido: ');
    readln(apellido);
    readln(apellido);
    writeln('Introduzca su nombre: ');
    readln(nombre);
    maxMin(nroIns,apellido,nombre,minNum1,minNum2,maxNum1,maxNum2,apellidoMinNum1,apellidoMinNum2,nombreMaxNum1,nombreMaxNum2);
    
    cantAl:=cantAl+1;
    if (nroIns mod 2=0) then
      cantNumPar:=cantNumPar+1;
  until (nroIns=1200);
  porcNumPar:=cantNumPar*100/cantAl;
  writeln('Apellido de los dos alumnos con numero de inscripcion mas chico: ',apellidoMinNum1,' y ',apellidoMinNum2);
  writeln('Nombre de los dos alumnos con numero de inscripcion mas grande: ',nombreMaxNum1,' y ',nombreMaxNum2);
  writeln('Porcentaje de alumnos con nro de inscripcion par: ',porcNumPar:1:2);
end.
