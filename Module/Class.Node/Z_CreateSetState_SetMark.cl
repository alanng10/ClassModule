class SetMarkCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var SetMark node;
        node : cast SetMark(arg.Node);
        node.This : cast Operate(k.Field00);
        node.Field : cast FieldName(k.Field01);
        return true;
    }
}