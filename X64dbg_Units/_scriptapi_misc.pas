{
Ported form _scriptapi_misc.h x64 and x32 to Unit Delphi by Lonely
FixCode:https://gitee.com/suxuss/DELPHI-x96dbg-Plugins-SDK
}
unit _scriptapi_misc;

interface
uses
  Winapi.Windows,_plugins_type,_plugins,bridgemain,bridgelist;

{$I dbg.inc}


{$ifdef win64}
{SCRIPT_EXPORT bool}  function ParseExpression(const expression:PAChar;value:pduint):Boolean;cdecl; external x32DBG name '?ParseExpression@Misc@Script@@YA_NPEBDPEA_K@Z';
{SCRIPT_EXPORT duint} function RemoteGetProcAddress(const module:PAChar; const api:PAChar):duint;cdecl; external x32DBG name '?RemoteGetProcAddress@Misc@Script@@YA_KPEBD0@Z';
{SCRIPT_EXPORT duint} function ResolveLabel(const Flabel:PAChar):duint;cdecl; external x32DBG name '?ResolveLabel@Misc@Script@@YA_KPEBD@Z';
{SCRIPT_EXPORT void*} function Alloc(size:duint):Pointer;cdecl; external x32DBG name '?Alloc@Misc@Script@@YAPEAX_K@Z';
{SCRIPT_EXPORT void}  procedure Free(ptr:Pointer);cdecl; external x32DBG name '?Free@Misc@Script@@YAXPEAX@Z';
{$else}
{SCRIPT_EXPORT bool}  function ParseExpression(const expression:PAChar;value:pduint):Boolean;cdecl; external x32DBG name '?ParseExpression@Misc@Script@@YA_NPBDPAK@Z';
{SCRIPT_EXPORT duint} function RemoteGetProcAddress(const module:PAChar; const api:PAChar):duint;cdecl; external x32DBG name '?RemoteGetProcAddress@Misc@Script@@YAKPBD0@Z';
{SCRIPT_EXPORT duint} function ResolveLabel(const Flabel:PAChar):duint;cdecl; external x32DBG name '?ResolveLabel@Misc@Script@@YAKPBD@Z';
{SCRIPT_EXPORT void*} function Alloc(size:duint):Pointer;cdecl; external x32DBG name '?Alloc@Misc@Script@@YAPAXK@Z';
{SCRIPT_EXPORT void}  procedure Free(ptr:Pointer);cdecl; external x32DBG name '?Free@Misc@Script@@YAXPAX@Z';
{$endif}

implementation

end.
