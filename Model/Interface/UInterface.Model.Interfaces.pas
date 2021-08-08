unit UInterface.Model.Interfaces;

interface

type
  iRepositorioDB = interface
    ['{139D884E-27F5-403D-A3A6-BC4C0A2D55F2}']
    function Tabela(Nome: String): iRepositorioDB;
    function AddCampo(Nome: String): iRepositorioDB; overload;
    function AddCampo(Nome, Valor: String): iRepositorioDB; overload;
    function AddWhere(Campo, Valor: String; Condicao: String = '='): iRepositorioDB;
    function AddGroup(Campo: String): iRepositorioDB;
    function AddOrder(Campo: String): iRepositorioDB;

    function AsClear(): iRepositorioDB;
    function AsSelect(): String;
    function AsInsert(): String;
    function AsUpdate(): String;
    function AsDelete(): String;
  end;

implementation

end.
