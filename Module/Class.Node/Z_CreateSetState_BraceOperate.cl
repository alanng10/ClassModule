class BraceOperateCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var BraceOperate node;
        node : cast BraceOperate(arg.Node);
        node.Any : cast Operate(k.Field00);
        return true;
    }
}