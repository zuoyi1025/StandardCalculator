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
    function getNewStringAfterBackspace(var realNum: real): String;

  public

    procedure calculateWithOperand;
    procedure reset;
    function updateWithNum(inputNum: Integer): String;
    function updateWithOperator(inputChar: Char): String;
    function backspace: String;
    constructor Create;

    property ResultExpression: String read currExp;
    // TODO:func updates resExp
    property ResultNumber: real read currResult;
    // property ResultString: String read getResultString;

  End;

implementation

constructor Calculator.Create; // constructor
begin

  currExp := '';
  currResult := 0;
  secondOperand := 0;
  currOperator := #0;
  iStatus := InputStatus.FIRST_NUM;
end;

function Calculator.getNewStringAfterBackspace(var realNum: real): String;
begin
  result := FloatToStr(realNum);
  delete(result, length(result), 1);
  if result = '' then
    realNum := 0
  else
    realNum := StrToFloat(result);
end;

procedure Calculator.reset; // reset all values
begin
  currExp := '';
  currResult := 0;
  secondOperand := 0;
  currOperator := #0;
  iStatus := InputStatus.FIRST_NUM;
end;

function Calculator.backspace: String;
begin
  case iStatus of
    InputStatus.FIRST_NUM:
      begin
        result := self.getNewStringAfterBackspace(currResult);
      end;
    InputStatus.THE_OPERATOR:
      begin
        result := FloatToStr(currResult);
      end;
    InputStatus.SECOND_NUM:
      begin
        result := self.getNewStringAfterBackspace(secondOperand);
      end;
  end;

end;

procedure Calculator.calculateWithOperand;
// calculate the temporary result with the operand

begin
  if iStatus <> InputStatus.SECOND_NUM then
    exit;

  currExp := currExp + FloatToStr(secondOperand);
  currExp := '(' + currExp + ')';

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

function Calculator.updateWithNum(inputNum: Integer): String;
// update currResult or secondOperand according to input number
begin
  if (currExp = 'ERROR DIV BY 0') then
  begin
    self.reset;
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

end;

function Calculator.updateWithOperator(inputChar: Char): String;
// deals with + - * /
begin
  // start a new calculation
  if (currExp = 'ERROR DIV BY 0') then
  begin
    self.reset;
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
          result := FloatToStr(currResult);
          exit;
        end
        else if currOperator <> #0 then
        begin
          // truncate the last operator char in expression
          delete(currExp, length(currExp), 1);
          currOperator := #0;
        end;
        currOperator := inputChar;
        result := FloatToStr(currResult);
      end;

    InputStatus.SECOND_NUM:
      begin
        self.calculateWithOperand;
        result := FloatToStr(self.currResult);
        iStatus := InputStatus.THE_OPERATOR;
        currOperator := inputChar;
      end;
  end;

  currExp := currExp + inputChar;
end;

end.
