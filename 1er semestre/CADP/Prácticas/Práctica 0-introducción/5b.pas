
program untitled;
var
  monto,USD,porcentaje,transaccion:real;
BEGIN
  read(monto,USD,porcentaje);
  transaccion:=monto*USD+porcentaje*0.01*monto*USD;
  write('La transaccion sera de: ',transaccion:5:2,' pesos.');
END.

