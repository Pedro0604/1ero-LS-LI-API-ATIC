program untitled;
var
  C1,C2,C3:char;
BEGIN
  writeln('Introduzca 3 caracteres: ');
  readln(C1);
  readln(C2);
  readln(C3);
  if ((C1= 'a') or (C1='e') or (C1='i') or (C1='o') or (C1='u')) and ((C2='a') or (C2='e') or (C2='i') or (C2='o') or (C2='u')) and ((C3='a') or (C3='e') or (C3='i') or (C3='o') or (C3='u')) then
    writeln('Los tres caracteres son vocales.')
  else
    write('Por lo menos uno de los tres caracteres no es una vocal.');
END.
