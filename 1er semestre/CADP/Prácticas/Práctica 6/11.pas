program once;
const
  dimF=10;
type
  alumno=record
    nroA:integer;
    apellido:string[20];
    promedio:real;
  end;
  diezM=array[1..10]of alumno;
  lista=^nodo;
  nodo=record
    el:alumno;
    sig:lista;
  end;
procedure cargarAlumno(var al:alumno);
begin
  writeln('Ingrese nroA.');
  readln(al.nroA);
  if (al.nroa<>0)then begin
    writeln('Ingrese apellido.');
    readln(al.apellido);
    writeln('Ingrese promedio.');
    readln(al.promedio);
  end;
end;
procedure cargarLista(var l:lista;al:alumno);
var
  nuevo:lista;
begin
  new(nuevo);
  nuevo^.sig:=l;
  nuevo^.el:=al;
  l:=nuevo;
end;
procedure mejores(l:lista;var mej:diezM);
var
  i,j:integer;
  puesto:boolean;
begin
  for i:=1 to dimF do
    mej[i].promedio:=11;
  while(l<>nil)do begin
    puesto:=false;
    i:=1;
    while (i<=dimF) and (not puesto)do begin
      if(l^.el.promedio<mej[i].promedio)and (not puesto)then begin
        for j:=dimF downto i+1 do
          mej[j]:=mej[j-1];
        mej[i]:=l^.el;
        puesto:=true;
      end;
      i:=i+1;
    end;
    l:=l^.sig;
  end;
end;
procedure imprimirMejores(mej:diezM);
var
  i:integer;
begin
  writeln('Los diez egresados con mejores promedios son: ');
  for i:=1 to dimF do
    writeln(mej[i].apellido,' cuyo numero de alumno es: ',mej[i].nroA,'.');
end;
procedure imprimirLista(l:lista);
begin
  while(l<>nil)do begin
    writeln('alumno: ', l^.el.apellido);
    l:=l^.sig;
  end;
end;
var
  l:lista;
  mej:diezM;
  al:alumno;
BEGIN
  l:=nil;
  cargarAlumno(al);
  while(al.nroA<>0)do begin
    cargarLista(l,al);
    cargarAlumno(al);
  end;
  imprimirLista(l);
  mejores(l,mej);
  imprimirMejores(mej);
END.
