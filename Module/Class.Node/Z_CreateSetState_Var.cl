class VarCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var Var node;
        node : cast Var(arg.Node);
        node.Class : cast ClassName(k.Field00);
        node.Name : cast VarName(k.Field01);
        return true;
    }
}