Unit _plugins;

(**
*
* Ported form _plugins.h (x64_dbg-PluginSDK v0.10) to Unit Delphi by quygia128
* Home: http://cin1team.biz
* Blog: http://crackertool.blogspot.com (www.crackertool.tk)
* Last Edit: 06.30.2014 by quygia128
* 
* Update: https://github.com/quygia128
* FixCode:https://gitee.com/suxuss/DELPHI-x96dbg-Plugins-SDK
*
* Thanks to TQN for Delphi Coding, phpbb3 and BOB for Nice Plugin(Tools) Power By Delphi,
* all my friends at CiN1Team(ALL CIN1'S MEMBER) & Other RCE Team.
* Of course thanks to Mr.eXodia author of x64_dbg, Nice Work!
*
**)

interface

uses 
	Windows, bridgemain,_plugins_type;


{$I dbg.inc}

const
	PLUG_SDKVERSION  = $1;
  {$IFDEF WIN64}
		x32_DBG          = 'x64_dbg.dll';
    x32DBG           = 'x64dbg.dll';
  {$ELSE}
		x32_DBG          = 'x32_dbg.dll';
    x32DBG           = 'x32dbg.dll';
  {$ENDIF}


Type

PPLUG_INITSTRUCT = ^PLUG_INITSTRUCT;
	PLUG_INITSTRUCT = packed record
		//provided by the debugger
    //Read Only!don't Write
		pluginHandle: Integer;
		//provided by the pluginit function
		sdkVersion: Integer;
		pluginVersion: Integer;
		pluginName:array[0..255] of AChar;
	end;

PPLUG_SETUPSTRUCT = ^PLUG_SETUPSTRUCT;
	PLUG_SETUPSTRUCT = packed record
		//provided by the debugger
		hwndDlg: HWND; //gui window handle
		hMenu: Integer; //plugin menu handle
    hMenuDisasm:Integer; //plugin disasm menu handle
    hMenuDump:Integer; //plugin dump menu handle
    hMenuStack:Integer; //plugin stack menu handle
	end;

//callback structures
PPLUG_CB_INITDEBUG = ^PLUG_CB_INITDEBUG;
	PLUG_CB_INITDEBUG = packed record
		szFileName: PAChar;
	end;

PPLUG_CB_STOPDEBUG = ^PLUG_CB_STOPDEBUG;
	PLUG_CB_STOPDEBUG = packed record
		reserved: Pointer;
	end;

PPLUG_CB_CREATEPROCESS = ^PLUG_CB_CREATEPROCESS;
	PLUG_CB_CREATEPROCESS = Packed record
		CreateProcessInfo: {CREATE_PROCESS_DEBUG_INFO*}PCreateProcessDebugInfo;
		modInfo: PIMAGEHLP_MODULE64;
		DebugFileName: PAChar;
		fdProcessInfo: {PROCESS_INFORMATION*}PProcessInformation;
	end;

PPLUG_CB_EXITPROCESS = ^PLUG_CB_EXITPROCESS;
	PLUG_CB_EXITPROCESS = packed record
		ExitProcess: {EXIT_PROCESS_DEBUG_INFO*}PExitProcessDebugInfo;
	end;

PPLUG_CB_CREATETHREAD = ^PLUG_CB_CREATETHREAD;
	PLUG_CB_CREATETHREAD = packed record
		CreateThread: {CREATE_THREAD_DEBUG_INFO*}PCreateThreadDebugInfo;
		dwThreadId: DWORD;
	end;

PPLUG_CB_EXITTHREAD = ^PLUG_CB_EXITTHREAD;
	PLUG_CB_EXITTHREAD = packed record
		ExitThread: {EXIT_THREAD_DEBUG_INFO*}PExitThreadDebugInfo;
		dwThreadId: DWORD;
	end;

PPLUG_CB_SYSTEMBREAKPOINT = ^PLUG_CB_SYSTEMBREAKPOINT;
	PLUG_CB_SYSTEMBREAKPOINT = packed record
		reserved: Pointer;
	end;

PPLUG_CB_LOADDLL = ^PLUG_CB_LOADDLL;
	PLUG_CB_LOADDLL = packed record
		LoadDll: {LOAD_DLL_DEBUG_INFO*}PLoadDLLDebugInfo;
		modInfo: PIMAGEHLP_MODULE64;
		modname: PAChar;
	end;

PPLUG_CB_UNLOADDLL = ^PLUG_CB_UNLOADDLL;
	PLUG_CB_UNLOADDLL = packed record
		UnloadDll: {UNLOAD_DLL_DEBUG_INFO*}PUnloadDLLDebugInfo;
	end;

PPLUG_CB_OUTPUTDEBUGSTRING = ^PLUG_CB_OUTPUTDEBUGSTRING;
	PLUG_CB_OUTPUTDEBUGSTRING = packed record
		DebugString: {OUTPUT_DEBUG_STRING_INFO*}POutputDebugStringInfo;
	end;

PPLUG_CB_EXCEPTION = ^PLUG_CB_EXCEPTION;
	PLUG_CB_EXCEPTION = packed record
		Exception: {EXCEPTION_DEBUG_INFO*}PExceptionDebugInfo;
	end;

PPLUG_CB_BREAKPOINT = ^PLUG_CB_BREAKPOINT;
	PLUG_CB_BREAKPOINT = packed record
		breakpoint: PBRIDGEBP;
	end;

PPLUG_CB_PAUSEDEBUG = ^PLUG_CB_PAUSEDEBUG;
	PLUG_CB_PAUSEDEBUG = packed record
		reserved: Pointer;
	end;

PPLUG_CB_RESUMEDEBUG = ^PLUG_CB_RESUMEDEBUG;
	PLUG_CB_RESUMEDEBUG = packed record
		reserved: Pointer;
	end;

PPLUG_CB_STEPPED = ^PLUG_CB_STEPPED;
	PLUG_CB_STEPPED = packed record
		reserved: Pointer;
	end;

PPLUG_CB_ATTACH = ^PLUG_CB_ATTACH;
	PLUG_CB_ATTACH = packed record
		dwProcessId: DWORD;
	end;

PPLUG_CB_DETACH = ^PLUG_CB_DETACH;
	PLUG_CB_DETACH = packed record
		fdProcessInfo: {PROCESS_INFORMATION*}PProcessInformation;
	end;

PPLUG_CB_DEBUGEVENT = ^PLUG_CB_DEBUGEVENT;
	PLUG_CB_DEBUGEVENT = packed record
		DebugEvent: {DEBUG_EVENT*}PDebugEvent;
	end;

PPLUG_CB_MENUENTRY = ^PLUG_CB_MENUENTRY;
	PLUG_CB_MENUENTRY = packed record
		hEntry: Integer;
	end;

Type
	CBTYPE = (
		CB_INITDEBUG,           //PLUG_CB_INITDEBUG         打开调试程序
		CB_STOPDEBUG,           //PLUG_CB_STOPDEBUG         关闭调试程序
		CB_CREATEPROCESS,       //PLUG_CB_CREATEPROCESS     创建进程
		CB_EXITPROCESS,         //PLUG_CB_EXITPROCESS       退出进程
		CB_CREATETHREAD,        //PLUG_CB_CREATETHREAD      创建线程
		CB_EXITTHREAD,          //PLUG_CB_EXITTHREAD        退出线程
		CB_SYSTEMBREAKPOINT,    //PLUG_CB_SYSTEMBREAKPOINT  系统断点事件
		CB_LOADDLL,             //PLUG_CB_LOADDLL           加载DLL事件
		CB_UNLOADDLL,           //PLUG_CB_UNLOADDLL         卸载DLL事件
		CB_OUTPUTDEBUGSTRING,   //PLUG_CB_OUTPUTDEBUGSTRING 打印事件
		CB_EXCEPTION,           //PLUG_CB_EXCEPTION         异常事件
		CB_BREAKPOINT,          //PLUG_CB_BREAKPOINT        断点事件
		CB_PAUSEDEBUG,          //PLUG_CB_PAUSEDEBUG        暂停调试
		CB_RESUMEDEBUG,         //PLUG_CB_RESUMEDEBUG       继续调试
		CB_STEPPED,             //PLUG_CB_STEPPED
		CB_ATTACH,              //PLUG_CB_ATTACHED          附加调试程序   (before attaching, after CB_INITDEBUG)
		CB_DETACH,              //PLUG_CB_DETACH            剥离调试程序   (before detaching, before CB_STOPDEBUG)
		CB_DEBUGEVENT,          //PLUG_CB_DEBUGEVENT        调试事件       (called on any debug event)
		CB_MENUENTRY            //PLUG_CB_MENUENTRY         菜单点击事件
	  );

  //typedef void (*CBPLUGIN)(CBTYPE cbType, void* callbackInfo);
  //typedef bool (*CBPLUGINCOMMAND)(int, char**);
  CBPLUGIN = procedure(cbType: CBTYPE;callbackInfo: Pointer); cdecl;
  CBPLUGINCOMMAND = function(argc: Integer;Command: PPAnsiChar): Boolean; cdecl;
  //typedef duint(*CBPLUGINEXPRFUNCTION)(int argc, duint* argv, void* userdata);
  CBPLUGINEXPRFUNCTION = function (arge:Integer;argv:duint;userdate:Pointer):duint;cdecl;
  CBPLUGINSCRIPT = procedure ();cdecl;

  ICONDATA = packed record
    idReserved: SmallInt; // Reserved
    idType: SmallInt; // Resource type
    idCount: SmallInt; // Image Count
  end; // 6 bytes
  PICONDATA = ^ICONDATA;

{PLUG_IMPEXP void}    procedure _plugin_registercallback(pluginHandle: Integer;CB_Type: CBTYPE;cb_Plugin: CBPLUGIN); cdecl; external x32_DBG;
{PLUG_IMPEXP bool}    function  _plugin_unregistercallback(pluginHandle: Integer;CB_Type: CBTYPE): Boolean; cdecl; external x32_DBG;
{PLUG_IMPEXP bool}	  function  _plugin_registercommand(pluginHandle: Integer;const command: PAChar;cbCommand: CBPLUGINCOMMAND;debugonly: Boolean): Boolean; cdecl; external x32_DBG;
{PLUG_IMPEXP bool}	  function  _plugin_unregistercommand(pluginHandle: Integer;const command: PAChar): Boolean; cdecl; external x32_DBG;
{PLUG_IMPEXP void}	  procedure _plugin_logprintf(const format: PAChar); cdecl; varargs; external x32_DBG; //Format型打印日志,尽量用Pachar包装
{PLUG_IMPEXP void}	  procedure _plugin_logputs(const text: PAChar); cdecl; external x32_DBG;             //打印日志
{PLUG_IMPEXP void}	  procedure _plugin_debugpause(); cdecl; external x32_DBG;
{PLUG_IMPEXP void}	  procedure _plugin_debugskipexceptions(skip: Boolean); cdecl; external x32_DBG;
{PLUG_IMPEXP int}	    function  _plugin_menuadd(hMenu: Integer;const title: PAChar): Integer; cdecl; external x32_DBG; //创建一个子菜单
{PLUG_IMPEXP bool}	  function  _plugin_menuaddentry(hMenu,hEntry: Integer;const title: PAChar): Boolean; cdecl; external x32_DBG; //在菜单里面加一项
{PLUG_IMPEXP bool}	  function  _plugin_menuaddseparator(hMenu: Integer): Boolean; cdecl; external x32_DBG; //在菜单里面加分隔符
{PLUG_IMPEXP bool}	  function  _plugin_menuclear(hMenu: Integer): Boolean; cdecl; external x32_DBG;  //删除菜单
{Warning:             The ICONDATA may have problems,You should pay attention to it!^_^}
{PLUG_IMPEXP void}    procedure _plugin_menuseticon(hMenu:Integer;const icon:PICONDATA); cdecl; external x32_DBG;     //?
{PLUG_IMPEXP void}    procedure _plugin_menuentryseticon(pluginHandle:Integer;hEntry:Integer;const icon:PICONDATA); cdecl; external x32_DBG;
{PLUG_IMPEXP void}    procedure _plugin_menuentrysetchecked(pluginHandle:Integer;hEntry:Integer;checked:Boolean); cdecl; external x32_DBG;
{PLUG_IMPEXP void}    procedure _plugin_startscript(cbScript:CBPLUGINSCRIPT); cdecl; external x32_DBG;
{PLUG_IMPEXP bool}    function _plugin_waituntilpaused:Boolean; cdecl; external x32_DBG;
{PLUG_IMPEXP bool}    function _plugin_registerexprfunction(pluginHandle:Integer;const name:PAChar;argc:Integer;cbFunction:CBPLUGINEXPRFUNCTION;userdata:Pointer):Boolean; cdecl; external x32_DBG;
{PLUG_IMPEXP bool}    function _plugin_unregisterexprfunction(pluginHandle:Integer;const name:PAChar):Boolean; cdecl; external x32_DBG;
{PLUG_IMPEXP bool}    function _plugin_unload(const pluginName:PAChar):Boolean; cdecl; external x32_DBG;
{PLUG_IMPEXP bool}    function _plugin_load(const pluginName:PAChar):Boolean; cdecl; external x32_DBG;
{PLUG_IMPEXP duint}   function _plugin_hash(const data:Pointer;size:duint):duint; cdecl; external x32_DBG;

//**********************************************new tools function**********************************************
procedure PrintLogW(log:PWideChar);overload;
procedure PrintLogW(log:WideString);overload;
procedure PrintLog(log:String);overload;
implementation

procedure PrintLogW(log:PWideChar);overload;
begin
   _plugin_logputs(PAnsiChar(AnsiString(WideString(log))));
end;
procedure PrintLogW(log:WideString);overload;
begin
  _plugin_logputs(PAnsiChar(AnsiString(log)));
end;

//fixed _pusher_
procedure PrintLog(log:string);overload;
begin
  _plugin_logputs(PAnsiChar(AnsiString(log)));
end;


end.