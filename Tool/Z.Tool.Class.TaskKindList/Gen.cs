namespace Z.Tool.Class.TaskKindList;

public class Gen : SourceGen
{
    public override bool Init()
    {
        base.Init();
        this.Module = this.S("Class.Console");
        this.ClassName = this.S("TaskKindList");
        this.BaseClassName = this.S("Any");
        this.AnyClassName = this.S("Any");
        this.ItemClassName = this.S("TaskKind");
        this.ArrayClassName = this.S("Array");
        this.Export = true;
        this.ItemListFileName = this.S("../../../Class/Out/net8.0/ToolData/Saber/ItemListTaskKind.txt");
        this.AddMethodFileName = this.S("ToolData/Class/AddMaideTaskKind.txt");
        this.OutputFilePath = this.S("../../Module/Class.Console/TaskKindList.cl");
        return true;
    }
}