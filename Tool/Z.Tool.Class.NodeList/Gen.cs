namespace Z.Tool.Class.NodeList;

public class Gen : ClassGen
{
    protected override ClassNodeGen CreateNodeGen()
    {
        ClassNodeGen a;
        a = new NodeGen();
        a.Init();
        return a;
    }

    protected override ClassNewStateGen CreateNewStateGen()
    {
        ClassNewStateGen a;
        a = new NewStateGen();
        a.Init();
        return a;
    }

    protected override ClassNodeStateGen CreateNodeStateGen()
    {
        ClassNodeStateGen a;
        a = new NodeStateGen();
        a.Init();
        return a;
    }

    protected override ClassCreateSetStateGen CreateCreateSetStateGen()
    {
        ClassCreateSetStateGen a;
        a = new CreateSetStateGen();
        a.Init();
        return a;
    }

    protected virtual NodeKindListGen CreateClassNodeKindListGen()
    {
        NodeKindListGen a;
        a = new NodeKindListGen();
        a.Init();
        return a;
    }

    protected override ClassTravelGen CreateTravelGen()
    {
        ClassTravelGen a;
        a = new TravelGen();
        a.Init();
        return a;
    }

    protected override ClassTravelPathGen CreateTravelPathGen()
    {
        ClassTravelPathGen a;
        a = new TravelPathGen();
        a.Init();
        return a;
    }

    protected override bool ExecuteNodeKindList()
    {
        NodeKindListGen nodeKindListGen;
        nodeKindListGen = this.CreateClassNodeKindListGen();
        nodeKindListGen.ClassTable = this.ClassTable;
        nodeKindListGen.Execute();
        return true;
    }

    protected virtual PortGen CreatePortGen()
    {
        PortGen a;
        a = new PortGen();
        a.Init();
        return a;
    }

    public override long Execute()
    {
        long k;
        k = base.Execute();

        if (!(k == 0))
        {
            return k;
        }

        PortGen portGen;
        portGen = this.CreatePortGen();
        portGen.ClassTable = this.ClassTable;
        portGen.Execute();
        return 0;
    }
}