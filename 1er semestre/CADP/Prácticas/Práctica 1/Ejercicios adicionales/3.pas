program untitled;
const
  pi=3.14159;
var
  cantTanR,cantTanC,cantAltMenor,cantVolMenor:integer;
  ancho,largo,alto,radio,vol,sumaVolR,sumaVolC,promTanR,promTanC,volMax1,volMax2:real;
  tanque:char;
BEGIN
  cantTanR:=0;
  cantTanC:=0;
  sumaVolR:=0;
  sumaVolC:=0;
  cantAltMenor:=0;
  cantVolMenor:=0;
  volMax1:=0;
  volMax2:=0;
  
  
  writeln('Introduzca el tipo de tanque: ');
  readln(tanque);
  while (tanque<>'Z') do
    begin
      if (tanque='r') then
        begin
          cantTanR:=cantTanR+1;
          writeln('Introduzca el ancho del tanque: ');
          readln(ancho);
          writeln('Introduzca el largo del tanque: ');
          readln(largo);
          writeln('Introduzca el alto del tanque: ');
          readln(alto);
          vol:=ancho*largo*alto;
          sumaVolR:=sumaVolR+vol;
          if (alto<1.4) then
            cantAltMenor:=cantAltMenor+1;
          if (vol<800) then
            cantVolMenor:=cantVolMenor+1;
        end
      else if (tanque='c') then
        begin
          cantTanC:=cantTanC+1;
          writeln('Introduzca el radio del tanque: ');
          readln(radio);
          writeln('Introduzca el alto del tanque: ');
          readln(alto);
          vol:=pi*radio*radio*alto;
          sumaVolC:=sumaVolC+vol;
          if (alto<1.4) then
            cantAltMenor:=cantAltMenor+1;
          if (vol<800) then
            cantVolMenor:=cantVolMenor+1;
        end;
      if (vol>volMax1) then
        begin
          volMax2:=volMax1;
          volMax1:=vol;
        end
      else if (vol>volMax2) then
        volMax2:=vol;
        
      writeln();
      writeln('Introduzca el tipo de tanque: ');
      readln(tanque);
    end;
    promTanR:=sumaVolR/cantTanR;
    promTanC:=sumaVolC/cantTanC;
    
  writeln('Volumen de los dos mayores tanques vendidos: ',volMax1:1:2,' y ',volMax2:1:2);
  writeln('Volumen promedio de todos los tanques cilíndricos vendidos: ',promTanC:1:2);
  writeln('Volumen promedio de todos los tanques rectangulares vendidos: ',promTanR:1:2);
  writeln('Cantidad de tanques cuyo alto sea menor a 1.40 metros: ',cantAltMenor);
  writeln('Cantidad de tanques cuyo volumen sea menor a 800 metros cúbicos: ',cantVolMenor);
END.

