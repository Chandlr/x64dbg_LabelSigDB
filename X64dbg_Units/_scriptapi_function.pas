{
Ported form _scriptapi_function.h x64 and x32 to Unit Delphi by Lonely
FixCode:https://gitee.com/suxuss/DELPHI-x96dbg-Plugins-SDK
}
unit _scriptapi_function;

interface
uses
  Winapi.Windows,_plugins_type,bridgemain,bridgelist,_plugins;

{$I dbg.inc}
type
    FunctionInfo = packed record
      Fmod :array [0..MAX_MODULE_SIZE - 1] of Achar;
      rvaStart:duint;
      rvaEnd:duint;
      manual:Boolean;
      instructioncount:duint;
    end;
    PFunctionInfo = ^FunctionInfo;
{$ifdef win64}
{SCRIPT_EXPORT bool} function Add(start:duint; Fend:duint; manual:Boolean;instructionCount:duint = 0):Boolean;cdecl; external x32DBG name '?Add@Function@Script@@YA_N_K0_N0@Z';
{SCRIPT_EXPORT bool} function Add2(const info:PFunctionInfo):Boolean;cdecl; external x32DBG name '?Add@Function@Script@@YA_NPEBUFunctionInfo@12@@Z';
{SCRIPT_EXPORT bool} function Get(addr:duint;start:pduint = nil;fend:pduint = nil; instructionCount:pduint = nil):Boolean;cdecl; external x32DBG name '?Get@Function@Script@@YA_N_KPEA_K11@Z';
{SCRIPT_EXPORT bool} function GetInfo(addr:duint;info:PFunctionInfo):Boolean;cdecl; external x32DBG name '?GetInfo@Function@Script@@YA_N_KPEAUFunctionInfo@12@@Z';
{SCRIPT_EXPORT bool} function Overlaps(start:duint;Fend:duint):Boolean;cdecl; external x32DBG name '?Overlaps@Function@Script@@YA_N_K0@Z';
{SCRIPT_EXPORT bool} function Delete(address:duint):Boolean;cdecl; external x32DBG name '?Delete@Function@Script@@YA_N_K@Z';
{SCRIPT_EXPORT void} procedure DeleteRange(start:duint;Fend:duint;deleteManual:Boolean);cdecl; external x32DBG name '?DeleteRange@Function@Script@@YAX_K0_N@Z';
{SCRIPT_EXPORT void} procedure DeleteRange2(start:duint;Fend:duint);cdecl; external x32DBG name '?DeleteRange@Function@Script@@YAX_K0@Z';
{SCRIPT_EXPORT void} procedure Clear(); cdecl; external x32DBG name '?Clear@Function@Script@@YAXXZ';
{SCRIPT_EXPORT bool} function GetList(list:PFunctionInfo):Boolean;cdecl; external x32DBG name '?GetList@Function@Script@@YA_NPEAUListInfo@@@Z'; //caller has the responsibility to free the list
{$else}
{SCRIPT_EXPORT bool} function Add(start:duint; Fend:duint; manual:Boolean;instructionCount:duint = 0):Boolean;cdecl; external x32DBG name '?Add@Function@Script@@YA_NKK_NK@Z';
{SCRIPT_EXPORT bool} function Add2(const info:PFunctionInfo):Boolean;cdecl; external x32DBG name '?Add@Function@Script@@YA_NPBUFunctionInfo@12@@Z';
{SCRIPT_EXPORT bool} function Get(addr:duint;start:pduint = nil;fend:pduint = nil; instructionCount:pduint = nil):Boolean;cdecl; external x32DBG name '?Get@Function@Script@@YA_NKPAK00@Z';
{SCRIPT_EXPORT bool} function GetInfo(addr:duint;info:PFunctionInfo):Boolean;cdecl; external x32DBG name '?GetInfo@Function@Script@@YA_NKPAUFunctionInfo@12@@Z';
{SCRIPT_EXPORT bool} function Overlaps(start:duint;Fend:duint):Boolean;cdecl; external x32DBG name '?Overlaps@Function@Script@@YA_NKK@Z';
{SCRIPT_EXPORT bool} function Delete(address:duint):Boolean;cdecl; external x32DBG name '?Delete@Function@Script@@YA_NK@Z';
{SCRIPT_EXPORT void} procedure DeleteRange(start:duint;Fend:duint;deleteManual:Boolean);cdecl; external x32DBG name '?DeleteRange@Function@Script@@YAXKK_N@Z';
{SCRIPT_EXPORT void} procedure DeleteRange2(start:duint;Fend:duint);cdecl; external x32DBG name '?DeleteRange@Function@Script@@YAXKK@Z';
{SCRIPT_EXPORT void} procedure Clear(); cdecl; external x32DBG name '?Clear@Function@Script@@YAXXZ';
{SCRIPT_EXPORT bool} function GetList(list:PFunctionInfo):Boolean;cdecl; external x32DBG name '?GetList@Function@Script@@YA_NPAUListInfo@@@Z'; //caller has the responsibility to free the list
{$endif}
implementation

end.
