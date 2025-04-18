class BoolValueCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.Arg;

        var BoolValue node;
        node : cast BoolValue(arg.Node);
        node.Value : cast Bool(k.Field00);
        return true;
    }
}