class InfExecuteCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.Arg;

        var InfExecute node;
        node : cast InfExecute(arg.Node);
        node.Cond : cast Operate(k.Field00);
        node.Then : cast State(k.Field01);
        return true;
    }
}