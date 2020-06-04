unit Calculation;

interface

uses
  System.SysUtils, Dialogs, StrUtils;

type

  Calculator = Class
  private
    currResult: real; // the real number in the upper line of result
    currExp: string; // the current expresion, may ends with operator
    currOperand: Integer; // the integer in the lower line of input
    currOperator: Char; // the last saved operator

  public

    procedure calculateWithOperand;
    procedure clear;
    function updateWithNum(inputNum: Integer): String;
    function updateWithChar(inputChar: Char): String;
    constructor Create;

    property ResultExpression: String read currExp;
    // TODO:func updates resExp
    property ResultNumber: real read currResult;

  End;

implementation

// constructor
constructor Calculator.Create;
begin

  currExp := '';
  currResult := 0;
  currOperand := 0;
  currOperator := #0;
end;

// clear all values
procedure Calculator.clear;
begin
  currExp := '';
  currResult := 0;
  currOperand := 0;
  currOperator := #0;

end;

// calculate the temporary result with the operand
procedure Calculator.calculateWithOperand;
begin
  case currOperator of
    '+':
      begin
        currResult := currResult + currOperand;
      end;

    '-':
      begin
        currResult := currResult - currOperand;
      end;

    '*':
      begin
        currResult := currResult * currOperand;
      end;

    '/':
      begin
        if currOperand = 0 then
        begin
          currResult := 0;
          currExp := 'ERROR DIV BY 0';
          // ShowMessage('Teilen durch 0 nicht möglich!');
        end
        else
        begin
          currResult := currResult / currOperand;
        end;
      end;
  end;
  currOperand := 0;
  currOperator := #0;
end;

// update currResult or currOperand according to input number
function Calculator.updateWithNum(inputNum: Integer): String;
begin

  if (currExp = 'ERROR DIV BY 0') or (currExp = '') then
  begin
    currExp := IntToStr(inputNum);
  end
  else
    currExp := currExp + IntToStr(inputNum);

  if currOperator <> #0 then
  begin

    currOperand := currOperand * 10 + inputNum;
    result := FloatToStr(self.currOperand);
  end
  else if currResult <> 0 then
  begin
    currResult := currResult * 10 + inputNum;
    result := FloatToStr(self.currResult);
  end
  else
  begin
    currResult := inputNum;
    result := FloatToStr(self.currResult);
  end;
end;

//
function Calculator.updateWithChar(inputChar: Char): String;
begin
  if (currExp = 'ERROR DIV BY 0') then
  begin
    currExp := '0';
  end
  else if (RightStr(currExp, 1) = '+') or (RightStr(currExp, 1) = '-') or
    (RightStr(currExp, 1) = '*') or (RightStr(currExp, 1) = '/') or
    (RightStr(currExp, 1) = '=') then
  begin
    delete(currExp, length(currExp), 1);
  end;

  if currOperator <> #0 then
  begin
    self.calculateWithOperand;
    currOperator := inputChar;
    if (RightStr(currExp, 1) <> ')') or (LeftStr(currExp, 1) <> '(') then
      currExp := '(' + currExp + ')';
    currExp := currExp + inputChar;
    result := FloatToStr(self.currResult);
    exit;
  end;

  currExp := currExp + inputChar;

  currOperator := inputChar;
  result := self.currOperator;

end;

end.
