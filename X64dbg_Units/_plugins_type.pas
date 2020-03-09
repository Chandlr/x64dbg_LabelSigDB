unit _plugins_type;
{
Ported form _plugins.h x64 and x32 to Unit Delphi by Lonely
FixCode:https://gitee.com/suxuss/DELPHI-x96dbg-Plugins-SDK
}

interface
uses
  Winapi.Windows;

{$I dbg.inc}

type
  {$IFDEF WIN64}
 // {$MINENUMSIZE 8}                         	// Size of enumerated types are 8 bytes
	duint = UInt64;
	dsint = Int64;
	pduint = ^duint;
	pdsint  = ^dsint;
{$ELSE}
 // {$MINENUMSIZE 4}                         // Size of enumerated types are 4 bytes
	duint = ULong;
	dsint = LongInt;
	pduint = ^duint;
	pdsint = ^dsint;
{$ENDIF} //WIN64

{$IFDEF UNICODE}
	AChar          = AnsiChar;                	// Delphi 6,7 SRC Work With Delphi 2009, 2010, XE.x
	PAChar         = PAnsiChar;               	// Delphi 6,7 SRC Work With Delphi 2009, 2010, XE.x
{$ELSE}
	AChar          = Char;
	PAChar         = PChar;
{$ENDIF}


implementation

end.
