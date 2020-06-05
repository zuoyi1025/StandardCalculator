unit Calculation;

interface

uses
  System.SysUtils, Dialogs, StrUtils;

type
  InputStatus = (FIRST_NUM, THE_OPERATOR, SECOND_NUM);

  Calculator = Class
  private
    currExp: string; // the current expresion, may ends with operator

    currResult: real; // current result = the first oeprand!!
    currOperator: Char; // the last saved operator
    secondOperand: real;

    iStatus: InputStatus;

  public

    procedure calculateWithOperand;
    procedure clear;
    function updateWithNum(inputNum: Integer): String;
    function updateWithOperator(inputChar: Char): String;
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
  secondOperand := 0;
  currOperator := #0;
  iStatus := InputStatus.FIRST_NUM;
end;

// clear all values
procedure Calculator.clear;
begin
  currExp := '';
  currResult := 0;
  secondOperand := 0;
  currOperator := #0;
  iStatus := InputStatus.FIRST_NUM;
end;

// calculate the temporary result with the operand
procedure Calculator.calculateWithOperand;
begin
  if iStatus <> InputStatus.SECOND_NUM then
    exit;

  case currOperator of
    '+':
      begin
        currResult := currResult + secondOperand;
      end;

    '-':
      begin
        currResult := currResult - secondOperand;
      end;

    '*':
      begin
        currResult := currResult * secondOperand;
      end;

    '/':
      begin
        if secondOperand = 0 then
        begin
          currResult := 0;
          currExp := 'ERROR DIV BY 0';
          // ShowMessage('Teilen durch 0 nicht möglich!');
        end
        else
        begin
          currResult := currResult / secondOperand;
        end;
      end;
  end;
  secondOperand := 0;
  currOperator := #0;
  iStatus := InputStatus.THE_OPERATOR;
end;

// update currResult or secondOperand according to input number
function Calculator.updateWithNum(inputNum: Integer): String;
begin
  if (currExp = 'ERROR DIV BY 0') then
  begin
    self.clear;
    currExp := IntToStr(inputNum);
    iStatus := InputStatus.FIRST_NUM;
  end;

  case iStatus of
    InputStatus.FIRST_NUM:
      begin
        currResult := currResult * 10 + inputNum;
        result := FloatToStr(self.currResult);
      end;
    InputStatus.THE_OPERATOR:
      begin
        iStatus := InputStatus.SECOND_NUM;
        secondOperand := inputNum;
        result := FloatToStr(self.secondOperand);
      end;
    InputStatus.SECOND_NUM:
      begin
        secondOperand := secondOperand * 10 + inputNum;
        result := FloatToStr(self.secondOperand);

      end;
  end;

  currExp := currExp + IntToStr(inputNum);
end;

//
function Calculator.updateWithOperator(inputChar: Char): String;
begin
  // start a new calculation
  if (currExp = 'ERROR DIV BY 0') then
  begin
    self.clear;
    currExp := '0';
    iStatus := InputStatus.FIRST_NUM;
  end;

  case iStatus of

    InputStatus.FIRST_NUM:
      begin
        currExp := FloatToStr(currResult);
        iStatus := InputStatus.THE_OPERATOR;
        currOperator := inputChar;
        result := currOperator;
      end;

    InputStatus.THE_OPERATOR:
      begin
        if currOperator = inputChar then
        begin
          result := currOperator;
          exit;
        end
        else if currOperator <> #0 then
        begin
          // truncate the last operator char in expression
          delete(currExp, length(currExp), 1);
          currOperator := #0;
        end;
        currOperator := inputChar;
        result := currOperator;
      end;

    InputStatus.SECOND_NUM:
      begin
        currExp := '(' + currExp + ')';
        self.calculateWithOperand;
        result := FloatToStr(self.currResult);
        iStatus := InputStatus.THE_OPERATOR;
        currOperator := inputChar;
      end;
  end;

  currExp := currExp + inputChar;
end;

end.
