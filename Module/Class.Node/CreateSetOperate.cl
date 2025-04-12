class CreateSetOperate : CreateOperate
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        this.StringComp : share StringComp;
        return true;
    }

    field precate InfraInfra InfraInfra { get { return data; } set { data : value; } }
    field precate StringComp StringComp { get { return data; } set { data : value; } }

    maide prusate Node ExecuteNode()
    {
        var Create create;
        create : this.Create;

        var CreateArg arg;
        arg : create.Arg;

        var CreateSetArg ka;
        ka : create.SetArg;

        var Int index;
        index : arg.NodeIndex;

        var Node node;
        node : cast Node(arg.NodeArray.Get(index));

        var CreateSetState state;
        state : ka.Kind.CreateSetState;

        var CreateSetStateArg stateArg;
        stateArg : cast CreateSetStateArg(state.Arg);
        stateArg.Node : node;
        stateArg.SetArg : ka;

        state.Execute();

        stateArg.SetArg : null;
        stateArg.Node : null;

        create.NodeInfo(node, ka.Range);

        index : index + 1;

        arg.NodeIndex : index;
        return node;
    }
}