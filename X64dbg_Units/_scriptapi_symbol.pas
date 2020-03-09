{
Ported form _scriptapi_symbol.h x64 and x32 to Unit Delphi by Lonely
FixCode:https://gitee.com/suxuss/DELPHI-x96dbg-Plugins-SDK
}
unit _scriptapi_symbol;

interface
uses
  Winapi.Windows,_plugins_type,bridgemain,bridgelist,_plugins;

{$I dbg.inc}
type
  SymbolType = (
  {$A4+}
    fFunction,
    fImport,
    fExport
  {$A4-}
  );

  SymbolInfo = packed record
    Fmod:array [0..MAX_MODULE_SIZE - 1] of AChar;
    rva:duint;
    name:array [0..MAX_LABEL_SIZE-1] of AChar;
    manual:Boolean;
    ftype:SymbolType;
  end;

//SCRIPT_EXPORT bool GetList(ListOf(SymbolInfo) list); //caller has the responsibility to free the list
{$ifdef win64}
function GetList(list:listinfo):Boolean;cdecl; external x32DBG name '?GetList@Symbol@Script@@YA_NPEAUListInfo@@@Z';
{$else}
function GetList(list:listinfo):Boolean;cdecl; external x32DBG name '?GetList@Symbol@Script@@YA_NPAUListInfo@@@Z';
{$endif}

implementation

end.
