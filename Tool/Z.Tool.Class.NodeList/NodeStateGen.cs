namespace Z.Tool.Class.NodeList;

public class NodeStateGen : ClassNodeStateGen
{
    public override bool Init()
    {
        base.Init();
        this.OutputFoldPath = this.S("../../Module/Class.Node");
        this.NodeStateSourceFileName = this.S("ToolData/Class/NodeStateSource.txt");
        return true;
    }
}