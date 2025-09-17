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

        var FormatArg ka;
        ka : this.FormatArgInt;

        ka.Kind : 1;
        ka.Base : 10;
        ka.AlignLeft : false;
        ka.FieldWidth : 0;
        ka.MaxWidth : null;
        ka.FillChar : this.TextInfra.Char("0");
        ka.Value : value;

        this.Format.ExecuteArgCount(ka);

        var Int count;
        count : ka.Count;

        ka.Count : 0;
        ka.ValueCount : 0;
        ka.Value : null;

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