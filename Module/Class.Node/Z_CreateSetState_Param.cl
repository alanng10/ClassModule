class ParamCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.Arg;

        var Param node;
        node : cast Param(arg.Node);
        node.Value : cast Array(k.Field00);
        return true;
    }
}