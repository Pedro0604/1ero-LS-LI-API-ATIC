program JugamosConListas;
type
  lista = ^nodo;
  nodo = record
    num : integer;
    sig : lista;
  end;
procedure armarNodo(var l: lista; v: integer);
var
  aux,nuevo: lista;
begin
  new(nuevo);
  nuevo^.num:=v;
  nuevo^.sig:=nil;
  if (l=nil)then
    l:=nuevo
  else begin
    aux:=l;
    while (aux^.sig<>nil)do
      aux:=aux^.sig;
    aux^.sig:=nuevo
  end;
end;
procedure imprimir(l: lista);
begin
  while(l<>nil)do begin
    writeln(l^.num);
    l:=l^.sig;
  end;
end;
procedure incrementar(l: lista;v:integer);
begin
  while(l<>nil)do begin
    l^.num:=l^.num+v;
    l:=l^.sig;
  end;
end;
var
  pri : lista;
  valor : integer;
begin
  pri := nil;
  writeln('Ingrese un numero: ');
  read(valor);
  while (valor <> 0)do begin
    armarNodo(pri, valor);
    writeln('Ingrese un numero: ');
    read(valor);
  end;
  imprimir(pri);
  writeln('Ingrese un incremento: ');
  read(valor);
  incrementar(pri,valor);
  imprimir(pri);
end.


















