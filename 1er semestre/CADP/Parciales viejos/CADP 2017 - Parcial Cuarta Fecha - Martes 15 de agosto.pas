program CADP_2017_-_Parcial_Cuarta_Fecha_-_Martes_15_de_agosto;
const
  dimF=100;
type
  tiposDeEvento=1..5;
  evCulturales=1..dimF;
  
  ev=record
    nombre,lugar:string[30];
    cantMax:integer;
    costoEn:real;
    tipo:tiposDeEvento;
  end;
  eventos=array[1..dimF] of ev;
  
  cantEnTotalesPorEv=array[1..dimF]of integer;
  
  venta=record
    codigo,dni,cantEn:integer;
    numEv:evCulturales;
  end;
  
  lista=^nodo;
  nodo=record
    el:venta;
    sig:lista;
  end;

procedure cargarEventos(var e:eventos);{SE DISPONE}

procedure cargarVenta(var v:venta);
begin
  writeln('Introduzca codigo');
  readln(v.codigo);
  if (v.codigo<>-1)then begin
    writeln('Introduzca numEv');
    readln(v.numEv);
    writeln('Introduzca dni');
    readln(v.dni);
    writeln('Introduzca cantEn');
    readln(v.cantEn);
  end;
end;

procedure agregarAdelante(var l:lista;v:venta);
var
  nuevo:lista;
begin
  new(nuevo);
  nuevo^.el:=v;
  nuevo^.sig:=l;
  l:=nuevo;
end;

procedure cargarLista(var l:lista);
var
  v:venta;
begin
  cargarVenta(v);
  while(v.codigo<>-1)do begin
    agregarAdelante(l,v);
    cargarVenta(v);
  end;
end;

procedure cantEntradasTot(l:lista;var CETPE:cantEnTotalesPorEv);
var
  i:integer;
begin
  for i:=1 to dimF do
    CETPE[i]:=0;
  while(l<>nil)do begin
    CETPE[l^.el.numEv]:=CETPE[l^.el.numEv]+l^.el.cantEn;
  end;
end;

procedure dosEvMenores(l:lista;e:eventos;var nomMin1,nomMin2,lugMin1,lugMin2:string[30]);
var
  min1,min2,recaudacion:real;
  CETPE:cantEnTotalesPorEv;
begin
  min1:=32000;
  min2:=32000;
  cantEntradasTot(l,CETPE);
  while(l<>nil)do begin
    recaudacion:=(CETPE[l^.el.numEv])*(e[l^.el.numEv].costoEn);
    if(recaudacion<min1)then begin
      min2:=min1;
      min1:=recaudacion;
      nomMin2:=nomMin1;
      nomMin1:=e[l^.el.numEv].nombre;
      lugMin2:=lugMin1;
      lugMin1:=e[l^.el.numEv].lugar;
    end
    else if(recaudacion<min2)then begin
      min2:=recaudacion;
      nomMin2:=e[l^.el.numEv].nombre;
      lugMin2:=e[l^.el.numEv].lugar;
    end;
    l:=l^.sig;
  end;
end;

function cantMasPqueImp(l:lista;e:eventos):integer;
var
  cantP,cantImp,cantTot,dig,DNI:integer;
  tipo:tiposDeEvento;
begin
  cantTot:=0;
  while(l<>nil)do begin
    DNI:=l^.el.dni;
    cantP:=0;
    cantImp:=0;
    while(DNI<>0)do begin
      dig:=DNI MOD 10;
      if(dig MOD 2=0)then
        cantP:=cantP+1
      else
        cantImp:=cantImp+1;
      DNI:=DNI DIV 10;
    end;
    tipo:=e[l^.el.numEv].tipo;
    if (cantP>cantImp)and(tipo=3)then
      cantTot:=cantTot+l^.el.cantEn;
    l:=l^.sig;
  end;
  cantMasPqueImp:=cantTot;
end;

function cant50(l:lista;e:eventos):boolean;
var
  entradasVendidas:integer;
begin
  entradasVendidas:=0;
  while(l<>nil)do begin
    if(l^.el.numEv=50)then
      entradasVendidas:=entradasVendidas+l^.el.cantEn;
  end;
  if(entradasVendidas>=e[50].cantMax)then
    cant50:=true;
  else
    cant50:=false;
end;

var
  l:lista;
  e:eventos;
  nomMin1,nomMin2,lugMin1,lugMin2:string[30];
BEGIN
  l:=nil;
  cargarEventos(e);{SE DISPONE}
  cargarLista(l);
  dosEvMenores(l,e,nomMin1,nomMin2,lugMin1,lugMin2);
  writeln('El nombre y lugar de los dos eventos con menor recaudacion es: ',nomMin1,' realizado en ',lugMin1,' y ',nomMin2,' realizado en ',lugMin2,'.');
  writeln('La cantidad de entradas vendidas cuyo comprador contiene en su DNI mas digitos pares que impares y que sean para el evento de tipo "obra de teatro" es de: ',cantMasPqueImp(l,e));
  if(cant50(l,e))then
    writeln('La cantidad de entradas vendidas para el evento numero 50 alcanzo la cantidad maxima de personas permitidas.')
  else
    writeln('La cantidad de entradas vendidas para el evento numero 50 no alcanzo la cantidad maxima de personas permitidas.');
END.
