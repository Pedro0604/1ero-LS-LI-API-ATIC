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

procedure cargarCategorias(var arrC:arrCategorias);
var
  i:integer;
begin
  for i:= 1 to cantCateg do
    arrC[i].precioKilo:=random(201)+100;
end;

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

procedure imprimirInfoCategorias(arrC:arrCategorias);
var
  i:integer;
begin
  writeln('');
  writeln('Precio por kilo de todas las categorias: ');
  for i:=1 to cantCateg do begin
    writeln('  La categoria ',i,' tiene un valor de ',arrC[i].precioKilo:1:2,' pesos por kilo.');
  end;
end;

procedure imprimirLista(l:lista);
begin
  writeln('');
  writeln('Lista: ');
  while(l<>nil)do begin
    writeln('');
    writeln('  DNI del cliente: ',l^.el.dni,'.');
    writeln('  Categoria del producto: ',l^.el.categProd,'.');
    writeln('  Cantidad de kilos comprados: ',l^.el.cantKilos:1:2,'.');
    l:=l^.sig;
  end;
end;

procedure imprimirCantComprasPorCategoria(CCPC:cantComprasPorCategoria);
var
  i:integer;
begin
  writeln('');
  writeln('Cantidad de compras por categoria');
  for i:=1 to cantCateg do begin
    writeln('  La categoria ',i,' tuvo ',CCPC[i],' compras.');
  end;
end;

var
  l:lista;
  arrC:arrCategorias;
  dniMenosGasto:integer;
  CCPC:cantComprasPorCategoria;
BEGIN
  l:=nil;
  cargarCategorias(arrC);
  imprimirInfoCategorias(arrC);
  cargarLista(l);
  imprimirLista(l);
  dniMenosYcantCompras(arrC,l,dniMenosGasto,CCPC);
  writeln('');
  writeln('DNI del cliente que menos ha gastado: ',dniMenosGasto,'.');
  imprimirCantComprasPorCategoria(CCPC);
END.
  
  
  
  
  
  
  
