program catorce;
const
  dimF=1000;
  anF=35.20;
  prog=27.45;
  adBD=31.03;
  arq=44.28;
  adRS=39.87;
type
  partipante=record
    pais,nombre:string;
    codigo,rol,cantH:integer;
  proyectos=array[1..dimF]of participante;
procedure leerPar(var par:participante);
begin
  writeln('pais');
  readln(par.pais);
  writeln('nombre');
  readln(par.nombre);
  writeln('codigo');
  readln(par.codigo);
  writeln('rol');
  readln(par.rol);
  writeln('cantH');
  readln(par.cantH);
end;
procedure leerPr(var pro:proyectos;var dimL:integer);
var
  par:participante;
begin
  dimL:=0;
  leerPar(par)
  while(dimL<dimF)and(par.codigo<>-1)do begin
    dimL:=dimL+1;
    pro[dimL]:=par;
    leerPar(par);
  end;
end;
procedure monArg(pro:proyectos;dimL:integer);
var
  i:integer;
  monTot:real;
begin
  monTot:=0;
  for i:=1 to dimL do begin
    if(pro[i].pais='Argentina')then begin
      case pro[i].rol of
        1:monTot:=monTot+(pro[i].cantH*anF)
        2:monTot:=monTot+(pro[i].cantH*prog)
        3:monTot:=monTot+(pro[i].cantH*adBD)
        4:monTot:=monTot+(pro[i].cantH*arq)
        5:monTot:=monTot+(pro[i].cantH*adRS)
      end;
    end;
  end;
  writeln('El monto total invertido en desarrolladores con residencia en Argentina fue de: ',monTot:1:2,'.');
end;
procedure cantABD(pro:proyectos;dimL:integer);
var
  i:integer;
  cantHAdBD:integer;
begin
  cantHAdBD:=0;
  for i:=1 to dimL do begin
    if(pro[i].rol=3)then
      cantHAdBD:=cantHAdBD+pro[i].cantH;
  end;
  writeln('La cantidad total de horas trabajadas por Administradores de bases de datos fue de: ',cantHAdBD,'.');
end;
procedure menorMon(pro:proyectos;dimL:integer);
var
  i:integer;
  minMon,monPr:real;
  codMin:integer;
begin
  minMon:=9999999;
  for i:=1 to dimL do begin
    monPr:=0;
    case pro[i].rol of
      1:monPr:=monPr+(pro[i].cantH*anF)
      2:monPr:=monPr+(pro[i].cantH*prog)
      3:monPr:=monPr+(pro[i].cantH*adBD)
      4:monPr:=monPr+(pro[i].cantH*arq)
      5:monPr:=monPr+(pro[i].cantH*adRS)
    end;
    if (monPr<minMon)then begin
      minMon:=monPr;
      codMin:=pro[i].codigo;
    end;
  end;
  writeln('El codigo del proyecto con menor monto invertido fue el numero: ',codMin,'.');
end;
var
  pro:proyectos;
  dimL:integer;
BEGIN
  leerPr(pro,dimL);
  monArg(pro,dimL);
  cantABD(pro,dimL);
  menorMon(pro,dimL);
  
  
  
  
  
  writeln('');
  readln();
  writeln('');
  readln();
  writeln('');
  readln();
  writeln('');
  readln();
  writeln('');
  readln();
END.





















