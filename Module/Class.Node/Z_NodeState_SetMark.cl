class SetMarkNodeState : NodeState
{
    maide prusate Bool Execute()
    {
        var Range range;
        range : cast Range(this.Arg);

        this.Result : this.Create.ExecuteSetMark(range);
        return true;
    }
}