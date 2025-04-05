class CountCreateOperate : CreateOperate
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        return true;
    }

    field precate InfraInfra InfraInfra { get { return data; } set { data : value; } }
    field precate Int TokenStart { get { return data; } set { data : value; } }
    field precate Int CommentStart { get { return data; } set { data : value; } }

    maide prusate Bool ExecuteToken(var Int row, var Range range)
    {
        var CreateArg arg;
        arg : this.Create.Arg;
        var Int index;
        index : arg.TokenIndex;
        index : index + 1;
        arg.TokenIndex : index;
        return true;
    }

    maide prusate Bool ExecuteComment(var Int row, var Range range)
    {
        var CreateArg arg;
        arg : this.Create.Arg;
        var Int index;
        index : arg.CommentIndex;
        index : index + 1;
        arg.CommentIndex : index;
        return true;
    }
}