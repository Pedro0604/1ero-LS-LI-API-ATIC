program untitled;
var
  car:char;
  num1,total:integer;
BEGIN
  total:=0;
  writeln('Ingrese un + o un -');
  readln(car);
  if (car<>'+') and (car<>'-') then
    writeln('--------------ERROR 404: character not found--------------')
  else
    begin
      writeln('Introduzca una secuencia de numeros:');
      readln(num1);
      while (num1<>0) do
        begin
          if car='+' then
            begin
              total:=total+num1;
              readln(num1);
            end
          else 
            begin
              total:=total-num1;
              readln(num1);
            end;
        end;
        write('El resultado final es: ',total);
    end;
END.
