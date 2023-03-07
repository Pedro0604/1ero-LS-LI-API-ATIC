
program untitled;
const
  pi=3.14;
var
  D,R,A,P:real;
BEGIN
  read(D);
  R:=D/2;
  A:=pi*R*R;
  P:=D*pi;
  write('El radio es igual a: ',R:5:2,', el area es igual a: ',A:5:2,' y el perimetro es igual a: ',P:5:2,'.');
END.

