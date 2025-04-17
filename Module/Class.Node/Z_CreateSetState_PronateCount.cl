class PronateCountCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.SetArg;

        var PronateCount node;
        node : cast PronateCount(arg.Node);
        return true;
    }
}