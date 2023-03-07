program modeloListas;
type
  rango=1..7;
  sonda=record
    nombre:string[20];
    dEM:integer;
    costoC,costoM:real;
    espectro:rango;
  end;
  lista=^nodo;
  nodo=record
    el:sonda;
    sig:lista;
  end;
  cantidadDeSondasPorRangoDelEspectroElectromagnetico=array[rango]of integer;
procedure cargarSonda(var s:sonda);
begin
  writeln('nombre');
  readln(s.nombre);
  writeln('dEM');
  readln(s.dEM);
  writeln('costoC');
  readln(s.costoC);
  writeln('costoM');
  readln(s.costoM);
  writeln('espectro');
  readln(s.espectro);
end;
procedure cargarNodo(var l:lista;s:sonda);
var
  aux:lista;
begin
  new(aux);
  aux^.el:=s;
  aux^.sig:=l;
  l:=aux;
end;
procedure todaLaInfo(l:lista;var c:cantidadDeSondasPorRangoDelEspectroElectromagnetico;var promDur,promCosto:real);
var
  max,valorS,sumaDur,sumaCosto:real;
  nomMax:string[20];
  i,tot:integer;
begin
  max:=-1;
  tot:=0;
  sumaDur:=0;
  sumaCosto:=0;
  for i:=1 to 7 do
    c[i]:=0;
  while(l<>nil)do begin
    {inciso a}
    valorS:=l^.el.costoC+(l^.el.costoM*l^.el.dEM);
    if(valorS>max)then begin
      max:=valorS;
      nomMax:=l^.el.nombre;
    end;
    {inciso b}
    c[l^.el.espectro]:=c[l^.el.espectro]+1;
    {inciso c}
    sumaDur:=sumaDur+l^.el.dEM;
    {inciso d}
    sumaCosto:=sumaCosto+l^.el.costoC;
    tot:=tot+1;
    l:=l^.sig;
  end;
  promDur:=sumaDur/tot;
  promCosto:=sumaCosto/tot;
  writeln('El nombre de la sonda mas costosa es: ',nomMax,'.');
end;
procedure imprimirCantSondas(c:cantidadDeSondasPorRangoDelEspectroElectromagnetico);
var
  i:integer;
begin
  for i:=1 to 7 do
    writeln('La cantidad de sondas que realizaran estudios en el rango ',i,' es de: ',c[i],'.');
end;
procedure SondasSuperiores(l:lista;promDur,promCosto:real);
var
  css:integer;
begin
  css:=0;
  while(l<>nil)do begin
    if (l^.el.dEM>promDur)then
      css:=css+1;
    if(l^.el.costoC>promCosto)then
      writeln('La sonda ',l^.el.nombre,' supera el costo promedio de construccion.');
    l:=l^.sig;
  end;
  
  
  writeln('La cantidad de sondas cuya duracion estimada supera la duracion promedio de todas las sondas es de: ',css,'.');
end;
var
  pri:lista;
  s:sonda;
  promDur,promCosto:real;
  CSPREE:cantidadDeSondasPorRangoDelEspectroElectromagnetico;
BEGIN
  pri:=nil;
  repeat
    cargarSonda(s);
    cargarNodo(pri,s);
  until(pri^.el.nombre='GAIA');
  todaLaInfo(pri,CSPREE,promDur,promCosto);
  imprimirCantSondas(CSPREE);
  SondasSuperiores(pri,promDur,promCosto);
END.



procedure ();
var
  
begin

end;

  while(l<>nil)do begin
    
    l:=l^.sig;
  end;
  
  writeln('');
  readln();




























