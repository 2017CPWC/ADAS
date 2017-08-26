object FormAdvancedDriverAssistanceSystem: TFormAdvancedDriverAssistanceSystem
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Advanced Driver Assistance System'
  ClientHeight = 183
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CheckBoxAdaptedCruiseControl: TCheckBox
    AlignWithMargins = True
    Left = 8
    Top = 8
    Width = 378
    Height = 17
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 6
    Align = alTop
    Caption = 'Adapted Cruise Control'
    TabOrder = 0
    ExplicitWidth = 368
  end
  object CheckBoxLaneDepartureWarning: TCheckBox
    AlignWithMargins = True
    Left = 8
    Top = 101
    Width = 378
    Height = 17
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 6
    Align = alTop
    Caption = 'Lane Departure Warning'
    TabOrder = 1
    ExplicitWidth = 368
  end
  object CheckBoxLaneChanging: TCheckBox
    AlignWithMargins = True
    Left = 8
    Top = 70
    Width = 378
    Height = 17
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 6
    Align = alTop
    Caption = 'Lane Changing'
    TabOrder = 3
    ExplicitWidth = 368
  end
  object CheckBoxLaneKeeping: TCheckBox
    AlignWithMargins = True
    Left = 8
    Top = 39
    Width = 378
    Height = 17
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 6
    Align = alTop
    Caption = 'Lane Keeping'
    TabOrder = 4
    ExplicitWidth = 368
  end
  object ButtonApply: TButton
    Left = 301
    Top = 140
    Width = 75
    Height = 25
    Caption = 'Apply'
    TabOrder = 2
    OnClick = ButtonApplyClick
  end
end
