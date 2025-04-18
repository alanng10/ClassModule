class OperateExecuteCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.Arg;

        var OperateExecute node;
        node : cast OperateExecute(arg.Node);
        node.Any : cast Operate(k.Field00);
        return true;
    }
}