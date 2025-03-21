class ErrorKindList : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InitArray();
        this.Count : this.Array.Count;
        this.Index : 0;

        this.NameUnavail : this.AddItem("NameUnavail");
        this.ClassUndefine : this.AddItem("ClassUndefine");
        this.BaseUndefine : this.AddItem("BaseUndefine");
        this.MarkUndefine : this.AddItem("MarkUndefine");
        this.ValueUndefine : this.AddItem("ValueUndefine");
        this.ValueUnassign : this.AddItem("ValueUnassign");
        this.OperandUndefine : this.AddItem("OperandUndefine");
        this.OperandUnassign : this.AddItem("OperandUnassign");
        this.ThisUndefine : this.AddItem("ThisUndefine");
        this.FieldUndefine : this.AddItem("FieldUndefine");
        this.MaideUndefine : this.AddItem("MaideUndefine");
        this.ArgueUnassign : this.AddItem("ArgueUnassign");
        this.AnyUndefine : this.AddItem("AnyUndefine");
        this.CondUndefine : this.AddItem("CondUndefine");
        this.CondUnassign : this.AddItem("CondUnassign");
        this.ResultUndefine : this.AddItem("ResultUndefine");
        this.ResultUnassign : this.AddItem("ResultUnassign");
        this.CastUnachieve : this.AddItem("CastUnachieve");
        this.VarUndefine : this.AddItem("VarUndefine");
        this.ExportUndefine : this.AddItem("ExportUndefine");
        this.ClassUnexport : this.AddItem("ClassUnexport");
        this.FieldUnexport : this.AddItem("FieldUnexport");
        this.MaideUnexport : this.AddItem("MaideUnexport");
        this.EntryUndefine : this.AddItem("EntryUndefine");
        this.EntryUnachieve : this.AddItem("EntryUnachieve");
        this.ModuleUnvalid : this.AddItem("ModuleUnvalid");
        this.ModuleUndefine : this.AddItem("ModuleUndefine");
        this.ImportNameUnavail : this.AddItem("ImportNameUnavail");
        this.ImportClassUndefine : this.AddItem("ImportClassUndefine");
        this.ExportUnvalid : this.AddItem("ExportUnvalid");
        this.ExportUnachieve : this.AddItem("ExportUnachieve");
        this.StorageDestUnvalid : this.AddItem("StorageDestUnvalid");
        this.StorageSourceUnvalid : this.AddItem("StorageSourceUnvalid");
        this.StorageDestUnavail : this.AddItem("StorageDestUnavail");
        this.StorageSourceUnachieve : this.AddItem("StorageSourceUnachieve");
        return true;
    }

    field prusate ErrorKind NameUnavail { get { return data; } set { data : value; } }
    field prusate ErrorKind ClassUndefine { get { return data; } set { data : value; } }
    field prusate ErrorKind BaseUndefine { get { return data; } set { data : value; } }
    field prusate ErrorKind MarkUndefine { get { return data; } set { data : value; } }
    field prusate ErrorKind ValueUndefine { get { return data; } set { data : value; } }
    field prusate ErrorKind ValueUnassign { get { return data; } set { data : value; } }
    field prusate ErrorKind OperandUndefine { get { return data; } set { data : value; } }
    field prusate ErrorKind OperandUnassign { get { return data; } set { data : value; } }
    field prusate ErrorKind ThisUndefine { get { return data; } set { data : value; } }
    field prusate ErrorKind FieldUndefine { get { return data; } set { data : value; } }
    field prusate ErrorKind MaideUndefine { get { return data; } set { data : value; } }
    field prusate ErrorKind ArgueUnassign { get { return data; } set { data : value; } }
    field prusate ErrorKind AnyUndefine { get { return data; } set { data : value; } }
    field prusate ErrorKind CondUndefine { get { return data; } set { data : value; } }
    field prusate ErrorKind CondUnassign { get { return data; } set { data : value; } }
    field prusate ErrorKind ResultUndefine { get { return data; } set { data : value; } }
    field prusate ErrorKind ResultUnassign { get { return data; } set { data : value; } }
    field prusate ErrorKind CastUnachieve { get { return data; } set { data : value; } }
    field prusate ErrorKind VarUndefine { get { return data; } set { data : value; } }
    field prusate ErrorKind ExportUndefine { get { return data; } set { data : value; } }
    field prusate ErrorKind ClassUnexport { get { return data; } set { data : value; } }
    field prusate ErrorKind FieldUnexport { get { return data; } set { data : value; } }
    field prusate ErrorKind MaideUnexport { get { return data; } set { data : value; } }
    field prusate ErrorKind EntryUndefine { get { return data; } set { data : value; } }
    field prusate ErrorKind EntryUnachieve { get { return data; } set { data : value; } }
    field prusate ErrorKind ModuleUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind ModuleUndefine { get { return data; } set { data : value; } }
    field prusate ErrorKind ImportNameUnavail { get { return data; } set { data : value; } }
    field prusate ErrorKind ImportClassUndefine { get { return data; } set { data : value; } }
    field prusate ErrorKind ExportUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind ExportUnachieve { get { return data; } set { data : value; } }
    field prusate ErrorKind StorageDestUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind StorageSourceUnvalid { get { return data; } set { data : value; } }
    field prusate ErrorKind StorageDestUnavail { get { return data; } set { data : value; } }
    field prusate ErrorKind StorageSourceUnachieve { get { return data; } set { data : value; } }

    maide precate ErrorKind AddItem(var String text)
    {
        var ErrorKind item;
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

    field precate Int ArrayCount { get { return 35; } set { } }

    field prusate Int Count { get { return data; } set { data : value; } }

    field precate Int Index { get { return data; } set { data : value; } }

    maide prusate ErrorKind Get(var Int index)
    {
        return cast ErrorKind(this.Array.Get(index));
    }
}