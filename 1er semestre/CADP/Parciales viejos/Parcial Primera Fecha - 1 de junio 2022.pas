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
    nombrePartido:string;
    cantVacunados:integer;
  end;
  
  cincoListas=array[1..5]of lista;
  
  infoCadaPartido=array[codigosPartidos]of info; {SE DISPONE}

procedure cargarLista(var l:lista); {SE DISPONE}

procedure cargarNombresPartidos(var ICP:infoCadaPartido); {SE DISPONE}

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

procedure dosMenores(var ICP:infoCadaPartido;var nomMin1,nomMin2:string;var min1,min2:integer);
var
  i:integer;
begin
  for i:=1 to cantPartidos do begin
    if(ICP[i].cantVacunados<min1)then begin
      min2:=min1;
      min1:=ICP[i].cantVacunados;
      nomMin2:=nomMin1;
      nomMin1:=ICP[i].nombrePartido;
    end
    else if(ICP[i].cantVacunados<min2)then begin
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
  while(aux<>nil)and(nuevo^.el.codigoPartido>aux^.el.codigoPartido)do begin
    ant:=aux;
    aux:=aux^.sig
  end;
  if(ant=aux)then
    cincoL[act^.el.codigoZona]:=nuevo
  else
    ant^.sig:=nuevo;
  nuevo^.sig:=aux;
end;

procedure recorrerLista(var l:lista;ICP:infoCadaPartido);
var
  ant,act:lista;
  i:integer;
  min1,min2:integer;
  nomMin1,nomMin2:string;
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
      eliminar(l,ant,act);             {ELIMINAR ESE DIA, MANTENER ANT, PERO DEVOLVER ACT EN ACT^.SIG (ANTES DE ELIMINARLO) COSA DE QUE NO SE ME BUGUEE TODO Y ANTERIOR SIGUE QUEDANDO EN EL LUGAR ANTERIOR A ACTUAL, YA QUE SI BIEN EN LA LISTA ORIGINAL ESTARÍA DOS ESPACIOS MAS ADELANTE, AL ELIMINAR EL SIGUIENTE NODO DSP DE ANTERIOR Y AVANZAR ACTUAL AL SIGUIENTE, ANTERIOR Y ACTUAL QUEDAN PEGADOS}
    end
    else begin                         {EN CASO DE QUE EL AÑO SEA 2021 PROCEDO CON NORMALIDAD MOVIENDO ANT Y ACT COMO SIEMPRE}
      cantTotalVac(act,ICP);    {CANTIDAD TOTAL VACUNADOS POR PARTIDO}
    
      cincoNuevas(act,cincoL);  {GENERACION DE LAS 5 NUEVAS LISTAS}
      
      ant:=act;
      act:=act^.sig;
    end;
  end;
  dosMenores(ICP,nomMin1,nomMin2,min1,min2); {OBTENER CUALES SON LOS DOS PARTIDOS CON MENOR CANTIDAD DE VACUNADOS Y TOMAR SUS NOMBRES Y DICHA CANTIDAD}
  writeln('El nombre y la cantidad de vacunados en los dos partidos con menor cantidad es: ',nomMin1,' con ',min1,' vacunados y ',nomMin2,' con',min2,' vacunados.');
end;


var 
  l:lista;
  ICP:infoCadaPartido;
BEGIN
  l:=nil;
  cargarLista(l); {SE DISPONE}
  cargarNombresPartidos(ICP); {SE DISPONE}
  recorrerLista(l,ICP);
END.  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
