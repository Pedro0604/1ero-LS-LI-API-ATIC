program p7;
var
  piloto,piloto1,piloto2,pilotoUl,pilotoAnte:string;
  tiempo,tiempo1,tiempo2,tiempoUl,tiempoAnte,i:integer;
begin
  tiempo1:=9999;
  tiempo2:=9999;
  tiempoUl:=-9999;
  tiempoAnte:=-9999;
  piloto1:='';
  pilotoUl:='';
  for i:=1 to 1 do
    begin
    writeLn('Introduzca el nombre del piloto: ');
    readln(piloto);
    writeln('Introduzca el tiempo del piloto: ');
    readln(tiempo);
    if (tiempo<tiempo1) then
      begin
        tiempo2:=tiempo1;
        tiempo1:=tiempo;
        piloto2:=piloto1;
        piloto1:=piloto;
      end
    else if (tiempo<tiempo2) then
      begin
        tiempo2:=tiempo;
        piloto2:=piloto;
      end;
    if (tiempo>tiempoUl) then
      begin
        tiempoAnte:=tiempoUl;
        tiempoUl:=tiempo;
        pilotoAnte:=pilotoUl;
        pilotoUl:=piloto;
      end
    else if  (tiempo>tiempoAnte) then
      begin
        tiempoAnte:=tiempo;
        pilotoAnte:=piloto;
      end;
    end;
  WriteLn('Los pilotos que terminaron en los dos primeros puestos fueron: ',piloto1,' y ',piloto2,' y los que terminaron en los dos ultimos puestos fueron: ',pilotoUl,' y ',pilotoAnte,'.');
end.
