unit AdvancedDriverAssistanceSystemPluginMain;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Dialogs,
  Forms,
  PluginCore;

type
  TF8AdvancedDriverAssistanceSystemPlugin = class(TF8PLuginClass)
    private
      { Private declarations }
        p_Ribbon : IF8Ribbon;
        p_RibbonTab : IF8RibbonTab;
        p_RibbonGroup : IF8RibbonGroup;

        p_winRoadApplication : IF8ApplicationServices;

        procedure AdvancedDriverAssistanceSystemMenuClick(Sender : TObject);

        procedure AbleMenus(enable : Boolean);

        procedure ProjectDestroyProc;
        procedure RemoveForms;

        procedure CreateRibbons;
        procedure FreeRibbons;

    public
      { Public declarations }
        procedure AfterConstruction; override;
        procedure BeforeDestruction; override;

        property winRoadApplication : IF8ApplicationServices read p_winRoadApplication;
    end;

    //Call back functions
  procedure RegisterUserPlugin(out optionName, apiVersion, Copyright : String);
  procedure LoadPlugin;
  procedure UnloadPlugin;

var
  F8AdvancedDriverAssistanceSystemPlugin : TF8AdvancedDriverAssistanceSystemPlugin;

implementation

uses
  AdvancedDriverAssistanceSystemForm,
  AdvancedDriverAssistanceSystemResource;

//==============================================================================
//   Register / Unregister the plugin
//==============================================================================
procedure RegisterUserPlugin(out optionName, apiVersion, Copyright : String);
  begin
    optionName := 'Advanced Driving Assistance System Plugin';
    APIVersion := PLUGIN_VERSION;
	  Copyright := 'FORUM8 Co., Ltd.';
  end;

procedure LoadPlugin;
  begin
  if not Assigned(F8AdvancedDriverAssistanceSystemPlugin) then
    F8AdvancedDriverAssistanceSystemPlugin := TF8AdvancedDriverAssistanceSystemPlugin.Create;
  if Assigned(F8AdvancedDriverAssistanceSystemPlugin) and Assigned(F8AdvancedDriverAssistanceSystemPlugin.winRoadApplication) then
    F8AdvancedDriverAssistanceSystemPlugin.winRoadApplication.RegisterPluginObject(F8AdvancedDriverAssistanceSystemPlugin);
  end;

procedure UnloadPlugin;
  begin
    if Assigned(F8AdvancedDriverAssistanceSystemPlugin) and Assigned(F8AdvancedDriverAssistanceSystemPlugin.winRoadApplication) then
        F8AdvancedDriverAssistanceSystemPlugin.winRoadApplication.UnRegisterPluginObject(F8AdvancedDriverAssistanceSystemPlugin);
    FreeAndNil(F8AdvancedDriverAssistanceSystemPlugin);
  end;

//==============================================================================
//  On plugin creation :
//     Gets the interface of the application.
//==============================================================================
procedure TF8AdvancedDriverAssistanceSystemPlugin.AfterConstruction;
  var
    method : TMethod;

  begin
    inherited;
    Supports(ApplicationServices, IF8ApplicationServices, p_winRoadApplication);

    CreateRibbons;

    PluginNotifyProc(method) := ProjectDestroyProc;
    p_winRoadApplication.RegisterEventHandler(_plgProjectDestroy, method);

    PluginAbleMenusProc(method) := AbleMenus;
    p_winRoadApplication.RegisterEventHandler(_plgPluginAbleMenus, method);
  end;

//==============================================================================
//  On plugin destruction :
//     Releases the interface of the application.
//==============================================================================
procedure TF8AdvancedDriverAssistanceSystemPlugin.BeforeDestruction;
  var
    method : TMethod;

  begin
    RemoveForms;
    FreeRibbons;

    PluginNotifyProc(method):= ProjectDestroyProc;
    p_winRoadApplication.UnRegisterEventHandler(_plgProjectDestroy,method);

    PluginAbleMenusProc(method):= AbleMenus;
    p_winRoadApplication.UnRegisterEventHandler(_plgPluginAbleMenus,method);

    p_winRoadApplication := nil;
  end;


procedure TF8AdvancedDriverAssistanceSystemPlugin.AdvancedDriverAssistanceSystemMenuClick(Sender: TObject);
  begin
    if not Assigned(FormAdvancedDriverAssistanceSystem) then
      Application.CreateForm(TFormAdvancedDriverAssistanceSystem, FormAdvancedDriverAssistanceSystem);
    FormAdvancedDriverAssistanceSystem.Show;
  end;


procedure TF8AdvancedDriverAssistanceSystemPlugin.AbleMenus(enable: Boolean);
  begin
    FormAdvancedDriverAssistanceSystemResource.ButtonAdvancedDriverAssistanceSystem.Enabled := enable;
  end;

procedure TF8AdvancedDriverAssistanceSystemPlugin.ProjectDestroyProc;
  begin
    RemoveForms;
  end;

procedure TF8AdvancedDriverAssistanceSystemPlugin.RemoveForms;
  begin
    if Assigned(FormAdvancedDriverAssistanceSystem) then
      FreeAndNil(FormAdvancedDriverAssistanceSystem);
  end;


//==============================================================================
//  Ribbon 만들고 해제하는 부분
//==============================================================================

procedure TF8AdvancedDriverAssistanceSystemPlugin.CreateRibbons;
  const
    PLUGIN_SAMPLE_TABCONTROLNAME = 'SDKPluginSample';
    PLUGIN_SAMPLE_TABCAPTION = 'SDK Plug-in';
    PLUGIN_SAMPLE_RIBBONGROUP_CONTROLNAME = 'ADAS';
    PLUGIN_SAMPLE_RIBBONGROUP_NAME = 'ADAS';

  begin
    if Assigned(p_winRoadApplication) and not Assigned(p_Ribbon) then
      begin
        p_Ribbon := p_winRoadApplication.mainForm.GetMainRibbonMenu;
        p_RibbonTab := p_winRoadApplication.mainForm.GetMainRibbonMenuTabByName(PLUGIN_SAMPLE_TABCONTROLNAME);

        if Assigned(p_Ribbon) and not Assigned(p_RibbonTab) then
          begin
            p_RibbonTab := p_Ribbon.CreateRibbonTab(PLUGIN_SAMPLE_TABCONTROLNAME, 10000);
            p_RibbonTab.Caption := PLUGIN_SAMPLE_TABCAPTION;
          end;
      end;

      p_RibbonGroup := p_RibbonTab.CreateRibbonGroup(PLUGIN_SAMPLE_RIBBONGROUP_CONTROLNAME, 2);
      p_RibbonGroup.Caption := PLUGIN_SAMPLE_RIBBONGROUP_NAME;

      if not assigned(FormAdvancedDriverAssistanceSystemResource) then
        FormAdvancedDriverAssistanceSystemResource := TFormAdvancedDriverAssistanceSystemResource.Create(nil);
      FormAdvancedDriverAssistanceSystemResource.ButtonAdvancedDriverAssistanceSystem.OnClick := AdvancedDriverAssistanceSystemMenuClick;

      if Assigned(p_RibbonGroup) then
        begin
          p_RibbonGroup.Width := FormAdvancedDriverAssistanceSystemResource.ButtonAdvancedDriverAssistanceSystem.Width;
          p_RibbonGroup.AddGroupControl(FormAdvancedDriverAssistanceSystemResource.ButtonAdvancedDriverAssistanceSystem);
        end;

      p_Ribbon := nil;

    end;

procedure TF8AdvancedDriverAssistanceSystemPlugin.FreeRibbons;
  begin
    if Assigned(FormAdvancedDriverAssistanceSystemResource) and Assigned(p_RibbonGroup) then
      begin
        p_RibbonGroup.RemoveGroupControl(FormAdvancedDriverAssistanceSystemResource.ButtonAdvancedDriverAssistanceSystem);
        FreeAndNil(FormAdvancedDriverAssistanceSystemResource);
      end;

    if Assigned(p_RibbonTab) then
      begin
        p_RibbonTab.DeleteGroup(p_RibbonGroup);
        p_RibbonGroup := nil;
      end;

    p_RibbonTab := nil;
    p_Ribbon := nil;
  end;

end.

