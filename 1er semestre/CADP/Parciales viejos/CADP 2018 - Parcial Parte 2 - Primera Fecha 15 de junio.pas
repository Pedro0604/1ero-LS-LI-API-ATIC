program CADP_2018_Parcial_Parte_2_Primera_Fecha_15_de_junio;
type
  codigosProvincia=0..23;
  estancia=record
    codigo:integer;
    localidad:string;
    codigoProv:codigosProvincia;
    cantCab:integer;
  end;
  lista=^nodo;
  nodo=record
    el:estancia;
    sig:lista;
  end;
  
procedure cargarEstancia(var e:estancia);
begin
  writeln('codigo');
  readln(e.codigo);
  if(e.codigo<>0)then begin
    writeln('localidad');
    readln(e.localidad);
    writeln('codigoProv');
    readln(e.codigoProv);
    writeln('cantCab');
    readln(e.cantCab);
  end;
end;

procedure agregarAdelante(var l:lista;e:estancia);
var
  nuevo:lista;
begin
  new(nuevo);
  nuevo^.el:=e;
  nuevo^.sig:=l;
  l:=nuevo;
end;

procedure cargarLista(var l:lista);
var
  e:estancia;
begin
  cargarEstancia(e);
  while(e.codigo<>0)do begin
    agregarAdelante(l,e);
    cargarEstancia(e);
  end;
end;

function esta234(l:lista):boolean;
var
  encontre:boolean;
begin
  encontre:=false;
  while(l<>nil)and(not encontre)do begin
    if(l^.el.codigo=234)then
      encontre:=true;
    l:=l^.sig;
  end;
  esta234:=encontre;
end;

procedure dosMayores(l:lista;var codMax1,codMax2:codigosProvincia);
var
  max1,max2:integer;
begin
  max1:=-1;
  max2:=-1;
  codMax1:=0;
  codMax2:=0;
  while(l<>nil)do begin
    if(l^.el.cantCab>max1)then begin
      max2:=max1;
      max1:=l^.el.cantCab;
      codMax2:=codMax1;
      codMax1:=l^.el.codigoProv;
    end
    else if(l^.el.cantCab>max2)then begin
      max2:=l^.el.cantCab;
      codMax2:=l^.el.codigoProv;
    end; 
    l:=l^.sig;
  end;
end;

var
  l:lista;
  codMax1,codMax2:codigosProvincia;
BEGIN
  l:=nil;
  cargarLista(l);
  if (esta234(l))then
    writeln('La estancia de codigo 234 se encuentra almacenada.')
  else
    writeln('La estancia de codigo 234 no se encuentra almacenada.');
  dosMayores(l,codMax1,codMax2);
  writeln('Los codigos de las dos provincias con mayor cantidad de ganado son: ',codMax1,' y ',codMax2,'.');
END.





