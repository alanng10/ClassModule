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

    protected override String OutputFilePath(String kind)
    {
        String fileName;
        fileName = this.AddClear().AddS("Z_NodeState_").Add(kind).AddS(".cl").AddResult();

        String filePath;
        filePath = this.AddClear().Add(this.OutputFoldPath).Add(this.TextInfra.PathCombine).Add(fileName).AddResult();
        return filePath;
    }
}