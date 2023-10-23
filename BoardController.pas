unit BoardController;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls, Board;

type

  { TBoardForm }

  TBoardForm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    LabelX: TLabel;
    LabelO: TLabel;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SelectBoardItem(Sender: TObject);
  private
    FBoardItems: array[0..8] of TBitBtn;
    FBoard: TBoard;

    procedure UpdateBoard;
    function GetSelectItemIndex(Sender: TObject): Integer;
  public

  end;

var
  BoardForm: TBoardForm;

implementation

{$R *.lfm}

{ TBoardForm }

procedure TBoardForm.FormCreate(Sender: TObject);
begin
  FBoard := TBoard.Create;
  FBoardItems[0] := BitBtn1;
  FBoardItems[1] := BitBtn2;
  FBoardItems[2] := BitBtn3;
  FBoardItems[3] := BitBtn4;
  FBoardItems[4] := BitBtn5;
  FBoardItems[5] := BitBtn6;
  FBoardItems[6] := BitBtn7;
  FBoardItems[7] := BitBtn8;
  FBoardItems[8] := BitBtn9;
end;

procedure TBoardForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FBoard);
end;

procedure TBoardForm.FormShow(Sender: TObject);
begin
  UpdateBoard;
end;

procedure TBoardForm.SelectBoardItem(Sender: TObject);
var
  selected: Integer;
begin
  selected := GetSelectItemIndex(Sender);
  FBoard.SelectItem(selected);
  UpdateBoard;
end;

function TBoardForm.GetSelectItemIndex(Sender: TObject): Integer;
var
  selected: TBitBtn;
  i: Integer;
begin
  selected := Sender as TBitBtn;
  Result := 0;
  for i := 0 to Length(FBoardItems) - 1 do begin
    if FBoardItems[i] = selected then Result := i;
  end;
end;

procedure TBoardForm.UpdateBoard;
var
  i: Integer;
begin
  LabelX.Color := clNone;
  if FBoard.Turn = ttX then LabelX.Color := clSkyBlue;

  LabelO.Color := clNone;
  if FBoard.Turn = ttO then LabelO.Color := clSkyBlue;

  for i := 0 to Length(FBoardItems) - 1 do begin
    case FBoard.GetItemStatus(i) of
    tsClean: FBoardItems[i].Caption := '';
    tsX: FBoardItems[i].Caption := 'X';
    tsO: FBoardItems[i].Caption := 'O';
    end;
  end;
end;

end.

