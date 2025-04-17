class BitSignRiteOperateCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var BitSignRiteOperate node;
        node : cast BitSignRiteOperate(arg.Node);
        node.Value : cast Operate(k.Field00);
        node.Count : cast Operate(k.Field01);
        return true;
    }
}