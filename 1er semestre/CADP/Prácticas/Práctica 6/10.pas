program diez;
type
  cliente=record
    dni,num:int32;
  end;
  lista=^nodo;
  nodo=record
    el:cliente;
    sig:lista;
  end;
procedure recibirCliente(var l,ult:lista;dnis:int32);
var
  nuevo:lista;
begin;
  new(nuevo);
  nuevo^.sig:=nil;
  nuevo^.el.dni:=dnis;
  if (l=nil)then begin
    l:=nuevo;
    ult:=nuevo;
    nuevo^.el.num:=1;
  end
  else begin
    ult^.sig:=nuevo;
    nuevo^.el.num:=ult^.el.num+1;
    ult:=nuevo;
  end;
end;
procedure atenderCliente(var l:lista;var nroA,dniA:int32);
var
  aux:lista;
begin
  nroA:=l^.el.num;
  dniA:=l^.el.dni;
  aux:=l^.sig;
  dispose(l);
  l:=aux;
end;
var
  l,ult:lista;
  i,j,dnis,dniA,nroA:int32;
BEGIN
  {l:=nil;
  writeln('Ingrese su DNI: ');
  read(dnis);
  while(dnis<>0)do begin
    recibirCliente(l,ult,dnis);
    writeln('Ingrese su DNI: ');
    read(dnis);
  end;
  while(l<>nil)do begin
    atenderCliente(l,nroA,dniA);
    writeln('El cliente a atender es: ',nroA,' DNI: ',dniA,'.');
  end;}
  for i:=1 to 214 do begin
    for j:=1 to 214 do begin
      dnis:=j*i;
      writeln(dnis);
    end;
  end;
END.







