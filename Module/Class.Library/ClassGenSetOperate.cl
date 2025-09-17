class ClassGenSetOperate : ClassGenOperate
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
        var ClassGenArg arg;
        arg : this.Gen.Arg;

        var Int index;
        index : arg.Index;

        this.TextInfra.DataCharSet(arg.Data, index, value);

        index : index + 1;
        arg.Index : index;
        return true;
    }

    maide prusate Bool ExecuteTextInt(var Int value)
    {
        var ClassGenArg arg;
        arg : this.Gen.Arg;

        var Int index;
        index : arg.Index;

        var FormatArg ka;
        ka : this.FormatArgInt;

        var Text kk;
        kk : this.Text;

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

        kk.Data : arg.Data;
        kk.Range.Index : index;
        kk.Range.Count : count;

        this.Format.ExecuteArgResult(ka, kk);

        ka.Count : 0;
        ka.ValueCount : 0;
        ka.Value : null;

        kk.Data : null;
        kk.Range.Index : null;
        kk.Range.Count : null;

        index : index + count;
        arg.Index : index;
        return true;
    }

    maide prusate Bool ExecuteTextIntHex(var Int value)
    {
        var ClassGenArg arg;
        arg : this.Gen.Arg;

        var Int index;
        index : arg.Index;

        var FormatArg ka;
        ka : this.FormatArgInt;

        var Text kk;
        kk : this.Text;

        ka.Kind : 1;
        ka.Base : 16;
        ka.AlignLeft : false;
        ka.FieldWidth : 15;
        ka.MaxWidth : 15;
        ka.FillChar : this.TextInfra.Char("0");
        ka.Value : value;

        this.Format.ExecuteArgCount(ka);

        var Int count;
        count : ka.Count;

        kk.Data : arg.Data;
        kk.Range.Index : index;
        kk.Range.Count : count;

        this.Format.ExecuteArgResult(ka, kk);

        ka.Count : 0;
        ka.ValueCount : 0;
        ka.Value : null;

        kk.Data : null;
        kk.Range.Index : null;
        kk.Range.Count : null;

        index : index + 15;
        arg.Index : index;
        return true;
    }
}