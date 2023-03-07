program Hello;
const
  precio=320;
function rendimiento (ha:real;tipo:integer):real;
begin
  if (tipo=1) then
    rendimiento:=6*ha*precio
  else if (tipo=2) then
    rendimiento:=2.6*ha*precio
  else 
    rendimiento:=1.4*ha*precio;
end;
procedure maxMin(rendimientoEsperado:real;localidad:string;var maxR,minR:real;var locMaxR,locMinR:string);
begin
  if (rendimientoEsperado>maxR) then begin
    maxR:=rendimientoEsperado;
    locMaxR:=localidad;
  end;
  if (rendimientoEsperado<minR) then begin
    minR:=rendimientoEsperado;
    locMinR:=localidad;
  end;
end;
var
  ha,rendimientoEsperado,maxR,minR,promedio,sumaR:real;
  tipo,cantC3F,cantCampos:integer;
  localidad,locMaxR,locMinR:string;
begin
  cantC3F:=0;
  cantCampos:=0;
  maxR:=-1;
  minR:=32000;
  sumaR:=0;
  repeat
    writeln('Introduzca la cantidad de hectareas y el tipo del campo: ');
    read(ha,tipo);
    writeln('Introduzca la localidad del campo: ');
    readln(localidad);
    read(localidad);
    rendimientoEsperado:=rendimiento(ha,tipo);
    
    if (rendimientoEsperado>10000) and (localidad='Tres de Febrero') then
      cantC3F:=cantC3F+1;
    
    maxMin(rendimientoEsperado,localidad,maxR,minR,locMaxR,locMinR);
    sumaR:=sumaR+rendimientoEsperado;
    cantCampos:=cantCampos+1;
  until (ha=900) and (localidad='Saladillo');
  promedio:=sumaR/cantCampos;
  
  writeln('La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000 es de: ',cantC3F);                         
  writeln('La localidad del campo con mayor rendimiento economico esperado es: ',locMaxR);
  writeln('La localidad del campo con menor rendimiento economico esperado es: ',locMinR);
  writeln('El rendimiento economico promedio es de ',promedio:1:2);
end.
