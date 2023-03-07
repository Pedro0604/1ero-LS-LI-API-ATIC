program untitled;
var
  legajo,i,nota,sumaNotas,cantAl0,EvApr,cantAlApr,cantAlPromAlto,EvAusente:integer;
  cantIngCondicion,cantRecCondicion,ingresantes,recursantes:integer;
  alMax0uno,alMax0dos,alMax10uno,alMax10dos,cant0,cant10:integer;
  porCantRecCondicion,porCantIngCondicion:real;
  puedeRendirParcial:boolean;
  condicion:char;
BEGIN
  cantAl0:=0;
  cantAlApr:=0;
  cantAlPromAlto:=0;
  puedeRendirParcial:=true;
  cantIngCondicion:=0;
  cantRecCondicion:=0;
  ingresantes:=0;
  recursantes:=0;
  alMax0uno:=0;
  alMax10uno:=0;
  alMax0dos:=0;
  alMax10dos:=0;
  
  write('Legajo: ');
  read(legajo);
  while (legajo<>-1) do
    begin
      sumaNotas:=0;
      EvApr:=0;
      EvAusente:=0;  
      cant0:=0;
      cant10:=0;
      write('Condicion: ');
      readln(condicion);
      readln(condicion);
      for i:=1 to 5 do
        begin
          write('Nota',i,': ');
          read(nota);
          sumaNotas:=sumaNotas+nota;
          case nota of
            0:begin
                cantAl0:=cantAl0+1;
                cant0:=cant0+1;
                EvAusente:=EvAusente+1;
              end;
            10:begin
               cant10:=cant10+1;
               EvApr:=EvApr+1;
               end;
            7..9:EvApr:=EvApr+1;
            -1:EvAusente:=EvAusente+1;
            1..4:EvAusente:=EvAusente+1;
          end;
        end;
      if (sumaNotas/5>6.5) then
        cantAlPromAlto:=cantAlPromAlto+1;
        
      if (EvApr=5) then
        cantAlApr:=cantAlApr+1;
        
      if (EvAusente>5*0.25) then
        puedeRendirParcial:=false;
        
      if (condicion='i') and (puedeRendirParcial) then
        cantIngCondicion:=cantIngCondicion+1;
        
      if (condicion='r') and (puedeRendirParcial) then
        cantRecCondicion:=cantRecCondicion+1;
        
      if (condicion='i') then
        ingresantes:=ingresantes+1;
        
      if (condicion='r') then
        recursantes:=recursantes+1;
        
      if (cant0>AlMax0uno) then
        begin
          AlMax0dos:=AlMax0uno;
          AlMax0uno:=legajo;
        end
      else if (cant0>AlMax0dos) then
        AlMax0dos:=legajo;
        
      if (cant10>AlMax10uno) then
        begin
          AlMax10dos:=AlMax10uno;
          AlMax10uno:=legajo;
        end
      else if (cant10>AlMax10dos) then
        AlMax10dos:=legajo;
        
      writeln();
      write('Legajo: ');
      read(legajo);
    end;
    if (ingresantes>0) then
    porCantIngCondicion:=cantIngCondicion*100/ingresantes;
    if (recursantes>0) then
    porCantRecCondicion:=cantRecCondicion*100/recursantes;
    
    writeln('Ingresantes rinden parcial: ',cantIngCondicion,'. Porcentaje: ',porCantIngCondicion:1:2,'%');
    writeln('Recursantes rinden parcial: ',cantRecCondicion,'. Porcentaje: ',porCantRecCondicion:1:2,'%');
    writeln('Cantidad de alumnos que aprobaron todas las autoevaluaciones: ', cantAlApr);
    writeln('Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos: ',cantAlPromAlto);
    writeln('Cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluacion: ',cantAl0);
    writeln('Codigo de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez): ',AlMax10uno,' y ',AlMax10dos,'.');
    writeln('Codigo de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero): ',AlMax0uno,' y ',AlMax0dos,'.');
END.
