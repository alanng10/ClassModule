class IntHexValueCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var IntHexValue node;
        node : cast IntHexValue(arg.Node);
        node.Value : cast Int(k.Field00);
        return true;
    }
}