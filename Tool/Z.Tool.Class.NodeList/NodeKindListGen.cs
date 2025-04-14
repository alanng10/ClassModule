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

    protected override bool ExecuteItemList()
    {
        this.ItemTable = this.TableCreateStringLess();

        Table table;
        table = this.ClassTable;

        Iter iter;
        iter = table.IterCreate();
        table.IterSet(iter);

        while (iter.Next())
        {
            NodeListGen.Class varClass;
            varClass = iter.Value as NodeListGen.Class;

            String a;
            a = varClass.Name;

            TableEntry entry;
            entry = this.GetItemEntry(a);

            this.ItemTable.Add(entry);
        }
        return true;
    }

    protected override TableEntry GetItemEntry(String line)
    {
        String index;
        index = line;

        Text k;
        k = this.TextCreate(line);

        Text ka;
        ka = this.TextCreate(this.S("Count"));

        if (this.TextSame(k, ka))
        {
            index = this.AddClear().AddS("Item").Add(line).AddResult();
        }

        TableEntry a;
        a = new TableEntry();
        a.Init();
        a.Index = index;
        a.Value = line;
        return a;
    }

    protected override bool AddInitFieldAddItem(String index, object value)
    {
        String ka;
        ka = value as String;

        this
            .AddS("AddItem")
            .AddS("(")
            .AddS("\"").Add(ka).AddS("\"").AddS(",").AddS(" ")
            .AddS("new").AddS(" ").Add(ka).AddS(",").AddS(" ")
            .AddS("new").AddS(" ").Add(ka).AddS("NewState").AddS(",").AddS(" ")
            .AddS("new").AddS(" ").Add(ka).AddS("NodeState").AddS(",").AddS(" ")
            .AddS("new").AddS(" ").Add(ka).AddS("CreateSetState")
            .AddS(")")
            ;
        return true;
    }
}