program siete;
type
  nums=array[1..100]of integer;
  digitos=array[0..9]of integer;
procedure leer(var num:nums;var i:integer);
var
  numerinho:integer;
begin
  i:=1;
  readln(numerinho);
  while ((i<=100)and(numerinho<>-1))do begin
    num[i]:=numerinho;
    readln(numerinho);
    i:=i+1;
  end;
end;
procedure leerD(var cantD:digitos);
var
  i:integer;
begin
  for i:=0 to 9 do
     cantD[i]:=0;
end;
procedure digitoss (num:nums;var cantD:digitos;cantEl:integer);
var
  i,digito:integer;
begin
  for i:=1 to cantEl do begin
      digito:=num[i];
    while (digito<>0)do begin
      cantD[digito mod 10]:=cantD[digito mod 10]+1;
      digito:=digito div 10;
    end;
  end;
end;
procedure cantO(cantD:digitos);
var
  i:integer;
begin
  for i:=0 to 9 do begin
    if (cantD[i]<>0)then
      writeln('El dig ',i,' aparecio ',cantD[i],' veces');
  end;
end;
procedure maxi(cantD:digitos;var max,digMax:integer);
var
  i:integer;
begin
  for i:=0 to 9 do begin
    if ((cantD[i])>max)then begin
      max:=cantD[i];
      digMax:=i;
    end;
  end;
end;
procedure sinO(cantD:digitos);
var
  i:integer;
begin
  for i:=0 to 9 do begin
    if ((cantD[i])=0)then
      writeln('El digito ',i,' no tuvo ocurrencias.');
  end;
end;
var
  num:nums;
  cantD:digitos;
  cantEl,max,digMax:integer;
BEGIN
  max:=-1;
  leer(num,cantEl);
  leerD(cantD);
  digitoss(num,cantD,cantEl);
  cantO(cantD);
  maxi(cantD,max,digMax);
  writeln('El dígito más leído fue el ',digMax);
  sinO(cantD);
  
  
  
  writeln('');
  writeln('');
  writeln('');
  writeln('');
END.
























