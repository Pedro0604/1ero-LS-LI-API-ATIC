program Registros;
const
  relacionIdeal=23435;
type
  escuela = record
  nombre,localidad:string;
  cantD,cantA:real;
  CUE:integer;
end;
procedure leer(var esc:escuela);
begin
  writeln('Nombre:');
  readln(esc.nombre);read(esc.nombre);
  writeln('Localidad');
  readln(esc.localidad);read(esc.localidad);
  writeln('Cant. docentes');
  read(esc.cantD);
  writeln('Cant. alumnos');
  read(esc.cantA);
  writeln('CUE');
  read(esc.CUE);
end;
function relacion(esc:escuela):real;
begin
  relacion:=esc.cantA/esc.cantD;
end;
procedure mejores (esc:escuela;relac:real;var mej1,mej2:real;var mejNom1,mejNom2:string;var mejCUE1,mejCUE2:integer);
begin
  if (relac<mej1)then begin
    mej2:=mej1;
    mej1:=relac;
    mejNom2:=mejNom1;
    mejNom1:=esc.nombre;
    mejCUE2:=mejCUE1;
    mejCUE1:=esc.CUE;
  end
  else if (relac<mej2)then begin
    mej2:=relac;
    mejNom2:=esc.nombre;
    mejCUE2:=esc.CUE;
  end;
end;
var
  esc:escuela;
  i,mejCUE1,mejCUE2,cantSup:integer;
  relac,mej1,mej2:real;
  mejNom1,mejNom2:string;
begin
  cantSup:=0;
  mej1:=99999;
  mej2:=99999;
  for i:=1 to 2400 do begin
    leer(esc);
    relac:=relacion(esc);
    mejores(esc,relac,mej1,mej2,mejNom1,mejNom2,mejCUE1,mejCUE2);
    if (relac>relacionIdeal)then
      cantSup:=cantSup+1;
  end;
  writeln('Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO: ',cantSup);
  writeln('CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos: ',mejNom1,',',mejCUE1,'y',mejNom2,',',mejCUE2);
end.







