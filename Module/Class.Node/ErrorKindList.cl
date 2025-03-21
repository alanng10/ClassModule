class ErrorKindList : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InitArray();
        this.Count : this.Array.Count;
        this.Index : 0;

        this.Unvalid : this.AddItem("Unvalid");
        this.NameUnvalid : this.AddItem("NameUnvalid");
        this.BaseUnvalid : this.AddItem("BaseUnvalid");
        this.PartUnvalid : this.AddItem("PartUnvalid");
        this.ClassUnvalid : this.AddItem("ClassUnvalid");
        this.CountUnvalid : this.AddItem("CountUnvalid");
        this.GetUnvalid : this.AddItem("GetUnvalid");
        this.SetUnvalid : this.AddItem("SetUnvalid");
        this.ParamUnvalid : this.AddItem("ParamUnvalid");
        this.CallUnvalid : this.AddItem("CallUnvalid");
        this.FieldUnvalid : this.AddItem("FieldUnvalid");
        this.MaideUnvalid : this.AddItem("MaideUnvalid");
        this.VarUnvalid : this.AddItem("VarUnvalid");
        this.OperandUnvalid : this.AddItem("OperandUnvalid");
        this.MarkUnvalid : this.AddItem("MarkUnvalid");
        this.ValueUnvalid : this.AddItem("ValueUnvalid");
        this.ThisUnvalid : this.AddItem("ThisUnvalid");
        this.AnyUnvalid : this.AddItem("AnyUnvalid");
        this.ArgueUnvalid : this.AddItem("ArgueUnvalid");
        this.ResultUnvalid : this.AddItem("ResultUnvalid");
        this.CondUnvalid : this.AddItem("CondUnvalid");
        this.BodyUnvalid : this.AddItem("BodyUnvalid");
        this.ItemUnvalid : this.AddItem("ItemUnvalid");
        return true;
    }

    field prusate ErrorKind Unvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind NameUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind BaseUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind PartUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind ClassUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind CountUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind GetUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind SetUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind ParamUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind CallUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind FieldUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind MaideUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind VarUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind OperandUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind MarkUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind ValueUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind ThisUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind AnyUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind ArgueUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind ResultUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind CondUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind BodyUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind ItemUnvalid { get { return data; } set { data : value; } }

    maide precate ErrorKind AddItem(var String text)
    {
        ErrorKind item;
        item : new ErrorKind;
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

    maide prusate ErrorKind Get(var Int index)
    {
        return cast ErrorKind(this.Array.Get(index));
    }
}