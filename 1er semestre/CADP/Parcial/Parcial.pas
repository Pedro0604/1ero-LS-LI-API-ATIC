program CADP_parcial_11_6_2022;
const
  cantCateg=20;
type
  categorias=1..cantCateg;
  
  infoCategoria=record
    nombre:string;
    precioKilo:real;
  end;
  
  arrCategorias=array[categorias]of infoCategoria;
  
  compra=record
    dni:integer;
    categProd:categorias;
    cantKilos:real;
  end;
  
  lista=^nodo;
  nodo=record
    el:compra;
    sig:lista;
  end;
  
  cantComprasPorCategoria=array[categorias]of integer;

procedure cargarCategorias(var arrC:arrCategorias); {SE DISPONE}


procedure cargarCompras(var c:compra);
begin
  writeln('Ingrese dni');
  readln(c.dni);
  if(c.dni<>-1)then begin
    writeln('Ingrese categProd');
    readln(c.categProd);
    writeln('Ingrese cantKilos');
    readln(c.cantKilos);
  end;
end; 

procedure agregarAlFinal(var l,ult:lista;c:compra);
var
  nuevo:lista;
begin
  new(nuevo);
  nuevo^.el:=c;
  if(l=nil)then
    l:=nuevo
  else 
    ult^.sig:=nuevo;
  ult:=nuevo;
end;
  
procedure cargarLista(var l:lista);
var
  ult:lista;
  c:compra;
begin
  cargarCompras(c);
  while(c.dni<>-1)do begin
    agregarAlFinal(l,ult,c);
    cargarCompras(c);
  end;
end;

procedure dniMenosYcantCompras(arrC:arrCategorias;l:lista;var dniMenosGasto:integer;var CCPC:cantComprasPorCategoria);
var
  min,gasto:real;
  dniAct,i:integer;
begin
  min:=32000;
  for i:=1 to cantCateg do
    CCPC[i]:=0;
  while(l<>nil)do begin
    dniAct:=l^.el.dni;
    gasto:=0;
    while(l<>nil)and(dniAct=l^.el.dni)do begin
      gasto:=gasto+(l^.el.cantKilos)*(arrC[l^.el.categProd].precioKilo);
      CCPC[l^.el.categProd]:=CCPC[l^.el.categProd]+1;
      l:=l^.sig;
    end;
    if(gasto<min)then begin
      min:=gasto;
      dniMenosGasto:=dniAct;
    end;
  end
end;

var
  l:lista;
  arrC:arrCategorias;
  dniMenosGasto:integer;
  CCPC:cantComprasPorCategoria;
BEGIN
  l:=nil;
  cargarCategorias(arrC); {SE DISPONE}
  cargarLista(l);
  dniMenosYcantCompras(arrC,l,dniMenosGasto,CCPC);
END.
