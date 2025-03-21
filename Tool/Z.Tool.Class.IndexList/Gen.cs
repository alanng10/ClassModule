namespace Z.Tool.Class.IndexList;

public class Gen : SourceGen
{
    public override bool Init()
    {
        base.Init();
        this.Module = this.S("Class.Infra");
        this.ClassName = this.S("IndexList");
        this.BaseClassName = this.S("Any");
        this.AnyClassName = this.S("Any");
        this.ItemClassName = this.S("Index");
        this.ArrayClassName = this.S("Array");
        this.Export = true;
        this.ItemListFileName = this.S("../../../Class/Out/net8.0/ToolData/Saber/ItemListIndex.txt");
        this.AddMethodFileName = this.S("ToolData/Class/AddMaideIndex.txt");
        this.OutputFilePath = this.S("../../Module/Class.Infra/IndexList.cl");
        return true;
    }

    protected override TableEntry GetItemEntry(String line)
    {
        String index;
        index = line;

        Text aa;
        aa = this.TextCreate(this.S("Item"));

        Text k;
        k = this.TextCreate(index);

        if (this.TextStart(k, aa))
        {
            long kk;
            kk = aa.Range.Count;

            Range range;
            range = k.Range;

            range.Index = range.Index + kk;
            range.Count = range.Count - kk;
        }

        k = this.TextAlphaSite(k);

        String text;        
        text = this.StringCreate(k);

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
        a = value as Value;
        this.AddS("AddItem")
            .AddS("(")
            .AddS("\"").Add(a.Text).AddS("\"")
            .AddS(")");
        return true;
    }
}