{
Ported form _scriptapi_memory.h x64 and x32 to Unit Delphi by Lonely
FixCode:https://gitee.com/suxuss/DELPHI-x96dbg-Plugins-SDK
}
unit _scriptapi_memory;

interface
uses
  Winapi.Windows,_plugins_type,_plugins,bridgemain,bridgelist;

{$I dbg.inc}

{$ifdef win64}
{SCRIPT_EXPORT bool}  function Read(addr:duint;data:Pointer;size:duint;sizeRead:pduint):Boolean;cdecl; external x32DBG name '?Read@Memory@Script@@YA_N_KPEAX0PEA_K@Z';
{SCRIPT_EXPORT bool}  function Write(addr:duint;const data:Pointer;size:duint;sizeWritten:pduint):Boolean;cdecl; external x32DBG name '?Write@Memory@Script@@YA_N_KPEBX0PEA_K@Z';
{SCRIPT_EXPORT bool}  function IsValidPtr(addr:duint):Boolean;cdecl; external x32DBG name '?IsValidPtr@Memory@Script@@YA_N_K@Z';
{SCRIPT_EXPORT duint} function RemoteAlloc(addr:duint; size:duint):duint;cdecl; external x32DBG name '?RemoteAlloc@Memory@Script@@YA_K_K0@Z';
{SCRIPT_EXPORT bool}  function RemoteFree(addr:duint):Boolean;cdecl; external x32DBG name '?RemoteFree@Memory@Script@@YA_N_K@Z';

{SCRIPT_EXPORT unsigned char}  function ReadByte(addr:duint):Byte;cdecl; external x32DBG name '?ReadByte@Memory@Script@@YAE_K@Z';
{SCRIPT_EXPORT bool}  function WriteByte(addr:duint;data:Byte):Boolean;cdecl; external x32DBG name '?WriteByte@Memory@Script@@YA_N_KE@Z';
{SCRIPT_EXPORT unsigned short} function ReadWord(addr:duint):Word;cdecl; external x32DBG name '?ReadWord@Memory@Script@@YAG_K@Z';
{SCRIPT_EXPORT bool}  function WriteWord(addr:duint;data:Word):Boolean;cdecl; external x32DBG name '?WriteWord@Memory@Script@@YA_N_KG@Z';
{SCRIPT_EXPORT unsigned int}   function ReadDword(addr:duint):Cardinal;cdecl; external x32DBG name '?ReadDword@Memory@Script@@YAI_K@Z';
{SCRIPT_EXPORT bool}  function WriteDword(addr:duint;data:Cardinal):Boolean;cdecl; external x32DBG name '?WriteDword@Memory@Script@@YA_N_KI@Z';
{SCRIPT_EXPORT unsigned long}  function ReadQword(addr:duint):LONG_PTR;cdecl; external x32DBG name '?ReadQword@Memory@Script@@YA_K_K@Z';
{SCRIPT_EXPORT bool}  function WriteQword(addr:duint;data:LONG_PTR):Boolean;cdecl; external x32DBG name '?WriteQword@Memory@Script@@YA_N_K0@Z';
{SCRIPT_EXPORT duint} function ReadPtr(addr:duint):duint;cdecl; external x32DBG name '?ReadPtr@Memory@Script@@YA_K_K@Z';
{SCRIPT_EXPORT bool}  function WritePtr(addr:duint;data:duint):Boolean;cdecl; external x32DBG name '?WriteWord@Memory@Script@@YA_N_KG@Z';

{$else}
{SCRIPT_EXPORT bool}  function Read(addr:duint;data:Pointer;size:duint;sizeRead:pduint):Boolean;cdecl; external x32DBG name '?Read@Memory@Script@@YA_NKPAXKPAK@Z';
{SCRIPT_EXPORT bool}  function Write(addr:duint;const data:Pointer;size:duint;sizeWritten:pduint):Boolean;cdecl; external x32DBG name '?Write@Memory@Script@@YA_NKPBXKPAK@Z';
{SCRIPT_EXPORT bool}  function IsValidPtr(addr:duint):Boolean;cdecl; external x32DBG name '?IsValidPtr@Memory@Script@@YA_NK@Z';
{SCRIPT_EXPORT duint} function RemoteAlloc(addr:duint; size:duint):duint;cdecl; external x32DBG name '?RemoteAlloc@Memory@Script@@YAKKK@Z';
{SCRIPT_EXPORT bool}  function RemoteFree(addr:duint):Boolean;cdecl; external x32DBG name '?RemoteFree@Memory@Script@@YA_NK@Z';

{SCRIPT_EXPORT unsigned char}  function ReadByte(addr:duint):Byte;cdecl; external x32DBG name '?ReadByte@Memory@Script@@YAEK@Z';
{SCRIPT_EXPORT bool}  function WriteByte(addr:duint;data:Byte):Boolean;cdecl; external x32DBG name '?WriteByte@Memory@Script@@YA_NKE@Z';
{SCRIPT_EXPORT unsigned short} function ReadWord(addr:duint):Word;cdecl; external x32DBG name '?ReadWord@Memory@Script@@YAGK@Z';
{SCRIPT_EXPORT bool}  function WriteWord(addr:duint;data:Word):Boolean;cdecl; external x32DBG name '?WriteWord@Memory@Script@@YA_NKG@Z';
{SCRIPT_EXPORT unsigned int}   function ReadDword(addr:duint):Cardinal;cdecl; external x32DBG name '?ReadDword@Memory@Script@@YAIK@Z';
{SCRIPT_EXPORT bool}  function WriteDword(addr:duint;data:Cardinal):Boolean;cdecl; external x32DBG name '?WriteDword@Memory@Script@@YA_NKI@Z';
{SCRIPT_EXPORT unsigned long}  function ReadQword(addr:duint):LONG_PTR;cdecl; external x32DBG name '?ReadQword@Memory@Script@@YA_KK@Z';
{SCRIPT_EXPORT bool}  function WriteQword(addr:duint;data:LONG_PTR):Boolean;cdecl; external x32DBG name '?WriteQword@Memory@Script@@YA_NK_K@Z';
{SCRIPT_EXPORT duint} function ReadPtr(addr:duint):duint;cdecl; external x32DBG name '?ReadPtr@Memory@Script@@YAKK@Z';
{SCRIPT_EXPORT bool}  function WritePtr(addr:duint;data:duint):Boolean;cdecl; external x32DBG name '?WriteWord@Memory@Script@@YA_NKG@Z';

{$endif}


implementation


end.
