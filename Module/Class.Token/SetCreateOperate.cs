namespace Saber.Token;

public class SetCreateOperate : CreateOperate
{
    public override bool ExecuteToken(Range range)
    {
        CreateArg arg;
        arg = this.Create.Arg;
        long index;
        index = arg.TokenIndex;

        Token token;
        token = arg.TokenArray.GetAt(index) as Token;
        token.Row = this.Create.Row;
        token.Range.Index = range.Index;
        token.Range.Count = range.Count;

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

        Comment comment;
        comment = arg.CommentArray.GetAt(index) as Comment;
        comment.Row = this.Create.Row;

        Range aa;
        aa = comment.Range;
        Range ab;
        ab = this.Create.LineRange;

        aa.Index = ab.Index;
        aa.Count = ab.Count;

        index = index + 1;

        arg.CommentIndex = index;
        return true;
    }
}