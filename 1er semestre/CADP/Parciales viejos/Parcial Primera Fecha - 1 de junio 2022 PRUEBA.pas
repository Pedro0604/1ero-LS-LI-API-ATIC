program Parcial_Primera_Fecha_1_de_junio_2022;
const
  cantPartidos=135;
type
  codigosZonas=1..5;
  codigosPartidos=1..cantPartidos;
  
  fecha=record
    dia,mes,ano:integer;
  end;
  
  diaVacunacion=record
    f:fecha;
    codigoPartido:codigosPartidos;
    codigoZona:codigosZonas;
    cantVac:integer;
  end;
  
  lista=^nodo;
  nodo=record
    el:diaVacunacion;
    sig:lista;
  end;
  
  info=record
    nombrePartido:integer;
    cantVacunados:integer;
  end;
  
  cincoListas=array[1..5]of lista;
  
  infoCadaPartido=array[codigosPartidos]of info; {SE DISPONE}

procedure cargarDiaVacunacion(var d:diaVacunacion);
begin
  writeln('');
  d.cantVac:=random(102)-1;
  writeln('cantVac: ',d.cantVac);
  if(d.cantVac<>-1)then begin
    d.f.ano:=random(3)+2019;
    writeln('ano: ',d.f.ano);
    d.codigoPartido:=random(135)+1;
    writeln('codigoPartido: ',d.codigoPartido);
    d.codigoZona:=random(5)+1;
    writeln('codigoZona: ',d.codigoZona);
    
  end;
end;

procedure aggAd(var l:lista;d:diaVacunacion);
var
  nuevo:lista;
begin
  new(nuevo);
  nuevo^.el:=d;
  nuevo^.sig:=l;
  l:=nuevo;
end;

procedure cargarLista(var l:lista); {SE DISPONE}
var
  d:diaVacunacion;
begin
  cargarDiaVacunacion(d);
  while(d.cantVac<>-1)do begin
    aggAd(l,d);
    cargarDiaVacunacion(d);
  end;
end;

procedure cargarNombresPartidos(var ICP:infoCadaPartido); {SE DISPONE}
var
  i:integer;
begin
  for i:=1 to cantPartidos do begin
    ICP[i].nombrePartido:=i+1000;
  end;
end;

procedure eliminar(var l:lista;ant:lista;var act:lista);
var
  aElim:lista;
begin
  aElim:=act;
  if(act=ant)then
    l:=act^.sig
  else
    ant^.sig:=act^.sig;
  act:=act^.sig;
  dispose(aElim);
end;

procedure cantTotalVac(act:lista;var ICP:infoCadaPartido);
begin
  ICP[act^.el.codigoPartido].cantVacunados:=ICP[act^.el.codigoPartido].cantVacunados+act^.el.cantVac;
end;

procedure dosMenores(var ICP:infoCadaPartido;var nomMin1,nomMin2:integer;var min1,min2:integer);
var
  i:integer;
begin
  min1:=32000;
  min2:=32000;
  for i:=1 to cantPartidos do begin
    if(ICP[i].cantVacunados<min1)and(ICP[i].cantVacunados>0)then begin
      min2:=min1;
      min1:=ICP[i].cantVacunados;
      nomMin2:=nomMin1;
      nomMin1:=ICP[i].nombrePartido;
    end
    else if(ICP[i].cantVacunados<min2)and(ICP[i].cantVacunados>0)then begin
      min2:=ICP[i].cantVacunados;
      nomMin2:=ICP[i].nombrePartido;
    end;
  end;
end;

procedure cincoNuevas(act:lista; var cincoL:cincoListas);
var
  nuevo,ant,aux:lista;
begin
  new(nuevo);
  nuevo^.el:=act^.el;
  aux:=cincoL[act^.el.codigoZona];
  ant:=aux;
  while (aux<>nil) and ((nuevo^.el.codigoPartido)>(aux^.el.codigoPartido))do begin
    ant:=aux;
    aux:=aux^.sig
  end;
  if(ant=aux)then
    cincoL[act^.el.codigoZona]:=nuevo
  else
    ant^.sig:=nuevo;
  nuevo^.sig:=aux;
end;

procedure imprimir5L(cincoL:cincoListas);
var
  i:integer;
begin
  writeln('');
  writeln('Cinco Listas:');
  for i:=1 to 5 do begin
    writeln('');
    writeln('  Lista numero ',i,':');
    while(cincoL[i]<>nil)do begin
      writeln('');
      writeln('    cantVac: ',cincoL[i]^.el.cantVac);
      writeln('    ano: ',cincoL[i]^.el.f.ano);
      writeln('    codigoPartido: ',cincoL[i]^.el.codigoPartido);
      writeln('    codigoZona: ',cincoL[i]^.el.codigoZona);
      cincoL[i]:=cincoL[i]^.sig;
    end;
  end;
end;

procedure imprimirLista(l:lista);
begin
  writeln('');
  writeln('Lista:');
  while(l<>nil)do begin
    writeln('');
    writeln('  cantVac: ',l^.el.cantVac);
    writeln('  ano',l^.el.f.ano);
    writeln('  codigoPartido',l^.el.codigoPartido);
    writeln('  codigoZona',l^.el.codigoZona);
    l:=l^.sig;
  end;
end;

procedure imformarCantTotVac(ICP:infoCadaPartido);
var
  i:integer;
begin
  writeln('');
  for i:=1 to cantPartidos do begin
    if(ICP[i].cantVacunados<>0) then
      writeln('El partido ',i,' tuvo ',ICP[i].cantVacunados,' vacunados en total.');
  end;
end;

procedure recorrerLista(var l:lista;ICP:infoCadaPartido);
var
  ant,act:lista;
  i:integer;
  min1,min2:integer;
  nomMin1,nomMin2:integer;
  cincoL:cincoListas;
begin
  ant:=l;
  act:=l;
  for i:=1 to cantPartidos do {INICIALIZAR LA CANTIDAD TOTAL VACUNADOS}
    ICP[i].cantVacunados:=0;                {POR PARTIDO EN 0 PARA TODOS LOS PARTIDOS}
    
  for i:=1 to 5 do            {INICIALIZAR LAS CINCO NUEVAS LISTAS EN NIL}
    cincoL[i]:=nil;
    
  while(act<>nil)do begin
    if(act^.el.f.ano<>2021)then begin  {SI NO ES DEL AÑO PASADO...}
      eliminar(l,ant,act);             {ELIMINAR ESE DIA}
    end
    else begin  
      cantTotalVac(act,ICP);    {CANTIDAD TOTAL VACUNADOS POR PARTIDO}
    
      cincoNuevas(act,cincoL);  {GENERACION DE LAS 5 NUEVAS LISTAS}
      
      ant:=act;
      act:=act^.sig;
    end;
  end;
  writeln('Despues de recorrer: ');
  imprimirLista(l);
  {imformarCantTotVac(ICP);}
  dosMenores(ICP,nomMin1,nomMin2,min1,min2); {OBTENER CUALES SON LOS DOS PARTIDOS CON MENOR CANTIDAD DE VACUNADOS Y TOMAR SUS NOMBRES Y DICHA CANTIDAD}
  writeln('');
  writeln('El nombre y la cantidad de vacunados en los dos partidos con menor cantidad es: ',nomMin1,' con ',min1,' vacunados y ',nomMin2,' con ',min2,' vacunados.');
  imprimir5L(cincoL);
end;

var 
  l:lista;
  ICP:infoCadaPartido;
BEGIN
  randomize();
  l:=nil;
  cargarLista(l); {SE DISPONE}
  imprimirLista(l);
  cargarNombresPartidos(ICP); {SE DISPONE}
  recorrerLista(l,ICP);
END.  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
