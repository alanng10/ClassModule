namespace Z.Tool.Class.NodeList;

public class NodeKindListGen : SourceGen
{
    public override bool Init()
    {
        base.Init();
        this.Module = this.S("Class.Node");
        this.ClassName = this.S("NodeKindList");
        this.BaseClassName = this.S("Any");
        this.AnyClassName = this.S("Any");
        this.ItemClassName = this.S("NodeKind");
        this.ArrayClassName = this.S("Array");
        this.Export = true;
        this.AddMethodFileName = this.S("ToolData/Class/AddMaideNodeKind.txt");
        this.OutputFilePath = this.S("../../Module/Class.Node/NodeKindList.cl");
        return true;
    }

    public virtual Table ClassTable { get; set; }
}