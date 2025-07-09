class GeneratSetOperate : GeneratOperate
{
    maide prusate Bool Init()
    {
        base.Init();
        this.TextInfra : share TextInfra;
        return true;
    }

    field precate TextInfra TextInfra { get { return data; } set { data : value; } }

    maide prusate Bool ExecuteChar(var Int value)
    {
        var GeneratArg arg;
        arg : this.Generat.Arg;

        var Int index;
        index : arg.Index;

        this.TextInfra.DataCharSet(arg.Data, index, value);

        index : index + 1;
        arg.Index : index;
        return true;
    }
}