class BinaryStateTravel : Travel
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Kind : share BinaryOperateKindList;

        this.Operate : this.CreateOperate();
        return true;
    }

    maide precate BinaryOperate CreateOperate()
    {
        var BinaryOperate a;
        a : new BinaryOperate;
        a.Init();
        return a;
    }

    field prusate BinaryState State { get { return data; } set { data : value; } }
    field precate BinaryOperateKindList Kind { get { return data; } set { data : value; } }
    field precate BinaryOperate Operate { get { return data; } set { data : value; } }

    maide precate Bool Op(var BinaryOperateKind kind, var Any argA, var Any argB)
    {
        this.Operate.Kind : kind.Index;
        this.Operate.ArgA : argA;
        this.Operate.ArgB : argB;

        this.State.ExecuteOperate(this.Operate);
        return true;
    }

    maide precate ModuleInfo Info(var Node node)
    {
        return cast ModuleInfo(node.NodeAny);
    }
}