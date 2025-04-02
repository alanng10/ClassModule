class SetReadOperate : ReadOperate
{
    maide prusate String ExecuteString(var Int row, var Range range)
    {
        var ReadArg arg;
        arg : this.Arg;
        var Int index;
        index : arg.StringIndex;
        var String a;
        a : cast String(arg.StringArray.Get(index));
        arg.StringIndex : index + 1;
        return a;
    }
}