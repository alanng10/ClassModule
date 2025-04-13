namespace Z.Tool.Class.NodeList;

public class Gen : ClassGen
{
    protected override ClassNewStateGen CreateNewStateGen()
    {
        ClassNewStateGen a;
        a = new NewStateGen();
        a.Init();
        return a;
    }
}