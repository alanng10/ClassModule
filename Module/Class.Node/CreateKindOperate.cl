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
}