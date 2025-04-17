class CastOperateCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var CastOperate node;
        node : cast CastOperate(arg.Node);
        node.Class : cast ClassName(k.Field00);
        node.Any : cast Operate(k.Field01);
        return true;
    }
}