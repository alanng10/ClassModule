namespace Z.Tool.Class.NodeList;

public class CreateSetStateGen : ClassCreateSetStateGen
{
    public override bool Init()
    {
        base.Init();
        this.OutputFoldPath = this.S("../../Module/Class.Node");
        this.SourceFileName = this.S("ToolData/Class/CreateSetStateSource.txt");
        return true;
    }
}