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

    protected override ListEntry GetItemEntry(String line)
    {
        Text kka;
        kka = this.TextCreate(this.S(" "));

        Text k;
        k = this.TextCreate(line);

        Array array;
        array = this.TextLimit(k, kka);

        Text ka;
        Text kb;
        ka = array.GetAt(0) as Text;
        kb = array.GetAt(1) as Text;

        String index;
        index = this.StringCreate(ka);

        if (this.TextSame(this.TA(index), this.TB(this.S("Get"))))
        {
            index = this.AddClear().AddS("Item").Add(index).AddResult();
        }

        long arg;
        arg = this.IntText(kb, 10);

        Value value;
        value = new Value();
        value.Init();
        value.Int = arg;

        ListEntry entry;
        entry = new ListEntry();
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
            .AddInt(a.Int)
            .AddS(")");
        return true;
    }
}