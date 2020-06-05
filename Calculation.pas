unit Calculation;

interface

uses
  System.SysUtils, Dialogs, StrUtils;

type
  InputStatus = (FIRST_NUM, THE_OPERATOR, SECOND_NUM);

  RealNumber = class
  private
    isNegativ: Boolean;
    integerPart: integer;
    fracPart: integer;
    lengthOfDecimalPlaces: integer;
  public
    // TODO getValueOfReal:real;
    // TODO etc.
  end;

  Calculator = Class

  private
    currExp: string; // the current expresion, may ends with operator

    currResult: real; // current result = the first oeprand!!
    currOperator: Char; // the last saved operator
    secondOperand: real;
    iStatus: InputStatus;
    isRecevingDecimalPlaces: Boolean;
    function appendLastDigitOfReal(var realNum: real;
      var shallAddSeperator: Boolean; inputNum: integer): String;
    function deleteLastDigitOfReal(var realNum: real): String;

  public
    procedure calculateWithOperand;
    procedure reset;
    procedure clearEntry;
    function updateWithDecimalSeperator: String;
    function updateWithNegative: String;
    function updateWithNum(inputNum: integer): String;
    function updateWithOperator(inputChar: Char): String;
    function backspace: String;
    constructor Create;

    property ResultExpression: String read currExp;
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
  iStatus := FIRST_NUM;
  isRecevingDecimalPlaces := false;
end;

function Calculator.appendLastDigitOfReal(var realNum: real;
  var shallAddSeperator: Boolean; inputNum: integer): String;
begin
  case shallAddSeperator of
    true:
      begin
        if (frac(realNum) <> 0) then
        begin
          ShowMessage('sorry, cannot add comma to a non-int number!');
          exit;
        end;
        // TODO: bugfix: program cannot do 0.00001  or 0.10000023 ?
        // idea: change the real number into Record or Class, then it will be easier
        result := FloatToStr(realNum) + ',' + IntToStr(inputNum);
        realNum := StrToFloat(result);
        shallAddSeperator := false;
      end;
    false:
      begin
        if realNum = 0 then
        begin
          result := IntToStr(inputNum);
          realNum := inputNum;
        end
        else
        begin
          result := FloatToStr(realNum) + IntToStr(inputNum);
          realNum := StrToFloat(result);
        end;
      end;
  end;
end;

function Calculator.deleteLastDigitOfReal(var realNum: real): String;
begin
  // TODO consider dec point
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
  iStatus := FIRST_NUM;
  isRecevingDecimalPlaces := false;
end;

function Calculator.backspace: String;
begin
  case iStatus of
    FIRST_NUM:
      begin
        result := self.deleteLastDigitOfReal(currResult);
      end;
    THE_OPERATOR:
      begin
        result := FloatToStr(currResult);
      end;
    SECOND_NUM:
      begin
        result := self.deleteLastDigitOfReal(secondOperand);
      end;
  end;

end;

procedure Calculator.calculateWithOperand;
// calculate the temporary result with the operand

begin
  if iStatus <> SECOND_NUM then
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
  iStatus := THE_OPERATOR;
end;

procedure Calculator.clearEntry;
begin
  case iStatus of
    FIRST_NUM:
      self.currResult := 0;
    THE_OPERATOR:
      ; // do nothing
    SECOND_NUM:
      self.secondOperand := 0;

  end;

end;

function Calculator.updateWithDecimalSeperator: String;
begin
  case iStatus of
    FIRST_NUM:
      begin
        if frac(currResult) = 0 then
        begin
          result := FloatToStr(currResult) + ',';
          self.isRecevingDecimalPlaces := true;
        end;
      end;
    THE_OPERATOR:
      begin
        result := FloatToStr(secondOperand) + ',';
        iStatus := SECOND_NUM;
        self.isRecevingDecimalPlaces := true;
      end;
    SECOND_NUM:
      begin
        if frac(secondOperand) = 0 then
        begin
          if secondOperand = 0 then
            result := FloatToStr(secondOperand) + ',';
          self.isRecevingDecimalPlaces := true;
        end;
      end;

  end;

end;

function Calculator.updateWithNegative: String;
begin
  ShowMessage('not implemented: Calculator.updateWithNegative');
end;

function Calculator.updateWithNum(inputNum: integer): String;
// update currResult or secondOperand according to input number
begin
  if (currExp = 'ERROR DIV BY 0') then
  begin
    self.reset;
    currExp := IntToStr(inputNum);
    iStatus := FIRST_NUM;
  end;

  case iStatus of
    FIRST_NUM:
      begin
        result := self.appendLastDigitOfReal(currResult,
          isRecevingDecimalPlaces, inputNum);
      end;
    THE_OPERATOR:
      begin
        if currOperator = #0 then
        begin
          self.reset;
          currResult := inputNum;
          result := FloatToStr(self.currResult);
          exit;
        end;
        iStatus := SECOND_NUM;
        secondOperand := inputNum;
        result := FloatToStr(self.secondOperand);
      end;
    SECOND_NUM:
      begin
        result := self.appendLastDigitOfReal(secondOperand,
          isRecevingDecimalPlaces, inputNum);

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
    iStatus := FIRST_NUM;
  end;

  case iStatus of

    FIRST_NUM:
      begin
        currExp := FloatToStr(currResult);
        isRecevingDecimalPlaces := false;
        iStatus := THE_OPERATOR;
        currOperator := inputChar;
        result := currOperator;
      end;

    THE_OPERATOR:
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

    SECOND_NUM:
      begin
        isRecevingDecimalPlaces := false;
        self.calculateWithOperand;
        result := FloatToStr(self.currResult);
        iStatus := THE_OPERATOR;
        currOperator := inputChar;
      end;
  end;

  currExp := currExp + inputChar;
end;

end.
