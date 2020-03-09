unit _scriptapi_bookmark;
{
Ported form _scriptapi_bookmark.h x64 and x32 to Unit Delphi by Lonely
FixCode:https://gitee.com/suxuss/DELPHI-x96dbg-Plugins-SDK
}
interface
uses
  Winapi.Windows,_plugins_type,bridgemain,bridgelist,_plugins;

{$I dbg.inc}

type
    BookmarkInfo = packed record
        fmod:array [0..MAX_MODULE_SIZE - 1] of AChar;
        rva:duint;
        manual:Boolean;
    end;
    PBookmarkInfo = ^BookmarkInfo;


{$ifdef win64}
{SCRIPT_EXPORT bool} function FSet(addr:duint;manual:Boolean = false):Boolean;  cdecl; external x32DBG name '?Set@Bookmark@Script@@YA_N_K_N@Z';
{SCRIPT_EXPORT bool} function FSet2(const info:PBookmarkInfo):Boolean;  cdecl; external x32DBG name '?Set@Bookmark@Script@@YA_NPEBUBookmarkInfo@12@@Z';
{SCRIPT_EXPORT bool} function Get(addr:duint):Boolean;  cdecl; external x32DBG name '?Get@Bookmark@Script@@YA_N_K@Z';
{SCRIPT_EXPORT bool} function GetInfo(addr:duint;info:PBookmarkInfo):Boolean;  cdecl; external x32DBG name '?GetInfo@Bookmark@Script@@YA_N_KPEAUBookmarkInfo@12@@Z';
{SCRIPT_EXPORT bool} function Delete(addr:duint):Boolean;  cdecl; external x32DBG name '?Delete@Bookmark@Script@@YA_N_K@Z';
{SCRIPT_EXPORT void} procedure DeleteRange(start:duint;Fend:duint);  cdecl; external x32DBG name '?DeleteRange@Bookmark@Script@@YAX_K0@Z';
{SCRIPT_EXPORT void} procedure Clear();  cdecl; external x32DBG name '?Clear@Bookmark@Script@@YAXXZ';
{SCRIPT_EXPORT bool} function GetList(list:PBookmarkInfo):Boolean;  cdecl; external x32DBG name '?GetList@Bookmark@Script@@YA_NPEAUListInfo@@@Z'; //caller has the responsibility to free the list
{$else}
{SCRIPT_EXPORT bool} function FSet(addr:duint;manual:Boolean = false):Boolean;  cdecl; external x32DBG name '?Set@Bookmark@Script@@YA_NK_N@Z';
{SCRIPT_EXPORT bool} function FSet2(const info:PBookmarkInfo):Boolean;  cdecl; external x32DBG name '?Set@Bookmark@Script@@YA_NPBUBookmarkInfo@12@@Z';
{SCRIPT_EXPORT bool} function Get(addr:duint):Boolean;  cdecl; external x32DBG name '?Get@Bookmark@Script@@YA_NK@Z';
{SCRIPT_EXPORT bool} function GetInfo(addr:duint;info:PBookmarkInfo):Boolean;  cdecl; external x32DBG name '?GetInfo@Bookmark@Script@@YA_NKPAUBookmarkInfo@12@@Z';
{SCRIPT_EXPORT bool} function Delete(addr:duint):Boolean;  cdecl; external x32DBG name '?Delete@Bookmark@Script@@YA_NK@Z';
{SCRIPT_EXPORT void} procedure DeleteRange(start:duint;Fend:duint);  cdecl; external x32DBG name '?DeleteRange@Bookmark@Script@@YAXKK@Z';
{SCRIPT_EXPORT void} procedure Clear();  cdecl; external x32DBG name '?Clear@Bookmark@Script@@YAXXZ';
{SCRIPT_EXPORT bool} function GetList(list:PBookmarkInfo):Boolean;  cdecl; external x32DBG name '?GetList@Bookmark@Script@@YA_NPAUListInfo@@@Z'; //caller has the responsibility to free the list
{$endif}

implementation

end.
