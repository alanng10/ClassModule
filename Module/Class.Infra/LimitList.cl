class LimitList : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InitArray();
        this.Count : this.Array.Count;
        this.Index : 0;

        this.Stop : this.AddItem(".");
        this.Pause : this.AddItem(",");
        this.Are : this.AddItem(":");
        this.Execute : this.AddItem(";");
        this.Same : this.AddItem("=");
        this.Add : this.AddItem("+");
        this.Sub : this.AddItem("-");
        this.Mul : this.AddItem("*");
        this.Div : this.AddItem("/");
        this.And : this.AddItem("&");
        this.Orn : this.AddItem("|");
        this.Not : this.AddItem("~");
        this.Less : this.AddItem("<");
        this.More : this.AddItem(">");
        this.BraceRoundLite : this.AddItem("(");
        this.BraceRoundRite : this.AddItem(")");
        this.BraceCurveLite : this.AddItem("{");
        this.BraceCurveRite : this.AddItem("}");
        return true;
    }

    field prusate Limit Stop { get { return data; } set { data : value; } }
    field prusate Limit Pause { get { return data; } set { data : value; } }
    field prusate Limit Are { get { return data; } set { data : value; } }
    field prusate Limit Execute { get { return data; } set { data : value; } }
    field prusate Limit Same { get { return data; } set { data : value; } }
    field prusate Limit Add { get { return data; } set { data : value; } }
    field prusate Limit Sub { get { return data; } set { data : value; } }
    field prusate Limit Mul { get { return data; } set { data : value; } }
    field prusate Limit Div { get { return data; } set { data : value; } }
    field prusate Limit And { get { return data; } set { data : value; } }
    field prusate Limit Orn { get { return data; } set { data : value; } }
    field prusate Limit Not { get { return data; } set { data : value; } }
    field prusate Limit Less { get { return data; } set { data : value; } }
    field prusate Limit More { get { return data; } set { data : value; } }
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