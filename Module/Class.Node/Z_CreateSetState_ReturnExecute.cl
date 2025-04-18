class ReturnExecuteCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.Arg;

        var ReturnExecute node;
        node : cast ReturnExecute(arg.Node);
        node.Result : cast Operate(k.Field00);
        return true;
    }
}