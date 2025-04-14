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

    protected override bool AddFieldSet(Field field, long index)
    {
        String className;
        className = field.Class;

        this.AddIndent(2);

        this
            .AddS("node").AddS(".").Add(field.Name)
            .Add(this.SSpace).AddS(":").Add(this.SSpace);

        this.AddS("cast").Add(this.SSpace).Add(className);

        this.AddS("(")
        
        .AddS("k").AddS(".");

        this.AddArgFieldName(index, className);

        this.AddS(")").AddS(";").AddLine();

        return true;
    }
}