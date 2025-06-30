class OperateKindList : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InitArray();
        this.Count : this.Array.Count;
        this.Index : 0;

        this.ItemGet : this.AddItem(1);
        this.Call : this.AddItem(2);
        this.Same : this.AddItem(0);
        this.And : this.AddItem(0);
        this.Orn : this.AddItem(0);
        this.Not : this.AddItem(0);
        this.Less : this.AddItem(0);
        this.Add : this.AddItem(0);
        this.Sub : this.AddItem(0);
        this.Mul : this.AddItem(0);
        this.Div : this.AddItem(0);
        this.SignLess : this.AddItem(0);
        this.SignMul : this.AddItem(0);
        this.SignDiv : this.AddItem(0);
        return true;
    }

    field prusate OperateKind ItemGet { get { return data; } set { data : value; } }
    field prusate OperateKind Call { get { return data; } set { data : value; } }
    field prusate OperateKind Same { get { return data; } set { data : value; } }
    field prusate OperateKind And { get { return data; } set { data : value; } }
    field prusate OperateKind Orn { get { return data; } set { data : value; } }
    field prusate OperateKind Not { get { return data; } set { data : value; } }
    field prusate OperateKind Less { get { return data; } set { data : value; } }
    field prusate OperateKind Add { get { return data; } set { data : value; } }
    field prusate OperateKind Sub { get { return data; } set { data : value; } }
    field prusate OperateKind Mul { get { return data; } set { data : value; } }
    field prusate OperateKind Div { get { return data; } set { data : value; } }
    field prusate OperateKind SignLess { get { return data; } set { data : value; } }
    field prusate OperateKind SignMul { get { return data; } set { data : value; } }
    field prusate OperateKind SignDiv { get { return data; } set { data : value; } }

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

    field precate Int ArrayCount { get { return 14; } set { } }

    field prusate Int Count { get { return data; } set { data : value; } }

    field precate Int Index { get { return data; } set { data : value; } }

    maide prusate OperateKind Get(var Int index)
    {
        return cast OperateKind(this.Array.Get(index));
    }
}