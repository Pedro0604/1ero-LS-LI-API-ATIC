program modeloV;
const
  dimF=1000;
type
  alumno=record
    nroAlu,asist:integer;
    apellido,nombre:string;
  end;
  alumnos=array[1..dimF]of alumno;
procedure cargarAlumno(var alu:alumno);
begin
  writeln('nroAlu');
  readln(alu.nroAlu);
  if(alu.nroAlu<>-1)then begin
    writeln('asist');
    readln(alu.asist);
    writeln('apellido');
    readln(alu.apellido);
    writeln('nombre');
   readln(alu.nombre);
  end;
end;
procedure cargarCatedra(var al:alumnos;var dimL:integer);
var
  alu:alumno;
begin
  dimL:=1;
  cargarAlumno(alu);
  while(dimL<dimF)and(alu.nroAlu<>-1)do begin
    al[dimL]:=alu;
    dimL:=dimL+1;
    cargarAlumno(alu);
  end;
end;
function posAlu(al:alumnos;dimL,nroA:integer):integer;
var
  pri,ult,medio:integer;
begin
  pri:=1;
  ult:=dimL;
  medio:=(pri+ult) div 2;
  while(pri<=ult)and(al[medio].nroAlu<>nroA)do begin
    if(nroA>al[medio].nroAlu)then
      pri:=medio+1
    else ult:=medio-1;
    medio:=(pri+ult)div 2;
  end;
  posAlu:=medio;
end;
procedure insertar(var al:alumnos;var dimL:integer;var pude:boolean;alu:alumno);
begin
  pude:=false;
  if (dimL<dimF)then begin
    al[dimL+1]:=alu;
    dimL:=dimL+1;
    pude:=true;
  end;
end;
procedure eliminarPos(var al:alumnos;var dimL:integer;var pude:boolean;pos:integer);
var
  i:integer;
begin
  pude:=false;
  if (pos>=1)and(pos<=dimL)then begin
    for i:=pos to (dimL-1) do
      al[i]:=al[i+1];
    pude:=true;
    dimL:=dimL-1;
  end;
end;
procedure emilinarNro(var al:alumnos;var dimL:integer;var pude:boolean;nroA:integer);
var
  i,j:integer;
begin
  pude:=false;
  for i:=1 to dimL do begin
    if(al[i].nroAlu=nroA)and(pude=false)then begin
      for j:=i to (dimL-1)do
        al[j]:=al[j+1];
      pude:=true;
      dimL:=dimL-1;
    end;
  end;
end;
procedure eliminarAsist(var al:alumnos;var dimL:integer);
var
  i,j:integer;
begin
  for i:=1 to dimL do begin
    if(al[i].asist=0)then begin
      for j:=i to (dimL-1) do begin
        al[j]:=al[j+1];
      end;
      dimL:=dimL-1;
    end;
  end;
end;
procedure imprimirAlumno(alu:alumno);
begin
  writeln('nroAlu: ',alu.nroAlu);
  writeln('asist: ',alu.asist);
  writeln('apellido: ',alu.apellido);
  writeln('nombre: ',alu.nombre);
end;
procedure imprimirCatedra(al:alumnos;dimL:integer);
var
  i:integer;
begin
  for i:=1 to dimL do begin
    writeln('Pos ',i,': ');
    imprimirAlumno(al[i]);
  end;
end;
var
  al:alumnos;
  alu:alumno;
  dimL,pos,nroA:integer;
  pude:boolean;
BEGIN
  cargarCatedra(al,dimL);
  writeln('Ingrese un numero de alumno para obtener su posicion: ');
  read(nroA);
  writeln('PosAlu con nroA ',nroA,': ',posAlu(al,dimL,nroA));
  writeln('Ingrese un alumno para insertarlo: ');
  cargarAlumno(alu);
  insertar(al,dimL,pude,alu);
  if (pude)then writeln('Alumno insertado.')
  else writeln('Error al insertar alumno.');
  writeln('Ingrese la posicion de un alumno para eliminarlo: ');
  read(pos);
  eliminarPos(al,dimL,pude,pos);
  if (pude)then writeln('Alumno eliminado.')
  else writeln('Error al eliminar alumno');
  writeln('Ingrese un numero de alumno para eliminarlo: ');
  read(nroA);
  emilinarNro(al,dimL,pude,nroA);
  if (pude)then writeln('Alumno eliminado.')
  else writeln('Error al eliminar alumno');
  eliminarAsist(al,dimL);
  imprimirCatedra(al,dimL);
END.




procedure ();
var
  
begin
  
end;

  writeln('');
  readln();
  
  
