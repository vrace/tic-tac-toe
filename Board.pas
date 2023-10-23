unit Board;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
  TTurn = (ttX, ttO);
  TItemStatus = (tsClean, tsX, tsO);
  TBoard = class
  private
    FTurn: TTurn;
    FBoard: array[0..8] of TItemStatus;
    function GetNextItemStatus: TItemStatus;
    function GetNextTurn: TTurn;
  public
    property Turn: TTurn read FTurn;
    constructor Create;
    procedure StartOver;
    function GetItemStatus(AIndex: Integer): TItemStatus;
    procedure SelectItem(AIndex: Integer);
  end;

implementation

constructor TBoard.Create;
begin
  StartOver;
end;

procedure TBoard.StartOver;
var
  i: Integer;
begin
  FTurn := ttX;
  for i := 0 to Length(FBoard) - 1 do begin
    FBoard[i] := tsClean;
  end;
end;

function TBoard.GetItemStatus(AIndex: Integer): TItemStatus;
begin
  Result := FBoard[AIndex];
end;

procedure TBoard.SelectItem(AIndex: Integer);
begin
  if FBoard[AIndex] <> tsClean then Exit;
  FBoard[AIndex] := GetNextItemStatus;
  FTurn := GetNextTurn;
end;

function TBoard.GetNextItemStatus: TItemStatus;
begin
  case FTurn of
  ttX: Result := tsX;
  ttO: Result := tsO;
  end;
end;

function TBoard.GetNextTurn: TTurn;
begin
  case FTurn of
  ttX: Result := ttO;
  ttO: Result := ttX;
  end;
end;

end.



