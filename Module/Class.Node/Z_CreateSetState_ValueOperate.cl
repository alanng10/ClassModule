class ValueOperateCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var ValueOperate node;
        node : cast ValueOperate(arg.Node);
        node.Value : cast Value(k.Field00);
        return true;
    }
}