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
}