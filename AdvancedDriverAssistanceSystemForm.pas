unit AdvancedDriverAssistanceSystemForm;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  F8OpenGL,
  ComCtrls,
  F8RealSpinEdit,
  ExtCtrls,
  PluginCore;


type
  TFormAdvancedDriverAssistanceSystem = class(TForm)
    CheckBoxAdaptedCruiseControl: TCheckBox;
    CheckBoxLaneDepartureWarning: TCheckBox;
    CheckBoxLaneChanging: TCheckBox;
    CheckBoxLaneKeeping: TCheckBox;
    ButtonApply: TButton;

    procedure ButtonApplyClick(Sender : TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FormAdvancedDriverAssistanceSystem: TFormAdvancedDriverAssistanceSystem;

implementation

{$R *.dfm}

procedure TFormAdvancedDriverAssistanceSystem.ButtonApplyClick(Sender : TObject);
  var
    Message : string;
  begin
  Message := '';
  if CheckBoxAdaptedCruiseControl.Checked then
    Message := Message + 'ACC ';
  if CheckBoxLaneKeeping.Checked then
    Message := Message + 'LK ';
  if CheckBoxLaneChanging.Checked then
    Message := Message + 'LC ';
  if CheckBoxLaneDepartureWarning.Checked then
    Message := Message + 'LDW ';

    theApplicationServices.ShowMessageDlg(Message, mtError, [mbOK], 0);
  end;

end.
