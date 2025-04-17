class IntSignValueCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var IntSignValue node;
        node : cast IntSignValue(arg.Node);
        node.Value : cast Int(k.Field00);
        return true;
    }
}