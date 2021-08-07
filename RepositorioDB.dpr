program RepositorioDB;

uses
  Vcl.Forms,
  UFrmPrincipal in 'Views\UFrmPrincipal.pas' {FrmPrincipal},
  UInterface.Model.Interfaces in 'Model\Interface\UInterface.Model.Interfaces.pas',
  UEntidade.Model.RepositorioDB in 'Model\Entidade\UEntidade.Model.RepositorioDB.pas',
  UController.Model.RepositorioDB in 'Model\Controller\UController.Model.RepositorioDB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
