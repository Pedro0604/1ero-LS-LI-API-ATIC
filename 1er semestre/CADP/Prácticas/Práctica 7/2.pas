program modeloListas;
const
poliza=500;
type
  cliente=record
    dni,codigoP,codigoC:int32;
    montoB:real;
    apellido,nombre:string[20];
  end;
  lista=^nodo;
  nodo=record
    el:cliente;
    sig:lista;
  end;

procedure cargarCl(var cl:cliente);
begin
  writeln('codigoC');
  readln(cl.codigoC);
  writeln('dni');
  readln(cl.dni);
  writeln('montoB');
  readln(cl.montoB);
  writeln('codigoP');
  readln(cl.codigoP);
  writeln('apellido');
  readln(cl.apellido);
  writeln('nombre');
  readln(cl.nombre);
end;

procedure agregarAdelante(var l:lista;cl:cliente);
var
  nuevo:lista;
begin
  new(nuevo);
  nuevo^.el:=cl;
  nuevo^.sig:=l;
  l:=nuevo;
end;

procedure cargarLista(var l:lista);
var
  cl:cliente;
begin
  repeat
    cargarCl(cl);
    agregarAdelante(l,cl);
  until(cl.codigoC=1122);
end;

procedure dos9(l:lista);
var
  dig,dni:int32;
  cant9:integer;
begin
  cant9:=0;
  while(l<>nil)do begin
    dni:=l^.el.dni;
    while(dni<>0)do begin
      dig:=dni MOD 10;
      if(dig=9)then
        cant9:=cant9+1;
      dni:=dni DIV 10;
    end;
    if(cant9>=2)then
      writeln('El cliente ',l^.el.apellido,' ',l^.el.nombre,' tiene al menos dos 9 en su DNI.');
    l:=l^.sig;
  end;
end;

procedure info(l:lista);
begin
  while(l<>nil)do begin
    writeln('Dni: ',l^.el.dni);
    writeln('Apellido: ',l^.el.apellido);
    writeln('Nombre:',l^.el.nombre);
    writeln('Monto completo a abonar mensualmente: ',(l^.el.montoB+l^.el.codigoP*poliza):1:2);
    l:=l^.sig;
  end;
end;

procedure eliminar(var l:lista;cod:int32);
var
  ant,act:lista;
begin
  ant:=l;
  act:=l;
  while(act<>nil)and(l^.el.codigoC<>cod)do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(act<>nil)then begin
    if(act=ant)then
      l:=act^.sig
    else
      ant^.sig:=act^.sig;
    dispose(act);
  end;
end;

var
  l:lista;
  cod:int32;
BEGIN
  l:=nil;
  cargarLista(l);
  info(l);
  dos9(l);
  writeln('Introduzca un codigo de cliente para eliminarlo: ');
  read(cod);
  eliminar(l,cod);
  info(l);
END.














