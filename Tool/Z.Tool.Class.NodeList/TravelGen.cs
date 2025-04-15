namespace Z.Tool.Class.NodeList;

public class TravelGen : ClassTravelGen
{
    public override bool Init()
    {
        base.Init();

        this.PathOutput = this.S("../../Module/Class.Node/Travel.cl");
        return true;
    }

    protected virtual String GetPathName(String name)
    {
        return this.AddClear().AddS("ToolData/Class/Travel").Add(name).AddResult();
    }

    protected override String GetPath(String name)
    {
        String k;
        k = this.AddClear().Add(name).AddS(".txt").AddResult();

        return this.GetPathName(k);
    }
}