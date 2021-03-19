object frm_pdv: Tfrm_pdv
  Left = 0
  Top = 0
  ActiveControl = edt_Cod_Cli
  BorderStyle = bsNone
  Caption = 'Tela de PDV'
  ClientHeight = 530
  ClientWidth = 780
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClick = FormClick
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 16
  object lbl_Buscar_Cod_Servico: TLabel
    Left = 8
    Top = 99
    Width = 42
    Height = 18
    Caption = 'Cliente'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 160
    Width = 50
    Height = 18
    Caption = 'Produto'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 50
    Width = 87
    Height = 16
    Caption = 'Numero Pedido'
  end
  object Label6: TLabel
    Left = 224
    Top = 50
    Width = 77
    Height = 16
    Caption = 'Data Emissao'
  end
  object Label8: TLabel
    Left = 144
    Top = 47
    Width = 27
    Height = 16
    Caption = 'Hora'
  end
  object Label2: TLabel
    Left = 61
    Top = 211
    Width = 65
    Height = 16
    Caption = 'Quantidade'
  end
  object Label10: TLabel
    Left = 202
    Top = 208
    Width = 44
    Height = 16
    Caption = 'Unitario'
  end
  object Label11: TLabel
    Left = 345
    Top = 208
    Width = 29
    Height = 16
    Caption = 'Total'
  end
  object Label12: TLabel
    Left = 8
    Top = 270
    Width = 102
    Height = 18
    Caption = 'Itens do Pedido'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label15: TLabel
    Left = 674
    Top = 439
    Width = 89
    Height = 16
    Caption = 'Total do Pedido'
  end
  object DBGrid1: TDBGrid
    Left = 9
    Top = 294
    Width = 764
    Height = 139
    DataSource = DM.ds_pedidos_produtos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'produtos_id_prod'
        Title.Alignment = taCenter
        Title.Caption = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 330
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtde'
        Title.Alignment = taRightJustify
        Title.Caption = 'Quantidade'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vlr_unit'
        Title.Alignment = taRightJustify
        Title.Caption = 'Unit'#225'rio'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vlr_total'
        Title.Alignment = taRightJustify
        Title.Caption = 'Total R$'
        Width = 100
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 780
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = 11426061
    DragCursor = crHandPoint
    ParentBackground = False
    TabOrder = 1
    OnMouseDown = Panel1MouseDown
    object Label3: TLabel
      Left = 6
      Top = 7
      Width = 65
      Height = 23
      Caption = 'Pedido'
      DragCursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnMouseDown = Panel1MouseDown
    end
    object Label16: TLabel
      Left = 750
      Top = 6
      Width = 13
      Height = 23
      Caption = 'X'
      DragCursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Label16Click
    end
    object Label17: TLabel
      Left = 725
      Top = -7
      Width = 17
      Height = 48
      Caption = '-'
      DragCursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -40
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Label17Click
    end
  end
  object edt_Cod_Cli: TEdit
    Left = 8
    Top = 120
    Width = 63
    Height = 24
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 2
    OnExit = edt_Cod_CliExit
    OnKeyDown = edt_Cod_CliKeyDown
  end
  object edt_Desc_Ser: TEdit
    Left = 77
    Top = 120
    Width = 452
    Height = 24
    CharCase = ecUpperCase
    Color = 11924987
    Ctl3D = True
    Enabled = False
    ParentCtl3D = False
    TabOrder = 3
    OnKeyDown = edt_Desc_SerKeyDown
  end
  object edt_Cod_Prod: TEdit
    Left = 8
    Top = 182
    Width = 145
    Height = 24
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 4
    OnKeyDown = edt_Cod_ProdKeyDown
  end
  object edt_Desc_Prod: TEdit
    Left = 159
    Top = 182
    Width = 604
    Height = 24
    CharCase = ecUpperCase
    Color = 11924987
    Ctl3D = True
    Enabled = False
    ParentCtl3D = False
    TabOrder = 5
    OnKeyDown = edt_Desc_ProdKeyDown
  end
  object edt_Hora: TEdit
    Left = 144
    Top = 69
    Width = 66
    Height = 24
    Color = 11924987
    Enabled = False
    TabOrder = 6
  end
  object edt_Data: TEdit
    Left = 224
    Top = 69
    Width = 121
    Height = 24
    Color = 11924987
    Enabled = False
    TabOrder = 7
  end
  object edt_Num_Pedido: TEdit
    Left = 8
    Top = 69
    Width = 121
    Height = 24
    Color = 11924987
    Enabled = False
    TabOrder = 8
    Text = '0'
  end
  object Panel2: TPanel
    Left = 8
    Top = 152
    Width = 758
    Height = 4
    BevelOuter = bvNone
    Color = 11426061
    ParentBackground = False
    TabOrder = 9
  end
  object edt_Qtde: TEdit
    Left = 7
    Top = 230
    Width = 118
    Height = 24
    Alignment = taRightJustify
    TabOrder = 10
    Text = '1'
    OnExit = edt_QtdeExit
  end
  object edt_Preco_Venda: TEdit
    Left = 132
    Top = 230
    Width = 118
    Height = 24
    Alignment = taRightJustify
    TabOrder = 11
    Text = '0,00'
    OnExit = edt_QtdeExit
  end
  object edt_Total: TEdit
    Left = 256
    Top = 230
    Width = 118
    Height = 24
    Alignment = taRightJustify
    Color = 11924987
    Enabled = False
    TabOrder = 12
    Text = '0,00'
  end
  object btn_Gravar: TButton
    Left = 428
    Top = 220
    Width = 178
    Height = 29
    Caption = 'Incluir Produto / Gravar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    OnClick = btn_GravarClick
  end
  object Panel3: TPanel
    Left = 8
    Top = 260
    Width = 758
    Height = 4
    BevelOuter = bvNone
    Color = 11426061
    ParentBackground = False
    TabOrder = 14
  end
  object Panel4: TPanel
    Left = 0
    Top = 489
    Width = 780
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Color = 11426061
    ParentBackground = False
    TabOrder = 15
    object Button3: TButton
      Left = 9
      Top = 5
      Width = 118
      Height = 32
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = Button3Click
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 41
    Width = 1
    Height = 448
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'Panel5'
    Color = 11426061
    ParentBackground = False
    TabOrder = 16
  end
  object Panel6: TPanel
    Left = 779
    Top = 41
    Width = 1
    Height = 448
    Align = alRight
    BevelOuter = bvNone
    Caption = 'Panel5'
    Color = 11426061
    ParentBackground = False
    TabOrder = 17
  end
  object Edit12: TEdit
    Left = 645
    Top = 459
    Width = 118
    Height = 24
    Alignment = taRightJustify
    Color = 11924987
    Enabled = False
    TabOrder = 18
    Text = '0,00'
  end
end
