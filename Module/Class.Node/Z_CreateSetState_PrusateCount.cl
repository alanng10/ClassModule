class PrusateCountCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var PrusateCount node;
        node : cast PrusateCount(arg.Node);
        return true;
    }
}