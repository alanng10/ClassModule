class CreateCountOperate : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.TextInfra : share TextInfra;

        this.List : this.CreateList();
        this.String : this.CreateString();
        return true;
    }

    maide precate Array CreateList()
    {
        return this.ListInfra.ArrayCreate(0);
    }

    maide precate String CreateString()
    {
        return this.TextInfra.Zero;
    }

    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate TextInfra TextInfra { get { return data; } set { data : value; } }
    field precate Array List { get { return data; } set { data : value; } }
    field precate String String { get { return data; } set { data : value; } }

    maide prusate Node ExecuteNode()
    {
        var CreateArg arg;
        arg : this.Create.Arg;

        var Int index;
        index : arg.NodeIndex;

        index : index + 1;

        arg.NodeIndex : index;

        var Node a;
        a : this.Create.SetArg.Kind.Node;
        return a;
    }

    maide prusate Int ExecuteListNew()
    {
        var CreateArg arg;
        arg : this.Create.Arg;

        var Int index;
        index : arg.ListIndex;

        var Int a;
        a : index;

        index : index + 1;

        arg.ListIndex : index;
        return a;
    }

    maide prusate Array ExecuteListGet(var Int index)
    {
        return this.List;
    }

    maide prusate Bool ExecuteError(var ErrorKind kind, var Range range)
    {
        var CreateArg arg;
        arg : this.Create.Arg;

        var Int index;
        index : arg.ErrorIndex;

        index : index + 1;

        arg.ErrorIndex : index;
        return true;
    }

    maide prusate String ExecuteNameValue(var Text text)
    {
        var CreateArg arg;
        arg : this.Create.Arg;

        var Int index;
        var Int indexA;
        index : arg.NameValueIndex;
        indexA : arg.NameValueTextIndex;

        index : index + 1;
        indexA : indexA + text.Range.Count;

        arg.NameValueTextIndex : indexA;
        arg.NameValueIndex : index;
        return this.String;
    }

    maide prusate String ExecuteStringValue(var Text text)
    {
        var CreateArg arg;
        arg : this.Create.Arg;

        var Int index;
        var Int indexA;
        index : arg.StringValueIndex;
        indexA : arg.StringValueTextIndex;

        var Int count;
        count : this.Create.StringValueCount(text);

        index : index + 1;
        indexA : indexA + count;

        arg.StringValueTextIndex : indexA;
        arg.StringValueIndex : index;
        return this.String;
    }
}