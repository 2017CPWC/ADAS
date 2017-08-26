object FormAdvancedDriverAssistanceSystem: TFormAdvancedDriverAssistanceSystem
  Left = 0
  Top = 0
  Caption = 'Advanced Driver Assistance System'
  ClientHeight = 173
  ClientWidth = 384
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
    Width = 368
    Height = 17
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 6
    Align = alTop
    Caption = 'Adapted Cruise Control'
    TabOrder = 0
  end
  object CheckBoxLaneDepartureWarning: TCheckBox
    AlignWithMargins = True
    Left = 8
    Top = 101
    Width = 368
    Height = 17
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 6
    Align = alTop
    Caption = 'Lane Departure Warning'
    TabOrder = 1
  end
  object CheckBoxLaneChanging: TCheckBox
    AlignWithMargins = True
    Left = 8
    Top = 70
    Width = 368
    Height = 17
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 6
    Align = alTop
    Caption = 'Lane Changing'
    TabOrder = 2
  end
  object CheckBoxLaneKeeping: TCheckBox
    AlignWithMargins = True
    Left = 8
    Top = 39
    Width = 368
    Height = 17
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 6
    Align = alTop
    Caption = 'Lane Keeping'
    TabOrder = 3
  end
  object ButtonApply: TButton
    Left = 301
    Top = 140
    Width = 75
    Height = 25
    Caption = 'Apply'
    TabOrder = 4
  end
end
