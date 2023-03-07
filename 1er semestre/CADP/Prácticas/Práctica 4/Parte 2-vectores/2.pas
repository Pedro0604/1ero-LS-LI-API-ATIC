program untitled;
const
  dimF=500;
type
  alumnos=array[1..dimF]of string;
procedure cargar(var al:alumnos;var dimL:integer);
var
  nom:string;
begin
  dimL:=0;
  writeln('Ingrese un nombre de alumno: ');
  readln(nom);
  while(dimL<dimF)and(nom<>'ZZZ')do begin
    dimL:=dimL+1;
    al[dimL]:=nom;
    writeln('Ingrese un nombre de alumno: ');
    readln(nom);
  end;
end;
procedure eliminar(var al:alumnos;var dimL:integer;var pude:boolean);
var
  i,j:integer;
  pri:boolean;
  nom:string;
begin
  pude:=false;
  i:=1;
  writeln('Ingrese un nombre de alumno para eliminarlo del vector: ');
  readln(nom);
  pri:=false;
  while not(pri)and(i<=dimL)do begin
    if (al[i]=nom)then begin
      for j:=i to (dimL-1) do begin
        al[j]:=al[j+1];
      end;
      dimL:=dimL-1;
      pude:=true;
      pri:=true;
    end;
    i:=i+1;
  end;
end;
procedure insertar(var al:alumnos;var dimL:integer;var pude:boolean);
var
  i:integer;
  nom:string;
begin
  pude:=false;
  writeln('Ingrese un nombre de alumno para insertarlo en la posicion 4 del vector: ');
  readln(nom);
  if (dimL<dimF)and (4<=dimL)then begin
    for i:=dimL downto 4 do begin
      al[i+1]:=al[i];
    end;
    pude:=true;
    dimL:=dimL+1;
    al[4]:=nom;
  end;
end;
procedure agregar(var al:alumnos;var dimL:integer;var pude:boolean);
var
  nom:string;
begin
  pude:=false;
  writeln('Ingrese un nombre de alumno para agregarlo al vector: ');
  readln(nom);
  if (dimL<dimF)then begin
    al[dimL+1]:=nom;
    pude:=true;
    dimL:=dimL+1;
  end;
end;
procedure imprimir(var al:alumnos;dimL:integer);
var
  i:integer;
begin
  for i:=1 to dimL do begin
    writeln(al[i]);
  end;
end;
var
  al:alumnos;
  dimL:integer;
  pude:boolean;
BEGIN
  cargar(al,dimL);
  eliminar(al,dimL,pude);
  if not(pude)then
    writeln('La eliminacion no se pudo realizar.');
  insertar(al,dimL,pude);
  if not(pude)then
    writeln('La insercion no se pudo realizar.');
  agregar(al,dimL,pude);
  if not(pude)then
    writeln('La agregacion no se pudo realizar.');
  writeln('El vector final es: ');
  imprimir(al,dimL);
  
  
  writeln('');
  writeln('');
  writeln('');
  writeln('');
END.

