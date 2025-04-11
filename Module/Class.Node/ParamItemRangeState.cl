class ParamItemRangeState : RangeState
{
    maide prusate Bool Execute()
    {
        var RangeStateArg arg;
        arg : cast RangeStateArg(this.Arg);

        this.Result : this.Create.ExecuteParamItemRange(arg.Result, arg.Range);
        return true;
    }
}