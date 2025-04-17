class IntValueCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var IntValue node;
        node : cast IntValue(arg.Node);
        node.Value : cast Int(k.Field00);
        return true;
    }
}