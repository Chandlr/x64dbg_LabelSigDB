unit ScanUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, _scriptapi_pattern,

  //for scan and disasm engine
  System.RegularExpressions,
  UnivDisasm.Disasm,
  UnivDisasm.Cnsts,
  UnivDisasm.Cnsts.Instructions,
  UnivDisasm.Syntax.UnivSyntax,
  UnivDisasm.Cnsts.Regs,

  //for stringstream..
  System.Classes,


  XSuperObject,
  StrUtils,

  _plugins,
  bridgemain;

  procedure CheckOnStart;
  procedure SigGen;
  procedure fDisasm2(P: PByte; cSize: cardinal; const Name: String);

implementation



procedure CheckOnStart;
//this is threaded
label back;
var
  fjson, json: ISuperObject;
  AMember,BMember: IMember;
  Strm: TStringStream;
  offs,cnt,total,cntX: duint;
begin
  try
    Strm := TStringStream.Create;
    Strm.LoadFromFile(ExtractFilePath(ParamStr(0))+'..\LabelSigDB.json');
    json := SO(Strm.DataString);
  except
    Strm.Free;
    PrintLog('Something wrong with: LabelSigDB.json '+#13#10);
    PrintLog('Put LabelSigDB.json in same dir as x96dbg.exe'+#13#10);
    exit;
  end;
     Strm.Free;
    PrintLog('Loaded: LabelSigDB.json '+#13#10);
    PrintLog('Scanning.. '+#13#10);
    total:=0;
    cntX:=0;
      for AMember in json.A['SigDB'] do
      begin
      fjson:=AMember.AsObject;
       for BMember in AMember.AsObject.A['Sig'] do
       begin
       offs:=DbgValFromString('mod.main()');
       cnt:=0;
       repeat

       offs:=FindMem(offs+cnt,(DbgValFromString('mod.size(mod.main())')-(offs-DbgValFromString('mod.main()')))-cnt,PAChar(RawByteString(BMember.AsString)));
       inc(total);

       if not ((offs=$FFFFFFFF) or (offs=$FFFFFFFFFFFFFFFF) or (offs=0) ) then
       begin
       DbgSetLabelAt(offs,  PAChar(RawByteString(fjson.S['Label'])));
       inc(cntX);
       inc(cnt);
       PrintLog('Made Label: '+fjson.S['Label']+' at: '+offs.ToHexString+#13#10);
       end;
       until ((offs=$FFFFFFFF) or (offs=$FFFFFFFFFFFFFFFF) or (offs=0) );
       end;
      end;
      PrintLog(json.A['SigDB'].Length.ToString+' labels and ['+total.ToString+'] signatures scanned'+#13#10);
      PrintLog('found: '+cntX.ToString+' labels'+#13#10);

      //this is important - thanks @mrexodia :)
      GuiUpdateAllViews();


end;


procedure SigGen;
//this is threaded
var
processMemory,instructions: PByte;
codeSize: cardinal;
lbl: LBLINFO;
selection: SELECTIONDATA;
begin
     if (DbgValFromString('dis.iscall(dis.sel())')<>1) then
     exit;


     if not GuiSelectionGet( GUI_DISASSEMBLY,@selection) then
     PrintLog('Selection failed'+#13#10);

     //dis.iscall(dis.sel())
    //dis.branchdest(dis.sel())
    //DbgValFromString('dis.branchdest(dis.sel())')

     if (DbgValFromString('dis.branchdest(dis.sel())')=0) then
     exit;

     selection.adrstart:=DbgValFromString('dis.branchdest(dis.sel())');

     codeSize := $FF;
     processMemory := BridgeAlloc(codeSize);

     	if not (DbgMemRead(selection.adrstart, processMemory, codeSize)) then
//                        DbgValFromString('mod.size(mod.main())')-(offs-DbgValFromString('mod.main()')))
      begin
      PrintLog('Couldn''t read process memory'+#13#10);
      BridgeFree(processMemory);
      exit;
      end;


      lbl.ilabel:='NoLabel';
      DbgGetLabelAt(     DbgValFromString('dis.branchdest(dis.sel())'), SEG_DEFAULT,@lbl);

      fDisasm2(processMemory,codeSize,lbl.ilabel);

      BridgeFree(processMemory);


end;



function SwapIndian(Value: Int64): Int64;
asm
{$IFDEF WIN32}
  mov    edx, [ebp+$08]
  mov    eax, [ebp+$0c]
  bswap  edx
  bswap  eax
{$ELSE}
  mov    rax, rcx
  bswap  rax
//{$Message Fatal 'ByteSwap64 has not been implemented for this architecture.'}
{$ENDIF}
end;


procedure fDisasm2(P: PByte; cSize: cardinal; const Name: String);
var
  ins: TInstruction;
  //List: TList;
  sz,i: Integer;
  S: String;
  //regex: TRegEx;
  //HexStr: String;
  counter: cardinal;
  sign: String;
begin
  counter:=0;
  sign:='';
  PrintLog('/* '+name+' */'+#13#10);

  while True do
  begin
    ins := Default (TInstruction);
    ins.Arch := CPUX;
    ins.Syntax := SX_UNIV_SYNTAX;
    ins.SyntaxOptions := USO_DEFAULT;
    ins.Addr := P;
    ins.Disp.Flags:=DF_REL+DF_USED+DF_DISP8N;
    sz := Disasm(@ins);



    S := '';
    P := ins.Addr;
    for i := 0 to sz - 1 do
    begin
      S := S + ' ' + IntToHex(P^, 2);
      Inc(P);
      inc(counter);
    end;


    if (ins.Disp.Size <>0) then
    S:=TRegEx.Replace(S, '([0-9A-F]{2})*(['+IntToHex( SwapIndian(ins.Disp.Value  ) )+']){2}', '??');

    if ( (ins.Arg1.Imm.Value<>0) or (ins.Arg2.Imm.Value<>0) ) then
    if (


       (ins.InstID = INST_ID_CALL  )
    or (ins.InstID = INST_ID_PUSH  )
    or (ins.InstID = INST_ID_ADD  )
    or (ins.InstID = INST_ID_SUB  )
    or (ins.InstID = INST_ID_OR  )
    or (ins.InstID = INST_ID_CMP  )
    or (ins.InstID = INST_ID_MOV   )
    or (ins.InstID = INST_ID_MOVD   )
    or (ins.InstID = INST_ID_MOVSX )
    //or
    )

    then
    begin

    if (ins.Arg1.Imm.Value<>0) then
    S:=TRegEx.Replace(S, '([0-9A-F]{2})*(['+IntToHex(SwapIndian(ins.Arg1.Imm.Value) )+']){2}', '??');

    if (ins.Arg2.Imm.Value<>0) then
    S:=TRegEx.Replace(S, '([0-9A-F]{2})*(['+IntToHex(SwapIndian(ins.Arg2.Imm.Value) )+']){2}', '??');
    end;

    P := ins.NextInst;

    sign:=sign+S;

    if ins.InstID = INST_ID_RET then
      break;

    if Counter >= cSize then
      break;

  end;
  sign := WrapText( trim( sign));

  PrintLog('/* '+#13#10+
  sign+
  #13#10+
  ' */'+
  #13#10);


 PrintLog('/*------------------------------------------------*/'+#13#10);
 PrintLog(''+#13#10);
 PrintLog(''+#13#10);
end;



end.
