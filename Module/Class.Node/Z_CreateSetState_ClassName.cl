class ClassNameCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var ClassName node;
        node : cast ClassName(arg.Node);
        node.Value : cast String(k.Field00);
        return true;
    }
}