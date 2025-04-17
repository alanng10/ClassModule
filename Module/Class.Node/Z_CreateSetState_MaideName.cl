class MaideNameCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var MaideName node;
        node : cast MaideName(arg.Node);
        node.Value : cast String(k.Field00);
        return true;
    }
}