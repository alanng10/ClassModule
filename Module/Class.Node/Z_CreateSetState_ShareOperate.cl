class ShareOperateCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.Arg;

        var ShareOperate node;
        node : cast ShareOperate(arg.Node);
        node.Class : cast ClassName(k.Field00);
        return true;
    }
}