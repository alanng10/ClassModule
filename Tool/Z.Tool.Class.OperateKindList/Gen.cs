namespace Z.Tool.Class.OperateKindList;

public class Gen : SourceGen
{
    public override bool Init()
    {
        base.Init();
        this.Module = this.S("Class.Binary");
        this.ClassName = this.S("OperateKindList");
        this.BaseClassName = this.S("Any");
        this.AnyClassName = this.S("Any");
        this.ItemClassName = this.S("OperateKind");
        this.ArrayClassName = this.S("Array");
        this.Export = true;
        this.ItemListFileName = this.S("ToolData/Class/ItemListOperateKind.txt");
        this.AddMethodFileName = this.S("ToolData/Class/AddMaideOperateKind.txt");
        this.OutputFilePath = this.S("../../Module/Class.Binary/OperateKindList.cl");
        return true;
    }
}