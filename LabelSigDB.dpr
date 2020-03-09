Library LabelSigDB;

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,

  ScanUnit,
  RegCallBackUnit,

  _scriptapi_stack,
  _scriptapi_symbol,
  bridgegraph,
  bridgelist,
  bridgemain,
  TitanEngine,
  _dbgfunctions,
  _plugins,
  _plugins_type,
  _scriptapi_argument,
  _scriptapi_assembler,
  _scriptapi_bookmark,
  _scriptapi_comment,
  _scriptapi_debug,
  _scriptapi_flag,
  _scriptapi_function,
  _scriptapi_gui,
  _scriptapi_label,
  _scriptapi_memory,
  _scriptapi_misc,
  _scriptapi_module,
  _scriptapi_pattern,
  _scriptapi_register;

//{$PointerMath ON}//Pointer on? ;s

  //  {$PointerMath OFF}//Pointer off? ;s


{$I dbg.inc}
  //{$DEFINE WIN64}

	{$IFDEF WIN64}
  	{$ALIGN 8}									                // Struct byte alignment
	  {$E dp64}                            // Extension supported is 3 in Delphi 7
  {$ELSE}
   	{$ALIGN 4}									                // Struct byte alignment
    {$E dp32}
  {$ENDIF}



var
  SaveDLLProc:        TDLLProc;
  g_pluginHandle: THandle  = 0;
  ss:ULONG_PTR =0;


  g_hWnD: Cardinal         = 0;


const
{$ifdef win64}
    PLUGIN_NAME: PAChar      = 'x64dbg_LabelSigDB';
{$else}
    PLUGIN_NAME: PAChar      = 'x32dbg_LabelSigDB';
{$endif}
  PLUGIN_AUTH: PAChar      = '_pusher_';
  PLUGIN_VERS: Integer     = 1;







//Plugin init
function pluginit(PlugInitInfo: PPLUG_INITSTRUCT): Boolean; cdecl;
begin
   RegCallBack := TRegeditCallBack.Create(PlugInitInfo^.pluginHandle);

   RegCallBack.RegisterCallBack;
   (*
    if not FileExists(ExtractFilePath(ParamStr(0))+'..\json_db') then
      ForceDirectories(ExtractFilePath(ParamStr(0))+'..\json_db');
      *)

    PlugInitInfo^.sdkVersion:= PLUG_SDKVERSION;
    PlugInitInfo^.PluginVersion:= PLUGIN_VERS;
    lstrcpyA(PlugInitInfo^.pluginName,PLUGIN_NAME);
    Result:= True;
end;

 //plugin setup
procedure plugsetup(PlugSetupInfo: PPLUG_SETUPSTRUCT); cdecl;
begin

  //_plugin_menuaddentry(  g_hDisasm,GUI_SCAN,'Scan Selected');
  _plugin_MenuAddEntry( PlugSetupInfo.hMenuDisasm,GUI_SCAN,'test');


  RegCallBack.plugsetup(PlugSetupInfo);
end;








//plugin stop
function plugstop(): Boolean; cdecl;
begin
  RegCallBack.UnRegisterCallBack;
  Result:= RegCallBack.plugstop;
  if Assigned(RegCallBack) then
    FreeAndNil(RegCallBack);
end;


exports
  pluginit,              //plugin-init
  plugsetup,             //plugin-setup
  plugstop;              //plugin-stop

procedure DLLEntryPoint(dwReason: DWORD);
begin
  case dwReason of
    DLL_PROCESS_ATTACH:
    begin
      //
    end;
    DLL_PROCESS_DETACH:
    begin
      // Uninitialize code here
    end;
  end;
  // Call saved entry point procedure
  if Assigned(SaveDLLProc) then SaveDLLProc(dwReason);
end;

begin

  SaveDLLProc:= @DLLProc;
  DLLProc:= @DLLEntryPoint;
end.
