unit U_PDV;

interface

uses

  WK.Cliente,
  WK.Produto,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  Tfrm_pdv = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label3: TLabel;
    lbl_Buscar_Cod_Servico: TLabel;
    edt_Cod_Cli: TEdit;
    edt_Desc_Ser: TEdit;
    Label1: TLabel;
    edt_Cod_Prod: TEdit;
    edt_Desc_Prod: TEdit;
    edt_Hora: TEdit;
    edt_Data: TEdit;
    edt_Num_Pedido: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Panel2: TPanel;
    edt_Qtde: TEdit;
    Label2: TLabel;
    Label10: TLabel;
    edt_Preco_Venda: TEdit;
    Label11: TLabel;
    edt_Total: TEdit;
    btn_Gravar: TButton;
    Label12: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Button3: TButton;
    Label15: TLabel;
    Edit12: TEdit;
    Label16: TLabel;
    Label17: TLabel;
    procedure edt_Desc_SerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label17Click(Sender: TObject);
    procedure Label16Click(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure btn_GravarClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure edt_Cod_ProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_Desc_ProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edt_Cod_CliKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_QtdeExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_Cod_CliExit(Sender: TObject);
  private
    procedure CalculaTotal;
    function RemoveCaracteres(const chrs: array of Char; const texto: string): string;
    function ReplaceSTR(var s: string; oldPattern: string; newPattern: string): string;
    { Private declarations }
  public
    ID_Produto, ID_Venda: Longint;
    { Public declarations }
  end;

var
  frm_pdv: Tfrm_pdv;

implementation

{$R *.dfm}

uses U_dm, U_Pesquisa;

procedure Tfrm_pdv.CalculaTotal;
var
  VlrTotal : Real;
begin

      with DM.SQL_PADRAO do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT SUM(vlr_total) TOTAL FROM pedidos_produtos ' +
                'WHERE NUM_PEDIDO = :NUM_PEDIDO');
        ParamByName('NUM_PEDIDO').AsInteger:=StrToInt(edt_Num_Pedido.Text);
        Open;

        if RecordCount > 0 then
          Edit12.Text := FieldByName('Total').AsString;

        VlrTotal := FieldByName('Total').AsFloat;
      end;

      with DM.SQL_PADRAO do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Update pedidos_dados_gerais set valor_total = ' + FloatToStr(VlrTotal) +
                ' WHERE NUM_PEDIDO = :NUM_PEDIDO ');
        ParamByName('NUM_PEDIDO').AsInteger:=StrToInt(edt_Num_Pedido.Text);
        ExecSQL;
        Close;
      end;

      with DM.SQL_pedidos_produtos do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select pp.*, p.Descricao from pedidos_produtos pp '+
                '        left join Produtos p on p.id_prod = pp.produtos_id_prod ' +
                'WHERE NUM_PEDIDO = :NUM_PEDIDO '+
                'order by item ');
        ParamByName('NUM_PEDIDO').AsInteger:=StrToInt(edt_Num_Pedido.Text);
        Open;
      end;

end;

procedure Tfrm_pdv.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
      with DM.SQL_Padrao do
      begin
        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM pedidos_produtos where item = :item ');
        ParamByName('item').Value := DM.SQL_pedidos_produtos.FieldByName('item').AsInteger;
        ExecSQL;

        CalculaTotal;
        //if RecordCount = 1 then
          //edt_Nome_Cli.Text := DM.SQL_clientesnome.AsString;

      end; // fim do with
  end;
end;

procedure Tfrm_pdv.btn_GravarClick(Sender: TObject);
var
  item : Integer;
begin

//  if ID_Venda = 0 then
//    ID_Venda := Gerar_Numero_Venda;


//  if not incluir_Item(Id_Venda, Id_Produto,Qtde,Unitario,Total,vResult) then
//    ShowMessage(vResult);

  Id_Produto :=0;

  with DM.SQL_pedidos_produtos do
  begin
    //StrToFloat(RemoveCaracteres(['.'], Trim(edt_Preco_Venda.Text)));
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO pedidos_produtos (qtde, vlr_unit, vlr_total, num_pedido, produtos_id_prod) VALUES (:qtde, :vlr_unit, :vlr_total, :num_pedido, :produtos_id_prod) ');
    ParamByName('qtde').AsInteger := StrToInt(edt_Qtde.Text);
    ParamByName('vlr_unit').AsFloat := StrToFloat(RemoveCaracteres(['.'], Trim(edt_Preco_Venda.Text)));
    ParamByName('vlr_total').AsFloat := StrToFloat(RemoveCaracteres(['.'], Trim(edt_Total.Text)));
    ParamByName('num_pedido').AsInteger := StrToInt(edt_Num_Pedido.Text);
    ParamByName('produtos_id_prod').AsInteger := StrToInt(edt_Cod_Prod.Text);
    ExecSQL;

    //if RecordCount = 1 then
      //edt_Nome_Cli.Text := DM.SQL_clientesnome.AsString;
  end; // fim do with

  CalculaTotal;

  edt_Cod_Prod.Text    := '';
  edt_Desc_Prod.Text   := '';
  edt_Qtde.Text        := '1';
  edt_Preco_Venda.Text := '0,00';
  edt_Total.Text       := '0,00';

  edt_Cod_Prod.SetFocus;
end;

procedure Tfrm_pdv.Button2Click(Sender: TObject);
begin

  //Grava_Venda; //incluir todos os dados da venda na tabela pedido ex: qtde itens total dos produtos, total geral, acrescimo e desconto

  ID_Produto :=0;
  ID_Venda :=0;
end;

procedure Tfrm_pdv.Button3Click(Sender: TObject);
begin
  //Cancelar_Venda; // Remover todos os itens do id=id_venda natabela itens

  ID_Produto :=0;
  ID_Venda   :=0;

  DM.SQL_pedidos_dados_gerais.Close;

  Application.Terminate;

end;

procedure Tfrm_pdv.edt_Cod_CliExit(Sender: TObject);
begin
  if edt_Cod_Cli.Text <> '' then
  begin
      with DM.SQL_pedidos_dados_gerais do
      begin
        btn_Gravar.Enabled := True;
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO pedidos_dados_gerais (valor_total, clientes_id) VALUES (:valor_total, :clientes_id) ');
        ParamByName('valor_total').Value := '0.00';
        ParamByName('clientes_id').Value := edt_Cod_Cli.Text;
        ExecSQL;

        //if RecordCount = 1 then
          //edt_Nome_Cli.Text := DM.SQL_clientesnome.AsString;

      end; // fim do with

      DM.SQL_pedido.Active := True;

      with DM.SQL_pedido do
      begin

        Close;
        SQL.Clear;
        SQL.Add('SELECT MAX(num_pedido) AS NumeroPedido FROM pedidos_dados_gerais');
        Open;

        if RecordCount = 1 then
          //lbl_Num_Pedido.Caption := DM.SQL_pedidoNumeroPedido.AsString;
          edt_Num_Pedido.Text := DM.SQL_pedidoNumeroPedido.AsString;

      end; // fim do with

  end;
end;

procedure Tfrm_pdv.edt_Cod_CliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Cliente        : TCliente;
  vNome, vResult : String;
  VQtdRegistro, vCodigo        : Longint;

begin

  DM.SQL_clientes.Fields.Clear;

  case key of

    VK_RETURN : begin

      Cliente := TCliente.Create(DM.conexao);
      try


        VQtdRegistro := Cliente.Retorna_Dados_Cliente(edt_Cod_Cli.Text,vCodigo,vNome,DM.SQL_clientes,vResult);

        if VQtdRegistro = 0 then
          ShowMessage(vResult);

        if VQtdRegistro = 1  then begin
          edt_Cod_Cli.Text := FormatFloat('000000',vCodigo);
          edt_Desc_Ser.Text := vNome;
          //btn_Gerar_Pedido.Enabled := True;
        end;

        if VQtdRegistro > 1  then begin

          DM.SQL_clientes.Open;

          frm_Pesquisa := Tfrm_Pesquisa.Create(Self);
          frm_Pesquisa.flag := 'Cliente';
          frm_Pesquisa.edt_Cod.Text := Edt_Cod_Cli.Text;
          frm_Pesquisa.ShowModal;

        end;

      finally
        Cliente.Free;
      end;

    end;

  end;
end;

procedure Tfrm_pdv.edt_Cod_ProdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Produto        : TProduto;
  vNome, vResult : String;
  VQtdRegistro, vCodigo        : Longint;
  vPreco_Venda : Currency;
begin

  //DM.SQL_produtos.Open();
  //DM.SQL_produtos.ClearFields;

case key of

    VK_RETURN : begin

      Produto := TProduto.Create(DM.conexao);
      try


        VQtdRegistro := Produto.Retorna_Dados_Produto(edt_Cod_Prod.Text,vCodigo,vNome, vPreco_Venda,DM.SQL_produtos,vResult);

        if VQtdRegistro = 0 then
          ShowMessage(vResult);

        if VQtdRegistro = 1  then
        begin
          edt_Cod_Prod.Text := FormatFloat('000000',vCodigo);
          edt_Desc_Prod.Text := vNome;
          edt_Preco_Venda.text := FormatFloat(',0.00', vPreco_Venda);
        end;

        if VQtdRegistro > 1  then
        begin
          frm_Pesquisa := Tfrm_Pesquisa.Create(Self);
          frm_Pesquisa.dbg_Listar.DataSource := DM.ds_servicos;
          frm_Pesquisa.dbg_Listar.Columns.Clear;
          frm_Pesquisa.flag := 'Produto';
          frm_Pesquisa.edt_Cod.Text := edt_cod_prod.Text;
          frm_Pesquisa.ShowModal;
          DM.SQL_produtos.Open;
        end;

      finally
        Produto.Free;
      end;

    end;

  end;
end;

procedure Tfrm_pdv.edt_Desc_ProdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case key of

    VK_F2 :
    begin
      frm_Pesquisa := Tfrm_Pesquisa.Create(Self);
      frm_Pesquisa.ShowModal;
    end;


  end;
end;

procedure Tfrm_pdv.edt_Desc_SerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

 case key of

    VK_F2 :
    begin
      frm_Pesquisa := Tfrm_Pesquisa.Create(Self);
      frm_Pesquisa.ShowModal;
    end;


  end;






end;

procedure Tfrm_pdv.edt_QtdeExit(Sender: TObject);
var
  //Total : Real;
  Total: Double;
begin
  Total := 0;

  Total := StrToFloat(Trim(edt_Qtde.Text)) *
           StrToFloat(RemoveCaracteres(['.'], Trim(edt_Preco_Venda.Text)));
           //StrToFloat(StringReplace(Trim(edt_Preco_Venda.Text)),
           //[
           //;


  //StrToFloat(edt_Qtde.Text) *
  edt_Preco_Venda.Text := FormatFloat(',0.00', StrToFloat(RemoveCaracteres(['.'], Trim(edt_Preco_Venda.Text))));

  edt_Total.Text := FormatFloat(',0.00', Total);

end;

procedure Tfrm_pdv.FormClick(Sender: TObject);
begin
  ID_Venda   :=0;
  ID_Produto :=0;
end;

procedure Tfrm_pdv.FormCreate(Sender: TObject);
begin
  DM := TDM.Create(self);

  edt_Data.Text := formatdatetime('dd/mm/yyyy', date);
  edt_Hora.Text := formatdatetime('hh:mm', time);

  if edt_Cod_Cli.Text = '' then
    //btn_Gerar_Pedido.Enabled := False;

end;

procedure Tfrm_pdv.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
end;

procedure Tfrm_pdv.Label16Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_pdv.Label17Click(Sender: TObject);
begin
  Application.Minimize;
end;

procedure Tfrm_pdv.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

  ReleaseCapture;
  SendMessage(Handle, wm_SysCommand,$f012,0);

end;

function Tfrm_pdv.RemoveCaracteres(const chrs: array of Char;
  const texto: string): string;
var
  i: Integer;
begin
  Result := texto;
  for i := Low(chrs) to High(chrs) do
    Result := ReplaceSTR(Result, chrs[i], '');
end;

function Tfrm_pdv.ReplaceSTR(var s: string; oldPattern,
  newPattern: string): string;
begin
  s := StringReplace(s, oldPattern, newPattern, [rfReplaceAll, rfIgnoreCase]);
  Result := s;
end;

end.
