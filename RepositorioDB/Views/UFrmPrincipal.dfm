object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'RepositorioDB'
  ClientHeight = 321
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object btnSelect: TSpeedButton
    Left = 7
    Top = 48
    Width = 80
    Height = 25
    Caption = 'Select'
    OnClick = btnSelectClick
  end
  object btnInsert: TSpeedButton
    Left = 93
    Top = 48
    Width = 80
    Height = 25
    Caption = 'Insert'
    OnClick = btnInsertClick
  end
  object btnUpdate: TSpeedButton
    Left = 179
    Top = 48
    Width = 80
    Height = 25
    Caption = 'Update'
    OnClick = btnUpdateClick
  end
  object btnDelete: TSpeedButton
    Left = 265
    Top = 48
    Width = 80
    Height = 25
    Caption = 'Delete'
    OnClick = btnDeleteClick
  end
  object lbExemplos: TLabel
    Left = 8
    Top = 8
    Width = 53
    Height = 16
    Caption = 'Exemplo:'
  end
  object mmMemo: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 118
    Width = 348
    Height = 200
    TabStop = False
    Align = alBottom
    ReadOnly = True
    TabOrder = 0
    ExplicitTop = 160
    ExplicitWidth = 428
  end
end
