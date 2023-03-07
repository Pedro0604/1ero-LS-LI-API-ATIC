program Hello;
procedure sumayProducto(x,y:integer;var suma,producto:real);
var
  i:integer;
begin
  for i:=x to y do begin
    suma:=suma+i;
    producto:=producto*i;
  end;
end;
var
  i,x,y:integer;
  suma,producto:real;
begin
  suma:=0;
  producto:=1;
  for i:=1 to 10 do begin
    suma:=0;
    producto:=1;
    read(x,y);
    sumayProducto(x,y,suma,producto);
    writeln('La suma es: ',suma:1:0);
    writeln('El producto es: ',producto:1:0);
  end;
end.
