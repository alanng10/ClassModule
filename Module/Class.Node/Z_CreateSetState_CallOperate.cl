class CallOperateCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.Arg;

        var CallOperate node;
        node : cast CallOperate(arg.Node);
        node.This : cast Operate(k.Field00);
        node.Maide : cast MaideName(k.Field01);
        node.Argue : cast Argue(k.Field02);
        return true;
    }
}