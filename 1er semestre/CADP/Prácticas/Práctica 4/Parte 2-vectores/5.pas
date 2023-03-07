program modeloV;
const
  dimF=4;
type
  fechas=record
    mes,ano:integer;
  end;
  categorias='A'..'F';
  codigos=0..2400;
  cliente=record
    f:fechas;
    categ:categorias;
    codigo:codigos;
    monto:real;
  end;
  informacion=array[1..dimF]of cliente;
  cantidadClientesCategoria=array['A'..'F']of integer;
  cantidadClientesCiudad=array[1..2400]of integer;
  diezCiudadesConMayorCantidadDeClientes=array[1..10]of codigos;
procedure leerf(var f:fechas);
begin
  writeln('mes');
  read(f.mes);
  writeln('ano');
  read(f.ano);
end;
procedure leerCliente(var cl:cliente);
begin
  {ñleerf(cl.f);
  writeln('categ');
  readln(cl.categ);
  readln(cl.categ);}
  writeln('codigo');
  readln(cl.codigo);
  writeln('monto');
  readln(cl.monto);
end;
procedure leerInformacion(var info:informacion);
var
  i:integer;
  cl:cliente;
begin
  for i:=1 to dimF do begin
    leerCliente(cl);
    info[i]:=cl;
  end;
end;
procedure cantCont(info:informacion);
var
  anoMax,maxCont,mesAct,AnoAct,i,contAno,contMes:integer;
begin
  i:=1;
  maxCont:=-1;
  while(i<=dimF)do begin
    anoAct:=info[i].f.ano;
    contAno:=0;
    while(anoAct=info[i].f.ano)and(i<=dimF)do begin
      mesAct:=info[i].f.mes;
      contMes:=0;
      while(mesAct=info[i].f.mes)and(i<=dimF)and(anoAct=info[i].f.ano)do begin
        contMes:=contMes+1;
        i:=i+1;
      end;
      writeln('En el mes ',mesAct,'/',anoAct,' hubo ',contMes,' contratos.');
      contAno:=contAno+contMes;
    end;
    if(maxCont<contAno)then begin
      maxCont:=contAno;
      anoMax:=anoAct;
    end;
    writeln('En el ano ',anoAct,' hubo ',contAno,' contratos.');
  end;
  writeln('El ano con mayor cantidad de contratos fue: ',anoMax,' con ',maxCont,' contratos.');
end;
procedure cantClCat(info:informacion);
var
  CCC:cantidadClientesCategoria;
  i:integer;
  car:char;
begin
  for car:='A' to 'F' do
    CCC[car]:=0;
  for i:=1 to dimF do
    CCC[info[i].categ]:=CCC[info[i].categ]+1;
  for car:='A' to 'F' do
    writeln('La cantidad de clientes en la categoria ',car,' es de: ',CCC[car],'.');
end;
procedure ciudadesMax(info:informacion);
var
  CCCiud:cantidadClientesCiudad;
  DCCMCDC:diezCiudadesConMayorCantidadDeClientes;
  i,j:integer;
begin
  for i:=1 to 10 do
    DCCMCDC[i]:=0;
  for i:=1 to 2400 do begin
    CCCiud[i]:=0;
  end;
  for i:=1 to dimF do begin
    CCCiud[info[i].codigo]:=CCCiud[info[i].codigo]+1;
  end;
  for i:=1 to 2400 do begin
    for j:=1 to 10 do begin
      if(CCCiud[i]>DCCMCDC[j])and (CCCiud[i]<DCCMCDC[10])then
        
      end;
    end;
  end;
end;
function cantClSuperiores(info:informacion):integer;
var
  cant,i:integer;
  prom,suma:real;
begin
  suma:=0;
  cant:=0;
  for i:=1 to dimF do begin
    suma:=suma+info[i].monto;
  end;
  prom:=suma/dimF;
  for i:=1 to dimF do begin
    if (info[i].monto>prom)then
      cant:=cant+1;
  end;
  cantClSuperiores:=cant;
end;
var
  info:informacion;
BEGIN
  leerInformacion(info);
  {cantClCat(info);
  cantCont(info);}
  ciudadesMax(info);
  writeln('La cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes es de: ',cantClSuperiores(info),'.');
END.



procedure ();
var
  
begin
  
end;

  writeln('');
  readln();
  
  
