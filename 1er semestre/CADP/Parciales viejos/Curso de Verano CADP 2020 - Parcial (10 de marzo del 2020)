program Curso_de_Verano_CADP_2020_Parcial_10_de_marzo_del_2020;
type
  categorias='A'..'E';
  
  empleado=record
    dni:integer;
    apellido,nombre:string[40];
    categ:categorias;
    sueldoBasico:real;
    montosPremios:real;
    antig:integer;
  end;
  
  lista=^nodo;
  nodo=record
    el:empleado;
    sig:lista;
  end;
  
  empl=record
    dni:integer;
    sueldoMensual:real;
  end;
  
  liquidaciones=^em;
  em=record
    el:empl;
    sig:liquidaciones;
  end;
  
  cantidadEmpleadosPorCategoria=array['A'..'E']of integer;

procedure cargarEmpleado(var e:empleado);
begin
  readln(e.dni);
  readln(e.apellido);
  readln(e.nombre);
  readln(e.categ);
  readln(e.sueldoBasico);
  readln(e.montosPremios);
  readln(e.antig);
end;

procedure insertarOrdenado(var l:lista;e:empleado);
var
  nuevo,ant,act:lista;
begin
  new(nuevo);
  nuevo^.el:=e;
  nuevo^.sig:=nil;
  ant:=l;
  act:=l;
  while(act<>nil)and(e.dni>act^.el.dni)do begin
    ant:=act;
    act:=act^.sig;
  end;
  if(ant=act)then
    l^.sig:=nuevo
  else
    ant^.sig:=nuevo;
  nuevo^.sig:=act;
end;

procedure cargarLista(var l:lista);
var
  e:empleado;
begin
  cargarEmpleado(e);
  while(e.dni<>-1)do begin
    insertarOrdenado(l,e);
    cargarEmpleado(e);
  end;
end;

procedure agregarLiquidaciones(var liq:liquidaciones;dni,antig:integer;sueldoB,premios:real;categ:categorias);
var
  nuevo:liquidaciones;
begin
  new(nuevo);
  nuevo^.el.dni:=dni;
  case (categ)of
    'A'..'C':nuevo^.el.sueldoMensual:=sueldoB+premios;
    'D'..'E':nuevo^.el.sueldoMensual:=sueldoB+premios+1000*antig;
  end;
  nuevo^.sig:=liq;
  liq:=nuevo;
end;

procedure cargarLiq(l:lista;var liq:liquidaciones);
begin
  while (l<>nil)do begin
    agregarLiquidaciones(liq,l^.el.dni,l^.el.antig,l^.el.sueldoBasico,l^.el.montosPremios,l^.el.categ);
    l:=l^.sig;
  end;
end;

procedure empXcat(l:lista);
var
  CEPC:cantidadEmpleadosPorCategoria;
  i:char;
begin
  for i:='A' to 'E' do
    CEPC[i]:=0;
  while(l<>nil)do begin
    CEPC[l^.el.categ]:=CEPC[l^.el.categ];
  end;
  for i:='A' to 'E' do begin
    writeln('La categoria ',i,' tiene ',CEPC[i],'empleados.');
  end;
end;

procedure eliminar555(var liq:liquidaciones;var pude:boolean);
var
  ant,act:lista;
begin
  pude:=false;
  ant:liq;
  act:liq;
  while(act<>nil)and(act^.el.dni<>555)do begin
    ant:=act;
    act:=act^.sig
  end;
  if(act<>nil)then begin
    if(act=ant)then
      l:=act^.sig
    else
      ant^.sig:=act^.sig;
    pude:=true;
    dispose(act);
  end;
end;

procedure imprimirLista(l:lista);
begin
  while(l<>nil)do begin
    writeln('');
    writeln('Lista:');
    writeln('  DNI: ',l^.el.dni);
    writeln('  apellido: ',l^.el.apellido);
    writeln('  nombre: ',l^.el.nombre);
    writeln('  categ: ',l^.el.categ);
    writeln('  antig: ',l^.el.antig);
    writeln('  montosPremios: ',l^.el.montosPremios);
    writeln('  Sueldo basico: ',l^.el.sueldoBasico);
    l:=l^.sig;
  end;
end;

procedure imprimirLiq(liq:liquidaciones);
begin
  while(liq<>nil)do begin
    writeln('');
    writeln('Liquidaciones:');
    writeln('  DNI: ',liq^.el.dni);
    writeln('  Sueldo Mensual: ',liq^.el.sueldoMensual);
    liq:=liq^.sig;
  end;
end;

var
  l:lista;
  liq:liquidaciones;
  pude:boolean;
begin
  l:=nil;
  liq:=nil;
  cargarLista(l);
  imprimirLista(l);
  cargarLiq(l,liq);
  imprimirLiq(liq);
  writeln('');
  empXcat(l);
  eliminar555(liq,pude);
  writeln('');
  if (pude)then
    writeln('El empleado con dni 555 fue elminado exitosamente.')
  else
    writeln('El empleado con dni 555 no se encuentra en la lista.');
end.
