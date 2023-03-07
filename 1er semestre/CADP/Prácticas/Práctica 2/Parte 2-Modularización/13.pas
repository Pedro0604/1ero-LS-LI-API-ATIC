program trecepr2par2;
var
  aCumple,bCumple:boolean;
  cantA,cantB,cantAr:integer;
  car:char;
begin
  cantA:=0;
  cantB:=-1;
  aCumple:=true;
  bCumple:=true;
  read(car);
  while(car<>'%')do begin
    if(car='$')then
      aCumple:=false;
    read(car);
    cantA:=cantA+1;
  end;
  while(car<>'*')do begin
    if (car='@')then
      cantAr:=cantAr+1;
    if (cantAr>3)then
      bCumple:=false;
    cantB:=cantB+1;
    read(car);
  end;
  if (cantB<>cantA)then
    Bcumple:=false;
  if aCumple then
    writeln('A cumple')
  else writeln('A falla');
  if bCumple then
    writeln('B cumple')
  else writeln('B falla');
end.








