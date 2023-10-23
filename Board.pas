unit Board;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
  TTurn = (ttX, ttO);
  TItemStatus = (tsClean, tsX, tsO);
  TMatchResult = (trPlaying, trTie, trX, trO);
  TBoard = class
  private
    FTurn: TTurn;
    FBoard: array[0..8] of TItemStatus;
    FMatchResult: TMatchResult;
    function GetNextItemStatus: TItemStatus;
    function GetNextTurn: TTurn;
    function GetMatchResult(AIndex: Integer): TMatchResult;
  public
    property Turn: TTurn read FTurn;
    property MatchResult: TMatchResult read FMatchResult;
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
  FMatchResult := trPlaying;
end;

function TBoard.GetItemStatus(AIndex: Integer): TItemStatus;
begin
  Result := FBoard[AIndex];
end;

procedure TBoard.SelectItem(AIndex: Integer);
begin
  if MatchResult <> trPlaying then Exit;
  if FBoard[AIndex] <> tsClean then Exit;

  FBoard[AIndex] := GetNextItemStatus;
  FTurn := GetNextTurn;
  FMatchResult := GetMatchResult(AIndex);
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

function TBoard.GetMatchResult(AIndex: Integer): TMatchResult;
begin
  { TODO: Estimate match result }
  Result := trPlaying;
end;

end.

