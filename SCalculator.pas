unit SCalculator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Calculation,
  Vcl.Buttons;

type
  TForm1 = class(TForm)
    tlbExpression: TLabel;
    tbnNum7: TSpeedButton;
    tbnNum8: TSpeedButton;
    tbnNum9: TSpeedButton;
    tbnDivide: TSpeedButton;
    tbnNum4: TSpeedButton;
    tbnNum5: TSpeedButton;
    tbnNum6: TSpeedButton;
    tbnMultiple: TSpeedButton;
    tbnNum1: TSpeedButton;
    tbnNum2: TSpeedButton;
    tbnNum3: TSpeedButton;
    tbnMinus: TSpeedButton;
    tbnNegative: TSpeedButton;
    tbnNum0: TSpeedButton;
    tbnComma: TSpeedButton;
    tbnAdd: TSpeedButton;
    tbnEqualsTo: TButton;
    tlbResult: TLabel;
    tbnClear: TSpeedButton;
    tbnClearEntry: TSpeedButton;
    tbnBackspace: TSpeedButton;
    procedure tbnNum7Click(Sender: TObject);
    procedure form1OnShow(Sender: TObject);
    procedure tbnNum8Click(Sender: TObject);
    procedure tbnAddClick(Sender: TObject);
    procedure tbnClearClick(Sender: TObject);
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
    procedure tbnEqualsToKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tbnBackspaceClick(Sender: TObject);
    procedure tbnClearEntryClick(Sender: TObject);

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

procedure TForm1.tbnClearClick(Sender: TObject);
begin
  sCal.reset;
  tlbResult.caption := '0';
  tlbExpression.caption := '';
end;

procedure TForm1.tbnClearEntryClick(Sender: TObject);
begin
  sCal.clearEntry;
  tlbResult.caption := '0';
end;

procedure TForm1.form1OnShow(Sender: TObject);
begin
  sCal := Calculation.Calculator.Create;
  // ShowMessage('You can also usbackspacee SPACE a ENTER');

end;

procedure TForm1.tbnAddClick(Sender: TObject);
begin
  tlbResult.caption := sCal.updateWithOperator('+');
  updateExpCaption(sCal.ResultExpression);
end;

procedure TForm1.tbnBackspaceClick(Sender: TObject);
begin
  tlbResult.caption := sCal.backspace();
end;

procedure TForm1.tbnCommaClick(Sender: TObject);
begin
  ShowMessage('TODO: not implemented yet.');
  // updateExpCaption(sCal.ResultExpression);
end;

procedure TForm1.tbnDivideClick(Sender: TObject);
begin
  tlbResult.caption := sCal.updateWithOperator('/');
  updateExpCaption(sCal.ResultExpression);
end;

procedure TForm1.tbnEqualsToClick(Sender: TObject);
begin
  sCal.calculateWithOperand;
  updateResultNumCap(sCal.resultNumber);
  updateExpCaption(sCal.ResultExpression);
end;

// receive input from keyboard
// Focus is always on tbnEqualsTo!
procedure TForm1.tbnEqualsToKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // TODO: BUG: ENTER oder SPACE wiederholt die letzte Eingabe
  // ShowMessage('the value of key is : ' + IntToStr(Key));
  case Key of
    8:
      begin
        self.tbnBackspace.Click;
      end;
    32:
      begin
        self.tbnEqualsTo.Click;
      end;
    67:
      begin
        self.tbnClear.Click;
      end;
    107:
      begin
        self.tbnAdd.Click;
      end;
    109:
      begin
        self.tbnMinus.Click;
      end;
    106:
      begin
        self.tbnMultiple.Click;
      end;
    111:
      begin
        self.tbnDivide.Click;
      end;
    48, 96:
      begin
        self.tbnNum0.Click;
      end;
    49, 97:
      begin
        self.tbnNum1.Click;
      end;
    50, 98:
      begin
        self.tbnNum2.Click;
      end;
    51, 99:
      begin
        self.tbnNum3.Click;
      end;
    52, 100:
      begin
        self.tbnNum4.Click;
      end;
    53, 101:
      begin
        self.tbnNum5.Click;
      end;
    54, 102:
      begin
        self.tbnNum6.Click;
      end;
    55, 103:
      begin
        self.tbnNum7.Click;
      end;
    56, 104:
      begin
        self.tbnNum8.Click;
      end;
    57, 105:
      begin
        self.tbnNum9.Click;
      end;

  end;
  Key := 0;
end;

procedure TForm1.tbnMinusClick(Sender: TObject);
begin
  tlbResult.caption := sCal.updateWithOperator('-');
  updateExpCaption(sCal.ResultExpression);
end;

procedure TForm1.tbnMultipleClick(Sender: TObject);
begin
  tlbResult.caption := sCal.updateWithOperator('*');
  updateExpCaption(sCal.ResultExpression);

end;

procedure TForm1.tbnNegativeClick(Sender: TObject);
begin
  ShowMessage('TODO: not implemented yet.');
  // updateExpCaption(sCal.ResultExpression);

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
