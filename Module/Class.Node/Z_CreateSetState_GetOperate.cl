class GetOperateCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.Arg;

        var GetOperate node;
        node : cast GetOperate(arg.Node);
        node.This : cast Operate(k.Field00);
        node.Field : cast FieldName(k.Field01);
        return true;
    }
}