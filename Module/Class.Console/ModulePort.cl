class ModulePort : TextAdd
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

        inf (this.ModuleTable.Valid(this.ModuleRef))
        {
            this.Status : 1;
            return false;
        }

        var Module a;
        a : new Module;
        a.Init();
        a.Ref : this.ClassInfra.ModuleRefCreate(this.ModuleRef.Name, this.ModuleRef.Ver);

        this.Module : a;

        this.Binary : cast Binary(this.BinaryTable.Get(this.Module.Ref));

        var Bool b;

        b : this.ExecuteClass();
        inf (~b)
        {
            return false;
        }

        b : this.ExecuteImport();
        inf (~b)
        {
            return false;
        }

        b : this.ExecuteExport();
        inf (~b)
        {
            return false;
        }

        b : this.ExecuteBase();
        inf (~b)
        {
            return false;
        }

        b : this.ExecutePart();
        inf (~b)
        {
            return false;
        }

        b : this.ExecuteVirtual();
        inf (~b)
        {
            return false;
        }

        b : this.ExecuteEntry();
        inf (~b)
        {
            return false;
        }

        return true;
    }

    maide precate Bool ExecuteClass()
    {
        this.Module.Class : this.ClassInfra.TableCreateStringLess();

        var Array array;
        array : this.Binary.Class;

        var Int count;
        count : array.Count;

        var Int i;
        i : 0;
        while (i < count)
        {
            var BinaryClass binaryClass;
            binaryClass : cast BinaryClass(array.Get(i));

            var String name;
            name : binaryClass.Name;

            inf (this.Module.Class.Valid(name))
            {
                this.Status : 11;
                return false;
            }

            var Class a;
            a : new Class;
            a.Init();
            a.Name : name;
            a.Module : this.Module;
            a.Index : this.Module.Class.Count;

            this.ListInfra.TableAdd(this.Module.Class, a.Name, a);

            i : i + 1;
        }

        inf (this.TextSame(this.TA(this.Module.Ref.Name), this.TB("System.Infra")))
        {
            var Class ka;
            ka : cast Class(this.Module.Class.Get("Any"));
            inf (ka = null)
            {
                this.Status : 12;
                return false;
            }
            this.AnyClass : ka;
        }
    }
}