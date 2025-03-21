namespace Z.Tool.Class.ErrorKindList;

public class Gen : SourceGen
{
    public override long Execute()
    {
        this.ExecuteOne("Node");
        this.ExecuteOne("Module");
        return 0;
    }

    protected virtual bool ExecuteOne(string name)
    {
        String k;
        k = this.S(name);

        this.Module = this.AddClear().AddS("Class.").Add(k).AddResult();
        this.ClassName = this.S("ErrorKindList");
        this.BaseClassName = this.S("Any");
        this.AnyClassName = this.S("Any");
        this.ItemClassName = this.S("ErrorKind");
        this.ArrayClassName = this.S("Array");
        this.Export = true;
        this.ItemListFileName = this.AddClear().AddS("../../../Class/Out/net8.0/ToolData/Saber/ItemListErrorKind").Add(k).AddS(".txt").AddResult();
        this.AddMethodFileName = this.S("ToolData/Class/AddMaideErrorKind.txt");
        this.OutputFilePath = this.AddClear().AddS("../../Module/Class.").Add(k).AddS("/ErrorKindList.cl").AddResult();
        base.Execute();
        return true;
    }

    protected override TableEntry GetItemEntry(String line)
    {
        String index;
        index = line;
        String text;        
        text = index;

        Value value;
        value = new Value();
        value.Init();
        value.Text = text;

        TableEntry entry;
        entry = new TableEntry();
        entry.Init();
        entry.Index = index;
        entry.Value = value;
        return entry;
    }

    protected override bool AddInitFieldAddItem(String index, object value)
    {
        Value a;
        a = (Value)value;

        this.AddS("AddItem")
            .AddS("(")
            .AddS("\"").Add(a.Text).AddS("\"")
            .AddS(")");
        return true;
    }
}