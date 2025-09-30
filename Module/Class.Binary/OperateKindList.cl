class OperateKindList : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InitArray();
        this.Count : this.Array.Count;
        this.Index : 0;

        this.End : this.AddItem(0);
        this.Ret : this.AddItem(0);
        this.Refer : this.AddItem(1);
        this.Are : this.AddItem(1);
        this.InfStart : this.AddItem(0);
        this.InfEnd : this.AddItem(0);
        this.WhileStart : this.AddItem(0);
        this.While : this.AddItem(0);
        this.WhileEnd : this.AddItem(0);
        this.ItemGet : this.AddItem(1);
        this.Set : this.AddItem(1);
        this.Call : this.AddItem(2);
        this.Var : this.AddItem(1);
        this.VarMark : this.AddItem(1);
        this.New : this.AddItem(1);
        this.Share : this.AddItem(1);
        this.Cast : this.AddItem(1);
        this.This : this.AddItem(0);
        this.Base : this.AddItem(0);
        this.Null : this.AddItem(0);
        this.Same : this.AddItem(0);
        this.Less : this.AddItem(0);
        this.And : this.AddItem(0);
        this.Orn : this.AddItem(0);
        this.Not : this.AddItem(0);
        this.Add : this.AddItem(0);
        this.Sub : this.AddItem(0);
        this.Mul : this.AddItem(0);
        this.Div : this.AddItem(0);
        this.SignLess : this.AddItem(0);
        this.SignMul : this.AddItem(0);
        this.SignDiv : this.AddItem(0);
        this.BitAnd : this.AddItem(0);
        this.BitOrn : this.AddItem(0);
        this.BitNot : this.AddItem(0);
        this.BitLite : this.AddItem(0);
        this.BitRite : this.AddItem(0);
        this.BitSignRite : this.AddItem(0);
        this.BoolValue : this.AddItem(1);
        this.IntValue : this.AddItem(1);
        this.StringValue : this.AddItem(1);
        return true;
    }

    field prusate OperateKind End { get { return data; } set { data : value; } }
    field prusate OperateKind Ret { get { return data; } set { data : value; } }
    field prusate OperateKind Refer { get { return data; } set { data : value; } }
    field prusate OperateKind Are { get { return data; } set { data : value; } }
    field prusate OperateKind InfStart { get { return data; } set { data : value; } }
    field prusate OperateKind InfEnd { get { return data; } set { data : value; } }
    field prusate OperateKind WhileStart { get { return data; } set { data : value; } }
    field prusate OperateKind While { get { return data; } set { data : value; } }
    field prusate OperateKind WhileEnd { get { return data; } set { data : value; } }
    field prusate OperateKind ItemGet { get { return data; } set { data : value; } }
    field prusate OperateKind Set { get { return data; } set { data : value; } }
    field prusate OperateKind Call { get { return data; } set { data : value; } }
    field prusate OperateKind Var { get { return data; } set { data : value; } }
    field prusate OperateKind VarMark { get { return data; } set { data : value; } }
    field prusate OperateKind New { get { return data; } set { data : value; } }
    field prusate OperateKind Share { get { return data; } set { data : value; } }
    field prusate OperateKind Cast { get { return data; } set { data : value; } }
    field prusate OperateKind This { get { return data; } set { data : value; } }
    field prusate OperateKind Base { get { return data; } set { data : value; } }
    field prusate OperateKind Null { get { return data; } set { data : value; } }
    field prusate OperateKind Same { get { return data; } set { data : value; } }
    field prusate OperateKind Less { get { return data; } set { data : value; } }
    field prusate OperateKind And { get { return data; } set { data : value; } }
    field prusate OperateKind Orn { get { return data; } set { data : value; } }
    field prusate OperateKind Not { get { return data; } set { data : value; } }
    field prusate OperateKind Add { get { return data; } set { data : value; } }
    field prusate OperateKind Sub { get { return data; } set { data : value; } }
    field prusate OperateKind Mul { get { return data; } set { data : value; } }
    field prusate OperateKind Div { get { return data; } set { data : value; } }
    field prusate OperateKind SignLess { get { return data; } set { data : value; } }
    field prusate OperateKind SignMul { get { return data; } set { data : value; } }
    field prusate OperateKind SignDiv { get { return data; } set { data : value; } }
    field prusate OperateKind BitAnd { get { return data; } set { data : value; } }
    field prusate OperateKind BitOrn { get { return data; } set { data : value; } }
    field prusate OperateKind BitNot { get { return data; } set { data : value; } }
    field prusate OperateKind BitLite { get { return data; } set { data : value; } }
    field prusate OperateKind BitRite { get { return data; } set { data : value; } }
    field prusate OperateKind BitSignRite { get { return data; } set { data : value; } }
    field prusate OperateKind BoolValue { get { return data; } set { data : value; } }
    field prusate OperateKind IntValue { get { return data; } set { data : value; } }
    field prusate OperateKind StringValue { get { return data; } set { data : value; } }

    maide precate OperateKind AddItem(var Int arg)
    {
        var OperateKind item;
        item : new OperateKind;
        item.Init();
        item.Index : this.Index;
        item.Arg : arg;
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

    field precate Int ArrayCount { get { return 41; } set { } }

    field prusate Int Count { get { return data; } set { data : value; } }

    field precate Int Index { get { return data; } set { data : value; } }

    maide prusate OperateKind Get(var Int index)
    {
        return cast OperateKind(this.Array.Get(index));
    }
}