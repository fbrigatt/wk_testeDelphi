unit U_dm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.UI, System.IniFiles, vcl.forms;

type
  TDM = class(TDataModule)
    conexao: TFDConnection;
    mysql_link: TFDPhysMySQLDriverLink;
    WaitCursor: TFDGUIxWaitCursor;
    SQL_clientes: TFDQuery;
    ds_clientes: TDataSource;
    TB_clientes: TFDTable;
    SQL_produtos: TFDQuery;
    ds_servicos: TDataSource;
    TB_produtos: TFDTable;
    TB_produtosser_codigo: TFDAutoIncField;
    TB_produtosser_descricao: TStringField;
    TB_produtosser_valor: TFloatField;
    SQL_produtosid_prod: TFDAutoIncField;
    SQL_produtosdescricao: TStringField;
    SQL_produtospreco_venda: TFloatField;
    TB_clientesid_cli: TFDAutoIncField;
    TB_clientesnome: TStringField;
    TB_clientescidade: TStringField;
    TB_clientesuf: TStringField;
    SQL_pedidos_dados_gerais: TFDQuery;
    ds_pedidos_dados_gerais: TDataSource;
    TB_pedidos_dados_gerais: TFDTable;
    SQL_pedido: TFDQuery;
    ds_pedido: TDataSource;
    SQL_pedidoNumeroPedido: TIntegerField;
    SQL_pedidos_produtos: TFDQuery;
    ds_pedidos_produtos: TDataSource;
    SQL_Padrao: TFDQuery;
    ds_total_pedido: TDataSource;
    SQL_pedidos_produtositem: TFDAutoIncField;
    SQL_pedidos_produtosqtde: TIntegerField;
    SQL_pedidos_produtosvlr_unit: TFloatField;
    SQL_pedidos_produtosvlr_total: TFloatField;
    SQL_pedidos_produtosnum_pedido: TIntegerField;
    SQL_pedidos_produtosprodutos_id_prod: TIntegerField;
    SQL_pedidos_produtosDescricao: TStringField;
    procedure conexaoBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  DM: TDM;

implementation

uses
  Vcl.Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.conexaoBeforeConnect(Sender: TObject);
var
  SERVER, DATABASE, USER, SENHA, LIB: string;
  PORTA: integer;
  CONF: TIniFile;
begin

  // setando os dados do arquivo ini
  SetCurrentDir(ExtractFilePath(Application.ExeName));
  CONF := TIniFile.Create(GetCurrentDir + '\conf.ini');

  LIB := GetCurrentDir + '\libmysql.dll';


  DATABASE := CONF.ReadString('banco','database','');
  SERVER   := CONF.ReadString('banco','server','');
  USER     := CONF.ReadString('banco','user','');
  SENHA    := CONF.ReadString('banco','senha','');
  PORTA    := StrToInt(CONF.ReadString('banco','porta',''));

  { dados da conexão do banco de dados dinâmico }

  // fecha conexao
  conexao.Connected := False;

  // passo os parâmetros
  mysql_link.VendorLib := LIB;
  mysql_link.DriverID := 'MySQL';
  conexao.DriverName := 'MySQL';

  conexao.Params.Add('Database='+DATABASE);
  conexao.Params.Add('Server='+SERVER);
  conexao.Params.Add('User_name='+USER);
  conexao.Params.Add('Password='+SENHA);
  conexao.Params.Add('Port='+IntToStr(PORTA));

//  try
//    // abro a conexão
//    conexao.Connected := True;
//  except
//    ShowMessage('Banco de dados não conectado');
//  end;

end;



end.
