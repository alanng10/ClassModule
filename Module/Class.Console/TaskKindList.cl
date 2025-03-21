class TaskKindList : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InitArray();
        this.Count : this.Array.Count;
        this.Index : 0;

        this.Docue : this.AddItem();
        this.Token : this.AddItem();
        this.Node : this.AddItem();
        this.Module : this.AddItem();
        this.Console : this.AddItem();
        return true;
    }

    field prusate TaskKind Docue { get { return data; } set { data : value; } }
    field prusate TaskKind Token { get { return data; } set { data : value; } }
    field prusate TaskKind Node { get { return data; } set { data : value; } }
    field prusate TaskKind Module { get { return data; } set { data : value; } }
    field prusate TaskKind Console { get { return data; } set { data : value; } }

    maide precate TaskKind AddItem()
    {
        var TaskKind item;
        item : new TaskKind;
        item.Init();
        item.Index : this.Index;
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

    field precate Int ArrayCount { get { return 5; } set { } }

    field prusate Int Count { get { return data; } set { data : value; } }

    field precate Int Index { get { return data; } set { data : value; } }

    maide prusate TaskKind Get(var Int index)
    {
        return cast TaskKind(this.Array.Get(index));
    }
}