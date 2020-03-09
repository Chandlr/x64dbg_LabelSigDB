{
Ported form _scriptapi_stack.h x64 and x32 to Unit Delphi by Lonely
FixCode:https://gitee.com/suxuss/DELPHI-x96dbg-Plugins-SDK
}
unit _scriptapi_stack;

interface
uses
  Winapi.Windows,_plugins_type,_plugins,bridgemain,bridgelist;

{$I dbg.inc}


{$ifdef win64}
{SCRIPT_EXPORT duint} function Pop():duint;cdecl; external x32DBG name '?Pop@Stack@Script@@YA_KXZ';
{SCRIPT_EXPORT duint} function Push(value:duint):duint;cdecl; external x32DBG name '?Push@Stack@Script@@YA_K_K@Z'; //returns the previous top, equal to Peek(1)
{SCRIPT_EXPORT duint} function Peek(offset:Integer = 0):duint;cdecl; external x32DBG name '?Peek@Stack@Script@@YA_KH@Z'; //offset is in multiples of Register::Size(), for easy x32/x64 portability
{$else}
{SCRIPT_EXPORT duint} function Pop():duint;cdecl; external x32DBG name '?Pop@Stack@Script@@YAKXZ';
{SCRIPT_EXPORT duint} function Push(value:duint):duint;cdecl; external x32DBG name '?Push@Stack@Script@@YAKK@Z'; //returns the previous top, equal to Peek(1)
{SCRIPT_EXPORT duint} function Peek(offset:Integer = 0):duint;cdecl; external x32DBG name '?Peek@Stack@Script@@YAKH@Z'; //offset is in multiples of Register::Size(), for easy x32/x64 portability
{$endif}

implementation

end.
