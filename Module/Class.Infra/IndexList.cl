class IndexList : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InitArray();
        this.Count : this.Array.Count;
        this.Index : 0;

        this.Class : this.AddItem("class");
        this.Field : this.AddItem("field");
        this.Maide : this.AddItem("maide");
        this.Var : this.AddItem("var");
        this.ItemGet : this.AddItem("get");
        this.Set : this.AddItem("set");
        this.This : this.AddItem("this");
        this.Base : this.AddItem("base");
        this.Return : this.AddItem("return");
        this.Inf : this.AddItem("inf");
        this.While : this.AddItem("while");
        this.New : this.AddItem("new");
        this.Share : this.AddItem("share");
        this.Cast : this.AddItem("cast");
        this.Null : this.AddItem("null");
        this.True : this.AddItem("true");
        this.False : this.AddItem("false");
        this.Sign : this.AddItem("sign");
        this.Bit : this.AddItem("bit");
        this.Prusate : this.AddItem("prusate");
        this.Precate : this.AddItem("precate");
        this.Pronate : this.AddItem("pronate");
        this.Private : this.AddItem("private");
        return true;
    }

    field prusate Index Class { get { return data; } set { data : value; } }
    field prusate Index Field { get { return data; } set { data : value; } }
    field prusate Index Maide { get { return data; } set { data : value; } }
    field prusate Index Var { get { return data; } set { data : value; } }
    field prusate Index ItemGet { get { return data; } set { data : value; } }
    field prusate Index Set { get { return data; } set { data : value; } }
    field prusate Index This { get { return data; } set { data : value; } }
    field prusate Index Base { get { return data; } set { data : value; } }
    field prusate Index Return { get { return data; } set { data : value; } }
    field prusate Index Inf { get { return data; } set { data : value; } }
    field prusate Index While { get { return data; } set { data : value; } }
    field prusate Index New { get { return data; } set { data : value; } }
    field prusate Index Share { get { return data; } set { data : value; } }
    field prusate Index Cast { get { return data; } set { data : value; } }
    field prusate Index Null { get { return data; } set { data : value; } }
    field prusate Index True { get { return data; } set { data : value; } }
    field prusate Index False { get { return data; } set { data : value; } }
    field prusate Index Sign { get { return data; } set { data : value; } }
    field prusate Index Bit { get { return data; } set { data : value; } }
    field prusate Index Prusate { get { return data; } set { data : value; } }
    field prusate Index Precate { get { return data; } set { data : value; } }
    field prusate Index Pronate { get { return data; } set { data : value; } }
    field prusate Index Private { get { return data; } set { data : value; } }

    maide precate Index AddItem(var String text)
    {
        var Index item;
        item : new Index;
        item.Init();
        item.Index : this.Index;
        item.Text : text;
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

    field precate Int ArrayCount { get { return 23; } set { } }

    field prusate Int Count { get { return data; } set { data : value; } }

    field precate Int Index { get { return data; } set { data : value; } }

    maide prusate Index Get(var Int index)
    {
        return cast Index(this.Array.Get(index));
    }
}