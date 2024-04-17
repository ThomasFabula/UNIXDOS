program UNIXDOS;
{ Umwandlung von UNIX-ASCII Dateien in DOS-ASCII-Dateien }

var ch,x : char;
    filename : string[80];
    infile,outfile : file of char;

begin
 x:=chr(13);
 writeln('UNIX -> DOS : Datei-Konvertierung:');
 writeln('Eingabedatei: IN');
 writeln('Ausgabedatei: OUT');
 assign(infile,'in');
 assign(outfile,'out');
 reset(infile);
 rewrite(outfile);
 write('Konvertierung beginnt...');
 while not(EOF(infile)) do
 begin
  read(infile,ch);
  if ch=chr(10) then write(outfile,x);
  write(outfile,ch);
 end;
 close(infile);
 close(outfile);
 writeln(' b e e n d e t !');
end.
