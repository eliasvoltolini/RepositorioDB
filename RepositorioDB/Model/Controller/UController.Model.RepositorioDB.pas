unit UController.Model.RepositorioDB;

interface

uses
  System.SysUtils, UInterface.Model.Interfaces, UEntidade.Model.RepositorioDB;

type
  TControllerDB = class
  public
    constructor Create;
    destructor Destroy; override;

    class function Repositorio : iRepositorioDB;
  end;

implementation

{ TController }

constructor TControllerDB.Create;
begin

end;

destructor TControllerDB.Destroy;
begin

  inherited;
end;

class function TControllerDB.Repositorio: iRepositorioDB;
begin
  Result := TRepositorioDB.New;
end;

end.
