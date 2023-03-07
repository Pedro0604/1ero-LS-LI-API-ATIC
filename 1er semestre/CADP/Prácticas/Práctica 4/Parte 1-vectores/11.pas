program once;
const
  dimF=3;
type
fotos=record
  titulo,autor:string;
  cantMg,cantCl,cantCom:integer;
end;
pagina=array[1..dimF]of fotos;
procedure leerF(var foto:fotos);
begin
  writeln('titulo');
  readln(foto.titulo);
  writeln('autor');
  readln(foto.autor);
  writeln('cantMg');
  readln(foto.cantMg);
  writeln('cantCl');
  readln(foto.cantCl);
  writeln('cantCom');
  readln(foto.cantCom);
  
end;
procedure leerP(var pag:pagina);
var
  foto:fotos;
  i:integer;
begin
  for i:=1 to dimF do begin
    leerF(foto);
    pag[i]:=foto;
  end;
end;
function masV(pag:pagina):string;
var
  i,max:integer;
  titMax:string;
begin
  max:=-1;
  for i:=1 to dimF do begin
    if(pag[i].cantCl>max)then begin
      max:=pag[i].cantCl;
      titMax:=pag[i].titulo;
    end;
  end;
  masV:=titMax;
end;
function cantTMg(pag:pagina):integer;
var
  i,suma:integer;
begin
  suma:=0;
  for i:=1 to dimF do begin
    if (pag[i].autor='Art Vandelay') then
      suma:=suma+pag[i].cantMg;
  end;
  cantTMg:=suma;
end;
procedure cantComen(pag:pagina);
var
  i:integer;
begin
  for i:=1 to dimF do begin
    writeln('En la foto numero ',i,' hubo ',pag[i].cantCom,' comentarios.');
  end;
end;
var
  pag:pagina;
BEGIN
  leerP(pag);
  writeln('El titulo de la foto mas vista fue: ',masV(pag),'.');
  writeln('La cantidad total de me gusta recibidas a las fotos cuyo autor es el fotografo "Art Vandelay" fue de: ',cantTMg(pag),'.');
  cantComen(pag);
  
  writeln('');
  readln();
  writeln('');
  readln();
  writeln('');
  readln();
END.




















