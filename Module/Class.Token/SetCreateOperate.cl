class SetCreateOperate : CreateOperate
{
    maide prusate Bool ExecuteToken(var Int row, var Range range)
    {
        var CreateArg arg;
        arg : this.Create.Arg;
        var Int index;
        index : arg.TokenIndex;

        var Token token;
        token : cast Token(arg.TokenArray.Get(index));
        token.Row : row;
        token.Range.Index : range.Index;
        token.Range.Count : range.Count;

        index : index + 1;

        arg.TokenIndex : index;
        return true;
    }
}