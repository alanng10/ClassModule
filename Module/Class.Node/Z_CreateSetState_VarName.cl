class VarNameCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var VarName node;
        node : cast VarName(arg.Node);
        node.Value : cast String(k.Field00);
        return true;
    }
}