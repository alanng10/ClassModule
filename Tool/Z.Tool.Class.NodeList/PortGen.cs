namespace Z.Tool.Class.NodeList;

public class PortGen : ToolBase
{
    public override bool Init()
    {
        base.Init();
        this.SourceFileName = this.S("ToolData/Class/PortSource.txt");
        this.SNewState = this.S("NewState");
        this.SNodeState = this.S("NodeState");
        this.SCreateSetState = this.S("CreateSetState");
        return true;
    }

    public virtual Table ClassTable { get; set; }
    protected virtual String SourceFileName { get; set; }
    protected virtual String SNewState { get; set; }
    protected virtual String SNodeState { get; set; }
    protected virtual String SCreateSetState { get; set; }

    public virtual bool Execute()
    {
        String ka;
        ka = this.StorageTextRead(this.SourceFileName);

        String export;
        export = this.ExecuteExport();

        Text k;
        k = this.TextCreate(ka);
        k = this.TextPlace(k, this.TA(this.S("#Export#")), this.TB(export));

        String a;
        a = this.StringCreate(k);

        this.StorageTextWrite(this.S("../../Module/Class.Node/Class.Port"), a);

        return true;
    }

    protected virtual String ExecuteExport()
    {
        this.AddClear();

        Iter iter;
        iter = this.ClassTable.IterCreate();
        this.ClassTable.IterSet(iter);
        while (iter.Next())
        {
            GenClass varClass;
            varClass = iter.Value as GenClass;

            this.Add(varClass.Name).AddLine();
            this.Add(varClass.Name).Add(this.SNewState).AddLine();
            this.Add(varClass.Name).Add(this.SNodeState).AddLine();
            this.Add(varClass.Name).Add(this.SCreateSetState).AddLine();
        }

        String a;
        a = this.AddResult();
        return a;
    }
}