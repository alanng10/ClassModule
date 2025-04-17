class SubOperateCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var SubOperate node;
        node : cast SubOperate(arg.Node);
        node.Lite : cast Operate(k.Field00);
        node.Rite : cast Operate(k.Field01);
        return true;
    }
}