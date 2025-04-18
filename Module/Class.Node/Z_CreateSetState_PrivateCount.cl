class PrivateCountCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.Arg;

        var PrivateCount node;
        node : cast PrivateCount(arg.Node);
        return true;
    }
}