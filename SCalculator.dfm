object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Standard Calculator v0.1'
  ClientHeight = 488
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = form1OnShow
  PixelsPerInch = 96
  TextHeight = 13
  object tlbExpression: TLabel
    Left = 0
    Top = 0
    Width = 400
    Height = 42
    Align = alTop
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitLeft = 381
    ExplicitWidth = 19
  end
  object tlbResult: TLabel
    Left = 0
    Top = 65
    Width = 400
    Height = 48
    Alignment = taRightJustify
    AutoSize = False
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object tbnNum7: TButton
    Left = 0
    Top = 216
    Width = 100
    Height = 62
    Caption = '7'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = tbnNum7Click
  end
  object tbnNum8: TButton
    Left = 100
    Top = 216
    Width = 100
    Height = 62
    Caption = '8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = tbnNum8Click
  end
  object tbnNum9: TButton
    Left = 200
    Top = 216
    Width = 100
    Height = 62
    Caption = '9'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = tbnNum9Click
  end
  object tbnDivide: TButton
    Left = 300
    Top = 216
    Width = 100
    Height = 62
    Caption = #247
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = tbnDivideClick
  end
  object tbnNum4: TButton
    Left = 0
    Top = 284
    Width = 100
    Height = 62
    Caption = '4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = tbnNum4Click
  end
  object tbnNum5: TButton
    Left = 100
    Top = 284
    Width = 100
    Height = 62
    Caption = '5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = tbnNum5Click
  end
  object tbnNum6: TButton
    Left = 200
    Top = 284
    Width = 100
    Height = 62
    Caption = '6'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = tbnNum6Click
  end
  object tbnMultiple: TButton
    Left = 300
    Top = 284
    Width = 100
    Height = 62
    Caption = #215
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = tbnMultipleClick
  end
  object tbnNum1: TButton
    Left = 0
    Top = 352
    Width = 100
    Height = 62
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = tbnNum1Click
  end
  object tbnNum2: TButton
    Left = 100
    Top = 352
    Width = 100
    Height = 62
    Caption = '2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = tbnNum2Click
  end
  object tbnNum3: TButton
    Left = 200
    Top = 352
    Width = 100
    Height = 62
    Caption = '3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = tbnNum3Click
  end
  object tbnMinus: TButton
    Left = 300
    Top = 352
    Width = 100
    Height = 62
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = tbnMinusClick
  end
  object tbnNegative: TButton
    Left = 0
    Top = 420
    Width = 100
    Height = 62
    Caption = '+/-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
  end
  object tbnNum0: TButton
    Left = 100
    Top = 420
    Width = 100
    Height = 62
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    OnClick = tbnNum0Click
  end
  object tbnComma: TButton
    Left = 200
    Top = 420
    Width = 100
    Height = 62
    Caption = ','
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
  end
  object tbnAdd: TButton
    Left = 300
    Top = 420
    Width = 100
    Height = 62
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
    OnClick = tbnAddClick
  end
  object tbnEqualsTo: TButton
    Left = 300
    Top = 148
    Width = 100
    Height = 62
    Caption = '='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
  end
  object btnClear: TButton
    Left = 200
    Top = 148
    Width = 100
    Height = 62
    Caption = 'C'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 17
    OnClick = btnClearClick
  end
end
