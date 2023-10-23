program TicTacToe;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, BoardController, Board
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='Tic-Tac-Toe';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TBoardForm, BoardForm);
  Application.Run;
end.

