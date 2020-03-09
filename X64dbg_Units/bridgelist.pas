unit bridgelist;
{
Ported form bridgelist.h x64 and x32 to Unit Delphi by Lonely
FixCode:https://gitee.com/suxuss/DELPHI-x96dbg-Plugins-SDK
}


interface
uses
  Winapi.Windows,bridgemain;
{$I dbg.inc}

type
  ListInfo = packed record
    count:Integer;
    size:SIZE_T;
    data:Pointer;
  end;

  PListInfo = ^ListInfo;

//Dont Codeing Object!

implementation


end.
