class NodeKindList : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InitArray();
        this.Count : this.Array.Count;
        this.Index : 0;

        this.Class : this.AddItem("Class", new Class, new ClassNewState, new ClassNodeState, new ClassCreateSetState);
        this.Part : this.AddItem("Part", new Part, new PartNewState, new PartNodeState, new PartCreateSetState);
        this.Comp : this.AddItem("Comp", new Comp, new CompNewState, new CompNodeState, new CompCreateSetState);
        this.Field : this.AddItem("Field", new Field, new FieldNewState, new FieldNodeState, new FieldCreateSetState);
        this.Maide : this.AddItem("Maide", new Maide, new MaideNewState, new MaideNodeState, new MaideCreateSetState);
        this.Param : this.AddItem("Param", new Param, new ParamNewState, new ParamNodeState, new ParamCreateSetState);
        this.Var : this.AddItem("Var", new Var, new VarNewState, new VarNodeState, new VarCreateSetState);
        this.ItemCount : this.AddItem("Count", new Count, new CountNewState, new CountNodeState, new CountCreateSetState);
        this.PrusateCount : this.AddItem("PrusateCount", new PrusateCount, new PrusateCountNewState, new PrusateCountNodeState, new PrusateCountCreateSetState);
        this.PrecateCount : this.AddItem("PrecateCount", new PrecateCount, new PrecateCountNewState, new PrecateCountNodeState, new PrecateCountCreateSetState);
        this.PronateCount : this.AddItem("PronateCount", new PronateCount, new PronateCountNewState, new PronateCountNodeState, new PronateCountCreateSetState);
        this.PrivateCount : this.AddItem("PrivateCount", new PrivateCount, new PrivateCountNewState, new PrivateCountNodeState, new PrivateCountCreateSetState);
        this.State : this.AddItem("State", new State, new StateNewState, new StateNodeState, new StateCreateSetState);
        this.Execute : this.AddItem("Execute", new Execute, new ExecuteNewState, new ExecuteNodeState, new ExecuteCreateSetState);
        this.InfExecute : this.AddItem("InfExecute", new InfExecute, new InfExecuteNewState, new InfExecuteNodeState, new InfExecuteCreateSetState);
        this.WhileExecute : this.AddItem("WhileExecute", new WhileExecute, new WhileExecuteNewState, new WhileExecuteNodeState, new WhileExecuteCreateSetState);
        this.ReturnExecute : this.AddItem("ReturnExecute", new ReturnExecute, new ReturnExecuteNewState, new ReturnExecuteNodeState, new ReturnExecuteCreateSetState);
        this.ReferExecute : this.AddItem("ReferExecute", new ReferExecute, new ReferExecuteNewState, new ReferExecuteNodeState, new ReferExecuteCreateSetState);
        this.AreExecute : this.AddItem("AreExecute", new AreExecute, new AreExecuteNewState, new AreExecuteNodeState, new AreExecuteCreateSetState);
        this.OperateExecute : this.AddItem("OperateExecute", new OperateExecute, new OperateExecuteNewState, new OperateExecuteNodeState, new OperateExecuteCreateSetState);
        this.Argue : this.AddItem("Argue", new Argue, new ArgueNewState, new ArgueNodeState, new ArgueCreateSetState);
        this.Mark : this.AddItem("Mark", new Mark, new MarkNewState, new MarkNodeState, new MarkCreateSetState);
        this.VarMark : this.AddItem("VarMark", new VarMark, new VarMarkNewState, new VarMarkNodeState, new VarMarkCreateSetState);
        this.SetMark : this.AddItem("SetMark", new SetMark, new SetMarkNewState, new SetMarkNodeState, new SetMarkCreateSetState);
        this.Operate : this.AddItem("Operate", new Operate, new OperateNewState, new OperateNodeState, new OperateCreateSetState);
        this.GetOperate : this.AddItem("GetOperate", new GetOperate, new GetOperateNewState, new GetOperateNodeState, new GetOperateCreateSetState);
        this.CallOperate : this.AddItem("CallOperate", new CallOperate, new CallOperateNewState, new CallOperateNodeState, new CallOperateCreateSetState);
        this.ThisOperate : this.AddItem("ThisOperate", new ThisOperate, new ThisOperateNewState, new ThisOperateNodeState, new ThisOperateCreateSetState);
        this.BaseOperate : this.AddItem("BaseOperate", new BaseOperate, new BaseOperateNewState, new BaseOperateNodeState, new BaseOperateCreateSetState);
        this.NullOperate : this.AddItem("NullOperate", new NullOperate, new NullOperateNewState, new NullOperateNodeState, new NullOperateCreateSetState);
        this.NewOperate : this.AddItem("NewOperate", new NewOperate, new NewOperateNewState, new NewOperateNodeState, new NewOperateCreateSetState);
        this.ShareOperate : this.AddItem("ShareOperate", new ShareOperate, new ShareOperateNewState, new ShareOperateNodeState, new ShareOperateCreateSetState);
        this.CastOperate : this.AddItem("CastOperate", new CastOperate, new CastOperateNewState, new CastOperateNodeState, new CastOperateCreateSetState);
        this.VarOperate : this.AddItem("VarOperate", new VarOperate, new VarOperateNewState, new VarOperateNodeState, new VarOperateCreateSetState);
        this.ValueOperate : this.AddItem("ValueOperate", new ValueOperate, new ValueOperateNewState, new ValueOperateNodeState, new ValueOperateCreateSetState);
        this.BraceOperate : this.AddItem("BraceOperate", new BraceOperate, new BraceOperateNewState, new BraceOperateNodeState, new BraceOperateCreateSetState);
        this.Value : this.AddItem("Value", new Value, new ValueNewState, new ValueNodeState, new ValueCreateSetState);
        this.BoolValue : this.AddItem("BoolValue", new BoolValue, new BoolValueNewState, new BoolValueNodeState, new BoolValueCreateSetState);
        this.IntValue : this.AddItem("IntValue", new IntValue, new IntValueNewState, new IntValueNodeState, new IntValueCreateSetState);
        this.IntSignValue : this.AddItem("IntSignValue", new IntSignValue, new IntSignValueNewState, new IntSignValueNodeState, new IntSignValueCreateSetState);
        this.IntHexValue : this.AddItem("IntHexValue", new IntHexValue, new IntHexValueNewState, new IntHexValueNodeState, new IntHexValueCreateSetState);
        this.IntHexSignValue : this.AddItem("IntHexSignValue", new IntHexSignValue, new IntHexSignValueNewState, new IntHexSignValueNodeState, new IntHexSignValueCreateSetState);
        this.StringValue : this.AddItem("StringValue", new StringValue, new StringValueNewState, new StringValueNodeState, new StringValueCreateSetState);
        this.ClassName : this.AddItem("ClassName", new ClassName, new ClassNameNewState, new ClassNameNodeState, new ClassNameCreateSetState);
        this.FieldName : this.AddItem("FieldName", new FieldName, new FieldNameNewState, new FieldNameNodeState, new FieldNameCreateSetState);
        this.MaideName : this.AddItem("MaideName", new MaideName, new MaideNameNewState, new MaideNameNodeState, new MaideNameCreateSetState);
        this.VarName : this.AddItem("VarName", new VarName, new VarNameNewState, new VarNameNodeState, new VarNameCreateSetState);
        this.SameOperate : this.AddItem("SameOperate", new SameOperate, new SameOperateNewState, new SameOperateNodeState, new SameOperateCreateSetState);
        this.AndOperate : this.AddItem("AndOperate", new AndOperate, new AndOperateNewState, new AndOperateNodeState, new AndOperateCreateSetState);
        this.OrnOperate : this.AddItem("OrnOperate", new OrnOperate, new OrnOperateNewState, new OrnOperateNodeState, new OrnOperateCreateSetState);
        this.NotOperate : this.AddItem("NotOperate", new NotOperate, new NotOperateNewState, new NotOperateNodeState, new NotOperateCreateSetState);
        this.LessOperate : this.AddItem("LessOperate", new LessOperate, new LessOperateNewState, new LessOperateNodeState, new LessOperateCreateSetState);
        this.AddOperate : this.AddItem("AddOperate", new AddOperate, new AddOperateNewState, new AddOperateNodeState, new AddOperateCreateSetState);
        this.SubOperate : this.AddItem("SubOperate", new SubOperate, new SubOperateNewState, new SubOperateNodeState, new SubOperateCreateSetState);
        this.MulOperate : this.AddItem("MulOperate", new MulOperate, new MulOperateNewState, new MulOperateNodeState, new MulOperateCreateSetState);
        this.DivOperate : this.AddItem("DivOperate", new DivOperate, new DivOperateNewState, new DivOperateNodeState, new DivOperateCreateSetState);
        this.SignMulOperate : this.AddItem("SignMulOperate", new SignMulOperate, new SignMulOperateNewState, new SignMulOperateNodeState, new SignMulOperateCreateSetState);
        this.SignDivOperate : this.AddItem("SignDivOperate", new SignDivOperate, new SignDivOperateNewState, new SignDivOperateNodeState, new SignDivOperateCreateSetState);
        this.SignLessOperate : this.AddItem("SignLessOperate", new SignLessOperate, new SignLessOperateNewState, new SignLessOperateNodeState, new SignLessOperateCreateSetState);
        this.BitAndOperate : this.AddItem("BitAndOperate", new BitAndOperate, new BitAndOperateNewState, new BitAndOperateNodeState, new BitAndOperateCreateSetState);
        this.BitOrnOperate : this.AddItem("BitOrnOperate", new BitOrnOperate, new BitOrnOperateNewState, new BitOrnOperateNodeState, new BitOrnOperateCreateSetState);
        this.BitNotOperate : this.AddItem("BitNotOperate", new BitNotOperate, new BitNotOperateNewState, new BitNotOperateNodeState, new BitNotOperateCreateSetState);
        this.BitLiteOperate : this.AddItem("BitLiteOperate", new BitLiteOperate, new BitLiteOperateNewState, new BitLiteOperateNodeState, new BitLiteOperateCreateSetState);
        this.BitRiteOperate : this.AddItem("BitRiteOperate", new BitRiteOperate, new BitRiteOperateNewState, new BitRiteOperateNodeState, new BitRiteOperateCreateSetState);
        this.BitSignRiteOperate : this.AddItem("BitSignRiteOperate", new BitSignRiteOperate, new BitSignRiteOperateNewState, new BitSignRiteOperateNodeState, new BitSignRiteOperateCreateSetState);
        return true;
    }

    field prusate NodeKind Class { get { return data; } set { data : value; } }
    field prusate NodeKind Part { get { return data; } set { data : value; } }
    field prusate NodeKind Comp { get { return data; } set { data : value; } }
    field prusate NodeKind Field { get { return data; } set { data : value; } }
    field prusate NodeKind Maide { get { return data; } set { data : value; } }
    field prusate NodeKind Param { get { return data; } set { data : value; } }
    field prusate NodeKind Var { get { return data; } set { data : value; } }
    field prusate NodeKind ItemCount { get { return data; } set { data : value; } }
    field prusate NodeKind PrusateCount { get { return data; } set { data : value; } }
    field prusate NodeKind PrecateCount { get { return data; } set { data : value; } }
    field prusate NodeKind PronateCount { get { return data; } set { data : value; } }
    field prusate NodeKind PrivateCount { get { return data; } set { data : value; } }
    field prusate NodeKind State { get { return data; } set { data : value; } }
    field prusate NodeKind Execute { get { return data; } set { data : value; } }
    field prusate NodeKind InfExecute { get { return data; } set { data : value; } }
    field prusate NodeKind WhileExecute { get { return data; } set { data : value; } }
    field prusate NodeKind ReturnExecute { get { return data; } set { data : value; } }
    field prusate NodeKind ReferExecute { get { return data; } set { data : value; } }
    field prusate NodeKind AreExecute { get { return data; } set { data : value; } }
    field prusate NodeKind OperateExecute { get { return data; } set { data : value; } }
    field prusate NodeKind Argue { get { return data; } set { data : value; } }
    field prusate NodeKind Mark { get { return data; } set { data : value; } }
    field prusate NodeKind VarMark { get { return data; } set { data : value; } }
    field prusate NodeKind SetMark { get { return data; } set { data : value; } }
    field prusate NodeKind Operate { get { return data; } set { data : value; } }
    field prusate NodeKind GetOperate { get { return data; } set { data : value; } }
    field prusate NodeKind CallOperate { get { return data; } set { data : value; } }
    field prusate NodeKind ThisOperate { get { return data; } set { data : value; } }
    field prusate NodeKind BaseOperate { get { return data; } set { data : value; } }
    field prusate NodeKind NullOperate { get { return data; } set { data : value; } }
    field prusate NodeKind NewOperate { get { return data; } set { data : value; } }
    field prusate NodeKind ShareOperate { get { return data; } set { data : value; } }
    field prusate NodeKind CastOperate { get { return data; } set { data : value; } }
    field prusate NodeKind VarOperate { get { return data; } set { data : value; } }
    field prusate NodeKind ValueOperate { get { return data; } set { data : value; } }
    field prusate NodeKind BraceOperate { get { return data; } set { data : value; } }
    field prusate NodeKind Value { get { return data; } set { data : value; } }
    field prusate NodeKind BoolValue { get { return data; } set { data : value; } }
    field prusate NodeKind IntValue { get { return data; } set { data : value; } }
    field prusate NodeKind IntSignValue { get { return data; } set { data : value; } }
    field prusate NodeKind IntHexValue { get { return data; } set { data : value; } }
    field prusate NodeKind IntHexSignValue { get { return data; } set { data : value; } }
    field prusate NodeKind StringValue { get { return data; } set { data : value; } }
    field prusate NodeKind ClassName { get { return data; } set { data : value; } }
    field prusate NodeKind FieldName { get { return data; } set { data : value; } }
    field prusate NodeKind MaideName { get { return data; } set { data : value; } }
    field prusate NodeKind VarName { get { return data; } set { data : value; } }
    field prusate NodeKind SameOperate { get { return data; } set { data : value; } }
    field prusate NodeKind AndOperate { get { return data; } set { data : value; } }
    field prusate NodeKind OrnOperate { get { return data; } set { data : value; } }
    field prusate NodeKind NotOperate { get { return data; } set { data : value; } }
    field prusate NodeKind LessOperate { get { return data; } set { data : value; } }
    field prusate NodeKind AddOperate { get { return data; } set { data : value; } }
    field prusate NodeKind SubOperate { get { return data; } set { data : value; } }
    field prusate NodeKind MulOperate { get { return data; } set { data : value; } }
    field prusate NodeKind DivOperate { get { return data; } set { data : value; } }
    field prusate NodeKind SignMulOperate { get { return data; } set { data : value; } }
    field prusate NodeKind SignDivOperate { get { return data; } set { data : value; } }
    field prusate NodeKind SignLessOperate { get { return data; } set { data : value; } }
    field prusate NodeKind BitAndOperate { get { return data; } set { data : value; } }
    field prusate NodeKind BitOrnOperate { get { return data; } set { data : value; } }
    field prusate NodeKind BitNotOperate { get { return data; } set { data : value; } }
    field prusate NodeKind BitLiteOperate { get { return data; } set { data : value; } }
    field prusate NodeKind BitRiteOperate { get { return data; } set { data : value; } }
    field prusate NodeKind BitSignRiteOperate { get { return data; } set { data : value; } }

    maide precate NodeKind AddItem(var String name, var Node node, var InfraState newState, var NodeState nodeState, var CreateSetState createSetState)
    {
        node.Init();
        newState.Init();
        nodeState.Init();
        createSetState.Init();

        var NodeKind item;
        item : new NodeKind;
        item.Init();
        item.Index : this.Index;
        item.Name : name;
        item.Node : node;
        item.NewState : newState;
        item.NodeState : nodeState;
        item.CreateSetState : createSetState;
        this.Array.Set(item.Index, item);
        this.Index : this.Index + 1;
        return item;
    }

    maide precate Bool InitArray()
    {
        this.Array : new Array;
        this.Array.Count : this.ArrayCount;
        this.Array.Init();
        return true;
    }

    field precate Array Array { get { return data; } set { data : value; } }

    field precate Int ArrayCount { get { return 65; } set { } }

    field prusate Int Count { get { return data; } set { data : value; } }

    field precate Int Index { get { return data; } set { data : value; } }

    maide prusate NodeKind Get(var Int index)
    {
        return cast NodeKind(this.Array.Get(index));
    }
}