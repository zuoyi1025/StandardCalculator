unit SCalculator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Calculation;

type
  TForm1 = class(TForm)
    tlbExpression: TLabel;
    tbnNum7: TButton;
    tbnNum8: TButton;
    tbnNum9: TButton;
    tbnDivide: TButton;
    tbnNum4: TButton;
    tbnNum5: TButton;
    tbnNum6: TButton;
    tbnMultiple: TButton;
    tbnNum1: TButton;
    tbnNum2: TButton;
    tbnNum3: TButton;
    tbnMinus: TButton;
    tbnNegative: TButton;
    tbnNum0: TButton;
    tbnComma: TButton;
    tbnAdd: TButton;
    tbnEqualsTo: TButton;
    tlbResult: TLabel;
    btnClear: TButton;
    procedure tbnNum7Click(Sender: TObject);
    procedure form1OnShow(Sender: TObject);
    procedure tbnNum8Click(Sender: TObject);
    procedure tbnAddClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure tbnNum9Click(Sender: TObject);
    procedure tbnNum4Click(Sender: TObject);
    procedure tbnNum5Click(Sender: TObject);
    procedure tbnNum6Click(Sender: TObject);
    procedure tbnNum1Click(Sender: TObject);
    procedure tbnNum2Click(Sender: TObject);
    procedure tbnNum3Click(Sender: TObject);
    procedure tbnNum0Click(Sender: TObject);
    procedure tbnMinusClick(Sender: TObject);
    procedure tbnMultipleClick(Sender: TObject);
    procedure tbnDivideClick(Sender: TObject);
    procedure tbnEqualsToClick(Sender: TObject);
    procedure tbnNegativeClick(Sender: TObject);
    procedure tbnCommaClick(Sender: TObject);

  private
    { Private-Deklarationen }
    procedure updateExpCaption(caption: String);
    procedure updateResultNumCap(resultNumber: Real);
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;
  sCal: Calculation.Calculator;

implementation

{$R *.dfm}

procedure TForm1.updateExpCaption(caption: String);
begin
  tlbExpression.caption := caption;
end;

procedure TForm1.updateResultNumCap(resultNumber: Real);
begin
  tlbResult.caption := FloatToStr(resultNumber);
end;

procedure TForm1.btnClearClick(Sender: TObject);
begin
  sCal.clear;
  tlbResult.caption := '0';
  tlbExpression.caption := '';
end;

procedure TForm1.form1OnShow(Sender: TObject);
begin
  sCal := Calculation.Calculator.Create;
end;

procedure TForm1.tbnAddClick(Sender: TObject);
begin
  tlbResult.caption := sCal.updateWithChar('+');
  updateExpCaption(sCal.ResultExpression);
end;

procedure TForm1.tbnCommaClick(Sender: TObject);
begin
  updateExpCaption(sCal.ResultExpression);

end;

procedure TForm1.tbnDivideClick(Sender: TObject);
begin
  tlbResult.caption := sCal.updateWithChar('/');
  updateExpCaption(sCal.ResultExpression);
end;

procedure TForm1.tbnEqualsToClick(Sender: TObject);
begin
  sCal.calculateWithOperand;
  updateResultNumCap(sCal.resultNumber);
  updateExpCaption(sCal.ResultExpression);
end;

procedure TForm1.tbnMinusClick(Sender: TObject);
begin
  tlbResult.caption := sCal.updateWithChar('-');
  updateExpCaption(sCal.ResultExpression);
end;

procedure TForm1.tbnMultipleClick(Sender: TObject);
begin
  tlbResult.caption := sCal.updateWithChar('*');
  updateExpCaption(sCal.ResultExpression);

end;

procedure TForm1.tbnNegativeClick(Sender: TObject);
begin
  updateExpCaption(sCal.ResultExpression);

end;

procedure TForm1.tbnNum0Click(Sender: TObject);
begin
  tlbResult.caption := sCal.updateWithNum(0);
  updateExpCaption(sCal.ResultExpression);

end;

procedure TForm1.tbnNum1Click(Sender: TObject);
begin
  tlbResult.caption := sCal.updateWithNum(1);
  updateExpCaption(sCal.ResultExpression);

end;

procedure TForm1.tbnNum2Click(Sender: TObject);
begin
  tlbResult.caption := sCal.updateWithNum(2);
  updateExpCaption(sCal.ResultExpression);

end;

procedure TForm1.tbnNum3Click(Sender: TObject);
begin
  tlbResult.caption := sCal.updateWithNum(3);
  updateExpCaption(sCal.ResultExpression);

end;

procedure TForm1.tbnNum4Click(Sender: TObject);
begin
  tlbResult.caption := sCal.updateWithNum(4);
  updateExpCaption(sCal.ResultExpression);

end;

procedure TForm1.tbnNum5Click(Sender: TObject);
begin
  tlbResult.caption := sCal.updateWithNum(5);
  updateExpCaption(sCal.ResultExpression);

end;

procedure TForm1.tbnNum6Click(Sender: TObject);
begin
  tlbResult.caption := sCal.updateWithNum(6);
  updateExpCaption(sCal.ResultExpression);

end;

procedure TForm1.tbnNum7Click(Sender: TObject);
begin
  tlbResult.caption := sCal.updateWithNum(7);
  updateExpCaption(sCal.ResultExpression);

end;

procedure TForm1.tbnNum8Click(Sender: TObject);
begin
  tlbResult.caption := sCal.updateWithNum(8);
  updateExpCaption(sCal.ResultExpression);

end;

procedure TForm1.tbnNum9Click(Sender: TObject);
begin
  tlbResult.caption := sCal.updateWithNum(9);
  updateExpCaption(sCal.ResultExpression);

end;

end.
