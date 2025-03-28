class StringWrite : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        this.TextInfra : share TextInfra;
        this.ClassInfra : share Infra;
        this.StringComp : share StringComp;

        this.Arg : this.CreateArg();
        this.CountOperate : this.CreateCountOperate();
        this.SetOperate : this.CreateSetOperate();
        return true;
    }

    maide precate StringWriteArg CreateArg()
    {
        var StringWriteArg a;
        a : new StringWriteArg;
        a.Init();
        return a;
    }

    maide precate StringCountWriteOperate CreateCountOperate()
    {
        var StringCountWriteOperate a;
        a : new StringCountWriteOperate;
        a.Arg : this.Arg;
        a.Init();
        return a;
    }

    maide precate StringSetWriteOperate CreateSetOperate()
    {
        var StringSetWriteOperate a;
        a : new StringSetWriteOperate;
        a.Arg : this.Arg;
        a.Init();
        return a;
    }

    field prusate StringCountWriteOperate CountOperate { get { return data; } set { data : value; } }
    field prusate StringSetWriteOperate SetOperate { get { return data; } set { data : value; } }
    field prusate StringWriteOperate Operate { get { return data; } set { data : value; } }
    field prusate StringWriteArg Arg { get { return data; } set { data : value; } }
    field precate InfraInfra InfraInfra { get { return data; } set { data : value; } }
    field precate TextInfra TextInfra { get { return data; } set { data : value; } }
    field precate Infra ClassInfra { get { return data; } set { data : value; } }
    field precate StringComp StringComp { get { return data; } set { data : value; } }

    maide prusate String Execute(var Text text)
    {
        var Bool b;
        b : this.ValidValue(text);
        inf (~b)
        {
            return null;
        }

        this.Arg : new StringWriteArg;
        this.Arg.Init();

        this.Operate : this.CountOperate;
        this.ArgClearIndex();

        this.ExecuteStage(text);

        var Int count;
        count : this.Index;

        var Int k;
        k : count;
        k : k * 4;

        this.Arg.Data : new Data;
        this.Arg.Data.Count : k;
        this.Arg.Data.Init();

        this.Operate : this.SetOperate;
        this.ArgClearIndex();

        this.ExecuteStage(text);

        var String a;
        a : this.StringComp.CreateData(this.Arg.Data, null);

        this.Operate : null;
        this.Arg : null;
        return a;
    }

    maide prusate Bool ValidValue(var Text text)
    {
        var TextInfra textInfra;
        textInfra : this.TextInfra;
        var ClassInfra classInfra;
        classInfra : this.ClassInfra;
        var StringComp stringComp;
        stringComp : this.StringComp;

        var InfraRange range;
        range : text.Range;
        var Int kk;
        kk : range.Count;
        inf (kk < 2)
        {
            return false;
        }

        var Data data;
        data : text.Data;
        var Int rangeStart;
        var Int rangeEnd;
        rangeStart : range.Index;
        rangeEnd : rangeStart + range.Count;

        var Int quote;
        quote : textInfra.Char(classInfra.TextQuote);
    }
}