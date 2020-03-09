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
    //�򿪵��Գ���
    procedure dbg_INITDEBUG(Info:PPLUG_CB_INITDEBUG);
    //�رյ��Գ���
    procedure dbg_STOPDEBUG(Info:PPLUG_CB_STOPDEBUG);
    //��������
    procedure dbg_CREATEPROCESS(Info:PPLUG_CB_CREATEPROCESS);
    //�˳�����
    procedure dbg_EXITPROCESS(Info:PPLUG_CB_EXITPROCESS);
    //�����߳�
    procedure dbg_CREATETHREAD(Info:PPLUG_CB_CREATETHREAD);
    //�˳��߳�
    procedure dbg_EXITTHREAD(Info:PPLUG_CB_EXITTHREAD);
    //ϵͳ�ϵ��¼�
    procedure dbg_SYSTEMBREAKPOINT(Info:PPLUG_CB_SYSTEMBREAKPOINT);
    //����DLL�¼�
    procedure dbg_LOADDLL(Info:PPLUG_CB_LOADDLL);
    //ж��DLL�¼�
    procedure dbg_UNLOADDLL(Info:PPLUG_CB_UNLOADDLL);
    //��ӡ�¼�
    procedure dbg_OUTPUTDEBUGSTRING(Info:PPLUG_CB_OUTPUTDEBUGSTRING);
    //�쳣�¼�
    procedure dbg_EXCEPTION(Info:PPLUG_CB_EXCEPTION);
    //�ϵ��¼�
    procedure dbg_BREAKPOINT(Info:PPLUG_CB_BREAKPOINT);
    //��ͣ����
    procedure dbg_PAUSEDEBUG(Info:PPLUG_CB_PAUSEDEBUG);
    //��������
    procedure dbg_RESUMEDEBUG(Info:PPLUG_CB_RESUMEDEBUG);

    procedure dbg_STEPPED(Info:PPLUG_CB_STEPPED);
    //���ӵ��Գ���
    procedure dbg_ATTACH(Info:PPLUG_CB_ATTACH);
    //������Գ���
    procedure dbg_DETACH(Info:PPLUG_CB_DETACH);
    //�����¼�
    procedure dbg_DEBUGEVENT(Info:PPLUG_CB_DEBUGEVENT);
    //�˵�����¼�
    procedure dbg_MENUENTRY(Info:PPLUG_CB_MENUENTRY);
  protected

  public
{************************************���·���ʹ�����������**************************************}
    /// <summary>
    /// ��������ص�
    /// </summary>
    /// <remarks>
    /// ���ǻ��޸ĸ÷�������ʵ�ֹ��ܣ�������ֱ�ӵ���
    /// </remarks>
    procedure plugsetup(PlugSetupInfo: PPLUG_SETUPSTRUCT);
    /// <summary>
    /// ���ֹͣ�ص�
    /// </summary>
    /// <remarks>
    /// ���ǻ��޸ĸ÷�������ʵ�ֹ��ܣ�������ֱ�ӵ���
    /// </remarks>
    function plugstop(): Boolean;
    /// <summary>
    /// �������¼��ص�
    /// </summary>
    /// <remarks>
    /// �������޸ĸ÷��������޸Ļ򸲸Ƕ�Ӧ�¼�����������ʵ����Ӧ����
    /// </remarks>
    procedure AnyCallBack(cbType: CBTYPE;callbackInfo: Pointer);
    /// <summary>
    /// �������¼��ص�
    /// </summary>
    /// <remarks>
    /// ���ǻ��޸ĸ÷�������ʵ�ֹ��ܣ�������ֱ�ӵ���
    /// </remarks>
    function AnyCmdCallBack(argc: Integer;Command: PAnsiChar): Boolean;
    function AddMenuEntry(Menu,Entry: Integer; const title: PAChar): Boolean;
{***********************************���·�������ʹ�������е���***********************************}
    /// <summary>
    /// ������
    /// </summary>
    property Handle:Cardinal read FpluginHandle;
    property hwndDlg: HWND  read FhwndDlg;
		property hMenu: Integer read FhMenu;
    property hMenuDisasm:Integer read FhMenuDisasm;
    property hMenuDump:Integer read FhMenuDump;
    property hMenuStack:Integer read FhMenuStack;
    /// <summary>
    /// ע��������ص�
    /// </summary>
    procedure RegisterCallBack;
    /// <summary>
    /// ��ע��������ص�
    /// </summary>
    procedure UnRegisterCallBack;
    /// <summary>
    /// ע�����������
    /// </summary>
    /// <param name="command">�����ַ���</param>
    /// <param name="debugonly">�Ƿ�ֻ�ڵ���״̬����</param>
    /// <returns>True ִ�гɹ�    False ִ��ʧ��</returns>
    function RegisterCommand(const command: PAChar;
                            debugonly: Boolean): Boolean;
    /// <summary>
    /// ��ע�����������
    /// </summary>
    /// <param name="command">�����ַ���</param>
    /// <returns>True �ɹ�    False ʧ��</returns>
    function  UnRegisterCommand(const command: PAChar): Boolean;
    /// <summary>
    /// ��ʼ��
    /// </summary>
    /// <param name="pluginHandle">������</param>
    constructor Create(pluginHandle: Cardinal);
    /// <summary>
    /// �ͷ�
    /// </summary>
    destructor Destroy; override;
{************************************************************************************************}
  //published

  end;
var
  RegCallBack:TRegeditCallBack = nil;

/// <summary>
/// �������ص�����
/// </summary>
/// <remarks>
/// ��ӻص�������ʹ��TRegeditCallBack��
/// </remarks>
procedure dbgCallBack(cbType: CBTYPE;callbackInfo: Pointer); cdecl;
/// <summary>
/// ����������ص�����
/// </summary>
/// <remarks>
/// ��ӻص�������ʹ��TRegeditCallBack��
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


//�����װ�ص�
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

//�򿪵��Գ���
procedure TRegeditCallBack.dbg_INITDEBUG(Info:PPLUG_CB_INITDEBUG);
begin
  //
end;
//�رյ��Գ���
procedure TRegeditCallBack.dbg_STOPDEBUG(Info:PPLUG_CB_STOPDEBUG);
begin
  //
end;

//��������
procedure TRegeditCallBack.dbg_CREATEPROCESS(Info:PPLUG_CB_CREATEPROCESS);
begin
  //
end;
//�˳�����
procedure TRegeditCallBack.dbg_EXITPROCESS(Info:PPLUG_CB_EXITPROCESS);
begin
  //
end;
//�����߳�
procedure TRegeditCallBack.dbg_CREATETHREAD(Info:PPLUG_CB_CREATETHREAD);
begin
  //
end;
//�˳��߳�
procedure TRegeditCallBack.dbg_EXITTHREAD(Info:PPLUG_CB_EXITTHREAD);
begin
  //
end;

//ϵͳ�ϵ��¼�
procedure TRegeditCallBack.dbg_SYSTEMBREAKPOINT(Info:PPLUG_CB_SYSTEMBREAKPOINT);
begin
  //
end;
//����DLL�¼�
procedure TRegeditCallBack.dbg_LOADDLL(Info:PPLUG_CB_LOADDLL);
begin
 //_plugin_logprintf(PAnsiChar(AnsiString(BaseFromName(info.modname).ToHexString)));
end;
//ж��DLL�¼�
procedure TRegeditCallBack.dbg_UNLOADDLL(Info:PPLUG_CB_UNLOADDLL);
begin
  //
end;
//��ӡ�¼�
procedure TRegeditCallBack.dbg_OUTPUTDEBUGSTRING(Info:PPLUG_CB_OUTPUTDEBUGSTRING);
begin
  //
end;
//�쳣�¼�
procedure TRegeditCallBack.dbg_EXCEPTION(Info:PPLUG_CB_EXCEPTION);
begin
  //
end;
//�ϵ��¼�
procedure TRegeditCallBack.dbg_BREAKPOINT(Info:PPLUG_CB_BREAKPOINT);
begin
  //
end;
//��ͣ����
procedure TRegeditCallBack.dbg_PAUSEDEBUG(Info:PPLUG_CB_PAUSEDEBUG);
begin
  //
end;
//��������
procedure TRegeditCallBack.dbg_RESUMEDEBUG(Info:PPLUG_CB_RESUMEDEBUG);
begin
  //
end;

procedure TRegeditCallBack.dbg_STEPPED(Info:PPLUG_CB_STEPPED);
begin
  //
end;
//���ӵ��Գ���
procedure TRegeditCallBack.dbg_ATTACH(Info:PPLUG_CB_ATTACH);
begin
  //
end;
//������Գ���
procedure TRegeditCallBack.dbg_DETACH(Info:PPLUG_CB_DETACH);
begin
  //
end;
//�����¼�
procedure TRegeditCallBack.dbg_DEBUGEVENT(Info:PPLUG_CB_DEBUGEVENT);
begin
  //
end;
//�˵�����¼�
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