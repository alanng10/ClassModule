class WhileExecuteCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.Arg;

        var WhileExecute node;
        node : cast WhileExecute(arg.Node);
        node.Cond : cast Operate(k.Field00);
        node.Loop : cast State(k.Field01);
        return true;
    }
}