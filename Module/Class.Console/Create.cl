class Create : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Token : this.CreateToken();
        this.Node : this.CreateNode();
        return true;
    }

    maide precate TokenCreate CreateToken()
    {
        var TokenCreate a;
        a : new TokenCreate;
        a.Init();
        return a;
    }

    maide precate NodeCreate CreateNode()
    {
        var NodeCreate a;
        a : new NodeCreate;
        a.Init();
        return a;
    }

    field prusate Console Console { get { return data; } set { data : value; } }
    field prusate Result Result { get { return data; } set { data : value; } }
    field prusate TokenCreate Token { get { return data; } set { data : value; } }
    field prusate NodeCreate Node { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        this.Result : new Result;
        this.Result.Init();

        var TaskKindList kindList;
        kindList : this.Console.TaskKind;
        var TaskKind kind;
        kind : this.Console.Task.Kind;

        inf (kind = kindList.Node |
            kind = kindList.Token
        )
        {
            this.ExecuteToken();
        }

        inf (kind = kindList.Node)
        {
            this.ExecuteNode();
        }

        return true;
    }
}