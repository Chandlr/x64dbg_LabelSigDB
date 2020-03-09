{
Ported form _scriptapi_label.h x64 and x32 to Unit Delphi by Lonely
FixCode:https://gitee.com/suxuss/DELPHI-x96dbg-Plugins-SDK
}
unit _scriptapi_label;

interface
uses
  Winapi.Windows,_plugins_type,_plugins,bridgemain,bridgelist;

{$I dbg.inc}

type
    LabelInfo = packed record
        Fmod:array [0..MAX_MODULE_SIZE - 1] of Byte;
        rva:duint;
        text:array [0..MAX_LABEL_SIZE - 1] of Byte;
        manual:Boolean;
    end;
    PLabelInfo = ^LabelInfo;
{$ifdef win64}
{SCRIPT_EXPORT bool} function FSet(addr:duint;const text:PAChar;manual:Boolean = false):Boolean;cdecl;external x32DBG name '?Set@Label@Script@@YA_N_KPEBD_N@Z';
{SCRIPT_EXPORT bool} function FSet2(const info:PLabelInfo):Boolean;cdecl;external x32DBG name '?Set@Label@Script@@YA_N_KPEBD_N@Z';
{SCRIPT_EXPORT bool} function FromString(const flabel:PAChar;addr:Pduint):Boolean;cdecl;external x32DBG name '?FromString@Label@Script@@YA_NPEBDPEA_K@Z';
{SCRIPT_EXPORT bool} function Get(addr:duint;text:PAChar):Boolean;cdecl;external x32DBG name '?Get@Label@Script@@YA_N_KPEAD@Z'; //text[MAX_LABEL_SIZE]
{SCRIPT_EXPORT bool} function GetInfo(addr:duint;info:PLabelInfo):Boolean;cdecl;external x32DBG name '?GetInfo@Label@Script@@YA_N_KPEAULabelInfo@12@@Z';
{SCRIPT_EXPORT bool} function Delete(addr:duint):Boolean;cdecl;external x32DBG name '?Delete@Label@Script@@YA_N_K@Z';
{SCRIPT_EXPORT void} procedure DeleteRange(start:duint;Fend:duint);cdecl;external x32DBG name '?DeleteRange@Label@Script@@YAX_K0@Z';
{SCRIPT_EXPORT void} procedure Clear();cdecl;external x32DBG name '?Clear@Label@Script@@YAXXZ';
{SCRIPT_EXPORT bool} function GetList(list:PLabelInfo):Boolean;cdecl;external x32DBG name '?GetList@Label@Script@@YA_NPEAUListInfo@@@Z'; //caller has the responsibility to free the list
{$else}
{SCRIPT_EXPORT bool} function FSet(addr:duint;const text:PAChar;manual:Boolean = false):Boolean;cdecl;external x32DBG name '?Set@Label@Script@@YA_NKPBD_N@Z';
{SCRIPT_EXPORT bool} function FSet2(const info:PLabelInfo):Boolean;cdecl;external x32DBG name '?Set@Label@Script@@YA_NKPBD_N@Z';
{SCRIPT_EXPORT bool} function FromString(const flabel:PAChar;addr:Pduint):Boolean;cdecl;external x32DBG name '?FromString@Label@Script@@YA_NPBDPAK@Z';
{SCRIPT_EXPORT bool} function Get(addr:duint;text:PAChar):Boolean;cdecl;external x32DBG name '?Get@Label@Script@@YA_NKPAD@Z'; //text[MAX_LABEL_SIZE]
{SCRIPT_EXPORT bool} function GetInfo(addr:duint;info:PLabelInfo):Boolean;cdecl;external x32DBG name '?GetInfo@Label@Script@@YA_NKPAULabelInfo@12@@Z';
{SCRIPT_EXPORT bool} function Delete(addr:duint):Boolean;cdecl;external x32DBG name '?Delete@Label@Script@@YA_NK@Z';
{SCRIPT_EXPORT void} procedure DeleteRange(start:duint;Fend:duint);cdecl;external x32DBG name '?DeleteRange@Label@Script@@YAXKK@Z';
{SCRIPT_EXPORT void} procedure Clear();cdecl;external x32DBG name '?Clear@Label@Script@@YAXXZ';
{SCRIPT_EXPORT bool} function GetList(list:PLabelInfo):Boolean;cdecl;external x32DBG name '?GetList@Label@Script@@YA_NPAUListInfo@@@Z'; //caller has the responsibility to free the list
{$endif}

implementation

end.
