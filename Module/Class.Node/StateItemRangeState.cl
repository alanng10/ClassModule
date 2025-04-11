class StateItemRangeState : RangeState
{
    maide prusate Bool Execute()
    {
        var RangeStateArg arg;
        arg : cast RangeStateArg(this.Arg);

        this.Result : this.Create.ExecuteStateItemRange(arg.Result, arg.Range);
        return true;
    }
}