class BitNotOperateCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.Arg;

        var BitNotOperate node;
        node : cast BitNotOperate(arg.Node);
        node.Value : cast Operate(k.Field00);
        return true;
    }
}