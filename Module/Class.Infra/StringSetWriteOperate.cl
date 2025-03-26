class StringSetWriteOperate : WriteOperate
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
        var Int index;
        index : this.Arg.Index;

        this.TextInfra.DataCharSet(this.Arg.Data, index, n);

        index : index + 1;

        this.Arg.Index : index;
        return true;
    }
}