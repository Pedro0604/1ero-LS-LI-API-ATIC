program doce;
const
  dimf=4;
type
galaxias=record
  nombre:string;
  tipo:integer;
  masa,dist:real;
end;
grLoc=array[1..dimF]of galaxias;
tipos=array[1..4]of integer;

procedure leerG(var galaxia:galaxias);
begin
  writeln('nombre');
  readln(galaxia.nombre);
  writeln('tipo');
  readln(galaxia.tipo);
  writeln('masa');
  readln(galaxia.masa);
  writeln('dist');
  readln(galaxia.dist);
end;
procedure leerGr(var gr:grLoc);
var
  galaxia:galaxias;
  i:integer;
begin
  for i:=1 to dimF do begin
    leerG(galaxia);
    gr[i]:=galaxia;
  end;
end;
procedure tip(gr:grLoc);
var
  i:integer;
  t:tipos;
begin
  for i:=1 to 4 do
    t[i]:=0;
  for i:=1 to dimF do begin
    case (gr[i].tipo)of
      1:t[1]:=t[1]+1;
      2:t[2]:=t[2]+1;
      3:t[3]:=t[3]+1;
      4:t[4]:=t[4]+1;
    end;
  end;
  writeln('Hubo ',t[1],' galaxias elipticas.');
  writeln('Hubo ',t[2],' galaxias espirales.');
  writeln('Hubo ',t[3],' galaxias lenticulares.');
  writeln('Hubo ',t[4],' galaxias irregulares.');
end;
procedure masas(gr:grLoc);
var
  i:integer;
  sumaTot,suma3,porc:real;
begin
  sumaTot:=0;
  suma3:=0;
  for i:=1 to dimF do begin
    if (gr[i].nombre='Via Lactea')or(gr[i].nombre='Andromeda')or(gr[i].nombre='Triangulo')then
      suma3:=suma3+gr[i].masa;
    sumaTot:=sumaTot+gr[i].masa;
  end;
  porc:=suma3*100/sumaTot;
  writeln('La masa total acumulada de las 3 galaxias principales es de: ',suma3:1:2,' y el porcentaje que esto representa respecto a la masa de todas las galaxias es de: ',porc:1:2,'.');
end;
function GnoI(gr:grLoc):integer;
var
  i,cant:integer;
begin
  cant:=0;
  for i:=1 to dimF do begin
    if(gr[i].tipo<>4)and(gr[i].dist<1000)then
      cant:=cant+1;
  end;
  GnoI:=cant;
end;
procedure maxMin(gr:grLoc);
var
  i:integer;
  max1,max2,min1,min2:real;
  nomMax1,nomMax2,nomMin1,nomMin2:string;
begin
  max1:=-1;
  max2:=-1;
  min1:=9999999;
  min2:=9999999;
  nomMax1:='';
  nomMin1:='';
  for i:=1 to dimF do begin
    if(gr[i].masa>max1)then begin
      max2:=max1;
      max1:=gr[i].masa;
      nomMax2:=nomMax1;
      nomMax1:=gr[i].nombre;
    end
    else if(gr[i].masa>max2)then begin
      max2:=gr[i].masa;
      nomMax2:=gr[i].nombre;
    end;
    if(gr[i].masa<min1)then begin
      min2:=min1;
      min1:=gr[i].masa;
      nomMin2:=nomMin1;
      nomMin1:=gr[i].nombre;
    end
    else if(gr[i].masa<min2)then begin
      min2:=gr[i].masa;
      nomMin2:=gr[i].nombre;
    end;
  end;
  writeln('Los nombre de las dos galaxias con mayor masa fueron: ',nomMax1,' y ',nomMax2,'.');
  writeln('Los nombre de las dos galaxias con menor masa fueron: ',nomMin1,' y ',nomMin2,'.');
end;
var
  gr:grLoc;
BEGIN
  leerGr(gr);
  tip(gr);
  masas(gr);
  writeln('La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc es de: ',GnoI(gr),'.');
  maxMin(gr);
  
  readln();
  writeln('');
  readln();
  writeln('');
  readln();
  writeln('');
  readln();
END.

























