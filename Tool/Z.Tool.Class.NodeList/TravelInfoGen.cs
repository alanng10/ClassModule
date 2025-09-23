namespace Z.Tool.Class.NodeList;

public class TravelInfoGen : ClassTravelInfoGen
{
    public override bool Init()
    {
        base.Init();
        this.PathOutput = this.S("../../Module/Class.Console/InfoTravel.cl");
        this.PathSource = this.GetPathName(this.S("InfoSource.cl"));
        this.PathNode = this.GetPath(this.S("InfoNode"));
        this.PathDerive = this.GetPath(this.S("InfoDerive"));
        this.PathExecuteNode = this.GetPath(this.S("InfoExecuteNode"));
        this.PathArray = this.GetPath(this.S("InfoArray"));
        this.PathField = this.GetPath(this.S("InfoField"));
        this.PathExecute = this.GetPath(this.S("InfoExecute"));
        return true;
    }

    public override bool Execute()
    {
        this.TextSource = this.StorageTextRead(this.PathSource);
        this.TextNode = this.StorageTextRead(this.PathNode);
        this.TextDerive = this.StorageTextRead(this.PathDerive);
        this.TextExecuteNode = this.StorageTextRead(this.PathExecuteNode);
        this.TextArray = this.StorageTextRead(this.PathArray);
        this.TextField = this.StorageTextRead(this.PathField);
        this.TextExecute = this.StorageTextRead(this.PathExecute);

        this.TextVirtual = this.Virtual();

        String executeList;
        executeList = this.ExecuteList();

        String nodeList;
        nodeList = this.NodeList();

        Text k;
        k = this.TextCreate(this.TextSource);
        k = this.Place(k, "#NodeList#", nodeList);
        k = this.Place(k, "#ExecuteList#", executeList);

        String a;
        a = this.StringCreate(k);

        this.StorageTextWrite(this.PathOutput, a);
        return true;
    }

    protected override String FieldState(GenClass varClass, String varName)
    {
        StringAdd h;
        h = new StringAdd();
        h.Init();

        StringAdd hh;
        hh = this.StringAdd;

        this.StringAdd = h;

        this.AddClear();

        String ka;
        ka = this.ExecuteNode(varName);

        this.Add(ka);

        this.AddLine();
        this.AddIndent(2).AddS("this.Start(\"").Add(varClass.Name).AddS("\");").AddLine();

        bool ba;
        ba = false;

        Table table;
        table = varClass.Field;

        Iter iter;
        iter = table.IterCreate();
        table.IterSet(iter);

        while (iter.Next())
        {
            Field kb;
            kb = iter.Value as Field;

            if (!kb.AnyBool)
            {
                String k;
                k = this.Field(kb, varName);

                if (!ba)
                {
                    this.AddLine();
                    ba = true;
                }

                this.Add(k);
            }

            if (kb.AnyBool)
            {
                if (!ba)
                {
                    this.AddLine();
                    ba = true;
                }

                this.AddIndent(2).AddS("this.FieldStart(\"").Add(kb.Name).AddS("\");").AddLine();

                this.AddIndent(2).AddS("this.Execute").Add(kb.Class).AddS("(").Add(varName).AddS(".").Add(kb.Name).AddS(");").AddLine();

                this.AddIndent(2).AddS("this.FieldEnd(\"").Add(kb.Name).AddS("\");").AddLine();
            }
        }

        this.AddLine();
        this.AddIndent(2).AddS("this.End();").AddLine();

        String a;
        a = this.AddResult();

        this.StringAdd = hh;

        return a;
    }

    protected override String InitStringMaide()
    {
        return this.TextInfra.Zero;
    }

    protected override String StringFieldList()
    {
        return this.TextInfra.Zero;
    }

    protected override String GetPathName(String name)
    {
        return this.AddClear().AddS("ToolData/Class/Travel").Add(name).AddResult();
    }
}