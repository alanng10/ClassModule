class StringSetOperate : StringOperate
{
    maide prusate Bool ExecuteString(var String value)
    {
        var StringArg arg;
        arg : this.Travel.Arg;

        var Int index;
        index : arg.Index;

        arg.Array.Set(index, value);

        index : index + 1;

        arg.Index : index;
        return true;
    }
}