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

    maide prusate Bool ExecuteNewOperate(var NewOperate newOperate)
    {
        var Class ka;
        ka : this.Info(newOperate).OperateClass;

        var Int k;
        k : this.State.ClassIndex(ka);

        this.Op(this.Kind.New, k, null);
        return true;
    }

    maide prusate Bool ExecuteBoolValue(var BoolValue boolValue)
    {
        this.Op(this.Kind.BoolValue, boolValue.Value, null);
        return true;
    }

    maide prusate Bool ExecuteStringValue(var StringValue stringValue)
    {
        this.Op(this.Kind.StringValue, stringValue.Value, null);
        return true;
    }

    maide precate Bool IntValueOp(var Int value)
    {
        this.Op(this.Kind.IntValue, value, null);
        return true;
    }

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