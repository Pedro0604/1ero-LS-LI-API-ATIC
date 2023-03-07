program modeloListas;
type
  producto=record
    codigo,sA,sM:integer;
    precio:real;
    descripcion:string[30];
  end;
  lista=^nodo;
  nodo=record
    el:producto;
    sig:lista;
  end;
procedure  cargarProducto(var pr:producto);
begin
  writeln('codigo');
  readln(pr.codigo);
  if (pr.codigo<>-1)then begin
    {writeln('sA');
    readln(pr.sA);
    writeln('sM');
    readln(pr.sM);}
    writeln('precio');
    readln(pr.precio);
    {writeln('descripcion');
    readln(pr.descripcion);}
  end;
end;
procedure cargarNodo(var l:lista;pr:producto);
var
  aux:lista;
begin
  new(aux);
  aux^.el:=pr;
  aux^.sig:=l;
  l:=aux;
end;
function porcInferior(l:lista):real;
var
  tot,cantInf:integer;
begin
  tot:=0;
  cantInf:=0;
  while(l<>nil)do begin
    if (l^.el.sA<l^.el.sM)then
      cantInf:=cantInf+1;
    tot:=tot+1;
    l:=l^.sig
  end;
  if (tot<>0) then
    porcInferior:=cantInf*100/tot
  else porcInferior:=-1;
end;
procedure tresDigP(l:lista);
var
  dig,cod,cantP:integer;
begin
  while (l<>nil)do begin
    cantP:=0;
    cod:=l^.el.codigo;
    dig:=cod mod 10;
    while (dig<>0)do begin
      if (dig mod 2=0)then
        cantP:=cantP+1;
      cod:=cod DIV 10;
      dig:=cod mod 10;
    end;
    if(cantP>=3)then
      writeln('El producto de descripcion ',l^.el.descripcion,' tiene al menos tresDigP');
    l:=l^.sig;
  end;
end;
procedure masEconomicos(l:lista);
var
  min1,min2:real;
  codMin1,codMin2:integer;
begin
  min1:=99999999;
  min2:=99999999;
  codMin1:=-1;
  while(l<>nil)do begin
    if(l^.el.precio<min1)then begin
      min2:=min1;
      min1:=l^.el.precio;
      codMin2:=codMin1;
      codMin1:=l^.el.codigo;
    end
    else if(l^.el.precio<min2)then begin
      min2:=l^.el.precio;
      codMin2:=l^.el.codigo;
    end;
    l:=l^.sig;
  end;
  writeln('Los codigos de los dos productos mas economicos son: ',codMin1,' con ',min1:1:2,' pesos y ',codMin2,' con ',min2:1:2,' pesos.');
end;
var
  pri:lista;
  pr:producto;
BEGIN
  pri:=nil;
  cargarProducto(pr);
  while(pr.codigo<>-1)do begin
    cargarNodo(pri,pr); 
    cargarProducto(pr);
  end;
  {writeln('El porcInferior es: ',porcInferior(pri):1:2,'.');
  tresDigP(pri);}
  masEconomicos(pri);
END.




























