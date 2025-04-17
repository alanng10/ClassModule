class InfExecuteNodeState : NodeState
{
    maide prusate Bool Execute()
    {
        var Range range;
        range : cast Range(this.Arg);

        this.Result : this.Create.ExecuteInfExecute(range);
        return true;
    }
}