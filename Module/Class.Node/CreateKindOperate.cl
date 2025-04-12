class CreateKindOperate : CreateOperate
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
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

    field precate InfraInfra InfraInfra { get { return data; } set { data : value; } }
    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate TextInfra TextInfra { get { return data; } set { data : value; } }
    field precate Array List { get { return data; } set { data : value; } }
    field precate String String { get { return data; } set { data : value; } }

    maide prusate Node ExecuteNode()
    {
        var Create create;
        create : this.Create;

        var CreateArg arg;
        arg : create.Arg;

        var NodeKind kind;
        kind : create.SetArg.Kind;

        var Int index;
        index : arg.NodeIndex;

        arg.NodeData.Set(index, kind.Index);

        index : index + 1;

        arg.NodeIndex : index;

        var Node a;
        a : kind.Node;
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

    maide prusate Bool ExecuteListCount(var Int index, var Int count)
    {
        var Int k;
        k : index;
        k : k * 8;
        this.InfraInfra.DataIntSet(this.Create.Arg.ListData, k, count);
        return true;
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

        var InfraRange range;
        range : text.Range;

        var Int count;
        count : range.Count;
        var Int ka;
        ka : index;
        ka : ka * 8;
        this.InfraInfra.DataIntSet(arg.NameValueCountData, ka, count);

        var Data source;
        source : text.Data;
        var Int sourceIndex;
        sourceIndex : range.Index;
        var Data dest;
        dest : arg.NameValueTextData;
        var Int destIndex;
        destIndex : indexA;

        this.TextInfra.Copy(dest, destIndex, source, sourceIndex, count);

        index : index + 1;
        indexA : indexA + count;

        arg.NameValueTextIndex : indexA;
        arg.NameValueIndex : index;
        return this.String;
    }

    maide prusate String ExecuteStringValue(var Text text)
    {
        var Create create;
        create : this.Create;
        var CreateArg arg;
        arg : create.Arg;

        var Int index;
        var Int indexA;
        index : arg.StringValueIndex;
        indexA : arg.StringValueTextIndex;

        var Int count;
        count : create.StringValueCount(text);
        var Int ka;
        ka : index;
        ka : ka * 8;
        this.InfraInfra.DataIntSet(arg.StringValueCountData, ka, count);

        create.StringValueSet(text);

        index : index + 1;
        indexA : indexA + count;

        arg.StringValueTextIndex : indexA;
        arg.StringValueIndex : index;
        return this.String;
    }
}