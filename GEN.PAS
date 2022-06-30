program GEN;
{ Konvertiert ANSYS-Ausgabedatei in einzelne Dateien }

var freq,ampl,phase     : real;
    i,j                 : integer;
    dummy               : string[80];
    filename            : string[80];
    infile,outf1,outf2  : text;

begin
 writeln('Generierung der Auswertedateien:');
 writeln('(AMPLITUDE, PHASE)');
 writeln('Eingabedatei-Format: FREQU  AMPLITUDE  PHASE)');

 write('Konvertierung beginnt...');

 assign(infile,'in');
 assign(outf1,'out1');
 assign(outf2,'out2');

 reset(infile);
 rewrite(outf1);
 rewrite(outf2);

 repeat
  { Kommentarzeilen ueberlesen }
  { for i:=1 to 7 do readln(infile,dummy); }
  { eigentliche Daten konvertieren }
  for j:=1 to 19 do
  begin
    readln(infile,freq,ampl,phase);
    if ((freq<>0) and (ampl<> 0)) then writeln(outf1,freq:30,ampl:30);
    if ((freq<>0) and (phase<>0)) then writeln(outf2,freq:30,phase:30);
 end;
 until EOF(infile);

 close(infile);
 close(outf1);
 close(outf2);

 writeln(' b e e n d e t !');
end.
