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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAdvancedDriverAssistanceSystem: TFormAdvancedDriverAssistanceSystem;

implementation

{$R *.dfm}

end.
