class WriteSetOperate : WriteOperate
{
    maide prusate Bool ExecuteByte(var Int value)
    {
        var WriteArg arg;
        arg : this.Write.Arg;

        var Int index;
        index : arg.Index;

        arg.Data.Set(index, value);

        index : index + 1;
        arg.Index : index;
        return true;
    }
}