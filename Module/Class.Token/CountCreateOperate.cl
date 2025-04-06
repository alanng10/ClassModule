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

    maide prusate Bool ExecuteCodeStart(var Int index)
    {
        var CreateArg arg;
        arg : this.Create.Arg;
        this.TokenStart : arg.TokenIndex;
        this.CommentStart : arg.CommentIndex;
        return true;
    }

    maide prusate Bool ExecuteCodeEnd(var Int index)
    {
        var CreateArg arg;
        arg : this.Create.Arg;

        var Int tokenCount;
        var Int commentCount;
        tokenCount : arg.TokenIndex - this.TokenStart;
        commentCount : arg.CommentIndex - this.CommentStart;

        var Data data;
        data : arg.CodeCountData;
        var Int kd;
        kd : 8;

        var Int kk;
        kk : index;
        kk : kk * 2;

        var Int ka;
        ka : kk * kd;
        this.InfraInfra.DataIntSet(data, ka, tokenCount);

        ka : (kk + 1) * kd;
        this.InfraInfra.DataIntSet(data, ka, commentCount);

        this.TokenStart : null;
        this.CommentStart : null;
        return true;
    }
}