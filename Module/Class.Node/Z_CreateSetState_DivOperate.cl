class DivOperateCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var DivOperate node;
        node : cast DivOperate(arg.Node);
        node.Lite : cast Operate(k.Field00);
        node.Rite : cast Operate(k.Field01);
        return true;
    }
}