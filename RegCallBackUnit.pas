unit RegCallBackUnit;

interface
uses
  Winapi.Windows,_plugins,TitanEngine,bridgemain,System.SysUtils,System.Classes,_scriptapi_module,
  ScanUnit,

  //for about box..
  ShellApi,
  Vcl.Dialogs
  ;

  const
  RegCommand: PAChar       = 'ScanDB';
  MENU_SCAN                = 2;
  MENU_ABOUT               = 1;

  var
  myThread: TThread;
  Task: TTaskDialog;

type

  TCmdCallBackFun = function(argc: Integer;Command: PPAnsiChar): Boolean of object;

  TCmdCallBack = record
    argc:Integer;
    cbCommand: TCmdCallBackFun;
  end;
  PCmdCallBack = ^TCmdCallBack;

{ TRegeditCallBack }
  TRegeditCallBack = class(TObject)
    FhwndDlg: HWND; //gui window handle
		FhMenu: Integer; //plugin menu handle
    FhMenuDisasm:Integer; //plugin disasm menu handle
    FhMenuDump:Integer; //plugin dump menu handle
    FhMenuStack:Integer; //plugin stack menu handle
    FpluginHandle: Cardinal;
  private
    //打开调试程序
    procedure dbg_INITDEBUG(Info:PPLUG_CB_INITDEBUG);
    //关闭调试程序
    procedure dbg_STOPDEBUG(Info:PPLUG_CB_STOPDEBUG);
    //创建进程
    procedure dbg_CREATEPROCESS(Info:PPLUG_CB_CREATEPROCESS);
    //退出进程
    procedure dbg_EXITPROCESS(Info:PPLUG_CB_EXITPROCESS);
    //创建线程
    procedure dbg_CREATETHREAD(Info:PPLUG_CB_CREATETHREAD);
    //退出线程
    procedure dbg_EXITTHREAD(Info:PPLUG_CB_EXITTHREAD);
    //系统断点事件
    procedure dbg_SYSTEMBREAKPOINT(Info:PPLUG_CB_SYSTEMBREAKPOINT);
    //加载DLL事件
    procedure dbg_LOADDLL(Info:PPLUG_CB_LOADDLL);
    //卸载DLL事件
    procedure dbg_UNLOADDLL(Info:PPLUG_CB_UNLOADDLL);
    //打印事件
    procedure dbg_OUTPUTDEBUGSTRING(Info:PPLUG_CB_OUTPUTDEBUGSTRING);
    //异常事件
    procedure dbg_EXCEPTION(Info:PPLUG_CB_EXCEPTION);
    //断点事件
    procedure dbg_BREAKPOINT(Info:PPLUG_CB_BREAKPOINT);
    //暂停调试
    procedure dbg_PAUSEDEBUG(Info:PPLUG_CB_PAUSEDEBUG);
    //继续调试
    procedure dbg_RESUMEDEBUG(Info:PPLUG_CB_RESUMEDEBUG);

    procedure dbg_STEPPED(Info:PPLUG_CB_STEPPED);
    //附加调试程序
    procedure dbg_ATTACH(Info:PPLUG_CB_ATTACH);
    //剥离调试程序
    procedure dbg_DETACH(Info:PPLUG_CB_DETACH);
    //调试事件
    procedure dbg_DEBUGEVENT(Info:PPLUG_CB_DEBUGEVENT);
    //菜单点击事件
    procedure dbg_MENUENTRY(Info:PPLUG_CB_MENUENTRY);
  protected

  public
{************************************以下方法使用者请勿调用**************************************}
    /// <summary>
    /// 插件启动回调
    /// </summary>
    /// <remarks>
    /// 覆盖或修改该方法代码实现功能，而不是直接调用
    /// </remarks>
    procedure plugsetup(PlugSetupInfo: PPLUG_SETUPSTRUCT);
    /// <summary>
    /// 插件停止回调
    /// </summary>
    /// <remarks>
    /// 覆盖或修改该方法代码实现功能，而不是直接调用
    /// </remarks>
    function plugstop(): Boolean;
    /// <summary>
    /// 调试器事件回调
    /// </summary>
    /// <remarks>
    /// 不建议修改该方法，请修改或覆盖对应事件方法代码来实现相应功能
    /// </remarks>
    procedure AnyCallBack(cbType: CBTYPE;callbackInfo: Pointer);
    /// <summary>
    /// 调试器事件回调
    /// </summary>
    /// <remarks>
    /// 覆盖或修改该方法代码实现功能，而不是直接调用
    /// </remarks>
    function AnyCmdCallBack(argc: Integer;Command: PAnsiChar): Boolean;
    function AddMenuEntry(Menu,Entry: Integer; const title: PAChar): Boolean;
{***********************************以下方法可以使用者自行调用***********************************}
    /// <summary>
    /// 插件句柄
    /// </summary>
    property Handle:Cardinal read FpluginHandle;
    property hwndDlg: HWND  read FhwndDlg;
		property hMenu: Integer read FhMenu;
    property hMenuDisasm:Integer read FhMenuDisasm;
    property hMenuDump:Integer read FhMenuDump;
    property hMenuStack:Integer read FhMenuStack;
    /// <summary>
    /// 注册调试器回调
    /// </summary>
    procedure RegisterCallBack;
    /// <summary>
    /// 反注册调试器回调
    /// </summary>
    procedure UnRegisterCallBack;
    /// <summary>
    /// 注册调试器命令
    /// </summary>
    /// <param name="command">命令字符串</param>
    /// <param name="debugonly">是否只在调试状态可用</param>
    /// <returns>True 执行成功    False 执行失败</returns>
    function RegisterCommand(const command: PAChar;
                            debugonly: Boolean): Boolean;
    /// <summary>
    /// 反注册调试器命令
    /// </summary>
    /// <param name="command">命令字符串</param>
    /// <returns>True 成功    False 失败</returns>
    function  UnRegisterCommand(const command: PAChar): Boolean;
    /// <summary>
    /// 初始化
    /// </summary>
    /// <param name="pluginHandle">插件句柄</param>
    constructor Create(pluginHandle: Cardinal);
    /// <summary>
    /// 释放
    /// </summary>
    destructor Destroy; override;
{************************************************************************************************}
  //published

  end;
var
  RegCallBack:TRegeditCallBack = nil;

/// <summary>
/// 调试器回调过程
/// </summary>
/// <remarks>
/// 添加回调代码请使用TRegeditCallBack类
/// </remarks>
procedure dbgCallBack(cbType: CBTYPE;callbackInfo: Pointer); cdecl;
/// <summary>
/// 调试器命令回调过程
/// </summary>
/// <remarks>
/// 添加回调代码请使用TRegeditCallBack类
/// </remarks>
function dbgCmdCallBack(argc: Integer;Command: PPAnsiChar): Boolean; cdecl;

implementation


type
  TCustomProcedures = class(TObject)
  public
    class procedure TaskDialogHyperLinkClicked(Sender: TObject);
  end;

class procedure TCustomProcedures.TaskDialogHyperLinkClicked(Sender: TObject);
begin
    if Sender is TTaskDialog then
    ShellExecute(0, 'open', PChar(TTaskDialog(Sender).URL), nil, nil, SW_SHOWNORMAL);
end;



procedure dbgCallBack(cbType: CBTYPE;callbackInfo: Pointer); cdecl;
begin
  RegCallBack.AnyCallBack(cbType,callbackInfo);
end;

function dbgCmdCallBack(argc: Integer;Command: PPAnsiChar): Boolean; cdecl;
begin
 Result := RegCallBack.AnyCmdCallBack(argc,Command^);
end;

function TRegeditCallBack.AddMenuEntry(Menu,Entry: Integer; const title: PAChar): Boolean;
begin
  Result := _plugin_menuaddentry(Menu,Entry,title);
end;


//插件安装回调
procedure TRegeditCallBack.plugsetup(PlugSetupInfo: PPLUG_SETUPSTRUCT);
begin
   FhwndDlg := PlugSetupInfo^.hwndDlg; //gui window handle
	 FhMenu := PlugSetupInfo^.hMenu; //plugin menu handle
   FhMenuDisasm := PlugSetupInfo^.hMenuDisasm; //plugin disasm menu handle
   FhMenuDump := PlugSetupInfo^.hMenuDump; //plugin dump menu handle
   FhMenuStack := PlugSetupInfo^.hMenuStack; //plugin stack menu handle

   AddMenuEntry(hMenuDisasm,MENU_SCAN, 'Scan selected');
   AddMenuEntry(hMenu,MENU_ABOUT,'About');

   RegisterCommand(RegCommand,False);
end;

function TRegeditCallBack.plugstop(): Boolean;
begin
  UnRegisterCommand(RegCommand);
  Result := true;
  //
end;

//打开调试程序
procedure TRegeditCallBack.dbg_INITDEBUG(Info:PPLUG_CB_INITDEBUG);
begin
  //
end;
//关闭调试程序
procedure TRegeditCallBack.dbg_STOPDEBUG(Info:PPLUG_CB_STOPDEBUG);
begin
  //
end;

//创建进程
procedure TRegeditCallBack.dbg_CREATEPROCESS(Info:PPLUG_CB_CREATEPROCESS);
begin
  //
end;
//退出进程
procedure TRegeditCallBack.dbg_EXITPROCESS(Info:PPLUG_CB_EXITPROCESS);
begin
  //
end;
//创建线程
procedure TRegeditCallBack.dbg_CREATETHREAD(Info:PPLUG_CB_CREATETHREAD);
begin
  //
end;
//退出线程
procedure TRegeditCallBack.dbg_EXITTHREAD(Info:PPLUG_CB_EXITTHREAD);
begin
  //
end;

//系统断点事件
procedure TRegeditCallBack.dbg_SYSTEMBREAKPOINT(Info:PPLUG_CB_SYSTEMBREAKPOINT);
begin
  //
end;
//加载DLL事件
procedure TRegeditCallBack.dbg_LOADDLL(Info:PPLUG_CB_LOADDLL);
begin
 //_plugin_logprintf(PAnsiChar(AnsiString(BaseFromName(info.modname).ToHexString)));
end;
//卸载DLL事件
procedure TRegeditCallBack.dbg_UNLOADDLL(Info:PPLUG_CB_UNLOADDLL);
begin
  //
end;
//打印事件
procedure TRegeditCallBack.dbg_OUTPUTDEBUGSTRING(Info:PPLUG_CB_OUTPUTDEBUGSTRING);
begin
  //
end;
//异常事件
procedure TRegeditCallBack.dbg_EXCEPTION(Info:PPLUG_CB_EXCEPTION);
begin
  //
end;
//断点事件
procedure TRegeditCallBack.dbg_BREAKPOINT(Info:PPLUG_CB_BREAKPOINT);
begin
  //
end;
//暂停调试
procedure TRegeditCallBack.dbg_PAUSEDEBUG(Info:PPLUG_CB_PAUSEDEBUG);
begin
  //
end;
//继续调试
procedure TRegeditCallBack.dbg_RESUMEDEBUG(Info:PPLUG_CB_RESUMEDEBUG);
begin
  //
end;

procedure TRegeditCallBack.dbg_STEPPED(Info:PPLUG_CB_STEPPED);
begin
  //
end;
//附加调试程序
procedure TRegeditCallBack.dbg_ATTACH(Info:PPLUG_CB_ATTACH);
begin
  //
end;
//剥离调试程序
procedure TRegeditCallBack.dbg_DETACH(Info:PPLUG_CB_DETACH);
begin
  //
end;
//调试事件
procedure TRegeditCallBack.dbg_DEBUGEVENT(Info:PPLUG_CB_DEBUGEVENT);
begin
  //
end;
//菜单点击事件
procedure TRegeditCallBack.dbg_MENUENTRY(Info:PPLUG_CB_MENUENTRY);
begin


   case (info.hEntry) of
   MENU_SCAN:
   begin
    myThread := TThread.CreateAnonymousThread(
    procedure
    begin
    ScanUnit.SigGen;
    end);
    myThread.Start;
   end;


   MENU_ABOUT:
	  Begin
      with TTaskDialog.Create(task) do
      begin
      Caption := 'x64dbg: SigMD5Gen';
      CommonButtons := [tcbClose];
      Text :=
      'SigMD5Gen v0.1 - 09.03.2019'+#10+
      '     by _pusher_ '+#10#10+
      //'<a href="https://github.com/x64dbg/yarasigs/">https://github.com/x64dbg/yarasigs/</a>'+#13#10+
      ''+#13#10+
      'Google:'+#13#10+
      '<a href="https://www.google.com">http://www.google.com/</a>'
      +#13#10;

     Flags := [tfUseHiconMain, tfEnableHyperlinks];
     CustomMainIcon := nil;//Application.Icon;
     OnHyperlinkClicked := TCustomProcedures.TaskDialogHyperLinkClicked;

     Execute;
     Free;
     end;
   end;
 end;
  //
end;


procedure TRegeditCallBack.AnyCallBack(cbType: CBTYPE;callbackInfo: Pointer);
begin
   case cbType of
     CB_INITDEBUG:
     begin
        dbg_INITDEBUG(callbackInfo);
     end;
     CB_STOPDEBUG:
     begin
        dbg_STOPDEBUG(callbackInfo);
     end;
     CB_CREATEPROCESS:
     begin
        dbg_CREATEPROCESS(callbackInfo);
     end;
     CB_EXITPROCESS:
     begin
        dbg_EXITPROCESS(callbackInfo);
     end;
     CB_CREATETHREAD:
     begin
        dbg_CREATETHREAD(callbackInfo);
     end;
     CB_EXITTHREAD:
     begin
        dbg_EXITTHREAD(callbackInfo);
     end;
     CB_SYSTEMBREAKPOINT:
     begin
        dbg_SYSTEMBREAKPOINT(callbackInfo);
     end;
     CB_LOADDLL:
     begin
        dbg_LOADDLL(callbackInfo);
     end;
     CB_UNLOADDLL:
     begin
        dbg_UNLOADDLL(callbackInfo);
     end;
     CB_OUTPUTDEBUGSTRING:
     begin
        dbg_OUTPUTDEBUGSTRING(callbackInfo);
     end;
     CB_EXCEPTION:
     begin
        dbg_EXCEPTION(callbackInfo);
     end;
     CB_BREAKPOINT:
     begin
        dbg_BREAKPOINT(callbackInfo);
     end;
     CB_PAUSEDEBUG:
     begin
        dbg_PAUSEDEBUG(callbackInfo);
     end;
     CB_RESUMEDEBUG:
     begin
        dbg_RESUMEDEBUG(callbackInfo);
     end;
     CB_STEPPED:
     begin
        dbg_STEPPED(callbackInfo);
     end;
     CB_ATTACH:
     begin
        dbg_ATTACH(callbackInfo);
     end;
     CB_DETACH:
     begin
        dbg_DETACH(callbackInfo);
     end;
     CB_DEBUGEVENT:
     begin
        dbg_DEBUGEVENT(callbackInfo);
     end;
     CB_MENUENTRY:
     begin
        dbg_MENUENTRY(callbackInfo);
     end;
   end;
end;

function TRegeditCallBack.AnyCmdCallBack(argc: Integer;Command: PAnsiChar): Boolean;
begin

    myThread := TThread.CreateAnonymousThread(
    procedure
    begin
      ScanUnit.CheckOnStart;
    end);
    myThread.Start;

//scan here..

  //_plugin_logprintf(PAnsiChar('argc %d %s'),argc,COMMAND);

  Result := True;

end;

procedure TRegeditCallBack.RegisterCallBack;
begin
  _plugin_registercallback(Handle,CB_INITDEBUG,@dbgCallBack);
  _plugin_registercallback(Handle,CB_STOPDEBUG,@dbgCallBack);
  _plugin_registercallback(Handle,CB_CREATEPROCESS,@dbgCallBack);
  _plugin_registercallback(Handle,CB_EXITPROCESS,@dbgCallBack);
  _plugin_registercallback(Handle,CB_CREATETHREAD,@dbgCallBack);
  _plugin_registercallback(Handle,CB_EXITTHREAD,@dbgCallBack);
  _plugin_registercallback(Handle,CB_SYSTEMBREAKPOINT,@dbgCallBack);
  _plugin_registercallback(Handle,CB_LOADDLL,@dbgCallBack);
  _plugin_registercallback(Handle,CB_UNLOADDLL,@dbgCallBack);
  _plugin_registercallback(Handle,CB_OUTPUTDEBUGSTRING,@dbgCallBack);
  _plugin_registercallback(Handle,CB_EXCEPTION,@dbgCallBack);
  _plugin_registercallback(Handle,CB_BREAKPOINT,@dbgCallBack);
  _plugin_registercallback(Handle,CB_PAUSEDEBUG,@dbgCallBack);
  _plugin_registercallback(Handle,CB_STEPPED,@dbgCallBack);
  _plugin_registercallback(Handle,CB_ATTACH,@dbgCallBack);
  _plugin_registercallback(Handle,CB_DETACH,@dbgCallBack);
  _plugin_registercallback(Handle,CB_DEBUGEVENT,@dbgCallBack);
  _plugin_registercallback(Handle,CB_MENUENTRY,@dbgCallBack);
end;

function TRegeditCallBack.RegisterCommand(const command: PAChar; debugonly: Boolean): Boolean;
begin
  Result := _plugin_registercommand(Handle,COMMAND,dbgCmdCallBack,debugonly);
end;

function TRegeditCallBack.UnRegisterCommand(const command: PAChar): Boolean;
begin
  Result := _plugin_unregistercommand(Handle,command);
end;

procedure TRegeditCallBack.UnRegisterCallBack;
begin
  _plugin_unregistercallback(Handle,CB_INITDEBUG);
  _plugin_unregistercallback(Handle,CB_STOPDEBUG);
  _plugin_unregistercallback(Handle,CB_CREATEPROCESS);
  _plugin_unregistercallback(Handle,CB_EXITPROCESS);
  _plugin_unregistercallback(Handle,CB_CREATETHREAD);
  _plugin_unregistercallback(Handle,CB_EXITTHREAD);
  _plugin_unregistercallback(Handle,CB_SYSTEMBREAKPOINT);
  _plugin_unregistercallback(Handle,CB_LOADDLL);
  _plugin_unregistercallback(Handle,CB_UNLOADDLL);
  _plugin_unregistercallback(Handle,CB_OUTPUTDEBUGSTRING);
  _plugin_unregistercallback(Handle,CB_EXCEPTION);
  _plugin_unregistercallback(Handle,CB_BREAKPOINT);
  _plugin_unregistercallback(Handle,CB_PAUSEDEBUG);
  _plugin_unregistercallback(Handle,CB_STEPPED);
  _plugin_unregistercallback(Handle,CB_ATTACH);
  _plugin_unregistercallback(Handle,CB_DETACH);
  _plugin_unregistercallback(Handle,CB_DEBUGEVENT);
  _plugin_unregistercallback(Handle,CB_MENUENTRY);
end;



constructor TRegeditCallBack.Create(pluginHandle: Cardinal);
begin
  FpluginHandle := pluginHandle;
end;

destructor TRegeditCallBack.Destroy;
begin
end;



end.