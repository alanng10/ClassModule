class NewOperateCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var NewOperate node;
        node : cast NewOperate(arg.Node);
        node.Class : cast ClassName(k.Field00);
        return true;
    }
}