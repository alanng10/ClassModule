class VarMarkCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var VarMark node;
        node : cast VarMark(arg.Node);
        node.Var : cast VarName(k.Field00);
        return true;
    }
}