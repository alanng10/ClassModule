class AreExecuteCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var AreExecute node;
        node : cast AreExecute(arg.Node);
        node.Mark : cast Mark(k.Field00);
        node.Value : cast Operate(k.Field01);
        return true;
    }
}