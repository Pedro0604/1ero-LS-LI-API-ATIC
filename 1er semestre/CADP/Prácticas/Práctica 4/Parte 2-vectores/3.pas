program tredichi;
const
  dimF=200;
type
  marzo=record
    dia:integer;
    monto,dist:real;
  end;
  viajes=array[1..dimF]of marzo;
  cantidadViajesDia=array[1..31]of integer;
procedure cargarM(var m:marzo);
begin
  writeln('dist');
  readln(m.dist);
  if (m.dist<>0)then begin
    writeln('dia');
    readln(m.dia);
    writeln('monto');
    readln(m.monto);
  end;
end;
procedure cargarV(var v:viajes;var dimL:integer);
var
  m:marzo;
begin
  dimL:=0;
  cargarM(m);
  while(dimL<dimF)and(m.dist<>0)do begin
    dimL:=dimL+1;
    v[dimL]:=m;
    cargarM(m);
  end;
end;
procedure info(var v:viajes;var dimL:integer);
var
  i,diaMin:integer;
  sumaTotal,min,distMin:real;
  cantVD:cantidadViajesDia;
begin
  for i:=1 to 31 do
    cantVD[i]:=0;
  sumaTotal:=0;
  min:=32000;
  for i:=1 to dimL do begin
    sumaTotal:=sumaTotal+v[i].monto;
    if (v[i].monto<min)then begin
      min:=v[i].monto;
      distMin:=v[i].dist;
      diaMin:=v[i].dia;
    end;
    cantVD[v[i].dia]:=cantVD[v[i].dia]+1
  end;
  writeln(' El monto promedio transportado de los viajes realizados fue: ',sumaTotal/dimL:1:2);
  writeln('La distancia recorrida en el viaje que transporto menos dinero fue:',distMin:1:2,' y el dia del mes en que se realizo el viaje que transporto menos dinero fue: ',diaMin);
  for i:=1 to 31 do begin 
    writeln('El dia ',i,' de marzo se realizaron ',cantVD[i],' viajes.');
  end;
end;
procedure eliminar(var v:viajes;var dimL:integer);
var
  i,j:integer;
begin
  for i:=1 to dimL do begin
    if (v[i].dist=100)then begin
      for j:=i to dimL-1 do begin
        v[j]:=v[j+1];
      end;
      dimL:=dimL-1;
    end;
  end;
end;
procedure imprimir(var v:viajes;var dimL:integer);
var
  i:integer;
begin
  for i:=1 to dimL do begin
    writeln('dia');
    writeln(v[i].dia);
    writeln('monto');
    writeln(v[i].monto:1:2);
    writeln('dist');
    writeln(v[i].dist:1:2);
  end;
end;
var
  v:viajes;
  dimL:integer;
BEGIN
  cargarV(v,dimL);
  info(v,dimL);
  eliminar(v,dimL);
  imprimir(v,dimL);
END.




procedure ();
var
  
begin
  
end;

  writeln('');
  readln();
  
  
  
  
  
  
  
  
  
  
  
  
  
