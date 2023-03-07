program JugamosConListas;
type
  lista = ^nodo;
  nodo = record
    num : integer;
    sig : lista;
  end;
procedure armarNodo(var L: lista; v: integer);
var
  aux : lista;
begin
  new(aux);
  aux^.num := v;
  aux^.sig := L;
  L := aux;
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
function maximo(l: lista):integer;
var
  max:integer;
begin
  max:=-32768;
  while(l<>nil)do begin
    if(l^.num>max)then begin
      max:=l^.num;
    end;
    l:=l^.sig;
  end;
  maximo:=max;
end;
function minimo(l: lista):integer;
var
  min:integer;
begin
  min:=32767;
  while(l<>nil)do begin
    if(l^.num<min)then begin
      min:=l^.num;
    end;
    l:=l^.sig;
  end;
  minimo:=min;
end;
function multiplos(l: lista;a:integer):integer;
var
  cant:integer;
begin
  cant:=0;
  while(l<>nil)do begin
    if (l^.num MOD a=0)then
      cant:=cant+1;
    l:=l^.sig;
  end;
  multiplos:=cant;
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
  {writeln('Ingrese un incremento: ');
  read(valor);
  incrementar(pri,valor);
  imprimir(pri);}
  if (maximo(pri)<>-32768)then
    writeln('El valor maximo es: ',maximo(pri),'.')
  else  writeln('La lista esta vacia.');
  if (minimo(pri)<>32767)then
    writeln('El valor minimo es: ',minimo(pri),'.')
  else  writeln('La lista esta vacia.');
  writeln('Ingrese un numero: ');
  read(valor);
  writeln('La cant de elementos de la lista multiplos de ',valor,' es: ',multiplos(pri,valor),'.');
end.











