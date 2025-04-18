class NotOperateCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.Arg;

        var NotOperate node;
        node : cast NotOperate(arg.Node);
        node.Value : cast Operate(k.Field00);
        return true;
    }
}