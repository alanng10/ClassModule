class ClassNameNodeState : NodeState
{
    maide prusate Bool Execute()
    {
        var Range range;
        range : cast Range(this.Arg);

        this.Result : this.Create.ExecuteClassName(range);
        return true;
    }
}