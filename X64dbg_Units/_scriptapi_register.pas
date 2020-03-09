unit _scriptapi_register;
{
Ported form _scriptapi_register.h x64 and x32 to Unit Delphi by Lonely
FixCode:https://gitee.com/suxuss/DELPHI-x96dbg-Plugins-SDK
}
interface
uses
  Winapi.Windows,_plugins_type,_plugins,bridgemain,bridgelist;

{$I dbg.inc}
  type
     RegisterEnum = (
     {$Z4+}
     {$IFDEF WIN64}
        RAX,
        RBX,
        RCX,
        RDX,
        RSI,
        SIL,
        RDI,
        DIL,
        RBP,
        BPL,
        RSP,
        SPL,
        RIP,
        R8,
        R8D,
        R8W,
        R8B,
        R9,
        R9D,
        R9W,
        R9B,
        R10,
        R10D,
        R10W,
        R10B,
        R11,
        R11D,
        R11W,
        R11B,
        R12,
        R12D,
        R12W,
        R12B,
        R13,
        R13D,
        R13W,
        R13B,
        R14,
        R14D,
        R14W,
        R14B,
        R15,
        R15D,
        R15W,
        R15B,
     {$ELSE}
        DR0,
        DR1,
        DR2,
        DR3,
        DR6,
        DR7,

        EAX,
        AX,
        AH,
        AL,
        EBX,
        BX,
        BH,
        BL,
        ECX,
        CX,
        CH,
        CL,
        EDX,
        DX,
        DH,
        DL,
        EDI,
        DI,
        ESI,
        SI,
        EBP,
        BP,
        ESP,
        SP,
        EIP,
     {$ENDIF}
        CIP,
        CSP
     {$Z4-}
     );


//cdecl; external x32_DBG;


{$IFDEF WIN64}
{SCRIPT_EXPORT duint} function _Get(reg:RegisterEnum):duint;cdecl; external x32DBG name '?Get@Register@Script@@YA_KW4RegisterEnum@12@@Z';
{SCRIPT_EXPORT bool}  function _Set(reg:RegisterEnum;value:duint):Boolean;cdecl; external x32DBG name '?Set@Register@Script@@YA_NW4RegisterEnum@12@_K@Z';
{SCRIPT_EXPORT int}   function Size():Integer;cdecl; external x32DBG name '?Size@Register@Script@@YAHXZ'; //gets architecture register size in bytes

{SCRIPT_EXPORT duint} function GetDR0():duint;cdecl; external x32DBG name '?GetDR0@Register@Script@@YA_KXZ';
{SCRIPT_EXPORT bool}  function SetDR0(value:duint):Boolean;cdecl; external x32DBG name '?SetDR0@Register@Script@@YA_N_K@Z';
{SCRIPT_EXPORT duint} function GetDR1():duint;cdecl; external x32DBG name '?GetDR1@Register@Script@@YA_KXZ';
{SCRIPT_EXPORT bool}  function SetDR1(value:duint):Boolean;cdecl; external x32DBG name '?SetDR1@Register@Script@@YA_N_K@Z';
{SCRIPT_EXPORT duint} function GetDR2():duint;cdecl; external x32DBG name '?GetDR2@Register@Script@@YA_KXZ';
{SCRIPT_EXPORT bool}  function SetDR2(value:duint):Boolean;cdecl; external x32DBG name '?SetDR2@Register@Script@@YA_N_K@Z';
{SCRIPT_EXPORT duint} function GetDR3():duint;cdecl; external x32DBG name '?GetDR3@Register@Script@@YA_KXZ';
{SCRIPT_EXPORT bool}  function SetDR3(value:duint):Boolean;cdecl; external x32DBG name '?SetDR3@Register@Script@@YA_N_K@Z';
{SCRIPT_EXPORT duint} function GetDR6():duint;cdecl; external x32DBG name '?GetDR6@Register@Script@@YA_KXZ';
{SCRIPT_EXPORT bool}  function SetDR6(value:duint):Boolean;cdecl; external x32DBG name '?SetDR6@Register@Script@@YA_N_K@Z';
{SCRIPT_EXPORT duint} function GetDR7():duint;cdecl; external x32DBG name '?GetDR7@Register@Script@@YA_KXZ';
{SCRIPT_EXPORT bool}  function SetDR7(value:duint):Boolean;cdecl; external x32DBG name '?SetDR7@Register@Script@@YA_N_K@Z';


{SCRIPT_EXPORT unsigned int}   function GetEAX():Cardinal;cdecl; external x32DBG name '?GetEAX@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool}           function SetEAX(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetEAX@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetAX():Word;cdecl; external x32DBG name '?GetAX@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool}           function SetAX(value:Word):Boolean;cdecl; external x32DBG name '?SetAX@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned char}  function GetAH():Byte;cdecl; external x32DBG name '?GetAH@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool}           function SetAH(value:Byte):Boolean;cdecl; external x32DBG name '?SetAH@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned char}  function GetAL():Byte;cdecl; external x32DBG name '?GetAL@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool}           function SetAL(value:Byte):Boolean;cdecl; external x32DBG name '?SetAL@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned int}   function GetEBX():Cardinal;cdecl; external x32DBG name '?GetEBX@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool}           function SetEBX(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetEBX@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetBX():Word;cdecl; external x32DBG name '?GetBX@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool}           function SetBX(value:Word):Boolean;cdecl; external x32DBG name '?SetBX@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned char}  function GetBH():Byte;cdecl; external x32DBG name '?GetBH@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool}           function SetBH(value:Byte):Boolean;cdecl; external x32DBG name '?SetBH@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned char}  function GetBL():Byte;cdecl; external x32DBG name '?GetBL@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool}           function SetBL(value:Byte):Boolean;cdecl; external x32DBG name '?SetBL@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned int}   function GetECX():Cardinal;cdecl; external x32DBG name '?GetECX@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool}           function SetECX(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetECX@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetCX():Word;cdecl; external x32DBG name '?GetCX@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool}           function SetCX(value:Word):Boolean;cdecl; external x32DBG name '?SetCX@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned char}  function GetCH():Byte;cdecl; external x32DBG name '?GetCH@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool}           function SetCH(value:Byte):Boolean;cdecl; external x32DBG name '?SetCH@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned char}  function GetCL():Byte;cdecl; external x32DBG name '?GetCL@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool}           function SetCL(value:Byte):Boolean;cdecl; external x32DBG name '?SetCL@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned int}   function GetEDX():Cardinal;cdecl; external x32DBG name '?GetEDX@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool}           function SetEDX(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetEDX@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetDX():Word;cdecl; external x32DBG name '?GetDX@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool}           function SetDX(value:Word):Boolean;cdecl; external x32DBG name '?SetDX@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned char}  function GetDH():Byte;cdecl; external x32DBG name '?GetDH@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool}           function SetDH(value:Byte):Boolean;cdecl; external x32DBG name '?SetDH@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned char}  function GetDL():Byte;cdecl; external x32DBG name '?GetDL@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool}           function SetDL(value:Byte):Boolean;cdecl; external x32DBG name '?SetDL@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned int}   function GetEDI():Cardinal;cdecl; external x32DBG name '?GetEDI@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool}           function SetEDI(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetEDI@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetDI():Word;cdecl; external x32DBG name '?GetDI@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool}           function SetDI(value:Word):Boolean;cdecl; external x32DBG name '?SetDI@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned int}   function GetESI():Cardinal;cdecl; external x32DBG name '?GetESI@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool}           function SetESI(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetESI@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetSI():Word;cdecl; external x32DBG name '?GetSI@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool}           function SetSI(value:Word):Boolean;cdecl; external x32DBG name '?SetSI@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned int}   function GetEBP():Cardinal;cdecl; external x32DBG name '?GetEBP@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool}           function SetEBP(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetEBP@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetBP():Word;cdecl; external x32DBG name '?GetBP@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool}           function SetBP(value:Word):Boolean;cdecl; external x32DBG name '?SetBP@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned int}   function GetESP():Cardinal;cdecl; external x32DBG name '?GetESP@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool}           function SetESP(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetESP@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetSP():Word;cdecl; external x32DBG name '?GetSP@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool}           function SetSP(value:Word):Boolean;cdecl; external x32DBG name '?SetSP@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned int}   function GetEIP():Cardinal;cdecl; external x32DBG name '?GetEIP@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool}           function SetEIP(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetEIP@Register@Script@@YA_NI@Z';

{SCRIPT_EXPORT duint} function GetCIP():duint;cdecl; external x32DBG name '?GetCIP@Register@Script@@YAKXZ';
{SCRIPT_EXPORT bool} function SetCIP(value:duint):Boolean;cdecl; external x32DBG name '?SetCIP@Register@Script@@YA_NK@Z';
{SCRIPT_EXPORT duint} function GetCSP():duint;cdecl; external x32DBG name '?GetCSP@Register@Script@@YAKXZ';
{SCRIPT_EXPORT bool} function SetCSP(value:duint):Boolean;cdecl; external x32DBG name '?SetCSP@Register@Script@@YA_NK@Z';

// The x64 unsigned long is ULONG_PTR,no't LongInt;
{SCRIPT_EXPORT unsigned long} function GetRAX():ULONG_PTR;cdecl; external x32DBG name '?GetRAX@Register@Script@@YA_KXZ';
{SCRIPT_EXPORT bool} function SetRAX(value:ULONG_PTR):Boolean;cdecl; external x32DBG name '?SetRAX@Register@Script@@YA_N_K@Z';
{SCRIPT_EXPORT unsigned long} function GetRBX():ULONG_PTR;cdecl; external x32DBG name '?GetRBX@Register@Script@@YA_KXZ';
{SCRIPT_EXPORT bool} function SetRBX(value:ULONG_PTR):Boolean;cdecl; external x32DBG name '?SetRBX@Register@Script@@YA_N_K@Z';
{SCRIPT_EXPORT unsigned long} function GetRCX():ULONG_PTR;cdecl; external x32DBG name '?GetRCX@Register@Script@@YA_KXZ';
{SCRIPT_EXPORT bool} function SetRCX(value:ULONG_PTR):Boolean;cdecl; external x32DBG name '?SetRCX@Register@Script@@YA_N_K@Z';
{SCRIPT_EXPORT unsigned long} function GetRDX():ULONG_PTR;cdecl; external x32DBG name '?GetRDX@Register@Script@@YA_KXZ';
{SCRIPT_EXPORT bool} function SetRDX(value:ULONG_PTR):Boolean;cdecl; external x32DBG name '?SetRDX@Register@Script@@YA_N_K@Z';
{SCRIPT_EXPORT unsigned long} function GetRSI():ULONG_PTR;cdecl; external x32DBG name '?GetRSI@Register@Script@@YA_KXZ';
{SCRIPT_EXPORT bool} function SetRSI(value:ULONG_PTR):Boolean;cdecl; external x32DBG name '?SetRSI@Register@Script@@YA_N_K@Z';
{SCRIPT_EXPORT unsigned char} function GetSIL():Byte;cdecl; external x32DBG name '?GetSIL@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool} function SetSIL(value:Byte):Boolean;cdecl; external x32DBG name '?SetSIL@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned long} function GetRDI():ULONG_PTR;cdecl; external x32DBG name '?GetRDI@Register@Script@@YA_KXZ';
{SCRIPT_EXPORT bool} function SetRDI(value:ULONG_PTR):Boolean;cdecl; external x32DBG name '?SetRDI@Register@Script@@YA_N_K@Z';
{SCRIPT_EXPORT unsigned char} function GetDIL():Byte;cdecl; external x32DBG name '?GetDIL@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool} function SetDIL(value:Byte):Boolean;cdecl; external x32DBG name '?SetDIL@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned long} function GetRBP():ULONG_PTR;cdecl; external x32DBG name '?GetRBP@Register@Script@@YA_KXZ';
{SCRIPT_EXPORT bool} function SetRBP(value:ULONG_PTR):Boolean;cdecl; external x32DBG name '?SetRBP@Register@Script@@YA_N_K@Z';
{SCRIPT_EXPORT unsigned char} function GetBPL():Byte;cdecl; external x32DBG name '?GetBPL@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool} function SetBPL(value:Byte):Boolean;cdecl; external x32DBG name '?SetBPL@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned long} function GetRSP():ULONG_PTR;cdecl; external x32DBG name '?GetRSP@Register@Script@@YA_KXZ';
{SCRIPT_EXPORT bool} function SetRSP(value:ULONG_PTR):Boolean;cdecl; external x32DBG name '?SetRSP@Register@Script@@YA_N_K@Z';
{SCRIPT_EXPORT unsigned char} function GetSPL():Byte;cdecl; external x32DBG name '?GetSPL@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool} function SetSPL(value:Byte):Boolean;cdecl; external x32DBG name '?SetSPL@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned long} function GetRIP():ULONG_PTR;cdecl; external x32DBG name '?GetRIP@Register@Script@@YA_KXZ';
{SCRIPT_EXPORT bool} function SetRIP(value:ULONG_PTR):Boolean;cdecl; external x32DBG name '?SetRIP@Register@Script@@YA_N_K@Z';
{SCRIPT_EXPORT unsigned long} function GetR8():ULONG_PTR;cdecl; external x32DBG name '?GetR8W@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool} function SetR8(value:ULONG_PTR):Boolean;cdecl; external x32DBG name '?SetR8@Register@Script@@YA_N_K@Z';
{SCRIPT_EXPORT unsigned int} function GetR8D():Cardinal;cdecl; external x32DBG name '?GetR8D@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool} function SetR8D(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetR8D@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetR8W():Word;cdecl; external x32DBG name '?GetR8W@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool} function SetR8W(value:Word):Boolean;cdecl; external x32DBG name '?SetR8W@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned char} function GetR8B():Byte;cdecl; external x32DBG name '?GetR8B@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool} function SetR8B(value:Byte):Boolean;cdecl; external x32DBG name '?SetR8B@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned long} function GetR9():ULONG_PTR;cdecl; external x32DBG name '?GetR9@Register@Script@@YA_KXZ';
{SCRIPT_EXPORT bool} function SetR9(value:ULONG_PTR):Boolean;cdecl; external x32DBG name '?SetR9@Register@Script@@YA_N_K@Z';
{SCRIPT_EXPORT unsigned int} function GetR9D():Cardinal;cdecl; external x32DBG name '?GetR9D@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool} function SetR9D(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetR9D@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetR9W():Word;cdecl; external x32DBG name '?GetR9W@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool} function SetR9W(value:Word):Boolean;cdecl; external x32DBG name '?SetR9W@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned char} function GetR9B():Byte;cdecl; external x32DBG name '?GetR9B@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool} function SetR9B(value:Byte):Boolean;cdecl; external x32DBG name '?SetR9B@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned long} function GetR10():ULONG_PTR;cdecl; external x32DBG name '?GetR10@Register@Script@@YA_KXZ';
{SCRIPT_EXPORT bool} function SetR10(value:ULONG_PTR):Boolean;cdecl; external x32DBG name '?SetR10@Register@Script@@YA_N_K@Z';
{SCRIPT_EXPORT unsigned int} function GetR10D():Cardinal;cdecl; external x32DBG name '?GetR10D@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool} function SetR10D(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetR10D@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetR10W():Word;cdecl; external x32DBG name '?GetR10W@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool} function SetR10W(value:Word):Boolean;cdecl; external x32DBG name '?SetR10W@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned char} function GetR10B():Byte;cdecl; external x32DBG name '?GetR10B@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool} function SetR10B(value:Byte):Boolean;cdecl; external x32DBG name '?SetR10B@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned long} function GetR11():ULONG_PTR;cdecl; external x32DBG name '?GetR11@Register@Script@@YA_KXZ';
{SCRIPT_EXPORT bool} function SetR11(value:ULONG_PTR):Boolean;cdecl; external x32DBG name '?SetR11@Register@Script@@YA_N_K@Z';
{SCRIPT_EXPORT unsigned int} function GetR11D():Cardinal;cdecl; external x32DBG name '?GetR11D@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool} function SetR11D(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetR11D@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetR11W():Word;cdecl; external x32DBG name '?GetR11W@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool} function SetR11W(value:Word):Boolean;cdecl; external x32DBG name '?SetR11W@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned char} function GetR11B():Byte;cdecl; external x32DBG name '?GetR11B@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool} function SetR11B(value:Byte):Boolean;cdecl; external x32DBG name '?SetR11B@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned long} function GetR12():ULONG_PTR;cdecl; external x32DBG name '?GetR12@Register@Script@@YA_KXZ';
{SCRIPT_EXPORT bool} function SetR12(value:ULONG_PTR):Boolean;cdecl; external x32DBG name '?SetR12@Register@Script@@YA_N_K@Z';
{SCRIPT_EXPORT unsigned int} function GetR12D():Cardinal;cdecl; external x32DBG name '?GetR12D@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool} function SetR12D(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetR12D@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetR12W():Word;cdecl; external x32DBG name '?GetR12W@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool} function SetR12W(value:Word):Boolean;cdecl; external x32DBG name '?SetR12W@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned char} function GetR12B():Byte;cdecl; external x32DBG name '?GetR12B@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool} function SetR12B(value:Byte):Boolean;cdecl; external x32DBG name '?SetR12B@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned long} function GetR13():ULONG_PTR;cdecl; external x32DBG name '?GetR13@Register@Script@@YA_KXZ';
{SCRIPT_EXPORT bool} function SetR13(value:ULONG_PTR):Boolean;cdecl; external x32DBG name '?SetR13@Register@Script@@YA_N_K@Z';
{SCRIPT_EXPORT unsigned int} function GetR13D():Cardinal;cdecl; external x32DBG name '?GetR13D@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool} function SetR13D(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetR13D@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetR13W():Word;cdecl; external x32DBG name '?GetR13W@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool} function SetR13W(value:Word):Boolean;cdecl; external x32DBG name '?SetR13W@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned char} function GetR13B():Byte;cdecl; external x32DBG name '?GetR13B@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool} function SetR13B(value:Byte):Boolean;cdecl; external x32DBG name '?SetR13B@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned long} function GetR14():ULONG_PTR;cdecl; external x32DBG name '?GetR14@Register@Script@@YA_KXZ';
{SCRIPT_EXPORT bool} function SetR14(value:ULONG_PTR):Boolean;cdecl; external x32DBG name '?SetR14@Register@Script@@YA_N_K@Z';
{SCRIPT_EXPORT unsigned int} function GetR14D():Cardinal;cdecl; external x32DBG name '?GetR14D@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool} function SetR14D(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetR14D@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetR14W():Word;cdecl; external x32DBG name '?GetR14W@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool} function SetR14W(value:Word):Boolean;cdecl; external x32DBG name '?SetR14W@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned char} function GetR14B():Byte;cdecl; external x32DBG name '?GetR14B@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool} function SetR14B(value:Byte):Boolean;cdecl; external x32DBG name '?SetR14B@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned long} function GetR15():ULONG_PTR;cdecl; external x32DBG name '?GetR15@Register@Script@@YA_KXZ';
{SCRIPT_EXPORT bool} function SetR15(value:ULONG_PTR):Boolean;cdecl; external x32DBG name '?SetR15@Register@Script@@YA_N_K@Z';
{SCRIPT_EXPORT unsigned int} function GetR15D():Cardinal;cdecl; external x32DBG name '?GetR15D@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool} function SetR15D(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetR15D@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetR15W():Word;cdecl; external x32DBG name '?GetR15W@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool} function SetR15W(value:Word):Boolean;cdecl; external x32DBG name '?SetR15W@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned char} function GetR15B():Byte;cdecl; external x32DBG name '?GetR15B@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool} function SetR15B(value:Byte):Boolean;cdecl; external x32DBG name '?SetR15B@Register@Script@@YA_NE@Z';
{$else}
//32
{SCRIPT_EXPORT duint} function _Get(reg:RegisterEnum):duint;cdecl; external x32DBG name '?Get@Register@Script@@YAKW4RegisterEnum@12@@Z';
{SCRIPT_EXPORT bool}  function _Set(reg:RegisterEnum;value:duint):Boolean;cdecl; external x32DBG name '?Set@Register@Script@@YA_NW4RegisterEnum@12@K@Z';
{SCRIPT_EXPORT int}   function Size():Integer;cdecl; external x32DBG name '?Size@Register@Script@@YAHXZ'; //gets architecture register size in bytes

{SCRIPT_EXPORT duint} function GetDR0():duint;cdecl; external x32DBG name '?GetDR0@Register@Script@@YAKXZ';
{SCRIPT_EXPORT bool}  function SetDR0(value:duint):Boolean;cdecl; external x32DBG name '?SetDR0@Register@Script@@YA_NK@Z';
{SCRIPT_EXPORT duint} function GetDR1():duint;cdecl; external x32DBG name '?GetDR1@Register@Script@@YAKXZ';
{SCRIPT_EXPORT bool}  function SetDR1(value:duint):Boolean;cdecl; external x32DBG name '?SetDR1@Register@Script@@YA_NK@Z';
{SCRIPT_EXPORT duint} function GetDR2():duint;cdecl; external x32DBG name '?GetDR2@Register@Script@@YAKXZ';
{SCRIPT_EXPORT bool}  function SetDR2(value:duint):Boolean;cdecl; external x32DBG name '?SetDR2@Register@Script@@YA_NK@Z';
{SCRIPT_EXPORT duint} function GetDR3():duint;cdecl; external x32DBG name '?GetDR3@Register@Script@@YAKXZ';
{SCRIPT_EXPORT bool}  function SetDR3(value:duint):Boolean;cdecl; external x32DBG name '?SetDR3@Register@Script@@YA_NK@Z';
{SCRIPT_EXPORT duint} function GetDR6():duint;cdecl; external x32DBG name '?GetDR6@Register@Script@@YAKXZ';
{SCRIPT_EXPORT bool}  function SetDR6(value:duint):Boolean;cdecl; external x32DBG name '?SetDR6@Register@Script@@YA_NK@Z';
{SCRIPT_EXPORT duint} function GetDR7():duint;cdecl; external x32DBG name '?GetDR7@Register@Script@@YAKXZ';
{SCRIPT_EXPORT bool}  function SetDR7(value:duint):Boolean;cdecl; external x32DBG name '?SetDR7@Register@Script@@YA_NK@Z';


{SCRIPT_EXPORT unsigned int}   function GetEAX():Cardinal;cdecl; external x32DBG name '?GetEAX@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool}           function SetEAX(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetEAX@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetAX():Word;cdecl; external x32DBG name '?GetAX@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool}           function SetAX(value:Word):Boolean;cdecl; external x32DBG name '?SetAX@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned char}  function GetAH():Byte;cdecl; external x32DBG name '?GetAH@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool}           function SetAH(value:Byte):Boolean;cdecl; external x32DBG name '?SetAH@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned char}  function GetAL():Byte;cdecl; external x32DBG name '?GetAL@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool}           function SetAL(value:Byte):Boolean;cdecl; external x32DBG name '?SetAL@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned int}   function GetEBX():Cardinal;cdecl; external x32DBG name '?GetEBX@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool}           function SetEBX(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetEBX@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetBX():Word;cdecl; external x32DBG name '?GetBX@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool}           function SetBX(value:Word):Boolean;cdecl; external x32DBG name '?SetBX@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned char}  function GetBH():Byte;cdecl; external x32DBG name '?GetBH@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool}           function SetBH(value:Byte):Boolean;cdecl; external x32DBG name '?SetBH@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned char}  function GetBL():Byte;cdecl; external x32DBG name '?GetBL@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool}           function SetBL(value:Byte):Boolean;cdecl; external x32DBG name '?SetBL@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned int}   function GetECX():Cardinal;cdecl; external x32DBG name '?GetECX@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool}           function SetECX(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetECX@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetCX():Word;cdecl; external x32DBG name '?GetCX@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool}           function SetCX(value:Word):Boolean;cdecl; external x32DBG name '?SetCX@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned char}  function GetCH():Byte;cdecl; external x32DBG name '?GetCH@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool}           function SetCH(value:Byte):Boolean;cdecl; external x32DBG name '?SetCH@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned char}  function GetCL():Byte;cdecl; external x32DBG name '?GetCL@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool}           function SetCL(value:Byte):Boolean;cdecl; external x32DBG name '?SetCL@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned int}   function GetEDX():Cardinal;cdecl; external x32DBG name '?GetEDX@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool}           function SetEDX(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetEDX@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetDX():Word;cdecl; external x32DBG name '?GetDX@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool}           function SetDX(value:Word):Boolean;cdecl; external x32DBG name '?SetDX@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned char}  function GetDH():Byte;cdecl; external x32DBG name '?GetDH@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool}           function SetDH(value:Byte):Boolean;cdecl; external x32DBG name '?SetDH@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned char}  function GetDL():Byte;cdecl; external x32DBG name '?GetDL@Register@Script@@YAEXZ';
{SCRIPT_EXPORT bool}           function SetDL(value:Byte):Boolean;cdecl; external x32DBG name '?SetDL@Register@Script@@YA_NE@Z';
{SCRIPT_EXPORT unsigned int}   function GetEDI():Cardinal;cdecl; external x32DBG name '?GetEDI@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool}           function SetEDI(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetEDI@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetDI():Word;cdecl; external x32DBG name '?GetDI@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool}           function SetDI(value:Word):Boolean;cdecl; external x32DBG name '?SetDI@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned int}   function GetESI():Cardinal;cdecl; external x32DBG name '?GetESI@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool}           function SetESI(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetESI@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetSI():Word;cdecl; external x32DBG name '?GetSI@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool}           function SetSI(value:Word):Boolean;cdecl; external x32DBG name '?SetSI@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned int}   function GetEBP():Cardinal;cdecl; external x32DBG name '?GetEBP@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool}           function SetEBP(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetEBP@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetBP():Word;cdecl; external x32DBG name '?GetBP@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool}           function SetBP(value:Word):Boolean;cdecl; external x32DBG name '?SetBP@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned int}   function GetESP():Cardinal;cdecl; external x32DBG name '?GetESP@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool}           function SetESP(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetESP@Register@Script@@YA_NI@Z';
{SCRIPT_EXPORT unsigned short} function GetSP():Word;cdecl; external x32DBG name '?GetSP@Register@Script@@YAGXZ';
{SCRIPT_EXPORT bool}           function SetSP(value:Word):Boolean;cdecl; external x32DBG name '?SetSP@Register@Script@@YA_NG@Z';
{SCRIPT_EXPORT unsigned int}   function GetEIP():Cardinal;cdecl; external x32DBG name '?GetEIP@Register@Script@@YAIXZ';
{SCRIPT_EXPORT bool}           function SetEIP(value:Cardinal):Boolean;cdecl; external x32DBG name '?SetEIP@Register@Script@@YA_NI@Z';

{SCRIPT_EXPORT duint} function GetCIP():duint;cdecl; external x32DBG name '?GetCIP@Register@Script@@YAKXZ';
{SCRIPT_EXPORT bool} function SetCIP(value:duint):Boolean;cdecl; external x32DBG name '?SetCIP@Register@Script@@YA_NK@Z';
{SCRIPT_EXPORT duint} function GetCSP():duint;cdecl; external x32DBG name '?GetCSP@Register@Script@@YAKXZ';
{SCRIPT_EXPORT bool} function SetCSP(value:duint):Boolean;cdecl; external x32DBG name '?SetCSP@Register@Script@@YA_NK@Z';

{$ENDIF}

implementation

end.
