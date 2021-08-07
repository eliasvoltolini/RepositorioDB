unit UEntidade.Model.RepositorioDB;

interface

uses
  System.Classes, System.SysUtils, UInterface.Model.Interfaces;

type
  TRepositorioDB = class(TInterfacedObject, iRepositorioDB)
  private
    FTabela  : String;
    FSql     : TStringList;
    FCampos  : TStringList;
    FValores : TStringList;
    FWhere   : TStringList;
    FGroup   : TStringList;
    FOrder   : TStringList;

    function Tabela(Nome: String): iRepositorioDB;
    function AddCampo(Nome: String): iRepositorioDB; overload;
    function AddCampo(Nome, Valor: String): iRepositorioDB; overload;
    function AddWhere(Campo, Valor: String; Condicao: String = '='): iRepositorioDB;
    function AddGroup(Campo: String): iRepositorioDB;
    function AddOrder(Campo: String): iRepositorioDB;
    function Limpa(): iRepositorioDB;

    function AsSelect(): String;
    function AsInsert(): String;
    function AsUpdate(): String;
    function AsDelete(): String;

  public
    constructor Create;
    destructor Destroy; override;

    class function New: iRepositorioDB;
  end;

implementation

{ TModelRepositorioDB }

const
  CNT_SELECT = 'SELECT ';
  CNT_INSERT = 'INSERT INTO ';
  CNT_UPDATE = 'UPDATE ';
  CNT_DELETE = 'DELETE FROM ';
  CNT_WHERE  = 'WHERE ';
  CNT_GROUP  = 'GROUP BY ';
  CNT_ORDER  = 'ORDER BY ';

constructor TRepositorioDB.Create;
begin
  FTabela  := EmptyStr;
  FSql     := TStringList.Create;
  FCampos  := TStringList.Create;
  FValores := TStringList.Create;
  FWhere   := TStringList.Create;
  FGroup   := TStringList.Create;
  FOrder   := TStringList.Create;
end;

destructor TRepositorioDB.Destroy;
begin
  FSql.Free;
  FCampos.Free;
  FValores.Free;
  FWhere.Free;
  FGroup.Free;
  FOrder.Free;
  inherited;
end;

class function TRepositorioDB.New: iRepositorioDB;
begin
  Result := Self.Create;
end;

function TRepositorioDB.Tabela(Nome: String): iRepositorioDB;
begin
  Result  := Self;
  FTabela := Nome;
end;

function TRepositorioDB.AddCampo(Nome: String): iRepositorioDB;
begin
  Result := Self;
  FCampos.Add(Nome);
end;

function TRepositorioDB.AddCampo(Nome, Valor: String): iRepositorioDB;
begin
  Result := Self;
  FCampos.Add(Nome);
  FValores.Add(Valor);
end;

function TRepositorioDB.AddWhere(Campo, Valor, Condicao: String): iRepositorioDB;
begin
  Result := Self;

  if FWhere.Count = 0 then
    FWhere.Add(CNT_WHERE + Campo + Condicao + Valor.QuotedString)
  else
    FWhere.Add(' AND ' + Campo + Condicao + Valor.QuotedString);
end;

function TRepositorioDB.AddGroup(Campo: String): iRepositorioDB;
begin
  Result := Self;

  if FGroup.Count = 0 then
    FGroup.Add(CNT_GROUP + Campo)
  else
    FGroup.Add(', ' + Campo);
end;

function TRepositorioDB.AddOrder(Campo: String): iRepositorioDB;
begin
  Result := Self;

  if FGroup.Count = 0 then
    FGroup.Add(CNT_ORDER + Campo)
  else
    FGroup.Add(', ' + Campo);
end;

function TRepositorioDB.AsSelect: String;
var i : Integer;
begin
  FSql.Add(CNT_SELECT);

  for i := 0 to Pred(FCampos.Count) do
  begin
    if i = Pred(FCampos.Count) then
      FSql.Add(FCampos[i] + ' ')
    else
      FSql.Add(FCampos[i] + ', ');
  end;

  FSql.Add('FROM ' + FTabela + ' ');

  if FWhere.Count > 0 then
    FSql.Add(FWhere.Text + ' ');

  if FGroup.Count > 0 then
    FSql.Add(FGroup.Text + ' ');

  if FOrder.Count > 0 then
    FSql.Add(FOrder.Text + ' ');

  Result := Trim(FSql.Text) + ';';
end;

function TRepositorioDB.AsInsert: String;
var i : Integer;
begin
  FSql.Add(CNT_INSERT + FTabela + ' (');

  for i := 0 to Pred(FCampos.Count) do
  begin
    if i = Pred(FCampos.Count) then
      FSql.Add(FCampos[i] + ') ')
    else
      FSql.Add(FCampos[i] + ', ')
  end;

  FSql.Add('VALUE (');

  for i := 0 to Pred(FValores.Count) do
  begin
    if i = Pred(FValores.Count) then
      FSql.Add(FValores[i].QuotedString + ') ')
    else
      FSql.Add(FValores[i].QuotedString + ', ');
  end;

  Result := Trim(FSql.Text) + ';';
end;

function TRepositorioDB.AsUpdate: String;
var i : Integer;
begin
  FSql.Add(CNT_UPDATE + FTabela + ' SET ');

  for i := 0 to Pred(FCampos.Count) do
  begin
    if i = Pred(FCampos.Count) then
      FSql.Add(FCampos[i] + '=' + FValores[i].QuotedString + ' ')
    else
      FSql.Add(FCampos[i] + '=' + FValores[i].QuotedString + ', ');
  end;

  if FWhere.Count > 0 then
    FSql.Add(FWhere.Text);

  Result := Trim(FSql.Text) + ';';
end;

function TRepositorioDB.AsDelete: String;
begin
  FSql.Add(CNT_DELETE + FTabela + ' ');

  if FWhere.Count > 0 then
    FSql.Add(FWhere.Text);

  Result := Trim(FSql.Text) + ';';
end;

function TRepositorioDB.Limpa(): iRepositorioDB;
begin
  Result  := Self;
  FTabela := EmptyStr;

  FSql.Clear;
  FCampos.Clear;
  FValores.Clear;
  FWhere.Clear;
  FGroup.Clear;
  FOrder.Clear;
end;

end.
