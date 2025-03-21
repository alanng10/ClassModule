class LimitList : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InitArray();
        this.Count : this.Array.Count;
        this.Index : 0;

        this.StopSign : this.AddItem(".");
        this.PauseSign : this.AddItem(",");
        this.AreSign : this.AddItem(":");
        this.ExecuteSign : this.AddItem(";");
        this.SameSign : this.AddItem("=");
        this.AddSign : this.AddItem("+");
        this.SubSign : this.AddItem("-");
        this.MulSign : this.AddItem("*");
        this.DivSign : this.AddItem("/");
        this.AndSign : this.AddItem("&");
        this.OrnSign : this.AddItem("|");
        this.NotSign : this.AddItem("~");
        this.LessSign : this.AddItem("<");
        this.MoreSign : this.AddItem(">");
        this.BraceRoundLite : this.AddItem("(");
        this.BraceRoundRite : this.AddItem(")");
        this.BraceCurveLite : this.AddItem("{");
        this.BraceCurveRite : this.AddItem("}");
        return true;
    }

    field prusate Limit StopSign { get { return data; } set { data : value; } }
    field prusate Limit PauseSign { get { return data; } set { data : value; } }
    field prusate Limit AreSign { get { return data; } set { data : value; } }
    field prusate Limit ExecuteSign { get { return data; } set { data : value; } }
    field prusate Limit SameSign { get { return data; } set { data : value; } }
    field prusate Limit AddSign { get { return data; } set { data : value; } }
    field prusate Limit SubSign { get { return data; } set { data : value; } }
    field prusate Limit MulSign { get { return data; } set { data : value; } }
    field prusate Limit DivSign { get { return data; } set { data : value; } }
    field prusate Limit AndSign { get { return data; } set { data : value; } }
    field prusate Limit OrnSign { get { return data; } set { data : value; } }
    field prusate Limit NotSign { get { return data; } set { data : value; } }
    field prusate Limit LessSign { get { return data; } set { data : value; } }
    field prusate Limit MoreSign { get { return data; } set { data : value; } }
    field prusate Limit BraceRoundLite { get { return data; } set { data : value; } }
    field prusate Limit BraceRoundRite { get { return data; } set { data : value; } }
    field prusate Limit BraceCurveLite { get { return data; } set { data : value; } }
    field prusate Limit BraceCurveRite { get { return data; } set { data : value; } }

    maide precate Limit AddItem(var String text)
    {
        var Limit item;
        item : new Limit;
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

    field precate Int ArrayCount { get { return 18; } set { } }

    field prusate Int Count { get { return data; } set { data : value; } }

    field precate Int Index { get { return data; } set { data : value; } }

    maide prusate Limit Get(var Int index)
    {
        return cast Limit(this.Array.Get(index));
    }
}