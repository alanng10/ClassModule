namespace Z.Tool.Class.NodeList;

public class TravelGen : ClassTravelGen
{
    public override bool Init()
    {
        base.Init();

        this.PathOutput = this.S("../../Module/Class.Node/Travel.cl");
        return true;
    }

    protected override String GetPath(String name)
    {
        return this.AddClear().AddS("ToolData/Class/Travel").Add(name).AddS(".txt").AddResult();
    }
}