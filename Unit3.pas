unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Win.ADODB, Datasnap.DBClient;

type
  TForm3 = class(TForm)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}
procedure FixDBGridColumnsWidth(const DBGrid: TDBGrid);
var i : integer; TotWidth : integer; VarWidth : integer; ResizableColumnCount : integer; AColumn : TColumn;
begin//total width of all columns before resize
 TotWidth := 0;
 //how to divide any extra space in the grid
 VarWidth := 0;
 //how many columns need to be auto-resized
 ResizableColumnCount := 0;
   for i := 0 to -1 + DBGrid.Columns.Count do begin
     TotWidth := TotWidth + DBGrid.Columns[i].Width;
     if DBGrid.Columns[i].Field.Tag=0 then
     Inc(ResizableColumnCount);
   end;
 //add 1px for the column separator lineif dgColLines in DBGrid.Options then
 TotWidth := TotWidth + DBGrid.Columns.Count;
 //add indicator column widthif dgIndicator in DBGrid.Options then
 TotWidth := TotWidth + IndicatorWidth;
 //width vale "left"
 VarWidth := DBGrid.ClientWidth - TotWidth;
 //Equally distribute VarWidth
 //to all auto-resizable columnsif ResizableColumnCount > 0 then
 VarWidth := varWidth div ResizableColumnCount;
   for i := 0 to -1 + DBGrid.Columns.Count do begin
   AColumn := DBGrid.Columns[i];
   if AColumn.Field.Tag=0 then
     begin
     AColumn.Width := AColumn.Width + VarWidth;
     if AColumn.Width <>0 then
      AColumn.Width := AColumn.Field.Tag;
     end;
   end;
end; (*FixDBGridColumnsWidth*)

procedure TForm3.FormCreate(Sender: TObject);
begin
    FDconnection1.Connected:=True;
    FDquery1.Active:=True;
    DbGrid1.Enabled:=True;
end;

procedure TForm3.FormResize(Sender: TObject);
begin FixDBGridColumnsWidth(DBGrid1); end;

end.
