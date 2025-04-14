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
}