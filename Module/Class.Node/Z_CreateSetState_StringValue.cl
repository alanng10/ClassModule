class StringValueCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.Arg;

        var StringValue node;
        node : cast StringValue(arg.Node);
        node.Value : cast String(k.Field00);
        return true;
    }
}