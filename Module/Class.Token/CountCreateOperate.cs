namespace Saber.Token;

public class CountCreateOperate : CreateOperate
{
    public override bool Init()
    {
        base.Init();
        this.InfraInfra = InfraInfra.This;
        return true;
    }

    public virtual Create Create { get; set; }
    protected virtual InfraInfra InfraInfra { get; set; }
    protected virtual long CodeTokenStart { get; set; }
    protected virtual long CodeCommentStart { get; set; }

    public override bool ExecuteToken()
    {
        CreateArg arg;
        arg = this.Create.Arg;
        long index;
        index = arg.TokenIndex;
        index = index + 1;
        arg.TokenIndex = index;
        return true;
    }

    public override bool ExecuteComment()
    {
        CreateArg arg;
        arg = this.Create.Arg;
        long index;
        index = arg.CommentIndex;
        index = index + 1;
        arg.CommentIndex = index;
        return true;
    }

    public override bool ExecuteCodeStart(long index)
    {
        CreateArg arg;
        arg = this.Create.Arg;
        this.CodeTokenStart = arg.TokenIndex;
        this.CodeCommentStart = arg.CommentIndex;
        return true;
    }

    public override bool ExecuteCodeEnd(long index)
    {
        InfraInfra infraInfra;
        infraInfra = this.InfraInfra;

        CreateArg arg;
        arg = this.Create.Arg;

        long tokenCount;
        long commentCount;
        tokenCount = arg.TokenIndex - this.CodeTokenStart;
        commentCount = arg.CommentIndex - this.CodeCommentStart;

        Data codeCountData;
        codeCountData = arg.CodeCountData;
        long oa;
        oa = sizeof(ulong);
        long ob;
        ob = index;
        ob = ob * 2;
        long oe;
        oe = ob * oa;
        long of;
        of = (ob + 1) * oa;
        infraInfra.DataIntSet(codeCountData, oe, tokenCount);
        infraInfra.DataIntSet(codeCountData, of, commentCount);

        this.CodeTokenStart = 0;
        this.CodeCommentStart = 0;
        return true;
    }
}