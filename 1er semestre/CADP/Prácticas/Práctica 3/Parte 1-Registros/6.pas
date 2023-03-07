program seis;
type
  cpu=record
    marca:string;
    linea:string;
    cores:integer;
    reloj:real;
    nmTr:integer;
  end;
procedure leer (var pr:cpu);
begin
  writeln('cores');
  readln(pr.cores);
  if pr.cores<>0 then begin
    writeln('marca');
    readln(pr.marca);
   writeln('linea');
    readln(pr.linea);
    writeln('reloj');
    readln(pr.reloj);
    writeln('nmTr');
    readln(pr.nmTr);
  end;
end;
function cumple22 (pr:cpu):boolean;
begin
  cumple22:=(pr.cores>2) and (pr.nmTr<=22)
end;
function cantMC(pr:cpu;cantM:integer):integer;
begin
  if (pr.cores>1)and((pr.marca='intel')or(pr.marca='AMD'))and(pr.reloj>=2)then
    cantMC:=cantM+1;
end;
procedure max(cantPr:integer;marca:string;var max1,max2:integer;var marca1,marca2:string);
begin
  if(cantPr>max1)then begin
    max2:=max1;
    max1:=cantPr;
    marca2:=marca1;
    marca1:=marca
  end
  else if(cantPr>max2)then begin
    max2:=cantPr;
    marca2:=marca;
  end;
end;
var
  pr:cpu;
  cantM,cantPr,max1,max2:integer;
  marcaActual,marca1,marca2:string;
BEGIN
  cantM:=0;
  max1:=-1;
  max2:=-1;
  leer(pr);
  while (pr.cores<>0)do begin
  cantPr:=0;
  marcaActual:=pr.marca;
    while (pr.marca=marcaActual)do begin
      if (cumple22(pr))then
        writeln('marca: ',pr.marca,' linea: ',pr.linea);
      cantM:=cantMC(pr,cantM);
      if (pr.nmTr=14)then begin
        cantPr:=cantPr+1;
      end;
      leer(pr);
    end;
    max(cantPr,pr.marca,max1,max2,marca1,marca2);
  end;
  
  writeln('Cantidad de procesadores multicore (de mas de un core) de Intel o AMD, cuyos relojes alcancen velocidades de al menos 2 Ghz.',cantM);
  writeln('Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm: ',marca1,' y ',marca2);
  writeln('');
  writeln('');
END.




















































