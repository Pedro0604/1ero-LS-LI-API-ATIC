program siete;
type
  centro=record
  nombre:string;
  universidad:string;
  cantInv:integer;
  cantB:integer;
end;
procedure leerC(var cen:centro);
begin
  writeln('nombre');
  readln(cen.nombre);
  writeln('universidad');
  readln(cen.universidad);
  writeln('cantInv');
  readln(cen.cantInv);
  writeln('cantB');
  readln(cen.cantB);
end;
procedure max(cantTotI:integer;var maxI:integer;var maxUni:string;uni:string);
begin
  if (cantTotI>maxI)then begin
    maxI:=cantTotI;
    maxUni:=uni;
  end;
end;
procedure min(cen:centro;var min1,min2:integer;var minB1,minB2:string);
begin
  if (cen.cantB<min1)then begin
    min2:=min1;
    min1:=cen.cantB;
    minB2:=minB1;
    minB1:=cen.nombre;
  end
  else if (cen.cantB<min2)then begin
    min2:=cen.cantB;
    minB2:=cen.nombre;
  end;
end;
var
  cen:centro;
  cantC,cantTotI,maxI,min1,min2:integer;
  maxUni,minB1,minB2,uniActual:string;
BEGIN
  maxI:=-1;
  min1:=32000;
  min2:=32000;
  leerC(cen);
  while(cen.cantInv<>0)do begin
    uniActual:=cen.universidad;
    cantC:=0;
    cantTotI:=0;
    while((uniActual=cen.universidad) and (cen.cantInv<>0))do begin
      cantC:=cantC+1;
      cantTotI:=cantTotI+cen.cantInv;
      min(cen,min1,min2,minB1,minB2);
      leerC(cen);
    end;
    writeln('Cantidad total de centros para la universidad ',uniActual,': ',cantC);
    max(cantTotI,maxI,maxUni,uniActual);
  end;
  writeln('Los dos centros con menor cantidad de becarios fueron: ',minB1,' y ',minB2);
  writeln('Universidad con mayor cantidad de investigadores en sus centros: ',maxUni);
  writeln('');
  writeln('');
  writeln('');
END.








































