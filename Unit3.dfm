object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 354
  ClientWidth = 818
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 818
    Height = 354
    ParentCustomHint = False
    Align = alClient
    BiDiMode = bdLeftToRight
    Ctl3D = True
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBiDiMode = False
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        ReadOnly = True
        Title.Caption = #1048#1084#1103' '#1087#1088#1080#1085#1090#1077#1088#1072
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IPADRESS'
        Title.Caption = 'IP-'#1040#1076#1088#1077#1089
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE_PAGE'
        Visible = True
      end>
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\UNO\Database\RDB.AKS'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=127.0.0.1'
      'Port=3050'
      'CharacterSet=UTF8'
      'DriverID=FB')
    LoginPrompt = False
    Left = 64
    Top = 16
  end
  object FDQuery1: TFDQuery
    IndexFieldNames = 'CODE_PAGE;IPADRESS;NAME'
    Connection = FDConnection1
    UpdateOptions.AssignedValues = [uvEInsert, uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    SQL.Strings = (
      'select name,ipadress,code_page from tbprinters')
    Left = 104
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 144
    Top = 16
  end
end
