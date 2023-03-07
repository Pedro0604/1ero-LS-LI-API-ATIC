program untitled;
var
  codigo,cant50k,codigoMax,cantInv,i:integer;
  monto,prom,max,montoTotal:real;
BEGIN
  max:=-32768;
  cant50k:=0;
  cantInv:=0;
  repeat
    montoTotal:=0;
    writeln('Ingrese un codigo de empresa: ');
    readln(codigo);
    writeln('Ingrese la cant. de inversiones de esa empresa: ');
    readln(cantInv);
    for i:=1 to cantInv do
      begin
        writeln('Ingrese el monto de cada inversion: ');
        readln(monto);
        montoTotal:=montoTotal+monto;
      end;
    prom:=(montoTotal/cantInv);
    if (montoTotal>max) then
      begin
        max:=montoTotal;
        codigoMax:=codigo;
      end;
    if (montoTotal>50000) then
      cant50k:=cant50k+1;
    writeln('Resultado del analisis: Empresa ',codigo,' monto promedio: ',prom:1:2,'.');
    writeln();
  until (codigo=100);
  writeln('La empresa ',codigomax,' es la que mayor dinero posee invertido (',max:1:2,')');
  writeln('Hay ',cant50k,' empresas con inversiones por mas de $50000.');
END.
