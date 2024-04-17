program SKAL;

{ Skaliert einen x,y-Datensatz um
  Eingabe der Skalierungsewerte erfolgt manuell }

var skalx, skaly,dummy,dummy2  : real;
    x,y,x1,y1                  : real;
    filename                   : string[80];
    infile,outf                : text;

begin
 writeln('Skalieren eines X,Y - Datenfiles:');
 writeln('Eingabedatei = SKALIN');
 writeln('Ausgabedatei = SKALOUT');
 write('Eingabe SKALX (default=1) : ');
 dummy:=0;
 dummy2:=0;
 readln(dummy);
 if dummy<>0
   then skalx:=dummy
   else skalx:=1;
 write('Eingabe SKALY (default=1) : ');
 readln(dummy2);
 if dummy2<>0
   then skaly:=dummy2
   else skaly:=1;

 write('Konvertierung beginnt...');

 assign(infile,'SKALIN');
 assign(outf,'SKALOUT');
 reset(infile);
 rewrite(outf);

 repeat
  readln(infile,x,y);
  x1:=skalx*x;
  y1:=skaly*y;
  writeln(outf,x1:30,y1:30);
 until EOF(infile);

 close(infile);
 close(outf);

 writeln(' b e e n d e t !');
end.
