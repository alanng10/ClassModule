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

    protected override String OutputFilePath(global::Z.Tool.NodeListGen.Class varClass)
    {
        String fileName;
        fileName = this.AddClear().AddS("Z_Node_").Add(varClass.Name).AddS(".cl").AddResult();

        String a;
        a = this.AddClear().Add(this.OutputFoldPath).Add(this.TextInfra.PathCombine).Add(fileName).AddResult();
        return a;
    }
}