{
Ported form _scriptapi_comment.h x64 and x32 to Unit Delphi by Lonely
FixCode:https://gitee.com/suxuss/DELPHI-x96dbg-Plugins-SDK
}
unit _scriptapi_comment;

interface
uses
  Winapi.Windows,_plugins_type,bridgemain,bridgelist,_plugins;

{$I dbg.inc}

type
    CommentInfo = packed record
        fmod:array [0..MAX_MODULE_SIZE - 1] of AChar;
        rva:duint;
        text:array [0..MAX_LABEL_SIZE - 1] of AChar;
        manual:Boolean;
    end;
    PCommentInfo = ^CommentInfo;


{$ifdef win64}
{SCRIPT_EXPORT} function FSet(addr:duint;const text:pachar;manual:boolean = false):boolean;  cdecl; external x32DBG name '?Set@Bookmark@Script@@YA_N_K_N@Z';
{SCRIPT_EXPORT} function FSet2(const info:PCommentInfo):boolean;  cdecl; external x32DBG name '?Set@Comment@Script@@YA_NPEBUCommentInfo@12@@Z';
{SCRIPT_EXPORT} function Get(addr:duint;text:pachar):boolean;  cdecl; external x32DBG name '?Get@Comment@Script@@YA_N_KPEAD@Z'; //text[MAX_COMMENT_SIZE]
{SCRIPT_EXPORT} function GetInfo(addr:duint;info:PCommentInfo):boolean;  cdecl; external x32DBG name '?GetInfo@Comment@Script@@YA_N_KPEAUCommentInfo@12@@Z';
{SCRIPT_EXPORT} function Delete(addr:duint):boolean;  cdecl; external x32DBG name '?Delete@Comment@Script@@YA_N_K@Z';
{SCRIPT_EXPORT} procedure DeleteRange(start:duint;Fend:duint);  cdecl; external x32DBG name '?DeleteRange@Comment@Script@@YAX_K0@Z';
{SCRIPT_EXPORT} procedure Clear();  cdecl; external x32DBG name '?Clear@Comment@Script@@YAXXZ';
{SCRIPT_EXPORT} function GetList(list:PCommentInfo):boolean;  cdecl; external x32DBG name '?GetList@Comment@Script@@YA_NPEAUListInfo@@@Z'; //caller has the responsibility to free the list
{$else}
{SCRIPT_EXPORT} function FSet(addr:duint;const text:pachar;manual:boolean = false):boolean;  cdecl; external x32DBG name '?Set@Comment@Script@@YA_NKPBD_N@Z';
{SCRIPT_EXPORT} function FSet2(const info:PCommentInfo):boolean;  cdecl; external x32DBG name '?Set@Comment@Script@@YA_NPBUCommentInfo@12@@Z';
{SCRIPT_EXPORT} function Get(addr:duint;text:pachar):boolean;  cdecl; external x32DBG name '?Get@Comment@Script@@YA_NKPAD@Z'; //text[MAX_COMMENT_SIZE]
{SCRIPT_EXPORT} function GetInfo(addr:duint;info:PCommentInfo):boolean;  cdecl; external x32DBG name '?GetInfo@Comment@Script@@YA_NKPAUCommentInfo@12@@Z';
{SCRIPT_EXPORT} function Delete(addr:duint):boolean;  cdecl; external x32DBG name '?Delete@Comment@Script@@YA_NK@Z';
{SCRIPT_EXPORT} procedure DeleteRange(start:duint;Fend:duint);  cdecl; external x32DBG name '?DeleteRange@Comment@Script@@YAXKK@Z';
{SCRIPT_EXPORT} procedure Clear();  cdecl; external x32DBG name '?Clear@Comment@Script@@YAXXZ';
{SCRIPT_EXPORT} function GetList(list:PCommentInfo):boolean;  cdecl; external x32DBG name '?GetList@Comment@Script@@YA_NPAUListInfo@@@Z'; //caller has the responsibility to free the list
{$endif}

implementation

end.
