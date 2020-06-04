program StandardCalculator;

uses
  Vcl.Forms,
  SCalculator in 'SCalculator.pas' {Form1},
  Calculation in 'Calculation.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
