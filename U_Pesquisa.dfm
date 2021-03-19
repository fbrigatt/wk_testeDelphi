object frm_Pesquisa: Tfrm_Pesquisa
  Left = 0
  Top = 0
  Caption = 'Pesquisa'
  ClientHeight = 377
  ClientWidth = 721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 16
  object lbl_Cod_Cli: TLabel
    Left = 8
    Top = 4
    Width = 221
    Height = 18
    Caption = 'Digite o codigo ou nome desejado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btn_OK: TSpeedButton
    Left = 632
    Top = 22
    Width = 71
    Height = 26
    Caption = 'Selecionar'
    OnClick = btn_OKClick
  end
  object btn_Pesquisar: TSpeedButton
    Left = 538
    Top = 24
    Width = 72
    Height = 26
    Caption = 'Pesquisar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = btn_PesquisarClick
  end
  object edt_Cod: TEdit
    Left = 8
    Top = 24
    Width = 513
    Height = 24
    CharCase = ecUpperCase
    TabOrder = 0
    OnKeyPress = edt_CodKeyPress
  end
  object dbg_Listar: TDBGrid
    Left = 8
    Top = 56
    Width = 695
    Height = 305
    Align = alCustom
    DataSource = DM.ds_clientes
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbg_ListarDblClick
    OnKeyDown = dbg_ListarKeyDown
    OnKeyPress = dbg_ListarKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'id_cli'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cidade'
        Width = 247
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'uf'
        Visible = True
      end>
  end
end
