{
Ported form _scriptapi_gui.h x64 and x32 to Unit Delphi by Lonely
FixCode:https://gitee.com/suxuss/DELPHI-x96dbg-Plugins-SDK
}
unit _scriptapi_gui;

interface
uses
  Winapi.Windows,_plugins_type,_plugins,bridgemain,bridgelist;

{$I dbg.inc}
type
    EWindow = (
     {$Z4+}
        DisassemblyWindow,
        DumpWindow,
        StackWindow,
        GraphWindow,
        MemMapWindow,
        SymModWindow
     {$Z4-}
    );

//Disassembly
{$ifdef win64}
{SCRIPT_EXPORT bool} function Disassembly_SelectionGet(start:pduint; fend:pduint):Boolean; cdecl; external x32DBG name '?SelectionGet@Disassembly@Gui@Script@@YA_NPEA_K0@Z';
{SCRIPT_EXPORT bool} function Disassembly_SelectionSet(start:duint; fend:duint):Boolean; cdecl; external x32DBG name '?SelectionSet@Disassembly@Gui@Script@@YA_N_K0@Z';
{SCRIPT_EXPORT duint} function Disassembly_SelectionGetStart():duint; cdecl; external x32DBG name '?SelectionGetStart@Disassembly@Gui@Script@@YA_KXZ';
{SCRIPT_EXPORT duint} function Disassembly_SelectionGetEnd():duint; cdecl; external x32DBG name '?SelectionGetEnd@Disassembly@Gui@Script@@YA_KXZ';
{$else}
{SCRIPT_EXPORT bool} function Disassembly_SelectionGet(start:pduint; fend:pduint):Boolean; cdecl; external x32DBG name '?SelectionGet@Disassembly@Gui@Script@@YA_NPAK0@Z';
{SCRIPT_EXPORT bool} function Disassembly_SelectionSet(start:duint; fend:duint):Boolean; cdecl; external x32DBG name '?SelectionSet@Disassembly@Gui@Script@@YA_NKK@Z';
{SCRIPT_EXPORT duint} function Disassembly_SelectionGetStart():duint; cdecl; external x32DBG name '?SelectionGetStart@Disassembly@Gui@Script@@YAKXZ';
{SCRIPT_EXPORT duint} function Disassembly_SelectionGetEnd():duint; cdecl; external x32DBG name '?SelectionGetEnd@Disassembly@Gui@Script@@YAKXZ';
{$endif}

//Dump
{$ifdef win64}
{SCRIPT_EXPORT bool} function Dump_SelectionGet(start:pduint; fend:pduint):Boolean;cdecl; external x32DBG name '?SelectionGet@Dump@Gui@Script@@YA_NPEA_K0@Z';
{SCRIPT_EXPORT bool} function Dump_SelectionSet(start:duint; fend:duint):Boolean;cdecl; external x32DBG name '?SelectionSet@Dump@Gui@Script@@YA_N_K0@Z';
{SCRIPT_EXPORT duint} function Dump_SelectionGetStart():duint;cdecl; external x32DBG name '?SelectionGetStart@Dump@Gui@Script@@YA_KXZ';
{SCRIPT_EXPORT duint} function Dump_SelectionGetEnd():duint;cdecl; external x32DBG name '?SelectionGetEnd@Dump@Gui@Script@@YA_KXZ';
{$else}
{SCRIPT_EXPORT bool} function Dump_SelectionGet(start:pduint; fend:pduint):Boolean;cdecl; external x32DBG name '?SelectionGet@Dump@Gui@Script@@YA_NPAK0@Z';
{SCRIPT_EXPORT bool} function Dump_SelectionSet(start:duint; fend:duint):Boolean;cdecl; external x32DBG name '?SelectionSet@Dump@Gui@Script@@YA_NKK@Z';
{SCRIPT_EXPORT duint} function Dump_SelectionGetStart():duint;cdecl; external x32DBG name '?SelectionGetStart@Dump@Gui@Script@@YAKXZ';
{SCRIPT_EXPORT duint} function Dump_SelectionGetEnd():duint;cdecl; external x32DBG name '?SelectionGetEnd@Dump@Gui@Script@@YAKXZ';
{$endif}

//Stack
{$ifdef win64}
{SCRIPT_EXPORT bool} function Stack_SelectionGet(start:pduint; fend:pduint):Boolean;cdecl; external x32DBG name '?SelectionGet@Stack@Gui@Script@@YA_NPEA_K0@Z';
{SCRIPT_EXPORT bool} function Stack_SelectionSet(start:duint; fend:duint):Boolean;cdecl; external x32DBG name '?SelectionSet@Stack@Gui@Script@@YA_N_K0@Z';
{SCRIPT_EXPORT duint} function Stack_SelectionGetStart():duint;cdecl; external x32DBG name '?SelectionGetStart@Stack@Gui@Script@@YA_KXZ';
{SCRIPT_EXPORT duint} function Stack_SelectionGetEnd():duint;cdecl; external x32DBG name '?SelectionGetEnd@Stack@Gui@Script@@YA_KXZ';
{$else}
{SCRIPT_EXPORT bool} function Stack_SelectionGet(start:pduint; fend:pduint):Boolean;cdecl; external x32DBG name '?SelectionGet@Stack@Gui@Script@@YA_NPAK0@Z';
{SCRIPT_EXPORT bool} function Stack_SelectionSet(start:duint; fend:duint):Boolean;cdecl; external x32DBG name '?SelectionSet@Stack@Gui@Script@@YA_NKK@Z';
{SCRIPT_EXPORT duint} function Stack_SelectionGetStart():duint;cdecl; external x32DBG name '?SelectionGetStart@Stack@Gui@Script@@YAKXZ';
{SCRIPT_EXPORT duint} function Stack_SelectionGetEnd():duint;cdecl; external x32DBG name '?SelectionGetEnd@Stack@Gui@Script@@YAKXZ';
{$endif}


//Graph
{$ifdef win64}
{SCRIPT_EXPORT duint} function Graph_SelectionGetStart():duint;cdecl; external x32DBG name '?SelectionGetStart@Graph@Gui@Script@@YA_KXZ';
{$else}
{SCRIPT_EXPORT duint} function Graph_SelectionGetStart():duint;cdecl; external x32DBG name '?SelectionGetStart@Graph@Gui@Script@@YAKXZ';
{$endif}

//namespace MemMap
{$ifdef win64}
{SCRIPT_EXPORT duint} function MemMap_SelectionGetStart():duint;cdecl; external x32DBG name '?SelectionGetStart@MemMap@Gui@Script@@YA_KXZ';
{$else}
{SCRIPT_EXPORT duint} function MemMap_SelectionGetStart():duint;cdecl; external x32DBG name '?SelectionGetStart@MemMap@Gui@Script@@YAKXZ';
{$endif}

//SymMod
{$ifdef win64}
{SCRIPT_EXPORT duint} function SymMod_SelectionGetStart():duint;cdecl; external x32DBG name '?SelectionGetStart@SymMod@Gui@Script@@YA_KXZ';
{$else}
{SCRIPT_EXPORT duint} function SymMod_SelectionGetStart():duint;cdecl; external x32DBG name '?SelectionGetStart@SymMod@Gui@Script@@YAKXZ';
{$endif}



{$ifdef win64}
{SCRIPT_EXPORT bool} function SelectionGet(window:EWindow; start:pduint;fend:pduint):Boolean;cdecl; external x32DBG name '?SelectionGet@Gui@Script@@YA_NW4Window@12@PEA_K1@Z';
{SCRIPT_EXPORT bool} function SelectionSet(window:EWindow; start:duint; fend:duint):Boolean;cdecl; external x32DBG name '?SelectionSet@Gui@Script@@YA_NW4Window@12@_K1@Z';
{SCRIPT_EXPORT duint} function SelectionGetStart(window:EWindow):duint;cdecl; external x32DBG name '?SelectionGetStart@Gui@Script@@YA_KW4Window@12@@Z';
{SCRIPT_EXPORT duint} function SelectionGetEnd(window:EWindow):duint;cdecl; external x32DBG name '?SelectionGetEnd@Gui@Script@@YA_KW4Window@12@@Z';
{SCRIPT_EXPORT void} procedure WindowMessage(const fmessage:PAChar);cdecl; external x32DBG name '?Message@Gui@Script@@YAXPEBD@Z';
{SCRIPT_EXPORT bool} function MessageYesNo(const fmessage:PAChar):Boolean;cdecl; external x32DBG name '?MessageYesNo@Gui@Script@@YA_NPEBD@Z';
{SCRIPT_EXPORT bool} function InputLine(const title:PAChar; text:PAChar):Boolean;cdecl; external x32DBG name '?InputLine@Gui@Script@@YA_NPEBDPEAD@Z'; //text[GUI_MAX_LINE_SIZE]
{SCRIPT_EXPORT bool} function InputValue(const title:PAChar;value:pduint):Boolean;cdecl; external x32DBG name '?InputValue@Gui@Script@@YA_NPEBDPEA_K@Z';
{SCRIPT_EXPORT void} procedure Refresh();cdecl; external x32DBG name '?Refresh@Gui@Script@@YAXXZ';
{SCRIPT_EXPORT void} procedure AddQWidgetTab(qWidget:Pointer);cdecl; external x32DBG name '?AddQWidgetTab@Gui@Script@@YAXPEAX@Z';
{SCRIPT_EXPORT void} procedure ShowQWidgetTab(qWidget:Pointer);cdecl; external x32DBG name '?ShowQWidgetTab@Gui@Script@@YAXPEAX@Z';
{SCRIPT_EXPORT void} procedure CloseQWidgetTab(qWidget:Pointer);cdecl; external x32DBG name '?CloseQWidgetTab@Gui@Script@@YAXPEAX@Z';

{$else}
{SCRIPT_EXPORT bool} function SelectionGet(window:EWindow; start:pduint;fend:pduint):Boolean;cdecl; external x32DBG name '?SelectionGet@Gui@Script@@YA_NW4Window@12@PAK1@Z';
{SCRIPT_EXPORT bool} function SelectionSet(window:EWindow; start:duint; fend:duint):Boolean;cdecl; external x32DBG name '?SelectionSet@Gui@Script@@YA_NW4Window@12@KK@Z';
{SCRIPT_EXPORT duint} function SelectionGetStart(window:EWindow):duint;cdecl; external x32DBG name '?SelectionGetStart@Gui@Script@@YAKW4Window@12@@Z';
{SCRIPT_EXPORT duint} function SelectionGetEnd(window:EWindow):duint;cdecl; external x32DBG name '?SelectionGetEnd@Gui@Script@@YAKW4Window@12@@Z';
{SCRIPT_EXPORT void} procedure WindowMessage(const fmessage:PAChar);cdecl; external x32DBG name '?Message@Gui@Script@@YAXPBD@Z';
{SCRIPT_EXPORT bool} function MessageYesNo(const fmessage:PAChar):Boolean;cdecl; external x32DBG name '?MessageYesNo@Gui@Script@@YA_NPBD@Z';
{SCRIPT_EXPORT bool} function InputLine(const title:PAChar; text:PAChar):Boolean;cdecl; external x32DBG name '?InputLine@Gui@Script@@YA_NPBDPAD@Z'; //text[GUI_MAX_LINE_SIZE]
{SCRIPT_EXPORT bool} function InputValue(const title:PAChar;value:pduint):Boolean;cdecl; external x32DBG name '?InputValue@Gui@Script@@YA_NPBDPAK@Z';
{SCRIPT_EXPORT void} procedure Refresh();cdecl; external x32DBG name '?Refresh@Gui@Script@@YAXXZ';
{SCRIPT_EXPORT void} procedure AddQWidgetTab(qWidget:Pointer);cdecl; external x32DBG name '?AddQWidgetTab@Gui@Script@@YAXPAX@Z';
{SCRIPT_EXPORT void} procedure ShowQWidgetTab(qWidget:Pointer);cdecl; external x32DBG name '?ShowQWidgetTab@Gui@Script@@YAXPAX@Z';
{SCRIPT_EXPORT void} procedure CloseQWidgetTab(qWidget:Pointer);cdecl; external x32DBG name '?CloseQWidgetTab@Gui@Script@@YAXPAX@Z';

{$endif}


implementation

end.
