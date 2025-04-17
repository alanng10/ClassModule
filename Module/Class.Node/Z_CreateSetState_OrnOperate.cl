class OrnOperateCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var OrnOperate node;
        node : cast OrnOperate(arg.Node);
        node.Lite : cast Operate(k.Field00);
        node.Rite : cast Operate(k.Field01);
        return true;
    }
}