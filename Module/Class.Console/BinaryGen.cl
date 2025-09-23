class BinaryGen : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.ClassInfra : share ClassInfra;

        this.BinaryState : this.CreateBinaryState();
        return true;
    }

    maide precate BinaryState CreateBinaryState()
    {
        var BinaryState a;
        a : new BinaryState;
        a.Init();
        return a;
    }

    field prusate Module Module { get { return data; } set { data : value; } }
    field prusate Binary Result { get { return data; } set { data : value; } }
    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate ClassInfra ClassInfra { get { return data; } set { data : value; } }
    field precate BinaryState BinaryState { get { return data; } set { data : value; } }
    field precate IndexTable IndexTable { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        this.IndexTableSet();
        
        var BinaryBinary a;
        a : this.ExecuteBinary();

        this.Result : a;

        this.IndexTable : null;
        return true;
    }

    maide prusate Bool IndexTableSet()
    {
        this.IndexTable : this.ClassInfra.TableCreateRefLess();

        var Iter iter;
        iter : new TableIter;
        iter.Init();

        var Iter iterA;
        iterA : new TableIter;
        iterA.Init();

        this.Module.Class.IterSet(iter);

        while (iter.Next())
        {
            var Class ka;
            ka : cast Class(iter.Value);

            this.IndexTableAdd(ka);
        }

        this.Module.Import.IterSet(iter);

        while (iter.Next())
        {
            var Table kk;
            kk : cast Table(iter.Value);

            kk.IterSet(iterA);

            while (iterA.Next())
            {
                var Class kb;
                kb : cast Class(iterA.Value);

                this.IndexTableAdd(kb);
            }
        }

        return true;
    }

    maide prusate Bool IndexTableAdd(var Class varClass)
    {
        var Int k;
        k : this.IndexTable.Count;

        this.ListInfra.TableAdd(this.IndexTable, varClass, k);
        return true;
    }

    maide prusate Binary ExecuteBinary()
    {
        var Binary a;
        a : new Binary;
        a.Init();

        a.Ref : this.ExecuteModuleRef(this.Module.Ref);
        a.Class : this.ExecuteClassArray();
        a.Import : this.ExecuteImportArray();
        a.Export : this.ExecuteExportArray();
        a.Base : this.ExecuteBaseArray();
        a.Part : this.ExecutePartArray();
        a.Entry : this.ExecuteEntry();
        a.State : this.ExecuteState();
        return a;
    }

    maide prusate Array ExecuteClassArray()
    {
        var Int count;
        count : this.Module.Class.Count;

        var Array array;
        array : this.ListInfra.ArrayCreate(count);

        var Iter iter;
        iter : this.Module.Class.IterCreate();
        this.Module.Class.IterSet(iter);

        var Int i;
        i : 0;
        while (i < count)
        {
            iter.Next();

            var Class varClass;
            varClass : cast Class(iter.Value);

            var BinaryClass a;
            a : this.ExecuteClass(varClass);

            array.Set(i, a);

            i : i + 1;
        }

        return array;
    }

    maide prusate BinaryClass ExecuteClass(var Class varClass)
    {
        var String name;
        name : varClass.Name;

        var BinaryClass a;
        a : new BinaryClass;
        a.Init();
        a.Name : name;
        return a;
    }

    maide prusate Array ExecuteImportArray()
    {
        var Int count;
        count : this.Module.Import.Count;

        var Array array;
        array : this.ListInfra.ArrayCreate(count);

        var Iter iter;
        iter : this.Module.Import.IterCreate();
        this.Module.Import.IterSet(iter);

        var Int i;
        i : 0;
        while (i < count)
        {
            iter.Next();

            var ModuleRef ka;
            ka : cast ModuleRef(iter.Index);

            var Table kb;
            kb : cast Table(iter.Value);

            var BinaryImport a;
            a : this.ExecuteImport(ka, kb);

            array.Set(i, a);

            i : i + 1;
        }

        return array;
    }

    maide prusate BinaryImport ExecuteImport(var ModuleRef moduleRef, var Table table)
    {
        var ModuleRef moduleRefA;
        moduleRefA : this.ExecuteModuleRef(moduleRef);

        var Int count;
        count : table.Count;

        var Array array;
        array : this.ListInfra.ArrayCreate(count);

        var Iter iter;
        iter : table.IterCreate();
        table.IterSet(iter);

        var Int i;
        i : 0;
        while (i < count)
        {
            iter.Next();

            var Class varClass;
            varClass : cast Class(iter.Value);

            var Int ka;
            ka : varClass.Index;

            array.Set(i, ka);

            i : i + 1;
        }

        var BinaryImport a;
        a : new BinaryImport;
        a.Init();
        a.Module : moduleRefA;
        a.Class : array;
        return a;
    }

    maide prusate Array ExecuteExportArray()
    {
        var Int count;
        count : this.Module.Export.Count;

        var Array array;
        array : this.ListInfra.ArrayCreate(count);

        var Iter iter;
        iter : this.Module.Export.IterCreate();
        this.Module.Export.IterSet(iter);

        var Int i;
        i : 0;
        while (i < count)
        {
            iter.Next();

            var Class varClass;
            varClass : cast Class(iter.Value);

            var Int ka;
            ka : varClass.Index;

            array.Set(i, ka);

            i : i + 1;
        }

        return array;
    }

    maide prusate Array ExecuteBaseArray()
    {
        var Int count;
        count : this.Module.Class.Count;

        var Array array;
        array : this.ListInfra.ArrayCreate(count);

        var Iter iter;
        iter : this.Module.Class.IterCreate();
        this.Module.Class.IterSet(iter);

        var Int i;
        i : 0;
        while (i < count)
        {
            iter.Next();

            var Class varClass;
            varClass : cast Class(iter.Value);

            var Class baseClass;
            baseClass : varClass.Base;

            var Int ka;
            ka : this.ClassIndex(baseClass);

            array.Set(i, ka);

            i : i + 1;
        }

        return array;
    }

    maide prusate Array ExecutePartArray()
    {
        var Int count;
        count : this.Module.Class.Count;

        var Array array;
        array : this.ListInfra.ArrayCreate(count);

        var Iter iter;
        iter : this.Module.Class.IterCreate();
        this.Module.Class.IterSet(iter);

        var Int i;
        i : 0;
        while (i < count)
        {
            iter.Next();

            var Class varClass;
            varClass : cast Class(iter.Value);

            var BinaryPart a;
            a : this.ExecutePart(varClass);

            array.Set(i, a);

            i : i + 1;
        }

        return array;
    }

    maide prusate BinaryPart ExecutePart(var Class varClass)
    {
        var Int fieldStart;
        var Int maideStart;
        fieldStart : varClass.FieldStart;
        maideStart : varClass.MaideStart;

        var Array varField;
        varField : this.ExecuteFieldArray(varClass.Field);

        var Array varMaide;
        varMaide : this.ExecuteMaideArray(varClass.Maide);

        var BinaryPart a;
        a : new BinaryPart;
        a.Init();
        a.FieldStart : fieldStart;
        a.MaideStart : maideStart;
        a.Field : varField;
        a.Maide : varMaide;
        return a;
    }

    maide prusate Array ExecuteFieldArray(var Table table)
    {
        var Int count;
        count : table.Count;

        var Array array;
        array : this.ListInfra.ArrayCreate(count);

        var Iter iter;
        iter : table.IterCreate();
        table.IterSet(iter);

        var Int i;
        i : 0;
        while (i < count)
        {
            iter.Next();

            var Field varField;
            varField : cast Field(iter.Value);

            var BinaryField a;
            a : this.ExecuteField(varField);

            array.Set(i, a);

            i : i + 1;
        }

        return array;
    }

    maide prusate BinaryField ExecuteField(var Field varField)
    {
        var Int varClass;
        varClass : this.ClassIndex(varField.Class);

        var Int count;
        count : varField.Count.Index;

        var String name;
        name : varField.Name;

        var BinaryField a;
        a : new BinaryField;
        a.Init();
        a.Class : varClass;
        a.Count : count;
        a.Name : name;
        return a;
    }

    maide prusate Array ExecuteMaideArray(var Table table)
    {
        var Int count;
        count : table.Count;

        var Array array;
        array : this.ListInfra.ArrayCreate(count);

        var Iter iter;
        iter : table.IterCreate();
        table.IterSet(iter);

        var Int i;
        i : 0;
        while (i < count)
        {
            iter.Next();

            var Maide varMaide;
            varMaide : cast Maide(iter.Value);

            var BinaryMaide a;
            a : this.ExecuteMaide(varMaide);

            array.Set(i, a);

            i : i + 1;
        }

        return array;
    }

    maide prusate BinaryMaide ExecuteMaide(var Maide varMaide)
    {
        var Int varClass;
        varClass : this.ClassIndex(varMaide.Class);

        var Int count;
        count : varMaide.Count.Index;

        var String name;
        name : varMaide.Name;

        var Array param;
        param : this.ExecuteVarArray(varMaide.Param);

        var BinaryMaide a;
        a : new BinaryMaide;
        a.Init();
        a.Class : varClass;
        a.Count : count;
        a.Name : name;
        a.Param : param;
        return a;
    }

    maide prusate Array ExecuteVarArray(var Table table)
    {
        var Int count;
        count : table.Count;

        var Array array;
        array : this.ListInfra.ArrayCreate(count);

        var Iter iter;
        iter : table.IterCreate();
        table.IterSet(iter);

        var Int i;
        i : 0;
        while (i < count)
        {
            iter.Next();

            var Var varVar;
            varVar : cast Var(iter.Value);

            var BinaryVar a;
            a : this.ExecuteVar(varVar);

            array.Set(i, a);

            i : i + 1;
        }

        return array;
    }

    public virtual BinaryVar ExecuteVar(Var varVar)
    {
        long varClass;
        varClass : this.ClassIndex(varVar.Class);

        String name;
        name : varVar.Name;

        BinaryVar a;
        a : new BinaryVar();
        a.Init();
        a.Class : varClass;
        a.Name : name;
        return a;
    }

    public virtual BinaryEntry ExecuteEntry()
    {
        long k;
        k : -1;

        String entry;
        entry : this.Module.Entry;

        if (!(entry == null))
        {
            ClassClass entryClass;
            entryClass : this.Module.Class.Get(entry) as ClassClass;

            k : entryClass.Index;
        }

        BinaryEntry a;
        a : new BinaryEntry();
        a.Init();
        a.Class : k;
        return a;
    }

    public virtual Data ExecuteState()
    {
        this.BinaryState.Module : this.Module;
        this.BinaryState.IndexTable : this.IndexTable;

        this.BinaryState.Execute();

        Data k;
        k : this.BinaryState.Result;

        this.BinaryState.Result : null;

        this.BinaryState.IndexTable : null;
        this.BinaryState.Module : null;

        Data a;
        a : k;
        return a;
    }

    public virtual ModuleRef ExecuteModuleRef(ModuleRef moduleRef)
    {
        ModuleRef a;
        a : this.ClassInfra.ModuleRefCreate(moduleRef.Name, moduleRef.Ver);
        return a;
    }

    public virtual long ClassIndex(ClassClass varClass)
    {
        InfraValue k;
        k : this.IndexTable.Get(varClass) as InfraValue;

        long a;
        a : k.Int;
        return a;
    }
}