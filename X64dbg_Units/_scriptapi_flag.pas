{
Ported form _scriptapi_flag.h x64 and x32 to Unit Delphi by Lonely
FixCode:https://gitee.com/suxuss/DELPHI-x96dbg-Plugins-SDK
}
unit _scriptapi_flag;

interface
uses
  Winapi.Windows,_plugins_type,bridgemain,bridgelist,_plugins;

{$I dbg.inc}
type
    FlagEnum = (
    {$Z4+}
            E_ZF,
            E_OF,
            E_CF,
            E_PF,
            E_SF,
            E_TF,
            E_AF,
            E_DF,
            E_IF
    {$Z4-}
    );

{$ifdef win64}
{SCRIPT_EXPORT bool} function Get(flag:FlagEnum):Boolean;  cdecl; external x32DBG name '?Get@Flag@Script@@YA_NW4FlagEnum@12@@Z';
{SCRIPT_EXPORT bool} function Flag_Set(flag:FlagEnum;value:Boolean):Boolean; cdecl; external x32DBG name '?Set@Flag@Script@@YA_NW4FlagEnum@12@_N@Z';
{SCRIPT_EXPORT bool} function GetZF():boolean;  cdecl; external x32DBG name '?GetZF@Flag@Script@@YA_NXZ';
{SCRIPT_EXPORT bool} function SetZF(value:Boolean):Boolean;  cdecl; external x32DBG name '?SetZF@Flag@Script@@YA_N_N@Z';
{SCRIPT_EXPORT bool} function GetOF():Boolean;  cdecl; external x32DBG name '?GetOF@Flag@Script@@YA_NXZ';
{SCRIPT_EXPORT bool} function SetOF(value:Boolean):Boolean;  cdecl; external x32DBG name '?SetOF@Flag@Script@@YA_N_N@Z';
{SCRIPT_EXPORT bool} function GetCF():Boolean;  cdecl; external x32DBG name '?GetCF@Flag@Script@@YA_NXZ';
{SCRIPT_EXPORT bool} function SetCF(value:Boolean):Boolean;  cdecl; external x32DBG name '?SetCF@Flag@Script@@YA_N_N@Z';
{SCRIPT_EXPORT bool} function GetPF():Boolean;  cdecl; external x32DBG name '?GetPF@Flag@Script@@YA_NXZ';
{SCRIPT_EXPORT bool} function SetPF(value:Boolean):Boolean;  cdecl; external x32DBG name '?SetPF@Flag@Script@@YA_N_N@Z';
{SCRIPT_EXPORT bool} function GetSF():Boolean;  cdecl; external x32DBG name '?GetSF@Flag@Script@@YA_NXZ';
{SCRIPT_EXPORT bool} function SetSF(value:Boolean):Boolean;  cdecl; external x32DBG name '?SetSF@Flag@Script@@YA_N_N@Z';
{SCRIPT_EXPORT bool} function GetTF():Boolean;  cdecl; external x32DBG name '?GetTF@Flag@Script@@YA_NXZ';
{SCRIPT_EXPORT bool} function SetTF(value:Boolean):Boolean;  cdecl; external x32DBG name '?SetTF@Flag@Script@@YA_N_N@Z';
{SCRIPT_EXPORT bool} function GetAF():Boolean;  cdecl; external x32DBG name '?GetAF@Flag@Script@@YA_NXZ';
{SCRIPT_EXPORT bool} function SetAF(value:Boolean):Boolean;  cdecl; external x32DBG name '?SetAF@Flag@Script@@YA_N_N@Z';
{SCRIPT_EXPORT bool} function GetDF():Boolean;  cdecl; external x32DBG name '?GetDF@Flag@Script@@YA_NXZ';
{SCRIPT_EXPORT bool} function SetDF(value:Boolean):Boolean;  cdecl; external x32DBG name '?SetDF@Flag@Script@@YA_N_N@Z';
{SCRIPT_EXPORT bool} function GetIF():Boolean;  cdecl; external x32DBG name '?GetIF@Flag@Script@@YA_NXZ';
{SCRIPT_EXPORT bool} function SetIF(value:Boolean):Boolean;  cdecl; external x32DBG name '?SetIF@Flag@Script@@YA_N_N@Z';
{$else}
{SCRIPT_EXPORT bool} function Get(flag:FlagEnum):Boolean;  cdecl; external x32DBG name '?Get@Flag@Script@@YA_NW4FlagEnum@12@@Z';
{SCRIPT_EXPORT bool} function Flag_Set(flag:FlagEnum;value:Boolean):Boolean; cdecl; external x32DBG name '?Set@Flag@Script@@YA_NW4FlagEnum@12@_N@Z';
{SCRIPT_EXPORT bool} function GetZF():boolean;  cdecl; external x32DBG name '?GetZF@Flag@Script@@YA_NXZ';
{SCRIPT_EXPORT bool} function SetZF(value:Boolean):Boolean;  cdecl; external x32DBG name '?SetZF@Flag@Script@@YA_N_N@Z';
{SCRIPT_EXPORT bool} function GetOF():Boolean;  cdecl; external x32DBG name '?GetOF@Flag@Script@@YA_NXZ';
{SCRIPT_EXPORT bool} function SetOF(value:Boolean):Boolean;  cdecl; external x32DBG name '?SetOF@Flag@Script@@YA_N_N@Z';
{SCRIPT_EXPORT bool} function GetCF():Boolean;  cdecl; external x32DBG name '?GetCF@Flag@Script@@YA_NXZ';
{SCRIPT_EXPORT bool} function SetCF(value:Boolean):Boolean;  cdecl; external x32DBG name '?SetCF@Flag@Script@@YA_N_N@Z';
{SCRIPT_EXPORT bool} function GetPF():Boolean;  cdecl; external x32DBG name '?GetPF@Flag@Script@@YA_NXZ';
{SCRIPT_EXPORT bool} function SetPF(value:Boolean):Boolean;  cdecl; external x32DBG name '?SetPF@Flag@Script@@YA_N_N@Z';
{SCRIPT_EXPORT bool} function GetSF():Boolean;  cdecl; external x32DBG name '?GetSF@Flag@Script@@YA_NXZ';
{SCRIPT_EXPORT bool} function SetSF(value:Boolean):Boolean;  cdecl; external x32DBG name '?SetSF@Flag@Script@@YA_N_N@Z';
{SCRIPT_EXPORT bool} function GetTF():Boolean;  cdecl; external x32DBG name '?GetTF@Flag@Script@@YA_NXZ';
{SCRIPT_EXPORT bool} function SetTF(value:Boolean):Boolean;  cdecl; external x32DBG name '?SetTF@Flag@Script@@YA_N_N@Z';
{SCRIPT_EXPORT bool} function GetAF():Boolean;  cdecl; external x32DBG name '?GetAF@Flag@Script@@YA_NXZ';
{SCRIPT_EXPORT bool} function SetAF(value:Boolean):Boolean;  cdecl; external x32DBG name '?SetAF@Flag@Script@@YA_N_N@Z';
{SCRIPT_EXPORT bool} function GetDF():Boolean;  cdecl; external x32DBG name '?GetDF@Flag@Script@@YA_NXZ';
{SCRIPT_EXPORT bool} function SetDF(value:Boolean):Boolean;  cdecl; external x32DBG name '?SetDF@Flag@Script@@YA_N_N@Z';
{SCRIPT_EXPORT bool} function GetIF():Boolean;  cdecl; external x32DBG name '?GetIF@Flag@Script@@YA_NXZ';
{SCRIPT_EXPORT bool} function SetIF(value:Boolean):Boolean;  cdecl; external x32DBG name '?SetIF@Flag@Script@@YA_N_N@Z';
{$endif}

implementation

end.
