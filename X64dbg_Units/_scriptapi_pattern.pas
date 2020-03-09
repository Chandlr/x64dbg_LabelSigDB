{
Ported form _scriptapi_pattern.h x64 and x32 to Unit Delphi by Lonely
FixCode:https://gitee.com/suxuss/DELPHI-x96dbg-Plugins-SDK
}
unit _scriptapi_pattern;

interface
uses
  Winapi.Windows,_plugins_type,_plugins,bridgemain,bridgelist;

{$I dbg.inc}

{$ifdef win64}
{SCRIPT_EXPORT duint} function Find(data:PByte;datasize:duint;const pattern:PAChar):duint;cdecl; external x32DBG name '?Find@Pattern@Script@@YA_KPEAE_KPEBD@Z';
{SCRIPT_EXPORT duint} function FindMem(start:duint;size:duint;const pattern:PAChar):duint;cdecl; external x32DBG name '?FindMem@Pattern@Script@@YA_K_K0PEBD@Z';
{SCRIPT_EXPORT void}  procedure Write(data:PAChar;datasize:duint;const pattern:PAChar);cdecl; external x32DBG name '?Write@Pattern@Script@@YAXPEAE_KPEBD@Z';
{SCRIPT_EXPORT void}  procedure WriteMem(start:duint;size:duint;const pattern:PAChar);cdecl; external x32DBG name '?WriteMem@Pattern@Script@@YAX_K0PEBD@Z';
{SCRIPT_EXPORT bool}  function SearchAndReplace(data:PByte;
                                                  datasize:duint;
                                                  const searchpattern:PAChar;
                                                  const replacepattern:PAChar):Boolean;cdecl; external x32DBG name '?SearchAndReplace@Pattern@Script@@YA_NPEAE_KPEBD2@Z';
{SCRIPT_EXPORT bool}  function SearchAndReplaceMem(start:duint;
                                                  size:duint;
                                                  const searchpattern:PAChar;
                                                  const replacepattern:PAChar):Boolean;cdecl; external x32DBG name '?SearchAndReplaceMem@Pattern@Script@@YA_N_K0PEBD1@Z';




{$else}
{SCRIPT_EXPORT duint} function Find(data:PByte;datasize:duint;const pattern:PAChar):duint;cdecl; external x32DBG name '?Find@Pattern@Script@@YAKPAEKPBD@Z';
{SCRIPT_EXPORT duint} function FindMem(start:duint;size:duint;const pattern:PAChar):duint;cdecl; external x32DBG name '?FindMem@Pattern@Script@@YAKKKPBD@Z';
{SCRIPT_EXPORT void}  procedure Write(data:PAChar;datasize:duint;const pattern:PAChar);cdecl; external x32DBG name '?Write@Pattern@Script@@YAXPAEKPBD@Z';
{SCRIPT_EXPORT void}  procedure WriteMem(start:duint;size:duint;const pattern:PAChar);cdecl; external x32DBG name '?WriteMem@Pattern@Script@@YAXKKPBD@Z';
{SCRIPT_EXPORT bool}  function SearchAndReplace(data:PByte;
                                                  datasize:duint;
                                                  const searchpattern:PAChar;
                                                  const replacepattern:PAChar):Boolean;cdecl; external x32DBG name '?SearchAndReplace@Pattern@Script@@YA_NPAEKPBD1@Z';
{SCRIPT_EXPORT bool}  function SearchAndReplaceMem(start:duint;
                                                  size:duint;
                                                  const searchpattern:PAChar;
                                                  const replacepattern:PAChar):Boolean;cdecl; external x32DBG name '?SearchAndReplaceMem@Pattern@Script@@YA_NKKPBD0@Z';
{$endif}


implementation

end.
