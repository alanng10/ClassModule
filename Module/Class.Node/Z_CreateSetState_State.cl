class StateCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var State node;
        node : cast State(arg.Node);
        node.Value : cast Array(k.Field00);
        return true;
    }
}