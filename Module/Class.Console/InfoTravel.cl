class InfoTravel : Travel
{
    field precate Int Space { get { return data; } set { data : value; } }

    maide prusate Bool ExecuteClass(var NodeClass nodeClass)
    {
        inf (nodeClass = null)
        {
            this.Null();
            return true;
        }

        this.Start("Class");
        
        this.Field("Name");
        this.ExecuteClassName(nodeClass.Name);

        this.Field("Base");
        this.ExecuteClassName(nodeClass.Base);

        this.Field("Part");
        this.ExecutePart(nodeClass.Part);

        this.End();
        return true;
    }

    maide prusate Bool ExecutePart(var Part part)
    {
        inf (part = null)
        {
            this.Null();
            return true;
        }

        this.StartArray();

        base.ExecutePart(part);

        this.EndArray();
        return true;
    }

    maide prusate Bool ExecuteComp(var Comp comp)
    {
        inf (comp = null)
        {
            this.Null();
            return true;
        }

        base.ExecuteComp(comp);
        return true;
    }

    maide prusate Bool ExecuteClassName(var ClassName className)
    {
        inf (className = null)
        {
            this.Null();
            return true;
        }

        this.Start("ClassName");
        
        this.Field("Value");
        this.AddStringValue(className.Value);

        this.End();
        return true;
    }

    maide precate Bool Start(var String name)
    {
        this.Add(name).AddLine();
        this.AddSpace().Add("{").AddLine();

        this.Space : this.Space + 4;
        return true;
    }

    maide precate Bool End()
    {
        this.Space : this.Space - 4;

        this.AddSpace().Add("}").Add(",").AddLine();
        return true;
    }

    maide precate Bool StartArray()
    {
        this.AddSpace().Add("[").AddLine();

        this.Space : this.Space + 4;
        return true;
    }

    maide precate Bool EndArray()
    {
        this.Space : this.Space - 4;

        this.AddSpace().Add("]").Add(",").AddLine();
        return true;
    }

    maide precate Bool Field(var String name)
    {
        this.AddSpace().Add(name).Add(" : ");
        return true;
    }

    maide precate Bool AddBoolValue(var Bool value)
    {
        this.AddStringBool(value).Add(",").AddLine();
        return true;
    }

    maide precate Bool AddIntValue(var Int value)
    {
        this.Add("0h").AddStringIntHex(value).Add(",").AddLine();
        return true;
    }

    maide precate Bool AddStringValue(var String value)
    {
        this.Add("\"").Add(value).Add("\"").Add(",").AddLine();
        return true;
    }

    maide precate Bool AddSpace()
    {
        var Int count;
        count : this.Space;
        var Int i;
        i : 0;
        while (i < count)
        {
            this.Add(" ");

            i : i + 1;
        }

        return true;
    }

    maide precate Bool Null()
    {
        this.Add("null").Add(",").AddLine();
        return true;
    }
}