program modelo;
const
  dimF=3600;
type
  roles=array[1..4]of integer;
  usuario=record
    email,revista:string[40];
    cantD:integer;
    rol:1..4
  end;
  usuarios=array[1..dimF]of usuario;
  revista=record
    nom:string[40];
    usxRol:roles;
  end;
  l=^nodo;
  nodo=record
    el:revista;
    sig:lista;
  end;
procedure cargarUs(var l:lista);
var
  
begin
  
end;
var
  
BEGIN
  
  
  
  
END.



procedure ();
var

begin
  
end;

writeln('');
readln();
