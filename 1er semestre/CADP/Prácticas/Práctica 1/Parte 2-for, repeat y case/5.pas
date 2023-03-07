program untitled;
var
  num,min,max,suma:integer;
BEGIN
  min:=32000;
  max:=-32000;
  suma:=0;
  repeat
    read(num);
    if(num<min) then
        min:=num;
    if(num>max) then
      max:=num;
    suma:=suma+num;
  until(num=100);
  writeln('El numero maximo es: ',max,', el minimo es ',min,' y la suma de todos los numeros es igual a ',suma,'.');
END.
