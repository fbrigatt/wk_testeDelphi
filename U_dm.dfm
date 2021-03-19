object DM: TDM
  OldCreateOrder = False
  Height = 452
  Width = 749
  object conexao: TFDConnection
    Params.Strings = (
      'Database=wk'
      'User_Name=root'
      'Password=Recobase@123'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    BeforeConnect = conexaoBeforeConnect
    Left = 40
    Top = 24
  end
  object mysql_link: TFDPhysMySQLDriverLink
    DriverID = 'MySQL'
    VendorLib = 'C:\pcrw-os\libmysql.dll'
    Left = 128
    Top = 25
  end
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 240
    Top = 27
  end
  object SQL_clientes: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select * from clientes')
    Left = 40
    Top = 136
  end
  object ds_clientes: TDataSource
    DataSet = SQL_clientes
    Left = 120
    Top = 136
  end
  object TB_clientes: TFDTable
    IndexFieldNames = 'id_cli'
    Connection = conexao
    UpdateOptions.UpdateTableName = 'clientes'
    TableName = 'clientes'
    Left = 192
    Top = 138
    object TB_clientesid_cli: TFDAutoIncField
      FieldName = 'id_cli'
      Origin = 'id_cli'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object TB_clientesnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 45
    end
    object TB_clientescidade: TStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Required = True
      Size = 45
    end
    object TB_clientesuf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object SQL_produtos: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select * from produtos')
    Left = 40
    Top = 208
    object SQL_produtosid_prod: TFDAutoIncField
      FieldName = 'id_prod'
      Origin = 'id_prod'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object SQL_produtosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 45
    end
    object SQL_produtospreco_venda: TFloatField
      FieldName = 'preco_venda'
      Origin = 'preco_venda'
      Required = True
      currency = True
    end
  end
  object ds_servicos: TDataSource
    DataSet = SQL_produtos
    Left = 116
    Top = 208
  end
  object TB_produtos: TFDTable
    IndexFieldNames = 'ser_codigo'
    Connection = conexao
    UpdateOptions.UpdateTableName = 'produtos'
    TableName = 'produtos'
    Left = 196
    Top = 207
    object TB_produtosser_codigo: TFDAutoIncField
      FieldName = 'ser_codigo'
      Origin = 'ser_codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object TB_produtosser_descricao: TStringField
      FieldName = 'ser_descricao'
      Origin = 'ser_descricao'
      Required = True
      Size = 50
    end
    object TB_produtosser_valor: TFloatField
      FieldName = 'ser_valor'
      Origin = 'ser_valor'
      Required = True
      currency = True
    end
  end
  object SQL_pedidos_dados_gerais: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select * from pedidos_dados_gerais')
    Left = 56
    Top = 288
  end
  object ds_pedidos_dados_gerais: TDataSource
    DataSet = TB_pedidos_dados_gerais
    Left = 200
    Top = 288
  end
  object TB_pedidos_dados_gerais: TFDTable
    Connection = conexao
    UpdateOptions.UpdateTableName = 'wk.pedidos_dados_gerais'
    TableName = 'wk.pedidos_dados_gerais'
    Left = 336
    Top = 288
  end
  object SQL_pedido: TFDQuery
    Connection = conexao
    SQL.Strings = (
      
        'SELECT MAX(num_pedido) AS NumeroPedido FROM pedidos_dados_gerais' +
        ';')
    Left = 584
    Top = 16
    object SQL_pedidoNumeroPedido: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NumeroPedido'
      Origin = 'NumeroPedido'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object ds_pedido: TDataSource
    DataSet = SQL_pedido
    Left = 672
    Top = 16
  end
  object SQL_pedidos_produtos: TFDQuery
    AggregatesActive = True
    Connection = conexao
    SQL.Strings = (
      'select pp.*, p.Descricao from pedidos_produtos pp'
      '        left join Produtos p on p.id_prod = pp.produtos_id_prod '
      'order by item')
    Left = 56
    Top = 360
    object SQL_pedidos_produtositem: TFDAutoIncField
      FieldName = 'item'
      Origin = 'item'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object SQL_pedidos_produtosqtde: TIntegerField
      FieldName = 'qtde'
      Origin = 'qtde'
      Required = True
      DisplayFormat = ',0'
    end
    object SQL_pedidos_produtosvlr_unit: TFloatField
      FieldName = 'vlr_unit'
      Origin = 'vlr_unit'
      Required = True
      DisplayFormat = ',0.00'
    end
    object SQL_pedidos_produtosvlr_total: TFloatField
      FieldName = 'vlr_total'
      Origin = 'vlr_total'
      Required = True
      DisplayFormat = ',0.00'
    end
    object SQL_pedidos_produtosnum_pedido: TIntegerField
      FieldName = 'num_pedido'
      Origin = 'num_pedido'
      Required = True
    end
    object SQL_pedidos_produtosprodutos_id_prod: TIntegerField
      FieldName = 'produtos_id_prod'
      Origin = 'produtos_id_prod'
      Required = True
    end
    object SQL_pedidos_produtosDescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Descricao'
      Origin = 'descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 45
    end
  end
  object ds_pedidos_produtos: TDataSource
    DataSet = SQL_pedidos_produtos
    Left = 176
    Top = 360
  end
  object SQL_Padrao: TFDQuery
    Connection = conexao
    Left = 352
    Top = 360
  end
  object ds_total_pedido: TDataSource
    DataSet = SQL_Padrao
    Left = 448
    Top = 360
  end
end
