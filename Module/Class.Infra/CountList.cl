class CountList : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InitArray();
        this.Count : this.Array.Count;
        this.Index : 0;

        this.Prusate : this.AddItem();
        this.Precate : this.AddItem();
        this.Pronate : this.AddItem();
        this.Private : this.AddItem();
        return true;
    }

    field prusate Count Prusate { get { return data; } set { data : value; } }
    field prusate Count Precate { get { return data; } set { data : value; } }
    field prusate Count Pronate { get { return data; } set { data : value; } }
    field prusate Count Private { get { return data; } set { data : value; } }

    maide precate Count AddItem()
    {
        var Count item;
        item : new Count;
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

    field precate Int ArrayCount { get { return 4; } set { } }

    field prusate Int Count { get { return data; } set { data : value; } }

    field precate Int Index { get { return data; } set { data : value; } }

    maide prusate Count Get(var Int index)
    {
        return cast Count(this.Array.Get(index));
    }
}