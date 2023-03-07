program cincoB;
procedure doble (numA,numB:integer;var esDoble:boolean);
begin
  if (numB/2=numA) then
    esDoble:=true
  else
    esDoble:=false;
end;
var
numA,numB,cantPares,cantDobles:integer;
esDoble:boolean;  
begin
  cantDobles:=0;
  cantPares:=0;
  read(numA,numB);
  while (numA<>0) and (numB<>0) do
    begin
      doble(numA,numB,esDoble);
      if (esDoble) then
        cantDobles:=cantDobles+1;
      cantPares:=cantPares+1;
      read(numA,numB);
    end;
  writeln(cantPares,' ',cantDobles);
end.
