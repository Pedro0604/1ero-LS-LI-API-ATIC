program Hello;
procedure sumaDigitos (num:integer;var sumaPares,cantImpares:integer);
var
  dig:integer;
begin
  while (num<>0) do begin
    dig:=num MOD 10;
    if (dig MOD 2=0) then
      sumaPares:=sumaPares+dig
    else
      cantImpares:=cantImpares+1;
    num:=num DIV 10;
  end;
end;
var
  num,sumaDigPares,cantDigImpares:integer;
begin
  sumaDigPares:=0;
  cantDigImpares:=0;
  read(num);
  while (num<>12345) do begin
    sumaDigitos(num,sumaDigPares,cantDigImpares);
    read(num);
  end;
  writeln('La suma de los digitos pares es de: ',sumaDigPares);
  writeln('La cant de digitos impares es de: ',cantDigImpares);
end.
