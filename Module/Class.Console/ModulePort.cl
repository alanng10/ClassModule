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

        this.ClassArray : this.ListInfra.ArrayCreate(this.Module.Class.Count);

        var Iter iter;
        iter : this.Module.Class.IterCreate();
        this.Module.Class.IterSet(iter);

        count : this.ClassArray.Count;
        i : 0;
        while (i < count)
        {
            iter.Next();

            var Class varClass;
            varClass : cast Class(iter.Value);

            this.ClassArray.Set(i, varClass);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteImport()
    {
        this.Module.Import : this.ClassInfra.TableCreateModuleRefLess();

        var Int importTotal;
        importTotal : 0;

        var Array array;
        array : this.Binary.Import;

        var Int count;
        count : array.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var BinaryImport binaryImport;
            binaryImport : cast BinaryImport(array.Get(i));

            var ModuleRef moduleRef;
            moduleRef : binaryImport.Module;

            inf (this.Module.Import.Valid(moduleRef))
            {
                this.Status : 20;
                return false;
            }

            var Table classTable;
            classTable : this.ClassInfra.TableCreateRefLess();

            this.ListInfra.TableAdd(this.Module.Import, moduleRef, classTable);

            var Module module;
            module : this.ModuleGet(moduleRef);
            inf (module = null)
            {
                this.Status : 21;
                return false;
            }

            var Binary binary;
            binary : cast Binary(this.BinaryTable.Get(moduleRef));
            inf (binary = null)
            {
                this.Status : 22;
                return false;
            }

            var Int countA;
            countA : binaryImport.Class.Count;
            var Int iA;
            iA : 0;
            while (iA < countA)
            {
                var Int ke;
                ke : cast Int(binaryImport.Class.Get(iA));

                var BinaryClass binaryClass;
                binaryClass : cast BinaryClass(binary.Class.Get(ke));
                inf (binaryClass = null)
                {
                    this.Status : 23;
                    return false;
                }

                var String className;
                className : binaryClass.Name;

                var Class varClass;
                varClass : this.ModuleClassGet(module, className);
                inf (varClass = null)
                {
                    this.Status : 24;
                    return false;
                }

                inf (classTable.Valid(varClass))
                {
                    this.Status : 25;
                    return false;
                }

                this.ListInfra.TableAdd(classTable, varClass, varClass);

                iA : iA + 1;
            }

            importTotal : importTotal + countA;

            i : i + 1;
        }

        this.ImportArray : this.ListInfra.ArrayCreate(importTotal);

        var Int importIndex;
        importIndex : 0;

        var Iter iter;
        iter : this.Module.Import.IterCreate();
        this.Module.Import.IterSet(iter);

        while (iter.Next())
        {
            var Table kd;
            kd : cast Table(iter.Value);

            var Iter iterA;
            iterA : kd.IterCreate();
            kd.IterSet(iterA);
            while (iterA.Next())
            {
                var Class ka;
                ka : cast Class(iterA.Value);

                this.ImportArray.Set(importIndex, ka);

                importIndex : importIndex + 1;
            }
        }

        return true;
    }

    maide precate Bool ExecuteExport()
    {
        this.Module.Export : this.ClassInfra.TableCreateStringLess();

        var Array array;
        array : this.Binary.Export;

        var Int count;
        count : array.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Int ka;
            ka : cast Int(array.Get(i));

            var Class varClass;
            varClass : this.ClassGet(ka);

            inf (varClass = null)
            {
                this.Status : 30;
                return false;
            }

            this.ListInfra.TableAdd(this.Module.Export, varClass.Name, varClass);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteBase()
    {
        this.SetBaseList();

        this.SetBaseCount();
        return true;
    }

    maide precate Bool SetBaseList()
    {
        var Array array;
        array : this.Binary.Base;

        var Int count;
        count : array.Count;
        inf (~(count = this.ClassArray.Count))
        {
            this.Status : 40;
            return false;
        }

        var Int i;
        i : 0;
        while (i < count)
        {
            var Class varClass;
            varClass : cast Class(this.ClassArray.Get(i));

            var Int k;
            k : cast Int(array.Get(i));

            var Class baseClass;
            baseClass : this.ClassGet(k);

            inf (baseClass = null)
            {
                this.Status : 41;
                return false;
            }

            varClass.Base : baseClass;

            i : i + 1;
        }
        return true;
    }

    maide precate Bool SetBaseCount()
    {
        var Array array;
        array : this.ClassArray;

        var Int count;
        count : array.Count;

        var Int i;
        i : 0;
        while (i < count)
        {
            var Class varClass;
            varClass : cast Class(array.Get(i));

            varClass.BaseCount : this.ClassInfra.BaseCount(varClass, this.AnyClass);

            i : i + 1;
        }

        return true;
    }
}