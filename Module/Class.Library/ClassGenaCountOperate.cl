class ClassGenaCountOperate : ClassGenaOperate
{
    maide prusate Bool Init()
    {
        base.Init();
        this.TextInfra : share TextInfra;

        this.Format : this.CreateFormat();
        this.FormatArgInt : this.CreateFormatArg();
        return true;
    }

    maide precate Format CreateFormat()
    {
        var Format a;
        a : new Format;
        a.Init();
        return a;
    }

    maide precate FormatArg CreateFormatArg()
    {
        var FormatArg a;
        a : new FormatArg;
        a.Init();
        a.Kind : 1;
        a.Base : 10;
        a.AlignLeft : false;
        a.FieldWidth : 0;
        a.MaxWidth : null;
        a.FillChar : this.TextInfra.Char("0");
        return a;
    }

    field precate TextInfra TextInfra { get { return data; } set { data : value; } }
    field precate Format Format { get { return data; } set { data : value; } }
    field precate FormatArg FormatArgInt { get { return data; } set { data : value; } }

    maide prusate Bool ExecuteChar(var Int value)
    {
        var ClassGenaArg arg;
        arg : this.Gena.Arg;

        var Int index;
        index : arg.Index;
        index : index + 1;
        arg.Index : index;
        return true;
    }

    maide prusate Bool ExecuteTextInt(var Int value)
    {
        var ClassGenaArg arg;
        arg : this.Gena.Arg;

        var Int index;
        index : arg.Index;

        this.FormatArgInt.Value : value;

        this.Format.ExecuteArgCount(this.FormatArgInt);

        var Int count;
        count : this.FormatArgInt.Count;

        this.FormatArgInt.Count : 0;
        this.FormatArgInt.ValueCount : 0;
        this.FormatArgInt.Value : null;

        index : index + count;

        arg.Index : index;
        return true;
    }

    maide prusate Bool ExecuteTextIntHex(var Int value)
    {
        var ClassGenaArg arg;
        arg : this.Gena.Arg;

        var Int index;
        index : arg.Index;
        index : index + 15;
        arg.Index : index;
        return true;
    }
}