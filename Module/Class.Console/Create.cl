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

    maide prusate Bool ExecuteToken()
    {
        this.Token.Source : this.Console.Source;
        this.Token.Execute();
        this.Result.Token : this.Token.Result;

        this.Token.Result : null;
        this.Token.Source : null;
        return true;
    }

    maide prusate Bool ExecuteNode()
    {
        this.Node.Source : this.Console.Source;
        this.Node.Task : this.Console.Task.Node;
        this.Node.Code : this.Result.Token.Code;
        this.Node.Execute();
        this.Result.Node : this.Node.Result;

        this.Node.Result : null;
        this.Node.Code : null;
        this.Node.Task : null;
        this.Node.Source : null;
        return true;
    }
}