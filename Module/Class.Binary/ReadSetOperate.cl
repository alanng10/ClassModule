class ReadSetOperate : ReadOperate
{
    maide prusate Binary ExecuteBinary()
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        var Int index;
        index : arg.BinaryIndex;
        var Binary a;
        a : cast Binary(arg.BinaryArray.Get(index));
        arg.BinaryIndex : index + 1;
        return a;
    }

    maide prusate Class ExecuteClass()
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        var Int index;
        index : arg.ClassIndex;
        var Class a;
        a : cast Class(arg.ClassArray.Get(index));
        arg.ClassIndex : index + 1;
        return a;
    }

    maide prusate Import ExecuteImport()
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        var Int index;
        index : arg.ImportIndex;
        var Import a;
        a : cast Import(arg.ImportArray.Get(index));
        arg.ImportIndex : index + 1;
        return a;
    }
}