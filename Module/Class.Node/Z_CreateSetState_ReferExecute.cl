class ReferExecuteCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.Arg;

        var ReferExecute node;
        node : cast ReferExecute(arg.Node);
        node.Var : cast Var(k.Field00);
        return true;
    }
}