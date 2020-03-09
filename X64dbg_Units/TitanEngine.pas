unit TitanEngine;

interface
  uses Winapi.Windows;

{$I dbg.inc}
  //{$DEFINE WIN64}

{TitanEngine Delphi SDK - 2.0.3}
{http://www.reversinglabs.com/}
{* FixCode:https://gitee.com/suxuss/DELPHI-x96dbg-Plugins-SDK}
{2019-1-9 Fix LongInt->ULONG_PTR  X64bug}
{Types}

type


  PE32Structure = ^PE_32_STRUCT;
  PE_32_STRUCT = packed record
	PE32Offset : LongInt;
	ImageBase : LongInt;
	OriginalEntryPoint : LongInt;
	BaseOfCode: LongInt;
	BaseOfData: LongInt;
	NtSizeOfImage : LongInt;
	NtSizeOfHeaders : LongInt;
	SizeOfOptionalHeaders : SmallInt;
	FileAlignment : LongInt;
	SectionAligment : LongInt;
	ImportTableAddress : LongInt;
	ImportTableSize : LongInt;
	ResourceTableAddress : LongInt;
	ResourceTableSize : LongInt;
	ExportTableAddress : LongInt;
	ExportTableSize : LongInt;
	TLSTableAddress : LongInt;
	TLSTableSize : LongInt;
	RelocationTableAddress : LongInt;
	RelocationTableSize : LongInt;
	TimeDateStamp : LongInt;
	SectionNumber : SmallInt;
	CheckSum : LongInt;
	SubSystem : SmallInt;
	Characteristics : SmallInt;
	NumberOfRvaAndSizes : LongInt;
  end;

PE64Structure = ^PE_64_STRUCT;
  PE_64_STRUCT = packed record
	PE64Offset : ULONG_PTR;
	ImageBase : Int64;
	OriginalEntryPoint : Int64;
	BaseOfCode: ULONG_PTR;
	BaseOfData: ULONG_PTR;
	NtSizeOfImage : ULONG_PTR;
	NtSizeOfHeaders : ULONG_PTR;
	SizeOfOptionalHeaders : SmallInt;
	FileAlignment : ULONG_PTR;
	SectionAligment : ULONG_PTR;
	ImportTableAddress : ULONG_PTR;
	ImportTableSize : ULONG_PTR;
	ResourceTableAddress : ULONG_PTR;
	ResourceTableSize : ULONG_PTR;
	ExportTableAddress : ULONG_PTR;
	ExportTableSize : ULONG_PTR;
	TLSTableAddress : ULONG_PTR;
	TLSTableSize : ULONG_PTR;
	RelocationTableAddress : ULONG_PTR;
	RelocationTableSize : ULONG_PTR;
	TimeDateStamp : ULONG_PTR;
	SectionNumber : SmallInt;
	CheckSum : ULONG_PTR;
	SubSystem : SmallInt;
	Characteristics : SmallInt;
	NumberOfRvaAndSizes : ULONG_PTR;
  end;

{$IFDEF WIN64}
  PEStruct = PE_64_STRUCT;
{$ELSE}
  PEStruct = PE_32_STRUCT;
{$ENDIF}

  FileStatusInfo = ^FILE_STATUS_INFO;
  FILE_STATUS_INFO = packed record
	OveralEvaluation : BYTE;
	EvaluationTerminatedByException : boolean;
	FileIs64Bit : boolean;
	FileIsDLL : boolean;
	FileIsConsole : boolean;
	MissingDependencies : boolean;
	MissingDeclaredAPIs : boolean;
	SignatureMZ : BYTE;
	SignaturePE : BYTE;
	EntryPoint : BYTE;
	ImageBase : BYTE;
	SizeOfImage : BYTE;
	FileAlignment : BYTE;
	SectionAlignment : BYTE;
	ExportTable : BYTE;
	RelocationTable : BYTE;
	ImportTable : BYTE;
	ImportTableSection : BYTE;
	ImportTableData : BYTE;
	IATTable : BYTE;
	TLSTable : BYTE;
	LoadConfigTable : BYTE;
	BoundImportTable : BYTE;
	COMHeaderTable : BYTE;
	ResourceTable : BYTE;
	ResourceData : BYTE;
	SectionTable : BYTE;
  end;

  FileFixInfo = ^FILE_FIX_INFO;
  FILE_FIX_INFO = packed record
	OveralEvaluation : BYTE;
	FixingTerminatedByException : boolean;
	FileFixPerformed : boolean;
	StrippedRelocation : boolean;
	DontFixRelocations : boolean;
	OriginalRelocationTableAddress : ULONG_PTR;
	OriginalRelocationTableSize : ULONG_PTR;
	StrippedExports : boolean;
	DontFixExports : boolean;
	OriginalExportTableAddress : ULONG_PTR;
	OriginalExportTableSize : ULONG_PTR;
	StrippedResources : boolean;
	DontFixResources : boolean;
	OriginalResourceTableAddress : ULONG_PTR;
	OriginalResourceTableSize : ULONG_PTR;
	StrippedTLS : boolean;
	DontFixTLS : boolean;
	OriginalTLSTableAddress : ULONG_PTR;
	OriginalTLSTableSize : ULONG_PTR;
	StrippedLoadConfig : boolean;
	DontFixLoadConfig : boolean;
	OriginalLoadConfigTableAddress : ULONG_PTR;
	OriginalLoadConfigTableSize : ULONG_PTR;
	StrippedBoundImports : boolean;
	DontFixBoundImports : boolean;
	OriginalBoundImportTableAddress : ULONG_PTR;
	OriginalBoundImportTableSize : ULONG_PTR;
	StrippedIAT : boolean;
	DontFixIAT : boolean;
	OriginalImportAddressTableAddress : ULONG_PTR;
	OriginalImportAddressTableSize : ULONG_PTR;
	StrippedCOM : boolean;
	DontFixCOM : boolean;
	OriginalCOMTableAddress : ULONG_PTR;
	OriginalCOMTableSize : ULONG_PTR;
  end;

  ImportEnumData = ^IMPORT_ENUM_DATA;
  IMPORT_ENUM_DATA = packed record
	NewDll : boolean;
	NumberOfImports : ULONG_PTR;
	ImageBase : ULONG_PTR;
	BaseImportThunk : ULONG_PTR;
	ImportThunk : ULONG_PTR;
	APIName : PAnsiChar;
	DLLName : PAnsiChar;
  end;
  
  ThreadItemData = ^THREAD_ITEM_DATA;
  THREAD_ITEM_DATA = packed record
	hThread : THandle;
	dwThreadId : ULONG_PTR;
	ThreadStartAddress : ULONG_PTR;
	ThreadLocalBase : ULONG_PTR;
  end;
  
  LibraryItemData = ^LIBRARY_ITEM_DATA;
  LIBRARY_ITEM_DATA = packed record
	hFile : THandle;
	BaseOfDll : Pointer;
	hFileMapping : THandle;
	hFileMappingView : Pointer;
	szLibraryPath:array[1..260] of AnsiChar;
	szLibraryName:array[1..260] of AnsiChar;
  end;
  
  ProcessItemData = ^PROCESS_ITEM_DATA;
  PROCESS_ITEM_DATA = packed record
	hProcess : THandle;
	dwProcessId : ULONG_PTR;
	hThread : THandle;
	dwThreadId : ULONG_PTR;
	hFile : THandle;
	BaseOfImage : Pointer;
	ThreadStartAddress : Pointer;
	ThreadLocalBase : Pointer;
  end;
  
  HandlerArray = ^HANDLER_ARRAY;
  HANDLER_ARRAY = packed record
	ProcessId : ULONG_PTR;
	hHandle : THandle;
  end;

  HookEntry = ^HOOK_ENTRY;
  HOOK_ENTRY = packed record
	IATHook : boolean;
	HookType : BYTE;
	HookSize : ULONG_PTR;
	HookAddress : Pointer;
	RedirectionAddress : Pointer;
	HookBytes:array[1..14] of BYTE;
	OriginalBytes:array[1..14] of BYTE;
	IATHookModuleBase : Pointer;
	IATHookNameHash : ULONG_PTR;
	HookIsEnabled : boolean;
	HookIsRemote : boolean;
	PatchedEntry : Pointer;
	RelocationInfo:array[1..7] of ULONG_PTR;
	RelocationCount : ULONG_PTR;
  end;

  PluginInformation = ^PLUGIN_INFORMATION;
  PLUGIN_INFORMATION = packed record
	PluginName:array[1..64] of AnsiChar;
	PluginMajorVersion : ULONG_PTR;
	PluginMinorVersion : ULONG_PTR;
	PluginBaseAddress : ULONG_PTR;
	TitanDebuggingCallBack : Pointer;
	TitanRegisterPlugin : Pointer;
	TitanReleasePlugin : Pointer;
	TitanResetPlugin : Pointer;
	PluginDisabled : boolean;
  end;
const
{Registers}
	UE_EAX = 1;
	UE_EBX = 2;
	UE_ECX = 3;
	UE_EDX = 4;
	UE_EDI = 5;
	UE_ESI = 6;
	UE_EBP = 7;
	UE_ESP = 8;
	UE_EIP = 9;
	UE_EFLAGS = 10;
	UE_DR0 = 11;
	UE_DR1 = 12;
	UE_DR2 = 13;
	UE_DR3 = 14;
	UE_DR6 = 15;
	UE_DR7 = 16;
	UE_CIP = 35;
	UE_CSP = 36;
	UE_SEG_GS = 37;
	UE_SEG_FS = 38;
	UE_SEG_ES = 39;
	UE_SEG_DS = 40;
	UE_SEG_CS = 41;
	UE_SEG_SS = 42;
{Constants}
	UE_PE_OFFSET = 0;
	UE_IMAGEBASE = 1;
	UE_OEP = 2;
	UE_SIZEOFIMAGE = 3;
	UE_SIZEOFHEADERS = 4;
	UE_SIZEOFOPTIONALHEADER = 5;
	UE_SECTIONALIGNMENT = 6;
	UE_IMPORTTABLEADDRESS = 7;
	UE_IMPORTTABLESIZE = 8;
	UE_RESOURCETABLEADDRESS = 9;
	UE_RESOURCETABLESIZE = 10;
	UE_EXPORTTABLEADDRESS = 11;
	UE_EXPORTTABLESIZE = 12;
	UE_TLSTABLEADDRESS = 13;
	UE_TLSTABLESIZE = 14;
	UE_RELOCATIONTABLEADDRESS = 15;
	UE_RELOCATIONTABLESIZE = 16;
	UE_TIMEDATESTAMP = 17;
	UE_SECTIONNUMBER = 18;         //节的个数
	UE_CHECKSUM = 19;
	UE_SUBSYSTEM = 20;
	UE_CHARACTERISTICS = 21;
	UE_NUMBEROFRVAANDSIZES = 22;
	UE_SECTIONNAME = 23;            //节名
	UE_SECTIONVIRTUALOFFSET = 24;   //节的内存VA
	UE_SECTIONVIRTUALSIZE = 25;     //节的内存VASize
	UE_SECTIONRAWOFFSET = 26;       //节的文件Raw
	UE_SECTIONRAWSIZE = 27;         //节的文件RawSize
	UE_SECTIONFLAGS = 28;

	UE_CH_BREAKPOINT = 1;
	UE_CH_SINGLESTEP = 2;
	UE_CH_ACCESSVIOLATION = 3;
	UE_CH_ILLEGALINSTRUCTION = 4;
	UE_CH_NONCONTINUABLEEXCEPTION = 5;
	UE_CH_ARRAYBOUNDSEXCEPTION = 6;
	UE_CH_FLOATDENORMALOPERAND = 7;
	UE_CH_FLOATDEVIDEBYZERO = 8;
	UE_CH_INTEGERDEVIDEBYZERO = 9;
	UE_CH_INTEGEROVERFLOW = 10;
	UE_CH_PRIVILEGEDINSTRUCTION = 11;
	UE_CH_PAGEGUARD = 12;
	UE_CH_EVERYTHINGELSE = 13;
	UE_CH_CREATETHREAD = 14;
	UE_CH_EXITTHREAD = 15;
	UE_CH_CREATEPROCESS = 16;
	UE_CH_EXITPROCESS = 17;
	UE_CH_LOADDLL = 18;
	UE_CH_UNLOADDLL = 19;
	UE_CH_OUTPUTDEBUGSTRING = 20;
    UE_CH_AFTEREXCEPTIONPROCESSING = 21;
    UE_CH_SYSTEMBREAKPOINT = 23;
    UE_CH_UNHANDLEDEXCEPTION = 24;
	UE_CH_RIPEVENT = 25;
    UE_CH_DEBUGEVENT = 26;
	
	UE_FUNCTION_STDCALL = 1;
	UE_FUNCTION_CCALL = 2;
	UE_FUNCTION_FASTCALL = 3;
	UE_FUNCTION_STDCALL_RET = 4;
	UE_FUNCTION_CCALL_RET = 5;
	UE_FUNCTION_FASTCALL_RET = 6;
	UE_FUNCTION_STDCALL_CALL = 7;
	UE_FUNCTION_CCALL_CALL = 8;
	UE_FUNCTION_FASTCALL_CALL = 9;
	UE_PARAMETER_BYTE = 0;
	UE_PARAMETER_WORD = 1;
	UE_PARAMETER_DWORD = 2;
	UE_PARAMETER_QWORD = 3;
	UE_PARAMETER_PTR_BYTE = 4;
	UE_PARAMETER_PTR_WORD = 5;
	UE_PARAMETER_PTR_DWORD = 6;
	UE_PARAMETER_PTR_QWORD = 7;
	UE_PARAMETER_STRING = 8;
	UE_PARAMETER_UNICODE = 9;

	UE_BREAKPOINT_INT3 = 1;
	UE_BREAKPOINT_LONG_INT3 = 2;
	UE_BREAKPOINT_UD2 = 3;

	UE_BPXREMOVED = 0;
	UE_BPXACTIVE = 1;
	UE_BPXINACTIVE = 2;

	UE_BREAKPOINT = 0;
	UE_SINGLESHOOT = 1;
	UE_HARDWARE = 2;
	UE_MEMORY = 3;
	UE_MEMORY_READ = 4;
	UE_MEMORY_WRITE = 5;
	UE_MEMORY_EXECUTE = 6;
	UE_BREAKPOINT_TYPE_INT3 = $10000000;
	UE_BREAKPOINT_TYPE_LONG_INT3 = $20000000;
	UE_BREAKPOINT_TYPE_UD2 = $30000000;

	UE_HARDWARE_EXECUTE = 4;
	UE_HARDWARE_WRITE = 5;
	UE_HARDWARE_READWRITE = 6;

	UE_HARDWARE_SIZE_1 = 7;
	UE_HARDWARE_SIZE_2 = 8;
	UE_HARDWARE_SIZE_4 = 9;

	UE_ON_LIB_LOAD = 1;
	UE_ON_LIB_UNLOAD = 2;
	UE_ON_LIB_ALL = 3;

	UE_APISTART = 0;
	UE_APIEND = 1;

	UE_PLATFORM_x86 = 1;
	UE_PLATFORM_x64 = 2;
	UE_PLATFORM_ALL = 3;

	UE_ACCESS_READ = 0;
	UE_ACCESS_WRITE = 1;
	UE_ACCESS_ALL = 2;
	
	UE_HIDE_BASIC = 1;

	UE_ENGINE_ALOW_MODULE_LOADING = 1;
	UE_ENGINE_AUTOFIX_FORWARDERS = 2;
	UE_ENGINE_PASS_ALL_EXCEPTIONS = 3;
	UE_ENGINE_NO_CONSOLE_WINDOW = 4;
	UE_ENGINE_BACKUP_FOR_CRITICAL_FUNCTIONS = 5;
	UE_ENGINE_CALL_PLUGIN_CALLBACK = 6;
	UE_ENGINE_RESET_CUSTOM_HANDLER = 7;
	UE_ENGINE_CALL_PLUGIN_DEBUG_CALLBACK = 8;
    UE_ENGINE_SET_DEBUG_PRIVILEGE = 9;

	UE_OPTION_REMOVEALL = 1;
	UE_OPTION_DISABLEALL = 2;
	UE_OPTION_REMOVEALLDISABLED = 3;
	UE_OPTION_REMOVEALLENABLED = 4;

	UE_STATIC_DECRYPTOR_XOR = 1;
	UE_STATIC_DECRYPTOR_SUB = 2;
	UE_STATIC_DECRYPTOR_ADD = 3;
	
	UE_STATIC_DECRYPTOR_FOREWARD = 1;
	UE_STATIC_DECRYPTOR_BACKWARD = 2;

	UE_STATIC_KEY_SIZE_1 = 1;
	UE_STATIC_KEY_SIZE_2 = 2;
	UE_STATIC_KEY_SIZE_4 = 4;
	UE_STATIC_KEY_SIZE_8 = 8;
	
	UE_STATIC_APLIB = 1;
	UE_STATIC_APLIB_DEPACK = 2;
	UE_STATIC_LZMA = 3;
	
	UE_STATIC_HASH_MD5 = 1;
	UE_STATIC_HASH_SHA1 = 2;
	UE_STATIC_HASH_CRC32 = 3;
	
	UE_RESOURCE_LANGUAGE_ANY = -1;

	UE_DEPTH_SURFACE = 0;
	UE_DEPTH_DEEP = 1;
	
	UE_UNPACKER_CONDITION_SEARCH_FROM_EP = 1;
	
	UE_UNPACKER_CONDITION_LOADLIBRARY = 1;
	UE_UNPACKER_CONDITION_GETPROCADDRESS = 2;
	UE_UNPACKER_CONDITION_ENTRYPOINTBREAK = 3;
	UE_UNPACKER_CONDITION_RELOCSNAPSHOT1 = 4;
	UE_UNPACKER_CONDITION_RELOCSNAPSHOT2 = 5;

	UE_FIELD_OK = 0;
	UE_FIELD_BROKEN_NON_FIXABLE = 1;
	UE_FIELD_BROKEN_NON_CRITICAL = 2;
	UE_FIELD_BROKEN_FIXABLE_FOR_STATIC_USE = 3;
	UE_FIELD_BROKEN_BUT_CAN_BE_EMULATED = 4;
	UE_FIELD_FIXABLE_NON_CRITICAL = 5;
	UE_FILED_FIXABLE_CRITICAL = 6;
	UE_FIELD_NOT_PRESET = 7;
	UE_FIELD_NOT_PRESET_WARNING = 8;

	UE_RESULT_FILE_OK = 10;
	UE_RESULT_FILE_INVALID_BUT_FIXABLE = 11;
	UE_RESULT_FILE_INVALID_AND_NON_FIXABLE = 12;
	UE_RESULT_FILE_INVALID_FORMAT = 13;
	
	UE_PLUGIN_CALL_REASON_PREDEBUG = 1;
	UE_PLUGIN_CALL_REASON_EXCEPTION = 2;
	UE_PLUGIN_CALL_REASON_POSTDEBUG = 3;

	TEE_HOOK_NRM_JUMP = 1;
	TEE_HOOK_NRM_CALL = 3;
	TEE_HOOK_IAT = 5;

{TitanEngine.Dumper.functions}
  function DumpProcess(hProcess:THandle; ImageBase:ULONG_PTR; szDumpFileName:PAnsiChar; EntryPoint:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'DumpProcess';
  function DumpProcessEx(ProcessId:ULONG_PTR; ImageBase:ULONG_PTR; szDumpFileName:PAnsiChar; EntryPoint:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'DumpProcessEx';
  function DumpMemory(hProcess:THandle; MemoryStart,MemorySize:ULONG_PTR; szDumpFileName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'DumpMemory';
  function DumpMemoryEx(ProcessId:ULONG_PTR; MemoryStart,MemorySize:ULONG_PTR; szDumpFileName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'DumpMemoryEx';
  function DumpRegions(hProcess:THandle; szDumpFolder:PAnsiChar; DumpAboveImageBaseOnly:boolean):boolean; stdcall;  external 'TitanEngine.dll' name 'DumpRegions';
  function DumpRegionsEx(ProcessId:ULONG_PTR; szDumpFolder:PAnsiChar; DumpAboveImageBaseOnly:boolean):boolean; stdcall;  external 'TitanEngine.dll' name 'DumpRegionsEx';
  function DumpModule(hProcess:THandle; ModuleBase:ULONG_PTR; szDumpFileName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'DumpModule';
  function DumpModuleEx(ProcessId:ULONG_PTR; ModuleBase:ULONG_PTR; szDumpFileName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'DumpModuleEx';
  function PastePEHeader(hProcess:THandle; ImageBase:ULONG_PTR; szDebuggedFileName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'PastePEHeader';
  function ExtractSection(szFileName,szDumpFileName:PAnsiChar; SectionNumber:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'ExtractSection';
  function ResortFileSections(szFileName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'ResortFileSections';
  function FindOverlay(szFileName:PAnsiChar; OverlayStart,OverlaySize:Pointer):boolean; stdcall;  external 'TitanEngine.dll' name 'FindOverlay';
  function ExtractOverlay(szFileName,szExtactedFileName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'ExtractOverlay';
  function AddOverlay(szFileName,szOverlayFileName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'AddOverlay';
  function CopyOverlay(szInFileName,szOutFileName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'CopyOverlay';
  function RemoveOverlay(szFileName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'RemoveOverlay';
  function MakeAllSectionsRWE(szFileName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'MakeAllSectionsRWE';
  function AddNewSectionEx(szFileName,szSectionName:PAnsiChar; SectionSize,SectionAttributes:ULONG_PTR; SectionContent:Pointer; ContentSize:ULONG_PTR):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'AddNewSectionEx';
  function AddNewSection(szFileName,szSectionName:PAnsiChar; SectionSize:ULONG_PTR):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'AddNewSection';
  function ResizeLastSection(szFileName:PAnsiChar; NumberOfExpandBytes:ULONG_PTR; AlignResizeData:boolean):boolean; stdcall;  external 'TitanEngine.dll' name 'ResizeLastSection';
  procedure SetSharedOverlay(szFileName:PAnsiChar); stdcall;  external 'TitanEngine.dll' name 'SetSharedOverlay';
  function GetSharedOverlay():PAnsiChar; stdcall;  external 'TitanEngine.dll' name 'GetSharedOverlay';
  function DeleteLastSection(szFileName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'DeleteLastSection';
  function DeleteLastSectionEx(szFileName:PAnsiChar; NumberOfSections:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'DeleteLastSectionEx';
  function GetPE32DataFromMappedFile(FileMapVA,WhichSection,WhichData:ULONG_PTR):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'GetPE32DataFromMappedFile';
  function GetPE32Data(szFileName:PAnsiChar; WhichSection,WhichData:ULONG_PTR):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'GetPE32Data';
  function GetPE32DataFromMappedFileEx(FileMapVA:ULONG_PTR; DataStorage:Pointer):boolean; stdcall;  external 'TitanEngine.dll' name 'GetPE32DataFromMappedFileEx';
  function GetPE32DataEx(szFileName:PAnsiChar; DataStorage:Pointer):boolean; stdcall;  external 'TitanEngine.dll' name 'GetPE32DataEx';
  function SetPE32DataForMappedFile(FileMapVA,WhichSection,WhichData,NewDataValue:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'SetPE32DataForMappedFile';
  function SetPE32Data(szFileName:PAnsiChar; WhichSection,WhichData,NewDataValue:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'SetPE32Data';
  function SetPE32DataForMappedFileEx(szFileName:PAnsiChar; DataStorage:Pointer):boolean; stdcall;  external 'TitanEngine.dll' name 'SetPE32DataForMappedFileEx';
  function SetPE32DataEx(szFileName:PAnsiChar; DataStorage:Pointer):boolean; stdcall;  external 'TitanEngine.dll' name 'SetPE32DataEx';
  function GetPE32SectionNumberFromVA(FileMapVA,AddressToConvert:ULONG_PTR):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'GetPE32SectionNumberFromVA';
  function ConvertVAtoFileOffset(FileMapVA,AddressToConvert:ULONG_PTR; ReturnType:boolean):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ConvertVAtoFileOffset';
  function ConvertVAtoFileOffsetEx(FileMapVA,FileSize,ImageBase,AddressToConvert:ULONG_PTR; AddressIsRVA,ReturnType:boolean):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ConvertVAtoFileOffsetEx';
  function ConvertFileOffsetToVA(FileMapVA,AddressToConvert:ULONG_PTR; ReturnType:boolean):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ConvertFileOffsetToVA';
  function ConvertFileOffsetToVAEx(FileMapVA,FileSize,ImageBase,AddressToConvert:ULONG_PTR; ReturnType:boolean):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ConvertFileOffsetToVAEx';
{TitanEngine.Realigner.functions}
  function FixHeaderCheckSum(szFileName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'FixHeaderCheckSum';
  function RealignPE(FileMapVA,FileSize,RealingMode:ULONG_PTR):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'RealignPE';
  function RealignPEEx(szFileName:PAnsiChar; RealingFileSize,ForcedFileAlignment:ULONG_PTR):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'RealignPEEx';
  function WipeSection(szFileName:PAnsiChar; WipeSectionNumber:ULONG_PTR; RemovePhysically:boolean):boolean; stdcall;  external 'TitanEngine.dll' name 'WipeSection';
  function IsPE32FileValidEx(szFileName:PAnsiChar; CheckDepth:ULONG_PTR; FileStatusInfo:Pointer):boolean; stdcall;  external 'TitanEngine.dll' name 'IsPE32FileValidEx';
  function FixBrokenPE32FileEx(szFileName:PAnsiChar; FileStatusInfo,FileFixInfo:Pointer):boolean; stdcall;  external 'TitanEngine.dll' name 'FixBrokenPE32FileEx';
  function IsFileDLL(szFileName:PAnsiChar; FileMapVA:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'IsFileDLL';
{TitanEngine.Hider.functions}
  function GetPEBLocation(hProcess:THandle):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'GetPEBLocation';
  function GetPEBLocation64(hProcess:THandle):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'GetPEBLocation64';
  function HideDebugger(hProcess:THandle; PatchAPILevel:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'HideDebugger';
  function UnHideDebugger(hProcess:THandle; PatchAPILevel:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'UnHideDebugger';
{TitanEngine.Relocater.functions}
  procedure RelocaterCleanup(); stdcall;  external 'TitanEngine.dll' name 'RelocaterCleanup';
  procedure RelocaterInit(MemorySize,OldImageBase,NewImageBase:ULONG_PTR); stdcall;  external 'TitanEngine.dll' name 'RelocaterInit';
  procedure RelocaterAddNewRelocation(hProcess:THandle; RelocateAddress,RelocateState:ULONG_PTR); stdcall;  external 'TitanEngine.dll' name 'RelocaterAddNewRelocation';
  function RelocaterEstimatedSize():ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'RelocaterEstimatedSize';
  function RelocaterExportRelocation(StorePlace,StorePlaceRVA,FileMapVA:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'RelocaterExportRelocation';
  function RelocaterExportRelocationEx(szFileName,szSectionName:PAnsiChar; StorePlace,StorePlaceRVA:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'RelocaterExportRelocationEx';
  function RelocaterGrabRelocationTable(hProcess:THandle; MemoryStart,MemorySize:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'RelocaterGrabRelocationTable';
  function RelocaterGrabRelocationTableEx(hProcess:THandle; MemoryStart,MemorySize,NtSizeOfImage:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'RelocaterGrabRelocationTableEx';
  function RelocaterMakeSnapshot(hProcess:THandle; szSaveFileName:PAnsiChar; MemoryStart,MemorySize:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'RelocaterMakeSnapshot';
  function RelocaterCompareTwoSnapshots(hProcess:THandle; LoadedImageBase,NtSizeOfImage:ULONG_PTR; szDumpFile1,szDumpFile2:PAnsiChar; MemStart:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'RelocaterCompareTwoSnapshots';
  function RelocaterChangeFileBase(szFileName:PAnsiChar; NewImageBase:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'RelocaterChangeFileBase';
  function RelocaterRelocateMemoryBlock(FileMapVA,MemoryLocation:ULONG_PTR; RelocateMemory:Pointer; RelocateMemorySize,CurrentLoadedBase,RelocateBase:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'RelocaterRelocateMemoryBlock';
  function RelocaterWipeRelocationTable(szFileName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'RelocaterWipeRelocationTable';
{TitanEngine.Resourcer.functions}
  function ResourcerLoadFileForResourceUse(szFileName:PAnsiChar):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ResourcerLoadFileForResourceUse';
  function ResourcerFreeLoadedFile(LoadedFileBase:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'ResourcerFreeLoadedFile';
  function ResourcerExtractResourceFromFileEx(FileMapVA:ULONG_PTR; szResourceType,szResourceName,szExtractedFileName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'ResourcerExtractResourceFromFileEx';
  function ResourcerExtractResourceFromFile(szFileName,szResourceType,szResourceName,szExtractedFileName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'ResourcerExtractResourceFromFile';
  function ResourcerFindResource(szFileName,szResourceType:PAnsiChar; ResourceType:ULONG_PTR; szResourceName:PAnsiChar; ResourceName,ResourceLanguage:ULONG_PTR; pResourceData,pResourceSize:Pointer):boolean; stdcall;  external 'TitanEngine.dll' name 'ResourcerFindResource';
  function ResourcerFindResourceEx(FileMapVA,FileSize:ULONG_PTR; szResourceType:PAnsiChar; ResourceType:ULONG_PTR; szResourceName:PAnsiChar; ResourceName,ResourceLanguage:ULONG_PTR; pResourceData,pResourceSize:Pointer):boolean; stdcall;  external 'TitanEngine.dll' name 'ResourcerFindResourceEx';
  procedure ResourcerEnumerateResource(szFileName:PAnsiChar; CallBack:ULONG_PTR); stdcall;  external 'TitanEngine.dll' name 'ResourcerEnumerateResource';
  procedure ResourcerEnumerateResourceEx(FileMapVA,FileSize:ULONG_PTR; CallBack:ULONG_PTR); stdcall;  external 'TitanEngine.dll' name 'ResourcerEnumerateResourceEx';
{TitanEngine.FindOEP.functions}
  procedure FindOEPInit(); stdcall;  external 'TitanEngine.dll' name 'FindOEPInit';
  procedure FindOEPGenerically(szFileName:PAnsiChar; TraceInitCallBack,CallBack:Pointer); stdcall;  external 'TitanEngine.dll' name 'FindOEPGenerically';
{TitanEngine.Threader.functions}
  function ThreaderImportRunningThreadData(ProcessId:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'ThreaderImportRunningThreadData';
  function ThreaderGetThreadInfo(hThread:THandle; ThreadId:ULONG_PTR):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ThreaderGetThreadInfo';
  procedure ThreaderEnumThreadInfo(EnumCallBack:Pointer); stdcall;  external 'TitanEngine.dll' name 'ThreaderGetThreadInfo';
  function ThreaderPauseThread(hThread:THandle):boolean; stdcall;  external 'TitanEngine.dll' name 'ThreaderPauseThread';
  function ThreaderResumeThread(hThread:THandle):boolean; stdcall;  external 'TitanEngine.dll' name 'ThreaderResumeThread';
  function ThreaderTerminateThread(hThread:THandle; ThreadExitCode:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'ThreaderTerminateThread';
  function ThreaderPauseAllThreads(LeaveMainRunning:boolean):boolean; stdcall;  external 'TitanEngine.dll' name 'ThreaderPauseAllThreads';
  function ThreaderResumeAllThreads(LeaveMainPaused:boolean):boolean; stdcall;  external 'TitanEngine.dll' name 'ThreaderResumeAllThreads';
  function ThreaderPauseProcess():boolean; stdcall;  external 'TitanEngine.dll' name 'ThreaderPauseProcess';
  function ThreaderResumeProcess():boolean; stdcall;  external 'TitanEngine.dll' name 'ThreaderResumeProcess';
  function ThreaderCreateRemoteThread(ThreadStartAddress:ULONG_PTR; AutoCloseTheHandle:boolean; ThreadPassParameter,ThreadId:Pointer):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ThreaderCreateRemoteThread';
  function ThreaderInjectAndExecuteCode(InjectCode:Pointer; StartDelta,InjectSize:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'ThreaderInjectAndExecuteCode';
  function ThreaderCreateRemoteThreadEx(hProcess:THandle; ThreadStartAddress:ULONG_PTR; AutoCloseTheHandle:boolean; ThreadPassParameter,ThreadId:Pointer):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ThreaderCreateRemoteThreadEx';
  function ThreaderInjectAndExecuteCodeEx(hProcess:THandle; InjectCode:Pointer; StartDelta,InjectSize:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'ThreaderInjectAndExecuteCodeEx';
  procedure ThreaderSetCallBackForNextExitThreadEvent(exitThreadCallBack:Pointer); stdcall;  external 'TitanEngine.dll' name 'ThreaderSetCallBackForNextExitThreadEvent';
  function ThreaderIsThreadStillRunning(hThread:THandle):boolean; stdcall;  external 'TitanEngine.dll' name 'ThreaderIsThreadStillRunning';
  function ThreaderIsThreadActive(hThread:THandle):boolean; stdcall;  external 'TitanEngine.dll' name 'ThreaderIsThreadActive';
  function ThreaderIsAnyThreadActive():boolean; stdcall;  external 'TitanEngine.dll' name 'ThreaderIsAnyThreadActive';
  function ThreaderExecuteOnlyInjectedThreads():boolean; stdcall;  external 'TitanEngine.dll' name 'ThreaderExecuteOnlyInjectedThreads';
  function ThreaderGetOpenHandleForThread(ThreadId:ULONG_PTR):THandle; stdcall;  external 'TitanEngine.dll' name 'ThreaderGetOpenHandleForThread';
  function ThreaderIsExceptionInMainThread():boolean; stdcall;  external 'TitanEngine.dll' name 'ThreaderIsExceptionInMainThread';
{TitanEngine.Debugger.functions}
  function StaticDisassembleEx(DisassmStart:ULONG_PTR; DisassmAddress:Pointer):PAnsiChar; stdcall;  external 'TitanEngine.dll' name 'StaticDisassembleEx';
  function StaticDisassemble(DisassmAddress:Pointer):PAnsiChar; stdcall;  external 'TitanEngine.dll' name 'StaticDisassemble';
  function DisassembleEx(hProcess:THandle; DisassmAddress:Pointer):PAnsiChar; stdcall;  external 'TitanEngine.dll' name 'DisassembleEx';
  function Disassemble(DisassmAddress:Pointer):PAnsiChar; stdcall;  external 'TitanEngine.dll' name 'Disassemble';
  function StaticLengthDisassemble(DisassmAddress:Pointer):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'StaticLengthDisassemble';
  function LengthDisassembleEx(hProcess:THandle; DisassmAddress:Pointer):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'LengthDisassembleEx';
  function LengthDisassemble(DisassmAddress:Pointer):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'LengthDisassemble';
  function InitDebug(szFileName,szCommandLine,szCurrentFolder:PAnsiChar): Pointer; stdcall; external 'TitanEngine.dll' name 'InitDebug';
  function InitDebugEx(szFileName,szCommandLine,szCurrentFolder:PAnsiChar; EntryCallBack:Pointer): Pointer; stdcall; external 'TitanEngine.dll' name 'InitDebugEx';
  function InitDLLDebug(szFileName:PAnsiChar; ReserveModuleBase:boolean; szCommandLine,szCurrentFolder:PAnsiChar; EntryCallBack:Pointer): Pointer; stdcall; external 'TitanEngine.dll' name 'InitDLLDebug';
  function StopDebug(): Boolean; stdcall; external 'TitanEngine.dll' name 'StopDebug';
  procedure SetBPXOptions(DefaultBreakPointType:ULONG_PTR); stdcall; external 'TitanEngine.dll' name 'SetBPXOptions';
  function IsBPXEnabled(bpxAddress:ULONG_PTR): boolean; stdcall; external 'TitanEngine.dll' name 'IsBPXEnabled';
  function EnableBPX(bpxAddress:ULONG_PTR): boolean; stdcall; external 'TitanEngine.dll' name 'EnableBPX';
  function DisableBPX(bpxAddress:ULONG_PTR): boolean; stdcall; external 'TitanEngine.dll' name 'DisableBPX';
  function SetBPX(bpxAddress,bpxType:ULONG_PTR; bpxCallBack:Pointer): boolean; stdcall; external 'TitanEngine.dll' name 'SetBPX';
  function DeleteBPX(bpxAddress:ULONG_PTR): boolean; stdcall; external 'TitanEngine.dll' name 'DeleteBPX';
  function SafeDeleteBPX(bpxAddress:ULONG_PTR): boolean; stdcall; external 'TitanEngine.dll' name 'SafeDeleteBPX';
  function SetAPIBreakPoint(szDLLName,szAPIName:PAnsiChar; bpxType,bpxPlace:ULONG_PTR; bpxCallBack:Pointer):boolean; stdcall; external 'TitanEngine.dll' name 'SetAPIBreakPoint';
  function DeleteAPIBreakPoint(szDLLName,szAPIName:PAnsiChar; bpxPlace:ULONG_PTR):boolean; stdcall; external 'TitanEngine.dll' name 'DeleteAPIBreakPoint';
  function SafeDeleteAPIBreakPoint(szDLLName,szAPIName:PAnsiChar; bpxPlace:ULONG_PTR):boolean; stdcall; external 'TitanEngine.dll' name 'SafeDeleteAPIBreakPoint';
  function SetMemoryBPX(MemoryStart,SizeOfMemory:ULONG_PTR; bpxCallBack:Pointer):boolean; stdcall; external 'TitanEngine.dll' name 'SetMemoryBPX';
  function SetMemoryBPXEx(MemoryStart,SizeOfMemory,BreakPointType:ULONG_PTR; RestoreOnHit:boolean; bpxCallBack:Pointer):boolean; stdcall; external 'TitanEngine.dll' name 'SetMemoryBPXEx';
  function RemoveMemoryBPX(MemoryStart,SizeOfMemory:ULONG_PTR):boolean; stdcall; external 'TitanEngine.dll' name 'RemoveMemoryBPX';
  function GetContextFPUDataEx(hActiveThread:THandle; FPUSaveArea:Pointer): boolean; stdcall; external 'TitanEngine.dll' name 'GetContextFPUDataEx';
  function GetContextDataEx(hActiveThread:THandle; IndexOfRegister:ULONG_PTR): ULONG_PTR; stdcall; external 'TitanEngine.dll' name 'GetContextDataEx';
  function GetContextData(IndexOfRegister:ULONG_PTR): ULONG_PTR; stdcall; external 'TitanEngine.dll' name 'GetContextData';
  function SetContextFPUDataEx(hActiveThread:THandle; FPUSaveArea:Pointer): boolean; stdcall; external 'TitanEngine.dll' name 'SetContextFPUDataEx';
  function SetContextDataEx(hActiveThread:THandle; IndexOfRegister,NewRegisterValue:ULONG_PTR):boolean; stdcall; external 'TitanEngine.dll' name 'SetContextDataEx';
  function SetContextData(IndexOfRegister,NewRegisterValue:ULONG_PTR):boolean; stdcall; external 'TitanEngine.dll' name 'SetContextData';
  procedure ClearExceptionNumber(); stdcall; external 'TitanEngine.dll' name 'ClearExceptionNumber';
  function CurrentExceptionNumber(): ULONG_PTR; stdcall; external 'TitanEngine.dll' name 'CurrentExceptionNumber';
  function MatchPatternEx(hProcess:THandle; MemoryToCheck,SizeOfMemoryToCheck:ULONG_PTR; PatternToMatch:Pointer; SizeOfPatternToMatch:ULONG_PTR; WildCard:Pointer): boolean; stdcall; external 'TitanEngine.dll' name 'MatchPatternEx';
  function MatchPattern(MemoryToCheck,SizeOfMemoryToCheck:ULONG_PTR; PatternToMatch:Pointer; SizeOfPatternToMatch:ULONG_PTR; WildCard:Pointer): boolean; stdcall; external 'TitanEngine.dll' name 'MatchPattern';
     function FindEx(hProcess:THandle; MemoryStart:Pointer;MemorySize:Cardinal; SearchPattern:Pointer; PatternSize:ULONG_PTR; WildCard:Pointer): ULONG_PTR; stdcall; external 'TitanEngine.dll' name 'FindEx';
     function Find(MemoryStart:Pointer;MemorySize:Cardinal; SearchPattern:Pointer; PatternSize:Cardinal; WildCard:Pointer): NativeUInt; stdcall; external 'TitanEngine.dll' name 'Find';
  function FillEx(hProcess:THandle; MemoryStart,MemorySize:ULONG_PTR; FillByte:Pointer): boolean; stdcall; external 'TitanEngine.dll' name 'FillEx';
  function Fill(MemoryStart,MemorySize:ULONG_PTR; FillByte:Pointer): boolean; stdcall; external 'TitanEngine.dll' name 'Fill';
  function PatchEx(hProcess:THandle; MemoryStart,MemorySize:ULONG_PTR; ReplacePattern:Pointer; ReplaceSize:ULONG_PTR; AppendNOP,PrependNOP:boolean): boolean; stdcall; external 'TitanEngine.dll' name 'PatchEx';
  function Patch(MemoryStart,MemorySize:ULONG_PTR; ReplacePattern:Pointer; ReplaceSize:ULONG_PTR; AppendNOP,PrependNOP:boolean): boolean; stdcall; external 'TitanEngine.dll' name 'Patch';
  function ReplaceEx(hProcess:THandle; MemoryStart,MemorySize:ULONG_PTR; SearchPattern:Pointer; PatternSize,NumberOfRepetitions:ULONG_PTR; ReplacePattern:Pointer; ReplaceSize:ULONG_PTR; WildCard:Pointer): boolean; stdcall; external 'TitanEngine.dll' name 'ReplaceEx';
  function Replace(MemoryStart,MemorySize:ULONG_PTR; SearchPattern:Pointer; PatternSize,NumberOfRepetitions:ULONG_PTR; ReplacePattern:Pointer; ReplaceSize:ULONG_PTR; WildCard:Pointer): boolean; stdcall; external 'TitanEngine.dll' name 'Replace';
  function GetDebugData(): Pointer; stdcall; external 'TitanEngine.dll' name 'GetDebugData';
  function GetTerminationData(): Pointer; stdcall; external 'TitanEngine.dll' name 'GetTerminationData';
  function GetExitCode():ULONG_PTR; stdcall; external 'TitanEngine.dll' name 'GetExitCode';
  function GetDebuggedDLLBaseAddress(): ULONG_PTR; stdcall; external 'TitanEngine.dll' name 'GetDebuggedDLLBaseAddress';
  function GetDebuggedFileBaseAddress(): ULONG_PTR; stdcall; external 'TitanEngine.dll' name 'GetDebuggedFileBaseAddress';
  function GetRemoteString(hProcess:THandle; StringAddress:ULONG_PTR; StringStorage:Pointer; MaximumStringSize:ULONG_PTR): ULONG_PTR; stdcall; external 'TitanEngine.dll' name 'GetRemoteString';
  function GetFunctionParameter(hProcess:THandle; FunctionType,ParameterNumber,ParameterType:ULONG_PTR): ULONG_PTR; stdcall; external 'TitanEngine.dll' name 'GetFunctionParameter';
  function GetJumpDestinationEx(hProcess:THandle; InstructionAddress:ULONG_PTR; JustJumps:boolean): ULONG_PTR; stdcall; external 'TitanEngine.dll' name 'GetJumpDestinationEx';
  function GetJumpDestination(hProcess:THandle; InstructionAddress:ULONG_PTR; JustJumps:boolean): ULONG_PTR; stdcall; external 'TitanEngine.dll' name 'GetJumpDestination';
  function IsJumpGoingToExecuteEx(hProcess,hThread:THandle; InstructionAddress,RegFlags:ULONG_PTR): boolean; stdcall; external 'TitanEngine.dll' name 'IsJumpGoingToExecuteEx';
  function IsJumpGoingToExecute(): boolean; stdcall; external 'TitanEngine.dll' name 'IsJumpGoingToExecute';
  procedure SetCustomHandler(WhichException:ULONG_PTR; CallBack:Pointer); stdcall; external 'TitanEngine.dll' name 'SetCustomHandler';
  procedure ForceClose(); stdcall; external 'TitanEngine.dll' name 'ForceClose';
  procedure StepInto(traceCallBack:Pointer); stdcall; external 'TitanEngine.dll' name 'StepInto';
  procedure StepOver(traceCallBack:Pointer); stdcall; external 'TitanEngine.dll' name 'StepOver';
  procedure SingleStep(StepCount:ULONG_PTR; StepCallBack:Pointer); stdcall; external 'TitanEngine.dll' name 'SingleStep';
  function GetUnusedHardwareBreakPointRegister(RegisterIndex:Pointer):boolean; stdcall; external 'TitanEngine.dll' name 'GetUnusedHardwareBreakPointRegister';
  function SetHardwareBreakPointEx(hActiveThread:THandle; bpxAddress,IndexOfRegister,bpxType,bpxSize:ULONG_PTR; bpxCallBack,IndexOfSelectedRegister:Pointer):boolean; stdcall; external 'TitanEngine.dll' name 'SetHardwareBreakPointEx';
  function SetHardwareBreakPoint(bpxAddress,IndexOfRegister,bpxType,bpxSize:ULONG_PTR; bpxCallBack:Pointer):boolean; stdcall; external 'TitanEngine.dll' name 'SetHardwareBreakPoint';
  function DeleteHardwareBreakPoint(IndexOfRegister:ULONG_PTR):boolean; stdcall; external 'TitanEngine.dll' name 'DeleteHardwareBreakPoint';
  function RemoveAllBreakPoints(RemoveOption:ULONG_PTR):boolean; stdcall; external 'TitanEngine.dll' name 'RemoveAllBreakPoints';
  function GetProcessInformation(): Pointer; stdcall; external 'TitanEngine.dll' name 'GetProcessInformation';
  function GetStartupInformation(): Pointer; stdcall; external 'TitanEngine.dll' name 'GetStartupInformation';
  procedure DebugLoop(); stdcall; external 'TitanEngine.dll' name 'DebugLoop';
  procedure SetDebugLoopTimeOut(TimeOut:ULONG_PTR); stdcall; external 'TitanEngine.dll' name 'SetDebugLoopTimeOut';
  procedure SetNextDbgContinueStatus(SetDbgCode:ULONG_PTR); stdcall; external 'TitanEngine.dll' name 'SetNextDbgContinueStatus';
  function AttachDebugger(ProcessId:ULONG_PTR; KillOnExit:Boolean; DebugInfo,CallBack:Pointer): Pointer; stdcall; external 'TitanEngine.dll' name 'AttachDebugger';
  function DetachDebugger(ProcessId:ULONG_PTR): Pointer; stdcall; external 'TitanEngine.dll' name 'DetachDebugger';
  function DetachDebuggerEx(ProcessId:ULONG_PTR): Pointer; stdcall; external 'TitanEngine.dll' name 'DetachDebuggerEx';
  function DebugLoopEx(TimeOut:ULONG_PTR): ULONG_PTR; stdcall; external 'TitanEngine.dll' name 'DebugLoopEx';
  procedure AutoDebugEx(szFileName:PAnsiChar; ReserveModuleBase:boolean; szCommandLine,szCurrentFolder:PAnsiChar; TimeOut:ULONG_PTR; EntryCallBack:Pointer); stdcall; external 'TitanEngine.dll' name 'AutoDebugEx';
  function IsFileBeingDebugged(): boolean; stdcall; external 'TitanEngine.dll' name 'IsFileBeingDebugged';
  procedure SetErrorModel(DisplayErrorMessages:boolean); stdcall; external 'TitanEngine.dll' name 'SetErrorModel';
{TitanEngine.Importer.functions}
  procedure ImporterCleanup(); stdcall;  external 'TitanEngine.dll' name 'ImporterCleanup';
  procedure ImporterSetImageBase(ImageBase:ULONG_PTR); stdcall;  external 'TitanEngine.dll' name 'ImporterSetImageBase';
  procedure ImporterSetUnknownDelta(DeltaAddress:ULONG_PTR); stdcall;  external 'TitanEngine.dll' name 'ImporterSetUnknownDelta';
  function ImporterGetCurrentDelta():ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ImporterGetCurrentDelta';
  procedure ImporterInit(MemorySize,ImageBase:ULONG_PTR); stdcall;  external 'TitanEngine.dll' name 'ImporterInit';
  procedure ImporterAddNewDll(DLLName:PAnsiChar; FirstThunk:ULONG_PTR); stdcall;  external 'TitanEngine.dll' name 'ImporterAddNewDll';
  procedure ImporterAddNewAPI(APIName:PAnsiChar; FirstThunk:ULONG_PTR); stdcall;  external 'TitanEngine.dll' name 'ImporterAddNewAPI';
  procedure ImporterAddNewOrdinalAPI(dwAPIName,FirstThunk:ULONG_PTR); stdcall;  external 'TitanEngine.dll' name 'ImporterAddNewAPI';
  function ImporterGetAddedDllCount(): ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ImporterGetAddedDllCount';
  function ImporterGetAddedAPICount(): ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ImporterGetAddedAPICount';
  function ImporterGetLastAddedDLLName(): PAnsiChar; stdcall;  external 'TitanEngine.dll' name 'ImporterGetLastAddedDLLName';
  procedure ImporterMoveIAT(); stdcall;  external 'TitanEngine.dll' name 'ImporterMoveIAT';
  function ImporterExportIAT(StorePlace,FileMap:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'ImporterExportIAT';
  function ImporterEstimatedSize(): ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ImporterEstimatedSize';
  function ImporterExportIATEx(szExportFileName,szSectionName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'ImporterExportIATEx';
  function ImporterFindAPIWriteLocation(szAPIName:PAnsiChar): ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ImporterFindAPIWriteLocation';
  function ImporterFindOrdinalAPIWriteLocation(OrdinalNumber:ULONG_PTR): ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ImporterFindOrdinalAPIWriteLocation';
  function ImporterFindAPIByWriteLocation(APIWriteLocation:PAnsiChar): ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ImporterFindAPIByWriteLocation';
  function ImporterFindDLLByWriteLocation(APIWriteLocation:PAnsiChar): ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ImporterFindDLLByWriteLocation';
  function ImporterGetDLLName(APIAddress:ULONG_PTR): PAnsiChar; stdcall;  external 'TitanEngine.dll' name 'ImporterGetDLLName';
  function ImporterGetAPIName(APIAddress:ULONG_PTR): PAnsiChar; stdcall;  external 'TitanEngine.dll' name 'ImporterGetAPIName';
  function ImporterGetAPIOrdinalNumber(APIAddress:ULONG_PTR): ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ImporterGetAPIOrdinalNumber';
  function ImporterGetAPINameEx(APIAddress:ULONG_PTR; pDLLBases:Pointer): PAnsiChar; stdcall;  external 'TitanEngine.dll' name 'ImporterGetAPINameEx';
  function ImporterGetRemoteAPIAddress(hProcess:THandle; APIAddress:ULONG_PTR): ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ImporterGetRemoteAPIAddress';
  function ImporterGetRemoteAPIAddressEx(szDLLName,szAPIName:PAnsiChar): ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ImporterGetRemoteAPIAddressEx';
  function ImporterGetLocalAPIAddress(hProcess:THandle; APIAddress:ULONG_PTR): ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ImporterGetLocalAPIAddress';
  function ImporterGetDLLNameFromDebugee(hProcess:THandle; APIAddress:ULONG_PTR): PAnsiChar; stdcall;  external 'TitanEngine.dll' name 'ImporterGetDLLNameFromDebugee';
  function ImporterGetAPINameFromDebugee(hProcess:THandle; APIAddress:ULONG_PTR): PAnsiChar; stdcall;  external 'TitanEngine.dll' name 'ImporterGetAPINameFromDebugee';
  function ImporterGetAPIOrdinalNumberFromDebugee(hProcess:THandle; APIAddress:ULONG_PTR): ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ImporterGetAPIOrdinalNumberFromDebugee';
  function ImporterGetDLLIndexEx(APIAddress:ULONG_PTR; pDLLBases:Pointer): ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ImporterGetDLLIndexEx';
  function ImporterGetDLLIndex(hProcess:THandle; APIAddress:ULONG_PTR; pDLLBases:Pointer): ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ImporterGetDLLIndex';
  function ImporterGetRemoteDLLBase(hProcess:THandle; LocalModuleBase:ULONG_PTR): ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ImporterGetRemoteDLLBase';
  function ImporterRelocateWriteLocation(AddValue:ULONG_PTR): boolean; stdcall;  external 'TitanEngine.dll' name 'ImporterRelocateWriteLocation';
  function ImporterIsForwardedAPI(hProcess:THandle; APIAddress:ULONG_PTR): boolean; stdcall;  external 'TitanEngine.dll' name 'ImporterIsForwardedAPI';
  function ImporterGetForwardedAPIName(hProcess:THandle; APIAddress:ULONG_PTR): PAnsiChar; stdcall;  external 'TitanEngine.dll' name 'ImporterGetForwardedAPIName';
  function ImporterGetForwardedDLLName(hProcess:THandle; APIAddress:ULONG_PTR): PAnsiChar; stdcall;  external 'TitanEngine.dll' name 'ImporterGetForwardedDLLName';
  function ImporterGetForwardedDLLIndex(hProcess:THandle; APIAddress:ULONG_PTR; pDLLBases:Pointer): ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ImporterGetForwardedDLLIndex';
  function ImporterGetForwardedAPIOrdinalNumber(hProcess:THandle; APIAddress:ULONG_PTR): ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ImporterGetForwardedAPIOrdinalNumber';
  function ImporterGetNearestAPIAddress(hProcess:THandle; APIAddress:ULONG_PTR): ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ImporterGetNearestAPIAddress';
  function ImporterGetNearestAPIName(hProcess:THandle; APIAddress:ULONG_PTR): PAnsiChar; stdcall;  external 'TitanEngine.dll' name 'ImporterGetNearestAPIName';
  function ImporterCopyOriginalIAT(szOriginalFile,szDumpFile:PAnsiChar): boolean; stdcall;  external 'TitanEngine.dll' name 'ImporterCopyOriginalIAT';
  function ImporterLoadImportTable(szFileName:PAnsiChar): boolean; stdcall;  external 'TitanEngine.dll' name 'ImporterLoadImportTable';
  function ImporterMoveOriginalIAT(szOriginalFile,szDumpFile,szSectionName:PAnsiChar): boolean; stdcall;  external 'TitanEngine.dll' name 'ImporterMoveOriginalIAT';
  procedure ImporterAutoSearchIAT(pFileName:PAnsiChar;ImageBase,SearchStart,SearchSize:ULONG_PTR;pIATStart,pIATSize:Pointer); stdcall;  external 'TitanEngine.dll' name 'ImporterAutoSearchIAT';
  procedure ImporterAutoSearchIATEx(hProcess:ULONG_PTR;ImageBase,SearchStart,SearchSize:ULONG_PTR;pIATStart,pIATSize:Pointer); stdcall;  external 'TitanEngine.dll' name 'ImporterAutoSearchIATEx';
  procedure ImporterEnumAddedData(EnumCallBack:Pointer); stdcall;  external 'TitanEngine.dll' name 'ImporterEnumAddedData';
  function ImporterAutoFixIAT(hProcess:ULONG_PTR;pFileName:PAnsiChar;ImageBase,SearchStart,SearchSize,SearchStep:ULONG_PTR):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ImporterAutoFixIAT';
  function ImporterAutoFixIATEx(hProcess:ULONG_PTR;pFileName,szSectionName:PAnsiChar;DumpRunningProcess,RealignFile:boolean;EntryPointAddress,ImageBase,SearchStart,SearchSize,SearchStep:ULONG_PTR;TryAutoFix,FixEliminations:boolean;UnknownPointerFixCallback:ULONG_PTR):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ImporterAutoFixIATEx';
{TitanEngine.Hooks.functions}
  function HooksSafeTransitionEx(HookAddressArray:Pointer; NumberOfHooks:ULONG_PTR; TransitionStart:boolean):boolean; stdcall;  external 'TitanEngine.dll' name 'HooksSafeTransitionEx';
  function HooksSafeTransition(HookAddressArray:Pointer; TransitionStart:boolean):boolean; stdcall;  external 'TitanEngine.dll' name 'HooksSafeTransition';
  function HooksIsAddressRedirected(HookAddressArray:Pointer):boolean; stdcall;  external 'TitanEngine.dll' name 'HooksIsAddressRedirected';
  function HooksGetTrampolineAddress(HookAddressArray:Pointer):Pointer; stdcall;  external 'TitanEngine.dll' name 'HooksGetTrampolineAddress';
  function HooksGetHookEntryDetails(HookAddressArray:Pointer):Pointer; stdcall;  external 'TitanEngine.dll' name 'HooksGetHookEntryDetails';
  function HooksInsertNewRedirection(HookAddressArray,RedirectTo:Pointer; HookType:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'HooksInsertNewRedirection';
  function HooksInsertNewIATRedirectionEx(FileMapVA,LoadedModuleBase:ULONG_PTR; szHookFunction:PAnsiChar; RedirectTo:Pointer):boolean; stdcall;  external 'TitanEngine.dll' name 'HooksInsertNewIATRedirectionEx';
  function HooksInsertNewIATRedirection(szModuleName,szHookFunction:PAnsiChar; RedirectTo:Pointer):boolean; stdcall;  external 'TitanEngine.dll' name 'HooksInsertNewIATRedirection';
  function HooksRemoveRedirection(HookAddressArray:Pointer; RemoveAll:boolean):boolean; stdcall;  external 'TitanEngine.dll' name 'HooksRemoveRedirection';
  function HooksRemoveRedirectionsForModule(ModuleBase:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'HooksRemoveRedirectionsForModule';
  function HooksDisableRedirection(HookAddressArray:Pointer; DisableAll:boolean):boolean; stdcall;  external 'TitanEngine.dll' name 'HooksDisableRedirection';
  function HooksDisableRedirectionsForModule(ModuleBase:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'HooksDisableRedirectionsForModule';
  function HooksEnableRedirection(HookAddressArray:Pointer; EnableAll:boolean):boolean; stdcall;  external 'TitanEngine.dll' name 'HooksEnableRedirection';
  function HooksEnableRedirectionsForModule(ModuleBase:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'HooksEnableRedirectionsForModule';
  function HooksRemoveIATRedirection(szModuleName,szHookFunction:PAnsiChar; RemoveAll:boolean):boolean; stdcall;  external 'TitanEngine.dll' name 'HooksRemoveIATRedirection';
  function HooksDisableIATRedirection(szModuleName,szHookFunction:PAnsiChar; DisableAll:boolean):boolean; stdcall;  external 'TitanEngine.dll' name 'HooksDisableIATRedirection';
  function HooksEnableIATRedirection(szModuleName,szHookFunction:PAnsiChar; EnableAll:boolean):boolean; stdcall;  external 'TitanEngine.dll' name 'HooksEnableIATRedirection';
  procedure HooksScanModuleMemory(ModuleBase:ULONG_PTR; CallBack:Pointer); stdcall;  external 'TitanEngine.dll' name 'HooksScanModuleMemory';
  procedure HooksScanEntireProcessMemory(CallBack:Pointer); stdcall;  external 'TitanEngine.dll' name 'HooksScanEntireProcessMemory';
  procedure HooksScanEntireProcessMemoryEx(); stdcall;  external 'TitanEngine.dll' name 'HooksScanEntireProcessMemoryEx';
{TitanEngine.Tracer.functions}
  procedure TracerInit(); stdcall;  external 'TitanEngine.dll' name 'TracerInit';
  function TracerLevel1(hProcess,APIAddress:ULONG_PTR):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'TracerLevel1';
  function HashTracerLevel1(hProcess,APIAddress,NumberOfInstructions:ULONG_PTR):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'HashTracerLevel1';
  function TracerDetectRedirection(hProcess,APIAddress:ULONG_PTR):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'TracerDetectRedirection';
  function TracerFixKnownRedirection(hProcess,APIAddress,RedirectionId:ULONG_PTR):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'TracerFixKnownRedirection';
  function TracerFixRedirectionViaImpRecPlugin(hProcess:ULONG_PTR;szPluginName:PAnsiChar;APIAddress:ULONG_PTR):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'TracerFixRedirectionViaImpRecPlugin';
{TitanEngine.Exporter.functions}
  procedure ExporterCleanup(); stdcall;  external 'TitanEngine.dll' name 'ExporterCleanup';
  procedure ExporterSetImageBase(ImageBase:ULONG_PTR); stdcall;  external 'TitanEngine.dll' name 'ExporterSetImageBase';
  procedure ExporterInit(MemorySize,ImageBase,ExportOrdinalBase:ULONG_PTR; szExportModuleName:PAnsiChar); stdcall;  external 'TitanEngine.dll' name 'ExporterInit';
  function ExporterAddNewExport(szExportName:PAnsiChar; ExportRelativeAddress:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'ExporterAddNewExport';
  function ExporterAddNewOrdinalExport(OrdinalNumber,ExportRelativeAddress:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'ExporterAddNewOrdinalExport';
  function ExporterGetAddedExportCount():ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ExporterGetAddedExportCount';
  function ExporterEstimatedSize():ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'ExporterEstimatedSize';
  function ExporterBuildExportTable(StorePlace,FileMapVA:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'ExporterBuildExportTable';
  function ExporterBuildExportTableEx(szExportFileName,szSectionName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'ExporterBuildExportTableEx';
  function ExporterLoadExportTable(szFileName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'ExporterLoadExportTable';
{TitanEngine.Librarian.functions}
  function LibrarianSetBreakPoint(szLibraryName:PAnsiChar; bpxType:ULONG_PTR; SingleShoot:boolean; bpxCallBack:Pointer):boolean; stdcall;  external 'TitanEngine.dll' name 'LibrarianSetBreakPoint';
  function LibrarianRemoveBreakPoint(szLibraryName:PAnsiChar; bpxType:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'LibrarianRemoveBreakPoint';
  function LibrarianGetLibraryInfo(szLibraryName:PAnsiChar):Pointer; stdcall;  external 'TitanEngine.dll' name 'LibrarianGetLibraryInfo';
  function LibrarianGetLibraryInfoEx(BaseOfDll:Pointer):Pointer; stdcall;  external 'TitanEngine.dll' name 'LibrarianGetLibraryInfoEx';
  procedure LibrarianEnumLibraryInfo(BaseOfDll:Pointer); stdcall;  external 'TitanEngine.dll' name 'LibrarianEnumLibraryInfo';
{TitanEngine.Process.functions}
  function GetActiveProcessId(szImageName:PAnsiChar):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'GetActiveProcessId';
  function EnumProcessesWithLibrary(szLibraryName:PAnsiChar; EnumFunction:Pointer):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'EnumProcessesWithLibrary';
{TitanEngine.TLSFixer.functions}
  function TLSBreakOnCallBack(ArrayOfCallBacks:Pointer; NumberOfCallBacks:ULONG_PTR; bpxCallBack:Pointer):boolean; stdcall;  external 'TitanEngine.dll' name 'TLSBreakOnCallBack';
  function TLSGrabCallBackData(szFileName:PAnsiChar; ArrayOfCallBacks,NumberOfCallBacks:Pointer):boolean; stdcall;  external 'TitanEngine.dll' name 'TLSGrabCallBackData';
  function TLSBreakOnCallBackEx(szFileName:PAnsiChar; bpxCallBack:Pointer):boolean; stdcall;  external 'TitanEngine.dll' name 'TLSBreakOnCallBackEx';
  function TLSRemoveCallback(szFileName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'TLSRemoveCallback';
  function TLSRemoveTable(szFileName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'TLSRemoveTable';
  function TLSBackupData(szFileName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'TLSBackupData';
  function TLSRestoreData():boolean; stdcall;  external 'TitanEngine.dll' name 'TLSRestoreData';
  function TLSBuildNewTable(FileMapVA,StorePlace,StorePlaceRVA:ULONG_PTR; ArrayOfCallBacks:Pointer; NumberOfCallBacks:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'TLSBuildNewTable';
  function TLSBuildNewTableEx(szFileName,szSectionName:PAnsiChar; ArrayOfCallBacks:Pointer; NumberOfCallBacks:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'TLSBuildNewTableEx';
{TitanEngine.TranslateName.functions}
  function TranslateNativeName(szNativeName:PAnsiChar):PAnsiChar; stdcall;  external 'TitanEngine.dll' name 'TranslateNativeName';
{TitanEngine.Handler.functions}
  function HandlerGetActiveHandleCount(ProcessId:ULONG_PTR):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'HandlerGetActiveHandleCount';
  function HandlerIsHandleOpen(ProcessId:ULONG_PTR; hHandle:THandle):boolean; stdcall;  external 'TitanEngine.dll' name 'HandlerIsHandleOpen';
  function HandlerGetHandleName(hProcess:THandle; ProcessId:ULONG_PTR; hHandle:THandle; TranslateName:boolean):PAnsiChar; stdcall;  external 'TitanEngine.dll' name 'HandlerGetHandleName';
  function HandlerEnumerateOpenHandles(ProcessId:ULONG_PTR; HandleBuffer:Pointer; MaxHandleCount:ULONG_PTR):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'HandlerEnumerateOpenHandles';
  function HandlerGetHandleDetails(hProcess:THandle; ProcessId:ULONG_PTR; hHandle:THandle; InformationReturn:ULONG_PTR):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'HandlerGetHandleDetails';
  function HandlerCloseRemoteHandle(ProcessId:ULONG_PTR; hHandle:THandle):boolean; stdcall;  external 'TitanEngine.dll' name 'HandlerCloseRemoteHandle';
  function HandlerEnumerateLockHandles(szFileOrFolderName:PAnsiChar; NameIsFolder,NameIsTranslated:boolean; HandleDataBuffer:Pointer; MaxHandleCount:ULONG_PTR):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'HandlerEnumerateLockHandles';
  function HandlerCloseAllLockHandles(szFileOrFolderName:PAnsiChar; NameIsFolder,NameIsTranslated:boolean):boolean; stdcall;  external 'TitanEngine.dll' name 'HandlerCloseAllLockHandles';
  function HandlerIsFileLocked(szFileOrFolderName:PAnsiChar; NameIsFolder,NameIsTranslated:boolean):boolean; stdcall;  external 'TitanEngine.dll' name 'HandlerIsFileLocked';
  function HandlerEnumerateOpenMutexes(hProcess:THandle; ProcessId:ULONG_PTR; HandleBuffer:Pointer; MaxHandleCount:ULONG_PTR):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'HandlerEnumerateOpenMutexes';
  function HandlerGetOpenMutexHandle(hProcess:THandle; ProcessId:ULONG_PTR; szMutexString:PAnsiChar):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'HandlerGetOpenMutexHandle';
  function HandlerGetProcessIdWhichCreatedMutex(szMutexString:PAnsiChar):ULONG_PTR; stdcall;  external 'TitanEngine.dll' name 'HandlerGetProcessIdWhichCreatedMutex';
{TitanEngine.Injector.functions}
  function RemoteLoadLibrary(hProcess:THandle; szLibraryFile:PAnsiChar; WaitForThreadExit:boolean):boolean; stdcall;  external 'TitanEngine.dll' name 'RemoteLoadLibrary';
  function RemoteFreeLibrary(hProcess:THandle; hModule:ULONG_PTR; szLibraryFile:PAnsiChar; WaitForThreadExit:boolean):boolean; stdcall;  external 'TitanEngine.dll' name 'RemoteFreeLibrary';
  function RemoteExitProcess(hProcess:THandle; ExitCode:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'RemoteExitProcess';
{TitanEngine.StaticUnpacker.functions}
  function StaticFileLoad(szFileName:PAnsiChar; DesiredAccess:ULONG_PTR; SimulateLoad:boolean; FileHandle,LoadedSize,FileMap,FileMapVA:Pointer):boolean; stdcall;  external 'TitanEngine.dll' name 'StaticFileLoad';
  function StaticFileUnload(szFileName:PAnsiChar; CommitChanges:boolean; FileHandle,LoadedSize,FileMap,FileMapVA:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'StaticFileUnload';
  function StaticFileOpen(szFileName:PAnsiChar; DesiredAccess:ULONG_PTR; FileHandle,FileSizeLow,FileSizeHigh:Pointer):boolean; stdcall;  external 'TitanEngine.dll' name 'StaticFileOpen';
  function StaticFileGetContent(FileHandle:THandle; FilePositionLow:ULONG_PTR; FilePositionHigh,Buffer:Pointer; Size:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'StaticFileGetContent';
  procedure StaticFileClose(FileHandle:THandle); stdcall;  external 'TitanEngine.dll' name 'StaticFileClose';
  procedure StaticMemoryDecrypt(MemoryStart,MemorySize,DecryptionType,DecryptionKeySize,DecryptionKey:ULONG_PTR); stdcall;  external 'TitanEngine.dll' name 'StaticMemoryDecrypt';
  procedure StaticMemoryDecryptEx(MemoryStart,MemorySize,DecryptionKeySize:ULONG_PTR; DecryptionCallBack:Pointer); stdcall;  external 'TitanEngine.dll' name 'StaticMemoryDecryptEx';
  procedure StaticMemoryDecryptSpecial(MemoryStart,MemorySize,DecryptionKeySize,SpecDecryptionType:ULONG_PTR; DecryptionCallBack:Pointer); stdcall;  external 'TitanEngine.dll' name 'StaticMemoryDecryptSpecial';
  procedure StaticSectionDecrypt(FileMapVA,SectionNumber:ULONG_PTR; SimulateLoad:boolean; DecryptionType,DecryptionKeySize,DecryptionKey:ULONG_PTR); stdcall;  external 'TitanEngine.dll' name 'StaticSectionDecrypt';
  function StaticMemoryDecompress(Source,SourceSize,Destination,DestinationSize,Algorithm:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'StaticMemoryDecompress';
  function StaticRawMemoryCopy(hFile:THandle; FileMapVA,VitualAddressToCopy,Size:ULONG_PTR; AddressIsRVA:boolean; szDumpFileName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'StaticRawMemoryCopy';
  function StaticHashMemory(MemoryToHash:Pointer; SizeOfMemory:ULONG_PTR; HashDigest:Pointer; OutputString:boolean; Algorithm:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'StaticHashMemory';
  function StaticHashFile(szFileName,HashDigest:PAnsiChar; OutputString:boolean; Algorithm:ULONG_PTR):boolean; stdcall;  external 'TitanEngine.dll' name 'StaticHashFile';
{TitanEngine.Engine.functions}
  procedure SetEngineVariable(VariableId:ULONG_PTR; VariableSet:boolean); stdcall;  external 'TitanEngine.dll' name 'SetEngineVariable';
  function EngineCreateMissingDependencies(szFileName,szOutputFolder:PAnsiChar; LogCreatedFiles:boolean):boolean; stdcall;  external 'TitanEngine.dll' name 'EngineCreateMissingDependencies';
  function EngineFakeMissingDependencies(hProcess:THandle):boolean; stdcall;  external 'TitanEngine.dll' name 'EngineCreateMissingDependencies';
  function EngineDeleteCreatedDependencies():boolean; stdcall;  external 'TitanEngine.dll' name 'EngineDeleteCreatedDependencies';
  function EngineCreateUnpackerWindow(WindowUnpackerTitle,WindowUnpackerLongTitleWindowUnpackerName,WindowUnpackerAuthor:PChar; StartUnpackingCallBack:Pointer):boolean; stdcall;  external 'TitanEngine.dll' name 'EngineCreateUnpackerWindow';
  procedure EngineAddUnpackerWindowLogMessage(szLogMessage:PChar); stdcall;  external 'TitanEngine.dll' name 'EngineAddUnpackerWindowLogMessage';
{TitanEngine.Extension.functions}
  function ExtensionManagerIsPluginLoaded(szPluginName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'ExtensionManagerIsPluginLoaded';
  function ExtensionManagerIsPluginEnabled(szPluginName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'ExtensionManagerIsPluginEnabled';
  function ExtensionManagerDisableAllPlugins():boolean; stdcall;  external 'TitanEngine.dll' name 'ExtensionManagerDisableAllPlugins';
  function ExtensionManagerDisablePlugin(szPluginName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'ExtensionManagerDisablePlugin';
  function ExtensionManagerEnableAllPlugins():boolean; stdcall;  external 'TitanEngine.dll' name 'ExtensionManagerEnableAllPlugins';
  function ExtensionManagerEnablePlugin(szPluginName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'ExtensionManagerEnablePlugin';
  function ExtensionManagerUnloadAllPlugins():boolean; stdcall;  external 'TitanEngine.dll' name 'ExtensionManagerUnloadAllPlugins';
  function ExtensionManagerUnloadPlugin(szPluginName:PAnsiChar):boolean; stdcall;  external 'TitanEngine.dll' name 'ExtensionManagerUnloadPlugin';
  function ExtensionManagerGetPluginInfo(szPluginName:PAnsiChar):Pointer; stdcall;  external 'TitanEngine.dll' name 'ExtensionManagerGetPluginInfo';


implementation

end.
