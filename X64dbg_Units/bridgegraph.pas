unit bridgegraph;

interface
uses
  Winapi.Windows,_plugins_type,bridgelist;

{$I dbg.inc}

type
  BridgeCFInstruction = packed record
    addr:duint;                              //virtual address of the instruction
    data:array [0..14] of Byte;              //instruction bytes
  end;

  BridgeCFNodeList = packed record
     parentGraph:duint;                      //function of which this node is a part
     start:duint;                            //start of the block
     ends:duint;                             //end of the block (inclusive)
     brtrue:duint;                           //destination if condition is true
     brfalse:duint;                          //destination if condition is false
     icount:duint;                           //number of instructions in node
     terminal:Boolean;                       //node is a RET
     split:Boolean;                          //node is a split (brtrue points to the next node)
     userdata:Pointer;                       //user data
     exits:listinfo;                         //exits (including brtrue and brfalse, duint)
     instrs:ListInfo;                        //block instructions
  end;

  BridgeCFGraphList = packed record
     entryPoint:duint;        //graph entry point
     userdata:Pointer;        //user data
     nodes:ListInfo;          //graph nodes (BridgeCFNodeList)
  end;




implementation

end.
