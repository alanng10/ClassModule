class ArgueCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var Argue node;
        node : cast Argue(arg.Node);
        node.Value : cast Array(k.Field00);
        return true;
    }
}