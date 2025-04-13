namespace Z.Tool.Class.NodeList;

public class NodeGen : ClassNodeGen
{
    public override bool Init()
    {
        base.Init();
        this.BoolClassWord = this.S("Bool");
        this.IntClassWord = this.S("Int");
        this.OutputFoldPath = this.S("../../Module/Class.Node");
        this.NodeSourceFileName = this.S("ToolData/Class/NodeSource.txt");
        return true;
    }
}