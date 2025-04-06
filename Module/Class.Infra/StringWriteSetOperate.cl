class StringWriteSetOperate : StringWriteOperate
{
    maide prusate Bool Init()
    {
        base.Init();
        this.TextInfra : share TextInfra;
        return true;
    }

    field precate TextInfra TextInfra { get { return data; } set { data : value; } }

    maide prusate Bool ExecuteChar(var Int n)
    {
        var StringWriteArg arg;
        arg : this.Write.Arg;
        var Int index;
        index : arg.Index;

        this.TextInfra.DataCharSet(arg.Data, index, n);

        index : index + 1;

        arg.Index : index;
        return true;
    }
}