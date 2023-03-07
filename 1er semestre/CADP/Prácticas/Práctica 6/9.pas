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
  writeln('');
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

function estaOrdenadaAsc(l:lista):boolean;
var
  ant:lista;
  ord:boolean;
begin
  ant:=l;
  ord:=true;
  while (l<>nil)and(ord)do begin
    if (ant^.num>l^.num)then
      ord:=false
    else begin
      ant:=l;
      l:=l^.sig;
    end;
  end;
  estaOrdenadaAsc:=ord;
end;

function estaOrdenadaDesc(l:lista):boolean;
var
  ant:lista;
  ord:boolean;
begin
  ant:=l;
  ord:=true;
  while (l<>nil)and(ord)do begin
    if (ant^.num<l^.num)then
      ord:=false
    else begin
      ant:=l;
      l:=l^.sig;
    end;
  end;
  estaOrdenadaDesc:=ord;
end;

procedure eliminar (var l:lista;v:integer;var pude:boolean);
var
  ant,act:lista;
begin
  pude:=false;
  ant:=l;
  act:=l;
  while(act<>nil)and(not pude)do begin
    if (act^.num=v)then
      pude:=true
    else begin
      ant:=act;
      act:=act^.sig;
    end;
  end;
  if (act<>nil)then begin
    if(act=ant)then
      l:=act^.sig
    else
      ant^.sig:=act^.sig;
    dispose(act);
  end;
end;

procedure sublista(var nueL:lista;l:lista;a,b:integer);
begin
  while (l<>nil)do begin
    if (l^.num>a)and(l^.num<b)then 
      armarNodo(nueL,l^.num);
    l:=l^.sig;
  end;
end;

procedure sublistaOrdenadaAsc(var nueL:lista;l:lista;a,b:integer);
begin
  while (l<>nil)and(l^.num<b)do begin
    if (l^.num>a)then begin
      while(l<>nil)and(l^.num<b)do begin
        armarNodo(nueL,l^.num);
        l:=l^.sig;
      end;
    end
    else l:=l^.sig;
  end;
end;

procedure sublistaOrdenadaDesc(var nueL:lista;l:lista;a,b:integer);
begin
  while (l<>nil)and(l^.num>a)do begin
    if (l^.num<b)then begin
      while(l<>nil)and(l^.num>a)do begin
        armarNodo(nueL,l^.num);
        l:=l^.sig;
      end;
    end
    else l:=l^.sig;
  end;
end;

var
  pri,nueL : lista;
  valor,a,b : integer;
  pude:boolean;
begin
  pri := nil;
  nueL:=nil;
  writeln('Ingrese un numero: ');
  read(valor);
  while (valor <> 0)do begin
    for valor:=-99 to 0 do
      armarNodo(pri,valor);
  end;
  imprimir(pri);
  
  writeln('Ingrese un incremento: ');
  read(valor);
  incrementar(pri,valor);
  imprimir(pri);
  
  if (estaOrdenadaAsc(pri))then writeln('La lista esta ordenada de manera ascendente.')
  else if (estaOrdenadaDesc(pri))then writeln('La lista esta ordenada de manera descendente.')
  else writeln('La lista no esta ordenada.');
  
  writeln('Ingrese un valor a eliminar: ');
  read(valor);
  eliminar(pri,valor,pude);
  if (pude)then writeln('El valor ',valor,' ha sido eliminado exitosamente.')
  else writeln('El valor ',valor,' no se encuentra en la lista.');
  imprimir(pri);
  
    writeln('Ingrese un valor minimo para la nueva sublista: ');
    readln(a);
    writeln('Ingrese un valor maximo para la nueva sublista: ');
    readln(b);
    
  if(estaOrdenadaAsc(pri))then begin
    sublistaOrdenadaAsc(nueL,pri,a,b);
    imprimir(nueL);
  end
  else if(estaOrdenadaDesc(pri))then begin
    sublistaOrdenadaDesc(nueL,pri,a,b);
    imprimir(nueL);
  end
  else begin
    sublista(nueL,pri,a,b);
    imprimir(nueL);
  end;
end.












