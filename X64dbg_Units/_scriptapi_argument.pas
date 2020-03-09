unit _scriptapi_argument;
{
Ported form _scriptapi_argument.h x64 and x32 to Unit Delphi by Lonely
FixCode:https://gitee.com/suxuss/DELPHI-x96dbg-Plugins-SDK
}
interface
uses
  Winapi.Windows,_plugins_type,bridgemain,bridgelist,_plugins;

{$I dbg.inc}

type
      ArgumentInfo = packed record
          fmod:array [0..MAX_MODULE_SIZE - 1] of AChar;
          rvaStart:duint;
          rvaEnd:duint;
          manual:Boolean;
          instructioncount:duint;
      end;
      PArgumentInfo = ^ArgumentInfo;


{$ifdef win64}
{SCRIPT_EXPORT bool} function Add(start:duint; fend:duint; manual:Boolean; instructionCount:duint = 0):Boolean;  cdecl; external x32DBG name '?Add@Argument@Script@@YA_N_K0_N0@Z';
{SCRIPT_EXPORT bool} function Add2(const info:PArgumentInfo):Boolean;  cdecl; external x32DBG name '?Add@Argument@Script@@YA_NPEBUArgumentInfo@12@@Z';
{SCRIPT_EXPORT bool} function Get(addr:duint; start:pduint = nil;  fend:pduint = nil; instructionCount:pduint = nil):Boolean;  cdecl; external x32DBG name '?Get@Argument@Script@@YA_N_KPEA_K11@Z';
{SCRIPT_EXPORT bool} function GetInfo(addr:duint; info:PArgumentInfo):Boolean;  cdecl; external x32DBG name '?GetInfo@Argument@Script@@YA_N_KPEAUArgumentInfo@12@@Z';
{SCRIPT_EXPORT bool} function Overlaps(start:duint; fend:duint):Boolean;  cdecl; external x32DBG name '?Overlaps@Argument@Script@@YA_N_K0@Z';
{SCRIPT_EXPORT bool} function Delete(address:duint):Boolean;  cdecl; external x32DBG name '?Delete@Argument@Script@@YA_N_K@Z';
{SCRIPT_EXPORT void} procedure DeleteRange(start:duint; fend:duint; deleteManual:Boolean = false);  cdecl; external x32DBG name '?DeleteRange@Argument@Script@@YAX_K0_N@Z';
{SCRIPT_EXPORT void} procedure Clear();  cdecl; external x32DBG name '?Clear@Argument@Script@@YAXXZ';
{SCRIPT_EXPORT bool} function GetList(list:PArgumentInfo):Boolean;  cdecl; external x32DBG name '?GetList@Argument@Script@@YA_NPEAUListInfo@@@Z'; //caller has the responsibility to free the list
{$else}
{SCRIPT_EXPORT bool} function Add(start:duint; fend:duint; manual:Boolean; instructionCount:duint = 0):Boolean;  cdecl; external x32DBG name '?Add@Argument@Script@@YA_NKK_NK@Z';
{SCRIPT_EXPORT bool} function Add2(const info:PArgumentInfo):Boolean;  cdecl; external x32DBG name '?Add@Argument@Script@@YA_NPBUArgumentInfo@12@@Z';
{SCRIPT_EXPORT bool} function Get(addr:duint; start:pduint = nil;  fend:pduint = nil; instructionCount:pduint = nil):Boolean;  cdecl; external x32DBG name '?Get@Argument@Script@@YA_NKPAK00@Z';
{SCRIPT_EXPORT bool} function GetInfo(addr:duint; info:PArgumentInfo):Boolean;  cdecl; external x32DBG name '?GetInfo@Argument@Script@@YA_NKPAUArgumentInfo@12@@Z';
{SCRIPT_EXPORT bool} function Overlaps(start:duint; fend:duint):Boolean;  cdecl; external x32DBG name '?Overlaps@Argument@Script@@YA_NKK@Z';
{SCRIPT_EXPORT bool} function Delete(address:duint):Boolean;  cdecl; external x32DBG name '?Delete@Argument@Script@@YA_NK@Z';
{SCRIPT_EXPORT void} procedure DeleteRange(start:duint; fend:duint; deleteManual:Boolean = false);  cdecl; external x32DBG name '?DeleteRange@Argument@Script@@YAXKK_N@Z';
{SCRIPT_EXPORT void} procedure Clear();  cdecl; external x32DBG name '?Clear@Argument@Script@@YAXXZ';
{SCRIPT_EXPORT bool} function GetList(list:PArgumentInfo):Boolean;  cdecl; external x32DBG name '?GetList@Argument@Script@@YA_NPAUListInfo@@@Z'; //caller has the responsibility to free the list
{$endif}
implementation

end.
