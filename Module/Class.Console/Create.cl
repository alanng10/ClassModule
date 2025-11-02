class Create : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Token : this.CreateToken();
        this.Node : this.CreateNode();
        this.Module : this.CreateModule();
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

    maide precate ModuleCreate CreateModule()
    {
        var ModuleCreate a;
        a : new ModuleCreate;
        a.Init();
        return a;
    }

    field prusate Console Console { get { return data; } set { data : value; } }
    field prusate Result Result { get { return data; } set { data : value; } }
    field prusate TokenCreate Token { get { return data; } set { data : value; } }
    field prusate NodeCreate Node { get { return data; } set { data : value; } }
    field prusate ModuleCreate Module { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        this.Result : new Result;
        this.Result.Init();

        var TaskKindList kindList;
        kindList : this.Console.TaskKind;
        var TaskKind kind;
        kind : this.Console.Task.Kind;

        inf (kind = kindList.Console |
            kind = kindList.Module |
            kind = kindList.Node |
            kind = kindList.Token
        )
        {
            this.ExecuteToken();
        }

        inf (kind = kindList.Console |
            kind = kindList.Module |
            kind = kindList.Node)
        {
            this.ExecuteNode();
        }

        inf (kind = kindList.Console |
            kind = kindList.Module)
        {
            this.ExecuteModule();
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

    maide prusate Bool ExecuteModule()
    {
        this.Module.Source : this.Console.Source;
        this.Module.RootNode : this.Result.Node.Root;
        this.Module.ModuleTable : this.Console.ModuleTable;
        this.Module.ImportClass : this.Console.ImportClass;
        this.Module.Module : this.Console.PortModule;
        this.Module.Execute();
        this.Result.Module : this.Module.Result;

        this.Module.Result : null;
        this.Module.Module : null;
        this.Module.ImportClass : null;
        this.Module.ModuleTable : null;
        this.Module.RootNode : null;
        this.Module.Source : null;
        return true;
    }
}