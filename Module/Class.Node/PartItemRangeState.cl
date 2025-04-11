class PartItemRangeState : RangeState
{
    maide prusate Bool Execute()
    {
        var RangeStateArg arg;
        arg : cast RangeStateArg(this.Arg);

        this.Result : this.Create.ExecutePartItemRange(arg.Result, arg.Range);
        return true;
    }
}