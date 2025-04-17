class SignLessOperateNodeState : NodeState
{
    maide prusate Bool Execute()
    {
        var Range range;
        range : cast Range(this.Arg);

        this.Result : this.Create.ExecuteSignLessOperate(range);
        return true;
    }
}