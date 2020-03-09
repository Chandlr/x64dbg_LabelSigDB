{
Ported form _scriptapi_debug.h x64 and x32 to Unit Delphi by Lonely
FixCode:https://gitee.com/suxuss/DELPHI-x96dbg-Plugins-SDK
}

unit _scriptapi_debug;

interface
uses
  Winapi.Windows,_plugins_type,bridgemain,bridgelist,_plugins;

{$I dbg.inc}

type
  HardwareType = (
  {$Z4+}
    HardwareAccess,
    HardwareWrite,
    HardwareExecute
  {$Z4-}
  );



{SCRIPT_EXPORT void} procedure Wait();  cdecl; external x32DBG name '?Wait@Debug@Script@@YAXXZ';
{SCRIPT_EXPORT void} procedure Run();  cdecl; external x32DBG name '?Run@Debug@Script@@YAXXZ';
{SCRIPT_EXPORT void} procedure Pause();  cdecl; external x32DBG name '?Pause@Debug@Script@@YAXXZ';
{SCRIPT_EXPORT void} procedure Stop();  cdecl; external x32DBG name '?Stop@Debug@Script@@YAXXZ';
{SCRIPT_EXPORT void} procedure StepIn();  cdecl; external x32DBG name '?StepIn@Debug@Script@@YAXXZ';
{SCRIPT_EXPORT void} procedure StepOver();  cdecl; external x32DBG name '?StepOver@Debug@Script@@YAXXZ';
{SCRIPT_EXPORT void} procedure StepOut();  cdecl; external x32DBG name '?StepOut@Debug@Script@@YAXXZ';

{$IFDEF WIN64}
{SCRIPT_EXPORT bool} function SetBreakpoint(address:duint):Boolean;  cdecl; external x32DBG name '?SetBreakpoint@Debug@Script@@YA_N_K@Z';
{SCRIPT_EXPORT bool} function DeleteBreakpoint(address:duint):Boolean;  cdecl; external x32DBG name '?DeleteBreakpoint@Debug@Script@@YA_N_K@Z';
{SCRIPT_EXPORT bool} function DisableBreakpoint(address:duint):Boolean;  cdecl; external x32DBG name '?DisableBreakpoint@Debug@Script@@YA_N_K@Z';
{SCRIPT_EXPORT bool} function SetHardwareBreakpoint(address:duint;Hardware:HardwareType = HardwareExecute):Boolean;  cdecl; external x32DBG name '?SetHardwareBreakpoint@Debug@Script@@YA_N_KW4HardwareType@12@@Z';
{SCRIPT_EXPORT bool} function DeleteHardwareBreakpoint(address:duint):Boolean;  cdecl; external x32DBG name '?DeleteHardwareBreakpoint@Debug@Script@@YA_N_K@Z';
{$ELSE}
{SCRIPT_EXPORT bool} function SetBreakpoint(address:duint):Boolean;  cdecl; external x32DBG name '?SetBreakpoint@Debug@Script@@YA_NK@Z';
{SCRIPT_EXPORT bool} function DeleteBreakpoint(address:duint):Boolean;  cdecl; external x32DBG name '?DeleteBreakpoint@Debug@Script@@YA_NK@Z';
{SCRIPT_EXPORT bool} function DisableBreakpoint(address:duint):Boolean;  cdecl; external x32DBG name '?DisableBreakpoint@Debug@Script@@YA_NK@Z';
{SCRIPT_EXPORT bool} function SetHardwareBreakpoint(address:duint;Hardware:HardwareType = HardwareExecute):Boolean;  cdecl; external x32DBG name '?SetHardwareBreakpoint@Debug@Script@@YA_NKW4HardwareType@12@@Z';
{SCRIPT_EXPORT bool} function DeleteHardwareBreakpoint(address:duint):Boolean;  cdecl; external x32DBG name '?DeleteHardwareBreakpoint@Debug@Script@@YA_NK@Z';
{$ENDIF}




implementation

end.
