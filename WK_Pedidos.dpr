program WK_Pedidos;

uses
  Vcl.Forms,
  U_PDV in 'U_PDV.pas' {frm_pdv},
  U_dm in 'U_dm.pas' {DM: TDataModule},
  U_Pesquisa in 'U_Pesquisa.pas' {frm_Pesquisa},
  WK.Cliente in 'Classe\WK.Cliente.pas',
  WK.Produto in 'Classe\WK.Produto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_pdv, frm_pdv);
  Application.Run;
end.
