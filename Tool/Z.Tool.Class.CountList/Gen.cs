namespace Z.Tool.Class.CountList;

public class Gen : SourceGen
{
    public override bool Init()
    {
        base.Init();
        this.Module = this.S("Class.Infra");
        this.ClassName = this.S("CountList");
        this.BaseClassName = this.S("Any");
        this.AnyClassName = this.S("Any");
        this.ItemClassName = this.S("Count");
        this.ArrayClassName = this.S("Array");
        this.Export = true;
        this.ItemListFileName = this.S("../../../Class/Out/net8.0/ToolData/Saber/ItemListCount.txt");
        this.AddMethodFileName = this.S("ToolData/Class/AddMaideCount.txt");
        this.OutputFilePath = this.S("../../Module/Class.Infra/CountList.cl");
        return true;
    }
}