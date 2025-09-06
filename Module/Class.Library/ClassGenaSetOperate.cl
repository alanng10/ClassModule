class ClassGenaSetOperate : ClassGenaOperate
{
    maide prusate Bool Init()
    {
        base.Init();
        this.TextInfra : share TextInfra;

        this.Format : this.CreateFormat();
        this.FormatArgInt : this.CreateFormatArg();
        this.Text : this.CreateText();
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

    maide precate Text CreateText()
    {
        var Text a;
        a : new Text;
        a.Init();
        a.Range : new Range;
        a.Range.Init();
        return a;
    }

    field precate TextInfra TextInfra { get { return data; } set { data : value; } }
    field precate Format Format { get { return data; } set { data : value; } }
    field precate FormatArg FormatArgInt { get { return data; } set { data : value; } }
    field precate Text Text { get { return data; } set { data : value; } }

    maide prusate Bool ExecuteChar(var Int value)
    {
        var ClassGenaArg arg;
        arg : this.Gena.Arg;

        var Int index;
        index : arg.Index;

        this.TextInfra.DataCharSet(arg.Data, index, value);

        index : index + 1;
        arg.Index : index;
        return true;
    }
}