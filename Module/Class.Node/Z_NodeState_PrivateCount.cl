class PrivateCountNodeState : NodeState
{
    maide prusate Bool Execute()
    {
        var Range range;
        range : cast Range(this.Arg);

        this.Result : this.Create.ExecutePrivateCount(range);
        return true;
    }
}