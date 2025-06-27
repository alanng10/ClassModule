class ModuleLoad : TextAdd
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.ClassInfra : share ClassInfra;
        this.CountList : share CountList;
        return true;
    }

    field prusate Table ModuleTable { get { return data; } set { data : value; } }
    field prusate Table BinaryTable { get { return data; } set { data : value; } }

}