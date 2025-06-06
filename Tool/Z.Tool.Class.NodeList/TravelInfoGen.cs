namespace Z.Tool.Class.NodeList;

public class TravelInfoGen : ClassTravelGen
{
    protected override String DeriveState(GenClass varClass, String varName)
    {
        StringAdd h;
        h = new StringAdd();
        h.Init();

        StringAdd hh;
        hh = this.StringAdd;

        this.StringAdd = h;

        this.AddClear();

        this.AddLine();

        Table table;
        table = varClass.Derive;

        Iter iter;
        iter = table.IterCreate();
        table.IterSet(iter);

        while (iter.Next())
        {
            GenClass aa;
            aa = iter.Value as GenClass;

            String className;
            className = aa.Name;

            Text k;
            k = this.TextCreate(this.TextDerive);
            k = this.Place(k, "#VarName#", varName);
            k = this.Place(k, "#ClassName#", className);

            String ka;
            ka = this.StringCreate(k);

            this.Add(ka);
        }

        String a;
        a = this.AddResult();

        this.StringAdd = hh;

        return a;
    }

    protected override String ArrayState(GenClass varClass, String varName)
    {
        StringAdd h;
        h = new StringAdd();
        h.Init();

        StringAdd hh;
        hh = this.StringAdd;

        this.StringAdd = h;

        this.AddClear();

        this.AddLine();

        Table table;
        table = varClass.Derive;

        Iter iter;
        iter = table.IterCreate();
        table.IterSet(iter);

        while (iter.Next())
        {
            GenClass aa;
            aa = iter.Value as GenClass;

            String className;
            className = aa.Name;

            Text k;
            k = this.TextCreate(this.TextArray);
            k = this.Place(k, "#VarName#", varName);
            k = this.Place(k, "#ClassName#", className);

            String ka;
            ka = this.StringCreate(k);

            this.Add(ka);
        }

        String a;
        a = this.AddResult();

        this.StringAdd = hh;

        return a;
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
            Field aa;
            aa = iter.Value as Field;

            if (!aa.AnyBool)
            {
                String k;
                k = this.Field(aa, varName);

                if (!ba)
                {
                    this.AddLine();
                    ba = true;
                }

                this.Add(k);
            }
        }

        this.AddLine();
        this.AddIndent(2).AddS("this.End();").AddLine();

        String a;
        a = this.AddResult();

        this.StringAdd = hh;

        return a;
    }

    protected override String DeclareClassName(String className)
    {
        Text k;
        k = this.TextCreate(className);

        bool b;
        b = false;
        if (!b)
        {
            if (this.TextSame(k, this.TA(this.SClass)))
            {
                b = true;
            }
        }
        if (!b)
        {
            if (this.TextSame(k, this.TA(this.SField)))
            {
                b = true;
            }
        }
        if (!b)
        {
            if (this.TextSame(k, this.TA(this.SMaide)))
            {
                b = true;
            }
        }
        if (!b)
        {
            if (this.TextSame(k, this.TA(this.SVar)))
            {
                b = true;
            }
        }
        if (!b)
        {
            if (this.TextSame(k, this.TA(this.SCount)))
            {
                b = true;
            }
        }

        if (b)
        {
            StringAdd h;
            h = new StringAdd();
            h.Init();

            StringAdd hh;
            hh = this.StringAdd;

            this.StringAdd = h;

            this.AddClear().AddS("Node").Add(className);

            String a;
            a = this.AddResult();

            this.StringAdd = hh;

            return a;

        }

        return className;
    }

    protected override String GetPathName(String name)
    {
        return this.AddClear().AddS("ToolData/Class/TravelInfo").Add(name).AddResult();
    }
}