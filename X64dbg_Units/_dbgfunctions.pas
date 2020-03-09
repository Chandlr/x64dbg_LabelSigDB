unit _dbgfunctions;
{
Ported form _dbgfunctions.h x64 and x32 to Unit Delphi by Lonely
FixCode:https://gitee.com/suxuss/DELPHI-x96dbg-Plugins-SDK
}
interface
uses
  Winapi.Windows,_plugins_type,bridgemain,bridgelist,_plugins;

{$I dbg.inc}
const
  // The longest ip address is 1234:6789:1234:6789:1234:6789:123.567.901.345 (46 bytes)
  TCP_ADDR_SIZE = 50;

type
  DBGPATCHINFO = packed record
      fmod:array [0..MAX_MODULE_SIZE - 1] of AChar;
      addr:duint;
      oldbyte:Byte;
      newbyte:Byte;
  end;
  PDBGPATCHINFO = ^DBGPATCHINFO;

  DBGCALLSTACKENTRY = packed record
      addr:duint;
      from:duint;
      toAddr:duint;
      comment:array [0..MAX_COMMENT_SIZE - 1] of AChar;
  end;
  PDBGCALLSTACKENTRY = ^DBGCALLSTACKENTRY;

  DBGCALLSTACK = packed record
      total:NativeUInt;
      entries:PDBGCALLSTACKENTRY;
  end;
  PDBGCALLSTACK = ^DBGCALLSTACK;

  DBGSEHRECORD = packed record
    addr:duint;
    handler:duint;
  end;
  PDBGSEHRECORD = ^DBGSEHRECORD;

  DBGSEHCHAIN = packed record
    total:duint;
    records:PDBGSEHRECORD;
  end;
  PDBGSEHCHAIN = ^DBGSEHCHAIN;

  DBGPROCESSINFO = packed record
    dwProcessId:DWORD;
    szExeFile:array [0..MAX_PATH-1] of AChar;
    szExeArgs:array [0..MAX_COMMAND_LINE_SIZE-1] of AChar;
  end;
  PDBGPROCESSINFO = ^DBGPROCESSINFO;
  PPDBGPROCESSINFO = ^PDBGPROCESSINFO;

  TRACERECORDBYTETYPE = (
  {$Z4+}
    InstructionBody = 0,
    InstructionHeading = 1,
    InstructionTailing = 2,
    InstructionOverlapped = 3, // The byte was executed with differing instruction base addresses
    DataByte,  // This and the following is not implemented yet.
    DataWord,
    DataDWord,
    DataQWord,
    DataFloat,
    DataDouble,
    DataLongDouble,
    DataXMM,
    DataYMM,
    DataMMX,
    DataMixed, //the byte is accessed in multiple ways
    InstructionDataMixed //the byte is both executed and written
  {$Z4-}
  );

  TRACERECORDTYPE = (
  {$Z4+}
    TraceRecordNone,
    TraceRecordBitExec,
    TraceRecordByteWithExecTypeAndCounter,
    TraceRecordWordWithExecTypeAndCounter
  {$Z4-}
  );

  HANDLEINFO = packed record
    Handle:duint;
    TypeNumber:Byte;
    GrantedAccess:Cardinal;
  end;
  PHANDLEINFO = ^HANDLEINFO;

  TCPCONNECTIONINFO = packed record
    RemoteAddress:array [0..TCP_ADDR_SIZE - 1] of AChar;
    RemotePort:Word;
    LocalAddress:array [0..TCP_ADDR_SIZE - 1] of AChar;
    LocalPort:Word;
    StateText:array [0..TCP_ADDR_SIZE - 1] of AChar;
    State:Cardinal;
  end;
  PTCPCONNECTIONINFO = ^TCPCONNECTIONINFO;

  ASSEMBLEATEX = function (addr:duint;const instruction:PAChar;error:PAChar;fillnop:Boolean):Boolean;cdecl;
  SECTIONFROMADDR = function (addr:duint;section:PAChar):Boolean;cdecl;
  MODNAMEFROMADDR = function (addr:duint;modname:PAChar;extension:Boolean):Boolean;cdecl;
  MODBASEFROMADDR = function (addr:duint):duint;cdecl;
  MODBASEFROMNAME = function (const modname:PAChar):duint;cdecl;
  MODSIZEFROMADDR = function (addr:duint):duint;cdecl;
  ASSEMBLE = function (addr:duint;dest:PByte;size:PInteger;const instruction:PAChar;error:PAChar):Boolean;cdecl;
  PATCHGET = function (addr:duint):Boolean;cdecl;
  PATCHINRANGE = function (start:duint;fend:duint):Boolean;cdecl;
  MEMPATCH = function(va:duint;const src:PByte;size:duint):Boolean;cdecl;
  PATCHRESTORERANGE = procedure (start:duint;fend:duint);cdecl;
  PATCHENUM = function (patchlist:PDBGPATCHINFO;cbsize:PSIZE_T):Boolean;cdecl;
  PATCHRESTORE = function (addr:duint):Boolean;cdecl;
  PATCHFILE = function (patchlist:PDBGPATCHINFO;count:Integer;const szFileName:PAChar;error:PAChar):Integer;cdecl;
  MODPATHFROMADDR = function (addr:duint;path:PAChar;size:Integer):Integer;cdecl;
  MODPATHFROMNAME = function (const modname:PAChar;path:PAChar;size:Integer):Integer;cdecl;
  DISASMFAST = function (const data:PByte;addr:duint;basicinfo:PBASIC_INSTRUCTION_INFO):Boolean;cdecl;
  MEMUPDATEMAP = procedure ();cdecl;
  GETCALLSTACK = procedure (callstack:PDBGCALLSTACK);cdecl;
  GETSEHCHAIN = procedure (sehchain:PDBGSEHCHAIN);cdecl;
  SYMBOLDOWNLOADALLSYMBOLS = procedure (const szSymbolStore:PAChar);cdecl;
  GETJIT = function (jit:PAChar;x64:Boolean):Boolean;cdecl;
  GETJITAUTO = function (jitauto:PBoolean):Boolean;cdecl;
  GETDEFJIT = function (defjit:PAChar):Boolean;cdecl;
  GETPROCESSLIST = function (entries:PPDBGPROCESSINFO;count:PInteger):Boolean;cdecl;
  GETPAGERIGHTS = function (addr:duint;rights:PAChar):Boolean;cdecl;
  SETPAGERIGHTS = function (addr:duint;const rights:PAChar):Boolean;cdecl;
  PAGERIGHTSTOSTRING = function (protect:DWORD;rights:PAChar):Boolean;cdecl;
  ISPROCESSELEVATED = function ():Boolean;cdecl;
  GETCMDLINE = function (cmdline:PAChar;cbsize:PSIZE_T):Boolean;cdecl;
  SETCMDLINE = function (const cmdline:PAChar):Boolean;cdecl;
  FILEOFFSETTOVA = function (const modname:PAChar;offset:duint):duint;cdecl;
  VATOFILEOFFSET = function (va:duint):duint;cdecl;
  GETADDRFROMLINE = function (const szSourceFile:PAChar;line:Integer;displacement:pduint):duint;cdecl;
  GETSOURCEFROMADDR = function (addr:duint;szSourceFile:PAChar;line:PInteger):Boolean;cdecl;
  VALFROMSTRING = function (const Fstring:PAChar;value:pduint):Boolean;cdecl;
  PATCHGETEX = function (addr:duint;info:PDBGPATCHINFO):Boolean;cdecl;
  GETBRIDGEBP = function (ftype:BPXTYPE;addr:duint;bp:PBRIDGEBP):Boolean;cdecl;
  STRINGFORMATINLINE = function (const fformat:PAChar;resultSize:SIZE_T;result:PAChar):Boolean;cdecl;
  GETMNEMONICBRIEF = procedure (const mnem:PAChar;resultSize:SIZE_T;result:PAChar);cdecl;
  GETTRACERECORDHITCOUNT = function (address:duint):Cardinal;cdecl;
  GETTRACERECORDBYTETYPE = function (address:duint):TRACERECORDBYTETYPE;cdecl;
  SETTRACERECORDTYPE = function (pageAddress:duint;ftype:TRACERECORDTYPE):Boolean;cdecl;
  GETTRACERECORDTYPE = function (pageAddress:duint):TRACERECORDTYPE;cdecl;
  ENUMHANDLES = function (handles:PHANDLEINFO):Boolean;cdecl;
  GETHANDLENAME = function (handle:duint;name:PAChar;nameSize:SIZE_T;TypeName:PAChar;TypeNameSize:SIZE_T):Boolean;cdecl;
  ENUMTCPCONNECTIONS = function (connections:PTCPCONNECTIONINFO):Boolean;cdecl;
  GETDBGEVENTS = function ():duint;cdecl;
  MODGETPARTY = function (base:duint):Integer;cdecl;
  MODSETPARTY = procedure (base:duint;party:Integer);cdecl;
  WATCHISWATCHDOGTRIGGERED = function (id:Cardinal):Boolean;cdecl;
  MEMISCODEPAGE = function (addr:duint;refresh:Boolean):Boolean;cdecl;
  ANIMATECOMMAND = function (const command:PAChar):Boolean;cdecl;
  DBGSETDEBUGGEEINITSCRIPT = procedure (const fileName:PAChar);cdecl;
  DBGGETDEBUGGEEINITSCRIPT = function ():PAChar;cdecl;


implementation

end.
