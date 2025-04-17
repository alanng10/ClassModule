class BitRiteOperateCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var BitRiteOperate node;
        node : cast BitRiteOperate(arg.Node);
        node.Value : cast Operate(k.Field00);
        node.Count : cast Operate(k.Field01);
        return true;
    }
}