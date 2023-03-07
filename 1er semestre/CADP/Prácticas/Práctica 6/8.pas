program JugamosConListas;
type
  lista = ^nodo;
  nodo = record
    num : integer;
    sig : lista;
  end;
procedure insertarOrdenado(var L: lista; v: integer);
var
  nuevo,ant,act : lista;
begin
  new(nuevo);
  nuevo^.num := v;
  nuevo^.sig := nil;
  ant:=l;
  act:=l;
  while (act<>nil)and(v>act^.num)do begin
    ant:=act;
    act:=act^.sig;
  end;
  if (act=ant)then
    l:=nuevo
  else
    ant^.sig:=nuevo;
  nuevo^.sig:=act;
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
    insertarOrdenado(pri, valor);
    writeln('Ingrese un numero: ');
    read(valor);
  end;
  imprimir(pri);
  writeln('Ingrese un incremento: ');
  read(valor);
  incrementar(pri,valor);
  imprimir(pri);
end.
