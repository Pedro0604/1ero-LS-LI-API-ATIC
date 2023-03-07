program ocho;
type
  docentes=record
    dni:integer;
    nombre,apellido,email:string;
  end;
  proyecto=record
  codigo:integer;
  titulo:string;
  docente:docentes;
  cantA:integer;
  esc:string;
  loc:string;
  
  end;
procedure leerD(var doc:docentes);
begin
  writeln('dni');
  readln(doc.dni);
  writeln('nombre');
  readln(doc.nombre);
  writeln('apellido');
  readln(doc.apellido);
  writeln('email');
  readln(doc.email);
end;
procedure leer(var pro:proyecto);
begin
  writeln('codigo');
  readln(pro.codigo);
  writeln('titulo');
  readln(pro.titulo);
  leerD(pro.docente);
  writeln('cantA');
  readln(pro.cantA);
  writeln('esc');
  readln(pro.esc);
  writeln('loc');
  readln(pro.loc);
end;
procedure max(esc:string;cantA:integer;var max1,max2:integer;var eMax1,eMax2:string);
begin
  if(cantA>max1)then begin
    max2:=max1;
    max1:=cantA;
    eMax2:=eMax1;
    eMax1:=esc;
  end
  else if(cantA>max2)then begin
    max2:=cantA;
    eMax2:=esc;
  end;
end;
function cumple(codigo:integer):boolean;
var
  cantI,cantP,dig:integer;
begin
  cantP:=0;
  cantI:=0;
  while (codigo<>0)do begin
    dig:=codigo MOD 10;
    if ((dig MOD 2)=0) then
      cantP:=cantP+1
    else cantI:=cantI+1;
    codigo:=codigo DIV 10;
  end;
  cumple:=(cantI=cantP);
  writeln(cumple);
end;
var
  pr:proyecto;
  locAc,escAc,eMax1,eMax2:string;
  cantTotE,cantELoc,max1,max2:integer;
BEGIN
  cantTotE:=0;
  max1:=-1;
  max2:=-1;
  leer(pr);
  while(pr.codigo<>-1)do begin
    locAc:=pr.loc;
    cantELoc:=0;
    while((locAc=pr.loc)and(pr.codigo<>-1))do begin
      escAc:=pr.esc;
      while((escAc=pr.esc)and(pr.codigo<>-1))do begin
        cantTotE:=cantTotE+1;
        cantELoc:=cantELoc+1;
        if ((locAc='Daireaux')and(cumple(pr.codigo)))then
          writeln('Titulo de los proyectos de la localidad de Daireaux cuyo codigo posee igual cantidad de digitos pares e impares: ',pr.titulo);
        leer(pr);
      end;
      max(pr.esc,pr.cantA,max1,max2,eMax1,eMax2);
    end;
    writeln('Cantidad de escuelas en la localidad ',locAc,': ',cantELoc);
  end;
  
  writeln('Cantidad total de escuelas que participan en la convocatoria 2020: ',cantTotE);
  writeln('Nombres de las dos escuelas con mayor cantidad de alumnos participantes: ',eMax1,' y ',eMax2);
  writeln('');
  writeln('');
END.












































