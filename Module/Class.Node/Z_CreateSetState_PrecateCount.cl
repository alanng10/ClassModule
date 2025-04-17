class PrecateCountCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var PrecateCount node;
        node : cast PrecateCount(arg.Node);
        return true;
    }
}