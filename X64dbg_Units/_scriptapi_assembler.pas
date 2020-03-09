unit _scriptapi_assembler;
{
Ported form _scriptapi_assembler.h x64 and x32 to Unit Delphi by Lonely
FixCode:https://gitee.com/suxuss/DELPHI-x96dbg-Plugins-SDK
}
interface
uses
  Winapi.Windows,_plugins_type,bridgemain,bridgelist,_plugins;

{$I dbg.inc}

{$ifdef win64}
{SCRIPT_EXPORT} function Assemble(addr:duint; dest:Pbyte; size:PInteger; const instruction:PAChar):Boolean;  cdecl; external x32DBG name '?Assemble@Assembler@Script@@YA_N_KPEAEPEAHPEBD@Z'; //dest[16]
{SCRIPT_EXPORT} function AssembleEx(addr:duint; dest:Pbyte; size:PInteger; const instruction:PAChar; error:PAChar):Boolean;  cdecl; external x32DBG name '?AssembleEx@Assembler@Script@@YA_N_KPEAEPEAHPEBDPEAD@Z'; //dest[16], error[MAX_ERROR_SIZE]
{SCRIPT_EXPORT} function AssembleMem(addr:duint; const instruction:PAChar):Boolean;  cdecl; external x32DBG name '?AssembleMem@Assembler@Script@@YA_N_KPEBD@Z';
{SCRIPT_EXPORT} function AssembleMemEx(addr:duint; const instruction:PAChar; size:PInteger; error:PAChar; fillnop:Boolean):Boolean;  cdecl; external x32DBG name '?AssembleMemEx@Assembler@Script@@YA_N_KPEBDPEAHPEAD_N@Z'; //error[MAX_ERROR_SIZE]
{$else}
{SCRIPT_EXPORT} function Assemble(addr:duint; dest:Pbyte; size:PInteger; const instruction:PAChar):Boolean;  cdecl; external x32DBG name '?Assemble@Assembler@Script@@YA_NKPAEPAHPBD@Z'; //dest[16]
{SCRIPT_EXPORT} function AssembleEx(addr:duint; dest:Pbyte; size:PInteger; const instruction:PAChar; error:PAChar):Boolean;  cdecl; external x32DBG name '?AssembleEx@Assembler@Script@@YA_NKPAEPAHPBDPAD@Z'; //dest[16], error[MAX_ERROR_SIZE]
{SCRIPT_EXPORT} function AssembleMem(addr:duint; const instruction:PAChar):Boolean;  cdecl; external x32DBG name '?AssembleMem@Assembler@Script@@YA_NKPBD@Z';
{SCRIPT_EXPORT} function AssembleMemEx(addr:duint; const instruction:PAChar; size:PInteger; error:PAChar; fillnop:Boolean):Boolean;  cdecl; external x32DBG name '?AssembleMemEx@Assembler@Script@@YA_NKPBDPAHPAD_N@Z'; //error[MAX_ERROR_SIZE]
{$endif}
implementation

end.
