program docepr2par2;
function vocales (car:char):boolean;
begin
  vocales:=(car='a')or(car='e')or(car='i')or(car='o')or(car='u');
end;
function alfabetico (car:char):boolean;
begin
  alfabetico:=(car>'A')and(car<'z');
end;
var
  car:char;
  aCumple,bCumple:boolean;
begin
  read(car);
  aCumple:=true;
  bCumple:=true;
  while(car<>'$')do begin
    if not(vocales(car))then
      aCumple:=false;
    read(car);
  end;
  while(car<>'#')do begin
    if((vocales(car))or not(alfabetico(car)))then
      bCumple:=false;
    read(car);
  end;
  if not(aCumple) then
    writeln('A cumple')
  else writeln('A falla');
  if not(bCumple) then
    writeln('B cumple')
  else writeln('B falla');
end.
