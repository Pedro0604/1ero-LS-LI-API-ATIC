program cuatro;
const
  precioMega=1.35;
  precioMinuto=3.40;
type
  linea=record
    numTel:integer;
    minutos:integer;
    megas:integer;
  end;
  
  cliente=record
    codigo:integer;
    cantL:integer;
  end;
procedure leerL (var ln:linea);
begin
  writeln('Numero de telefono');
  readln(ln.numTel);
  writeln('Minutos');
  readln(ln.minutos);
  writeln('Megas');
  readln(ln.megas);
end;
procedure leerC(var cl:cliente;var minutos,megas:integer);
var
  i:integer;
  ln:linea;
begin
  writeln('Codigo');
  readln(cl.codigo);
  writeln('Cantidad de lineas');
  readln(cl.cantL);
  for i:=1 to cl.cantL do begin
    leerL(ln);
    minutos:=ln.minutos+minutos;
    megas:=ln.megas+megas;
  end;
end;
var
  i,minutos,megas:integer;
  gastoTotal:real;
  cl:cliente;
BEGIN
  
  for i:=1 to 9300 do begin
    minutos:=0;
    megas:=0;
    leerC(cl,minutos,megas);
    gastoTotal:=minutos*precioMinuto+megas*precioMega;
    writeln('Gasto total: ',gastoTotal);
  end;
END.























































