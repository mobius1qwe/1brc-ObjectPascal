program RoundEx;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils
, System.Classes
, RoundEx.Common
;

var
  index: Integer;
  temperature: Integer;
  output: String;
  outputStream: TFileStream;

begin
  WriteLn('Lazarus RoundExDouble');
  index:= 0;
  output:= '';
  for temperature:= -999 to 999 do
  begin
    Inc(index);
    Write(GenerateProgressBar(index, 1999, 50), #13);
    output:= output + FloatToStr(RoundExDouble(temperature / 10))  + ', ';
  end;
  SetLength(output, Length(output) - 2);
  outputStream:= TFileStream.Create('RoundExDouble.txt', fmCreate);
  outputStream.WriteBuffer(output[1], Length(output));
  outputStream.Free;

  WriteLn;
  WriteLn;
  WriteLn('Lazarus RoundExInteger');
  index:= 0;
  output:= '';
  for temperature:= -999 to 999 do
  begin
    Inc(index);
    Write(GenerateProgressBar(index, 1999, 50), #13);
    output:= output + IntToStr(RoundExInteger(temperature / 10))  + ', ';
  end;
  SetLength(output, Length(output) - 2);
  outputStream:= TFileStream.Create('RoundExInteger.txt', fmCreate);
  outputStream.WriteBuffer(output[1], Length(output));
  outputStream.Free;

  WriteLn;

end.