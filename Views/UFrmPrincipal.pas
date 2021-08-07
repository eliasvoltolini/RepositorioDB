unit UFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmPrincipal = class(TForm)
    mmMemo     : TMemo;
    btnSelect  : TSpeedButton;
    btnInsert  : TSpeedButton;
    btnUpdate  : TSpeedButton;
    btnDelete  : TSpeedButton;
    lbExemplos : TLabel;
    procedure btnSelectClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    FSql : String;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses UController.Model.RepositorioDB;

procedure TFrmPrincipal.btnSelectClick(Sender: TObject);
begin
  FSql := TControllerDB.Repositorio.Tabela('usuarios')
          .AddCampo('CODIGO')
          .AddCampo('NOME')
          .AddCampo('LOGIN')
          .AddCampo('SENHA')
          .AddCampo('PERFIL')
          .AddOrder('NOME').AsSelect;

  mmMemo.Text := FSql;
end;

procedure TFrmPrincipal.btnInsertClick(Sender: TObject);
begin
  FSql := TControllerDB.Repositorio.Tabela('usuarios')
          .AddCampo('CODIGO' , '1')
          .AddCampo('NOME'   , 'TESTE')
          .AddCampo('LOGIN'  , 'TESTE')
          .AddCampo('SENHA'  , '123')
          .AddCampo('PERFIL' , '1').AsInsert;

  mmMemo.Text := FSql;
end;

procedure TFrmPrincipal.btnUpdateClick(Sender: TObject);
begin
  FSql := TControllerDB.Repositorio.Tabela('usuarios')
          .AddCampo('NOME'   , 'TESTE')
          .AddCampo('LOGIN'  , 'TESTE')
          .AddCampo('SENHA'  , '123')
          .AddCampo('PERFIL' , '1')
          .AddWhere('CODIGO' , '1').AsUpdate;

  mmMemo.Text := FSql;
end;

procedure TFrmPrincipal.btnDeleteClick(Sender: TObject);
begin
  FSql := TControllerDB.Repositorio.Tabela('usuarios')
          .AddWhere('CODIGO', '1').AsDelete;

  mmMemo.Text := FSql;
end;

end.
