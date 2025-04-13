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

    protected override String OutputFilePath(String kind)
    {
        String fileName;
        fileName = this.AddClear().AddS("Z_NewState_").Add(kind).AddS(".cl").AddResult();

        String filePath;
        filePath = this.AddClear().Add(this.OutputFoldPath).Add(this.TextInfra.PathCombine).Add(fileName).AddResult();
        return filePath;
    }
}