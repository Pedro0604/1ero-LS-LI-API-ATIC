program catorce;
const
  cantA=1300;
  busUr=20;
  busIn=40;
  trenU=5;
  trenR=10;
  
type
  codigos=-1..cantA;
  medios=1..5;
  
  viaje=record
    codigo:codigos;
    dia:integer;
    facu:string[30];
    transp:medios;
  end;
  lista=^nodo;
  nodo=record
    el:viaje;
    sig:lista;
  end;
  
  bicicletaYOtro=record
    bici,otro:boolean;
  end;
  biciYOtro=array[1..cantA]of bicicletaYOtro;
  
  mediosDeT=array[1..5]of integer;
  
  dias=array[1..31]of integer;
  
  alumnos=array[1..cantA]of dias;
  
procedure cargarViaje(var v:viaje);
begin
  writeln('Ingrese la informacion de un alumno: ');
  writeln('  Ingrese el codigo');
  write('  ');readln(v.codigo);
  if (v.codigo<>-1)then begin
    writeln('  Ingrese el dia');
    write('  ');readln(v.dia);
    {writeln('  Ingrese la facu');
    write('  ');readln(v.facu);}
    writeln('  Ingrese el medio de transporte');
    write('  ');readln(v.transp);
  end;
end;

procedure cargarLista(var l:lista;var v:viaje);
var
  nuevo:lista;
begin
  new(nuevo);
  nuevo^.sig:=nil;
  nuevo^.el:=v;
  if (l=nil)then
    l:=nuevo
  else begin
    nuevo^.sig:=l;
    l:=nuevo;
  end;
end;

function cantMasDe6(l:lista):integer;
var
  i,d,cant:integer;
  cantV:alumnos;
begin
  cant:=0;
  for i:=1 to cantA do begin
    for d:=1 to 31 do
      cantV[i][d]:=0;
  end;
  while(l<>nil)do begin
    cantV[l^.el.codigo][l^.el.dia]:=cantV[l^.el.codigo][l^.el.dia]+1;
    l:=l^.sig;
  end;
  for i:=1 to cantA do begin
    for d:=1 to 31 do begin
      if(cantV[i][d]>6)then
        cant:=cant+1;
    end;
  end;
  cantMasDe6:=cant;
end;

function cantMasDe80(l:lista):integer;
var
  gastoAlumno:alumnos;
  i,d,cant:integer;
begin
  cant:=0;
  for i:=1 to cantA do begin
    for d:=1 to 31 do
      gastoAlumno[i][d]:=0;
  end;
  while(l<>nil)do begin
    case(l^.el.transp)of
      1:gastoAlumno[l^.el.codigo][l^.el.dia]:=gastoAlumno[l^.el.codigo][l^.el.dia]+busUr;
      2:gastoAlumno[l^.el.codigo][l^.el.dia]:=gastoAlumno[l^.el.codigo][l^.el.dia]+busIn;
      3:gastoAlumno[l^.el.codigo][l^.el.dia]:=gastoAlumno[l^.el.codigo][l^.el.dia]+trenU;
      4:gastoAlumno[l^.el.codigo][l^.el.dia]:=gastoAlumno[l^.el.codigo][l^.el.dia]+trenR;
    end;
    l:=l^.sig;
  end;
  for i:=1 to cantA do begin
    for d:=1 to 31 do begin
      if (gastoAlumno[i][d]>80)then
        cant:=cant+1;
     end;
  end;
  cantMasDe80:=cant;
end;

procedure dosMasUsados(l:lista;var maxT1,maxT2:medios);
var
  cantM:mediosDeT;
  i:medios;
  max1,max2:integer;
begin
  max1:=-1;
  max2:=-1;
  for i:=1 to 5 do
    cantM[i]:=0;
  while(l<>nil)do begin
    cantM[l^.el.transp]:=cantM[l^.el.transp]+1;
    l:=l^.sig;
  end;
  for i:=1 to 5 do begin
    if(cantM[i]>max1)then begin
      max2:=max1;
      max1:=cantM[i];
      maxT2:=maxT1;
      maxT1:=i;
    end
    else if (cantM[i]>max2)then begin
      max2:=cantM[i];
      maxT2:=i;
    end;
  end;
end;

function cantCombinan(l:lista):integer;
var
  i,cant:integer;
  BYO:biciYOtro;
begin
  cant:=0;
  for i:=1 to cantA do begin
    BYO[i].bici:=false;
    BYO[i].otro:=false;
  end;
  while(l<>nil)do begin
    case (l^.el.transp)of
      1..4:BYO[l^.el.codigo].otro:=true;
      5:BYO[l^.el.codigo].bici:=true;
    end;
    l:=l^.sig;
  end;
  for i:=1 to cantA do begin
    if (BYO[i].bici)and(BYO[i].otro)then
      cant:=cant+1;
  end;
  cantCombinan:=cant;
end;

var
  l:lista;
  maxT1,maxT2:medios;
  masU1,masU2:string[25];
  v:viaje;
BEGIN
  l:=nil;
  cargarViaje(v);
  while (v.codigo<>-1)do begin
    cargarLista(l,v);
    cargarViaje(v);
  end;
  writeln('La cantidad de alumnos que realizan mas de 6 viajes por dia es de: ',cantMasDe6(l),'.');
  writeln('La cantidad de alumnos que gastan en transporte mas de $80 por dia es de: ',cantMasDe80(l),'.');
  dosMasUsados(l,maxT1,maxT2);
  case (maxT1)of
    1:masU1:='el colectivo urbano';
    2:masU1:='el colectivo interurbano';
    3:masU1:='el tren universitario';
    4:masU1:='el tren Roca';
    5:masU1:='la bicicleta';
  end;
  case (maxT2)of
    1:masU2:='el colectivo urbano';
    2:masU2:='el colectivo interurbano';
    3:masU2:='el tren universitario';
    4:masU2:='el tren Roca';
    5:masU2:='la bicicleta';
  end;
  writeln('Los dos medios de transporte mas utilizados son: ',masU1,' y ',masU2,'.');
  writeln('La cantidad de alumnos que combinan bicicleta con algun otro medio de transporte son: ',cantCombinan(l),'.');
END.
