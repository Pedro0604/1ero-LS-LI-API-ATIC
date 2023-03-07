program uno;
type
  persona=record
    dni,edad,codigo:int32;
    apellido,nombre:string[30];
  end;
  
  lista=^nodo;
  nodo=record
    el:persona;
    sig:lista;
  end;
  
  genero=Array[1..5]of int32;
  
procedure cargarPersona(var p:persona);
begin
  writeln('dni');
  readln(p.dni);
  writeln('codigo');
  readln(p.codigo);
  writeln('edad');
  readln(p.edad);
  writeln('apellido');
  readln(p.apellido);
  writeln('nombre');
  readln(p.nombre);
end;

procedure agregarAdelante(var l:lista;p:persona);
var
  nuevo:lista;
begin
  new(nuevo);
  nuevo^.el:=p;
  nuevo^.sig:=l;
  l:=nuevo;
end;

procedure cargarLista(var l:lista);
var
  p:persona;
begin
  repeat
    cargarPersona(p);
    agregarAdelante(l,p);
  until(p.dni=33555444);
end;

function masPares(l:lista):int32;
var
  dig,DNI,cantMas,cantImp,cantP:int32;
begin
  cantMas:=0;
  while (l<>nil)do begin
    cantP:=0;
    cantImp:=0;
    DNI:=l^.el.dni;
    while (DNI<>0)do begin
      dig:=DNI mod 10;
      if (dig mod 2=0)then cantP:=cantP+1
      else cantImp:=cantImp+1;
      DNI:=DNI div 10;
    end;
    if (cantP>cantImp)then cantMas:=cantMas+1;
    l:=l^.sig;
  end;
  masPares:=cantMas;
end;

procedure dosMas(l:lista;var maxG1,maxG2:int32);
var
  i,max1,max2:int32;
  g:genero;
begin
  max1:=-1;
  max2:=-1;
  for i:=1 to 5 do
    g[i]:=0;
  while(l<>nil)do begin
    g[l^.el.codigo]:=g[l^.el.codigo]+1;
    l:=l^.sig;
  end;
  for i:=1 to 5 do begin
    if(g[i]>max1)then begin
      max2:=max1;
      max1:=g[i];
      maxG2:=maxG1;
      maxG1:=i;
    end
    else if(g[i]>max2)then begin
      max2:=g[i];
      maxG2:=i;
    end;
  end;
end;

function eliminar(var l:lista;DNI:int32):boolean;
var
  ant,act:lista;
  pude:boolean;
begin
  pude:=false;
  act:=l;
  ant:=l;
  while(act<>nil)and(not pude)do begin
    if(act^.el.dni=DNI)then
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
  eliminar:=pude;
end;

var
  l:lista;
  DNI,maxG1,maxG2:int32;
BEGIN
  l:=nil;
  cargarLista(l);
  writeln('La cantidad de personas cuyo DNI contiene mas digitos pares que impares es: ',MasPares(l),'.');
  dosMas(l,maxG1,maxG2);
  writeln('Los dos codigos de genero mas elegidos son: ',maxG1,' y ',maxG2,'.');
  writeln('Ingrese un DNI a eliminar: ');
  readln(DNI);
  if (eliminar(l,DNI))then writeln('El DNI ',DNI,' ha sido eliminado exitosamente.')
  else writeln('El DNI ',DNI,' no se encuentra en la lista.');
END.
