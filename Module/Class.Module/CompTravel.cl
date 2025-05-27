class CompTravel : Travel
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.ClassInfra : share ClassInfra;
        return true;
    }

    field prusate Class ThisClass { get { return data; } set { data : value; } }
    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate ClassInfra ClassInfra { get { return data; } set { data : value; } }
    field precate Table ParamVar { get { return data; } set { data : value; } }

    maide prusate Bool ExecuteClass(var NodeClass nodeClass)
    {
        inf (nodeClass = null)
        {
            return true;
        }

        this.ThisClass : this.Info(nodeClass).Class;

        base.ExecuteClass(nodeClass);

        this.ThisClass : null;

        return true;
    }
}