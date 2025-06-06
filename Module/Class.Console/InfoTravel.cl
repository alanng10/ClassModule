class InfoTravel : Travel
{
    field precate Int Space { get { return data; } set { data : value; } }

    maide prusate Bool ExecuteClass(var NodeClass nodeClass)
    {
        inf (nodeClass = null)
        {
            this.AddNull();
            return true;
        }

        this.Start("Class");
        
        this.ExecuteClassName(nodeClass.Base);
    }

    maide precate Bool Start(var String name)
    {
        this.Add(name).AddLine();
        this.AddSpace().Add("{").AddLine();

        this.Space : this.Space + 4;
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

    maide precate Bool AddNull()
    {
        this.Add("null");
        return true;
    }
}