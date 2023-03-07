
Program cinco;

Const 
  dimF = 4;

Type 
  codigosC = 1..dimF;

  camion = Record
    patente: int32;
    anoF: int32;
    capacidad: real;
  End;
  flota = array[1..dimF] Of camion;

  distTotalCamion = array[1..dimF] Of real;

  viaje = Record
    codigoV,anoV,dni: int32;
    codigoC: codigosC;
    dist: real;
    dest: string[30];
  End;

  lista = ^nodo;
  nodo = Record
    el: viaje;
    sig: lista;
  End;


Procedure cargarFlota(Var f:flota);

Var 
  i: int32;
Begin
  For i:=1 To dimF Do
    Begin
      f[i].patente := random(899999)+100000;
      f[i].anoF := random(22)+2000;
      f[i].capacidad := random(65)+5;
    End;
End;

Procedure cargarViaje(Var v:viaje);
Begin
  writeln('codigoV');
  readln(v.codigoV);
  If (v.codigoV<>-1)Then
    Begin
      writeln('anoV');
      readln(v.anoV);
      writeln('dni');
      readln(v.dni);
      writeln('codigoC');
      readln(v.codigoC);
      writeln('dist');
      readln(v.dist);
      writeln('dest');
      readln(v.dest);
    End;
End;

Procedure agregarAdelante(Var l:lista;v:viaje);

Var 
  nuevo: lista;
Begin
  new(nuevo);
  nuevo^.el := v;
  nuevo^.sig := l;
  l := nuevo;
End;

Procedure cargarLista(Var l:lista);

Var 
  v: viaje;
Begin
  cargarViaje(v);
  While (v.codigoV<>-1) Do
    Begin
      agregarAdelante(l,v);
      cargarViaje(v);
    End;
End;

Procedure maxMin(l:lista;f:flota;Var patMax,patMin:int32);

Var 
  i: int32;
  max,min: real;
  dTC: distTotalCamion;
Begin
  max := -1;
  min := 1000000;
  For i:=1 To dimF Do
    dtC[i] := 0;
  While (l<>Nil) Do
    Begin
      dTC[l^.el.codigoC] := dTC[l^.el.codigoC]+l^.el.dist;
      l := l^.sig;
    End;
  For i:=1 To dimF Do
    Begin
      If (dTC[i]>max)Then
        Begin
          max := dTC[i];
          patMax := f[i].patente;
        End;
      If (dTC[i]<min)Then
        Begin
          min := dTC[i];
          patMin := f[i].patente;
        End;
    End;
End;

Function cantV(l:lista;f:flota): int32;

Var 
  cant: int32;
  anoViaje,anoFabr,antig: int32;
  codCam: codigosC;
Begin
  cant := 0;
  While (l<>Nil) Do
    Begin
      codCam := l^.el.codigoC;
      anoViaje := l^.el.anoV;
      anoFabr := f[codCam].anoF;
      antig := anoViaje-anoFabr;
      If ((f[codCam].capacidad)>30.5)And(antig>5)Then
        cant := cant+1;
      l := l^.sig;
    End;
  cantV := cant;
End;

Function soloImp(dni:int32): boolean;

Var 
  dig: int32;
  todosImp: boolean;
Begin
  todosImp := true;
  While (dni<>0)And(todosImp) Do
    Begin
      dig := dni Mod 10;
      If (dig Mod 2=0)Then
        todosImp := false;
      dni := dni Div 10;
    End;
  soloImp := todosImp;
End;

Procedure codSoloImp(l:lista);
Begin
  While (l<>Nil) Do
    Begin
      If (soloImp(l^.el.dni))Then
        writeln('El viaje de codigo ',l^.el.codigoV,' fue realizado por un chofer cuyo dni solo tiene digitos impares.'
        );
      l := l^.sig;
    End;
End;

Var 
  l: lista;
  f: flota;
  patMax,patMin: int32;
Begin
  randomize();
  l := Nil;
  cargarFlota(f);{SE DISPONE}
  cargarLista(l);
  maxMin(l,f,patMax,patMin);
  writeln('la patente del camion que mas kilometros recorridos posee es: ', patMax,
          ' y la patente del camion que menos kilometros recorridos posee es: ',patMin,'.');
  writeln(
'La cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5 toneladas y que posean una antiguedad mayor a 5 anos al momento de realizar el viaje es de: '
          ,cantV(l,f),'.');
  codSoloImp(l);
End.
