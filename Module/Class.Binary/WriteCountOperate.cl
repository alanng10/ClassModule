class WriteCountOperate : WriteOperate
{
    maide prusate Bool ExecuteByte(var Int value)
    {
        var WriteArg arg;
        arg : this.Write.Arg;

        var Int index;
        index : arg.Index;
        index : index + 1;
        arg.Index : index;
        return true;
    }
}