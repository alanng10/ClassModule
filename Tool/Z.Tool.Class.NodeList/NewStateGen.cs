namespace Z.Tool.Class.NodeList;

public class NewStateGen : ClassNewStateGen
{
    public override bool Init()
    {
        base.Init();
        this.OutputFoldPath = this.S("../../Module/Class.Node");
        this.NewStateSourceFileName = this.S("ToolData/Class/NewStateSource.txt");
        return true;
    }
}