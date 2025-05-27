class Travel : NodeTravel
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Count : share CountList;
        this.ErrorKind : share ErrorKindList;
        return true;
    }

    field prusate Create Create { get { return data; } set { data : value; } }
    field precate CountList Count { get { return data; } set { data : value; } }
    field precate ErrorKindList ErrorKind { get { return data; } set { data : value; } }

    maide precate Info Info(var Node node)
    {
        return this.Create.Info(node);
    }

    maide precate Class Class(var String name)
    {
        var Class a;
        a : this.Create.Class(name);
        return a;
    }

    maide precate Bool ErrorUnique(var ErrorKind kind, var Node node, var Bool did)
    {
        inf (~did)
        {
            this.Error(kind, node);

            did : true;
        }

        return did;
    }

    maide precate Bool Error(var ErrorKind kind, var Node node)
    {
        this.Create.Error(kind, node, this.Create.SourceIndex);
        return true;
    }
}