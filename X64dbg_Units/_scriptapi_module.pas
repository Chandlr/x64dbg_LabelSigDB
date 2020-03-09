
{
Ported form _scriptapi_module.h x64 and x32 to Unit Delphi by Lonely
FixCode:https://gitee.com/suxuss/DELPHI-x96dbg-Plugins-SDK
}
unit _scriptapi_module;

interface
uses
  Winapi.Windows,_plugins_type,_plugins,bridgemain,bridgelist;

{$I dbg.inc}
type
  ModuleInfo = packed record
    base :duint;
    size :duint;
    entry:duint;
    sectionCount:Integer;
    name :array [0..MAX_MODULE_SIZE - 1] of AChar;
    path :array [0..MAX_PATH - 1] of AChar;
  end;
  PModuleInfo = ^ModuleInfo;

  ModuleSectionInfo = packed record
    addr:duint;
    size:duint;
    name:array [0..(MAX_SECTION_SIZE * 5) - 1] of AnsiChar;
  end;
  PModuleSectionInfo = ^ModuleSectionInfo;


{$ifdef win64}
{SCRIPT_EXPORT bool}  function InfoFromAddr(addr:duint;info:PModuleInfo):Boolean;cdecl; external x32DBG name '?InfoFromAddr@Module@Script@@YA_N_KPEAUModuleInfo@12@@Z';
{SCRIPT_EXPORT bool}  function InfoFromName(const name:PAChar;info:PModuleInfo):Boolean;cdecl; external x32DBG name '?InfoFromName@Module@Script@@YA_NPEBDPEAUModuleInfo@12@@Z';
{SCRIPT_EXPORT duint} function BaseFromAddr(addr:duint):duint;cdecl; external x32DBG name '?BaseFromAddr@Module@Script@@YA_K_K@Z';
{SCRIPT_EXPORT duint} function BaseFromName(const name:PAChar):duint;cdecl; external x32DBG name '?BaseFromName@Module@Script@@YA_KPEBD@Z';
{SCRIPT_EXPORT duint} function SizeFromAddr(addr:duint):duint;cdecl; external x32DBG name '?SizeFromAddr@Module@Script@@YA_K_K@Z';
{SCRIPT_EXPORT duint} function SizeFromName(const name:PAChar):duint;cdecl; external x32DBG name '?SizeFromName@Module@Script@@YA_KPEBD@Z';
{SCRIPT_EXPORT bool}  function NameFromAddr(addr:duint;name:PAChar):Boolean;cdecl; external x32DBG name '?NameFromAddr@Module@Script@@YA_N_KPEAD@Z';   //name[MAX_MODULE_SIZE]
{SCRIPT_EXPORT bool}  function PathFromAddr(addr:duint;path:PAChar):Boolean;cdecl; external x32DBG name '?PathFromAddr@Module@Script@@YA_N_KPEAD@Z';   //path[MAX_PATH]
{SCRIPT_EXPORT bool}  function PathFromName(const name:PAChar;path:PAChar):Boolean;cdecl; external x32DBG name '?PathFromName@Module@Script@@YA_NPEBDPEAD@Z';  //path[MAX_PATH]
{SCRIPT_EXPORT duint} function EntryFromAddr(addr:duint):duint;cdecl; external x32DBG name '?EntryFromAddr@Module@Script@@YA_K_K@Z';
{SCRIPT_EXPORT duint} function EntryFromName(const name:PAChar):duint;cdecl; external x32DBG name '?EntryFromName@Module@Script@@YA_KPEBD@Z';
{SCRIPT_EXPORT int}   function SectionCountFromAddr(addr:duint):Integer;cdecl; external x32DBG name '?SectionCountFromAddr@Module@Script@@YAH_K@Z';
{SCRIPT_EXPORT int}   function SectionCountFromName(const name:PAChar):Integer;cdecl; external x32DBG name '?SectionCountFromName@Module@Script@@YAHPEBD@Z';
{SCRIPT_EXPORT bool}  function SectionFromAddr(addr:duint;number:Integer;section:PModuleSectionInfo):Boolean;cdecl; external x32DBG name '?SectionFromAddr@Module@Script@@YA_N_KHPEAUModuleSectionInfo@12@@Z';
{SCRIPT_EXPORT bool}  function SectionFromName(const name:PAChar;number:Integer;section:PModuleSectionInfo):Boolean;cdecl; external x32DBG name '?SectionFromName@Module@Script@@YA_NPEBDHPEAUModuleSectionInfo@12@@Z';
{SCRIPT_EXPORT bool}  function GetMainModuleInfo(info:PModuleInfo):Boolean;cdecl; external x32DBG name '?GetMainModuleInfo@Module@Script@@YA_NPEAUModuleInfo@12@@Z';
{SCRIPT_EXPORT duint} function GetMainModuleBase():duint;cdecl; external x32DBG name '?GetMainModuleBase@Module@Script@@YA_KXZ';
{SCRIPT_EXPORT duint} function GetMainModuleSize():duint;cdecl; external x32DBG name '?GetMainModuleSize@Module@Script@@YA_KXZ';
{SCRIPT_EXPORT duint} function GetMainModuleEntry():duint;cdecl; external x32DBG name '?GetMainModuleEntry@Module@Script@@YA_KXZ';
{SCRIPT_EXPORT duint} function GetMainModuleSectionCount():Integer;cdecl; external x32DBG name '?GetMainModuleSectionCount@Module@Script@@YAHXZ';
{SCRIPT_EXPORT bool}  function GetMainModuleName(name:PAChar):Boolean;cdecl; external x32DBG name '?GetMainModuleName@Module@Script@@YA_NPEAD@Z';
{SCRIPT_EXPORT bool}  function GetMainModulePath(path:PAChar):Boolean;cdecl; external x32DBG name '?GetMainModulePath@Module@Script@@YA_NPEAD@Z';      //path[MAX_PATH]
{SCRIPT_EXPORT bool}  function GetMainModuleSectionList(list:PListInfo):Boolean;cdecl; external x32DBG name '?GetMainModuleSectionList@Module@Script@@YA_NPEAUListInfo@@@Z';   //caller has the responsibility to free the list
{SCRIPT_EXPORT bool}  function GetList(list:PListInfo):Boolean;cdecl; external x32DBG name '?GetList@Module@Script@@YA_NPEAUListInfo@@@Z';                    //caller has the responsibility to free the list
{SCRIPT_EXPORT bool}  function SectionListFromAddr(addr:duint;list:PListInfo):Boolean;cdecl; external x32DBG name '?SectionListFromAddr@Module@Script@@YA_N_KPEAUListInfo@@@Z';
{SCRIPT_EXPORT bool}  function SectionListFromName(const name:PAChar;list:PListInfo):Boolean;cdecl; external x32DBG name '?SectionListFromName@Module@Script@@YA_NPEBDPEAUListInfo@@@Z';

{$else}
{SCRIPT_EXPORT bool}  function InfoFromAddr(addr:duint;info:PModuleInfo):Boolean;cdecl; external x32DBG name '?InfoFromAddr@Module@Script@@YA_NKPAUModuleInfo@12@@Z';
{SCRIPT_EXPORT bool}  function InfoFromName(const name:PAChar;info:PModuleInfo):Boolean;cdecl; external x32DBG name '?InfoFromName@Module@Script@@YA_NPBDPAUModuleInfo@12@@Z';
{SCRIPT_EXPORT duint} function BaseFromAddr(addr:duint):duint;cdecl; external x32DBG name '?BaseFromAddr@Module@Script@@YAKK@Z';
{SCRIPT_EXPORT duint} function BaseFromName(const name:PAChar):duint;cdecl; external x32DBG name '?BaseFromName@Module@Script@@YAKPBD@Z';
{SCRIPT_EXPORT duint} function SizeFromAddr(addr:duint):duint;cdecl; external x32DBG name '?SizeFromAddr@Module@Script@@YAKK@Z';
{SCRIPT_EXPORT duint} function SizeFromName(const name:PAChar):duint;cdecl; external x32DBG name '?SizeFromName@Module@Script@@YAKPBD@Z';
{SCRIPT_EXPORT bool}  function NameFromAddr(addr:duint;name:PAChar):Boolean;cdecl; external x32DBG name '?NameFromAddr@Module@Script@@YA_NKPAD@Z';   //name[MAX_MODULE_SIZE]
{SCRIPT_EXPORT bool}  function PathFromAddr(addr:duint;path:PAChar):Boolean;cdecl; external x32DBG name '?PathFromAddr@Module@Script@@YA_NKPAD@Z';   //path[MAX_PATH]
{SCRIPT_EXPORT bool}  function PathFromName(const name:PAChar;path:PAChar):Boolean;cdecl; external x32DBG name '?PathFromName@Module@Script@@YA_NPBDPAD@Z';  //path[MAX_PATH]
{SCRIPT_EXPORT duint} function EntryFromAddr(addr:duint):duint;cdecl; external x32DBG name '?EntryFromAddr@Module@Script@@YAKK@Z';
{SCRIPT_EXPORT duint} function EntryFromName(const name:PAChar):duint;cdecl; external x32DBG name '?EntryFromName@Module@Script@@YAKPBD@Z';
{SCRIPT_EXPORT int}   function SectionCountFromAddr(addr:duint):Integer;cdecl; external x32DBG name '?SectionCountFromAddr@Module@Script@@YAHK@Z';
{SCRIPT_EXPORT int}   function SectionCountFromName(const name:PAChar):Integer;cdecl; external x32DBG name '?SectionCountFromName@Module@Script@@YAHPBD@Z';
{SCRIPT_EXPORT bool}  function SectionFromAddr(addr:duint;number:Integer;section:PModuleSectionInfo):Boolean;cdecl; external x32DBG name '?SectionFromAddr@Module@Script@@YA_NKHPAUModuleSectionInfo@12@@Z';
{SCRIPT_EXPORT bool}  function SectionFromName(const name:PAChar;number:Integer;section:PModuleSectionInfo):Boolean;cdecl; external x32DBG name '?SectionFromName@Module@Script@@YA_NPBDHPAUModuleSectionInfo@12@@Z';
{SCRIPT_EXPORT bool}  function GetMainModuleInfo(info:PModuleInfo):Boolean;cdecl; external x32DBG name '?GetMainModuleInfo@Module@Script@@YA_NPAUModuleInfo@12@@Z';
{SCRIPT_EXPORT duint} function GetMainModuleBase():duint;cdecl; external x32DBG name '?GetMainModuleBase@Module@Script@@YAKXZ';
{SCRIPT_EXPORT duint} function GetMainModuleSize():duint;cdecl; external x32DBG name '?GetMainModuleSize@Module@Script@@YAKXZ';
{SCRIPT_EXPORT duint} function GetMainModuleEntry():duint;cdecl; external x32DBG name '?GetMainModuleEntry@Module@Script@@YAKXZ';
{SCRIPT_EXPORT duint} function GetMainModuleSectionCount():Integer;cdecl; external x32DBG name '?GetMainModuleSectionCount@Module@Script@@YAHXZ';
{SCRIPT_EXPORT bool}  function GetMainModuleName(name:PAChar):Boolean;cdecl; external x32DBG name '?GetMainModuleName@Module@Script@@YA_NPAD@Z';
{SCRIPT_EXPORT bool}  function GetMainModulePath(path:PAChar):Boolean;cdecl; external x32DBG name '?GetMainModulePath@Module@Script@@YA_NPAD@Z';      //path[MAX_PATH]
{SCRIPT_EXPORT bool}  function GetMainModuleSectionList(list:PListInfo):Boolean;cdecl; external x32DBG name '?GetMainModuleSectionList@Module@Script@@YA_NPAUListInfo@@@Z';   //caller has the responsibility to free the list
{SCRIPT_EXPORT bool}  function GetList(list:PListInfo):Boolean;cdecl; external x32DBG name '?GetList@Module@Script@@YA_NPAUListInfo@@@Z';                    //caller has the responsibility to free the list
{SCRIPT_EXPORT bool}  function SectionListFromAddr(addr:duint;list:PListInfo):Boolean;cdecl; external x32DBG name '?SectionListFromAddr@Module@Script@@YA_NKPAUListInfo@@@Z';
{SCRIPT_EXPORT bool}  function SectionListFromName(const name:PAChar;list:PListInfo):Boolean;cdecl; external x32DBG name '?SectionListFromName@Module@Script@@YA_NPBDPAUListInfo@@@Z';

{$endif}

implementation

end.
