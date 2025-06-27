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
    field prusate ModuleRef ModuleRef { get { return data; } set { data : value; } }
    field prusate Module Module { get { return data; } set { data : value; } }
    field prusate Int Status { get { return data; } set { data : value; } }
    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate ClassInfra ClassInfra { get { return data; } set { data : value; } }
    field precate CountList CountList { get { return data; } set { data : value; } }
    field precate Binary Binary { get { return data; } set { data : value; } }
    field precate Array ClassArray { get { return data; } set { data : value; } }
    field precate Array ImportArray { get { return data; } set { data : value; } }
    field precate Table VirtualTable { get { return data; } set { data : value; } }
    field precate Class AnyClass { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        var Bool b;
        b : this.ExecuteAll();

        this.Binary : null;
        this.ClassArray : null;
        this.ImportArray : null;

        inf (~b)
        {
            this.Module : null;
            return false;
        }

        return true;
    }

    maide precate Bool ExecuteAll()
    {
        this.Status : 0;

        var ModuleRef ka;
        ka : this.ModuleRef;

        inf (this.ModuleTable.Valid(ka))
        {
            this.Status : 1;
            return false;
        }

        var Module a;
        a : new Module;
        a.Init();
        a.Ref : this.ClassInfra.ModuleRefCreate(ka.Name, ka.Ver);

        this.Module : a;

        this.Binary : cast Binary(this.BinaryTable.Get(this.Module.Ref));

        var Bool b;
        
        b : this.SetClassList();
        inf (~b)
        {
            return false;
        }

        b : this.SetImportList();
        inf (~b)
        {
            return false;
        }

        b : this.SetExportList();
        inf (~b)
        {
            return false;
        }

    }
}