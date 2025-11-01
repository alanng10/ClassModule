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
    field prusate Module Result { get { return data; } set { data : value; } }
    field prusate Class AnyClass { get { return data; } set { data : value; } }
    field prusate Int Status { get { return data; } set { data : value; } }
    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate ClassInfra ClassInfra { get { return data; } set { data : value; } }
    field precate CountList CountList { get { return data; } set { data : value; } }
    field precate Module Module { get { return data; } set { data : value; } }
    field precate Binary Binary { get { return data; } set { data : value; } }
    field precate Array ClassArray { get { return data; } set { data : value; } }
    field precate Array ImportArray { get { return data; } set { data : value; } }
    field precate Table VirtualTable { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        var Bool b;
        b : this.ExecuteAll();

        this.Module : null;
        this.Binary : null;
        this.ClassArray : null;
        this.ImportArray : null;

        inf (~b)
        {
            return false;
        }

        return true;
    }

    maide precate Bool ExecuteAll()
    {
        this.Status : 0;
        this.Result : null;

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

        this.Result : this.Module;
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

    maide precate Bool ExecutePart()
    {
        var Array array;
        array : this.Binary.Part;

        var Int count;
        count : array.Count;
        inf (~(count = this.ClassArray.Count))
        {
            this.Status : 50;
            return false;
        }

        var Int i;
        i : 0;
        while (i < count)
        {
            var Class varClass;
            varClass : cast Class(this.ClassArray.Get(i));

            var BinaryPart k;
            k : cast BinaryPart(array.Get(i));

            var Bool b;
            b : this.SetPart(varClass, k);
            inf (~b)
            {
                return false;
            }

            i : i + 1;
        }
        return true;
    }

    maide precate Bool SetPart(var Class varClass, var BinaryPart part)
    {
        varClass.FieldStart : part.FieldStart;

        varClass.MaideStart : part.MaideStart;

        var Bool b;

        b : this.SetPartField(varClass, part.Field);
        inf (~b)
        {
            return false;
        }
        b : this.SetPartMaide(varClass, part.Maide);
        inf (~b)
        {
            return false;
        }

        return true;
    }

    maide precate Bool SetPartField(var Class varClass, var Array binaryField)
    {
        varClass.Field : this.ClassInfra.TableCreateStringLess();

        var Int count;
        count : binaryField.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var BinaryField ka;
            ka : cast BinaryField(binaryField.Get(i));

            var Class k;
            k : this.ClassGet(ka.Class);
            inf (k = null)
            {
                return false;
            }

            var Field a;
            a : new Field;
            a.Init();
            a.Index : i;
            a.Name : ka.Name;
            a.Class : k;
            a.Count : this.CountList.Get(ka.Count);
            a.Parent : varClass;

            this.ListInfra.TableAdd(varClass.Field, a.Name, a);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool SetPartMaide(var Class varClass, var Array binaryMaide)
    {
        varClass.Maide : this.ClassInfra.TableCreateStringLess();

        var Int count;
        count : binaryMaide.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var BinaryMaide ka;
            ka : cast BinaryMaide(binaryMaide.Get(i));

            var Class k;
            k : this.ClassGet(ka.Class);
            inf (k = null)
            {
                return false;
            }

            var Maide a;
            a : new Maide;
            a.Init();
            a.Index : i;
            a.Name : ka.Name;
            a.Class : k;
            a.Count : this.CountList.Get(ka.Count);
            a.Parent : varClass;

            var Bool b;
            b : this.SetPartParam(a, ka.Param);
            inf (~b)
            {
                return false;
            }

            this.ListInfra.TableAdd(varClass.Maide, a.Name, a);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool SetPartParam(var Maide varMaide, var Array binaryVar)
    {
        varMaide.Param : this.ClassInfra.TableCreateStringLess();

        var Int count;
        count : binaryVar.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var BinaryVar ka;
            ka : cast BinaryVar(binaryVar.Get(i));

            var Class k;
            k : this.ClassGet(ka.Class);
            inf (k = null)
            {
                return false;
            }

            var Var a;
            a : new Var;
            a.Init();
            a.Name : ka.Name;
            a.Class : k;

            this.ListInfra.TableAdd(varMaide.Param, a.Name, a);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteVirtual()
    {
        this.VirtualTable : this.ClassInfra.TableCreateRefLess();

        var Int count;
        count : this.ClassArray.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Class varClass;
            varClass : cast Class(this.ClassArray.Get(i));

            var Bool b;
            b : this.VirtualClassSet(varClass);
            inf (~b)
            {
                return false;
            }

            i : i + 1;
        }

        this.VirtualTable : null;
        return true;
    }

    maide precate Bool VirtualClassSet(var Class varClass)
    {
        inf (this.VirtualTable.Valid(varClass))
        {
            return true;
        }

        inf (~(varClass.Module = this.Module))
        {
            return true;
        }

        var Class ka;
        inf (~(varClass = this.AnyClass))
        {
            ka : varClass.Base;
        }

        inf (~(ka = null))
        {
            var Bool ba;
            ba : this.VirtualClassSet(ka);

            inf (~ba)
            {
                return false;
            }
        }

        var Bool b;
        b : this.VirtualClassPartSet(varClass);

        inf (~b)
        {
            return false;
        }

        this.ListInfra.TableAdd(this.VirtualTable, varClass, varClass);

        return true;
    }

    maide precate Bool VirtualClassPartSet(var Class varClass)
    {
        var Bool b;
        b : this.VirtualClassFieldSet(varClass);
        inf (~b)
        {
            return false;
        }
        b : this.VirtualClassMaideSet(varClass);
        inf (~b)
        {
            return false;
        }
        return true;
    }

    maide precate Bool VirtualClassFieldSet(var Class varClass)
    {
        var Iter iter;
        iter : varClass.Field.IterCreate();
        varClass.Field.IterSet(iter);

        while (iter.Next())
        {
            var Field a;
            a : cast Field(iter.Value);

            this.ClassInfra.VirtualField(a, this.AnyClass);
        }
        return true;
    }

    maide precate Bool VirtualClassMaideSet(var Class varClass)
    {
        var Iter iterA;
        iterA : new TableIter;
        iterA.Init();

        var Iter iterB;
        iterB : new TableIter;
        iterB.Init();

        var Iter iter;
        iter : varClass.Maide.IterCreate();
        varClass.Maide.IterSet(iter);

        while (iter.Next())
        {
            var Maide a;
            a : cast Maide(iter.Value);

            this.ClassInfra.VirtualMaide(a, this.AnyClass, iterA, iterB);
        }
        return true;
    }

    maide precate Bool ExecuteEntry()
    {
        var String entry;

        var Int k;
        k : this.Binary.Entry.Class;
        inf (~(k = null))
        {
            var Class a;
            a : cast Class(this.ClassArray.Get(k));
            inf (a = null)
            {
                return false;
            }

            entry : a.Name;
        }

        this.Module.Entry : entry;
        return true;
    }

    maide precate Class ClassGet(var Int index)
    {
        var Class a;

        var Bool b;
        b : this.ClassArray.Valid(index);

        inf (b)
        {
            a : cast Class(this.ClassArray.Get(index));
        }
        inf (~b)
        {
            var Int ka;
            ka : index - this.ClassArray.Count;
            inf (~this.ImportArray.Valid(ka))
            {
                return null;
            }
            a : cast Class(this.ImportArray.Get(ka));
        }
        return a;
    }

    maide precate Module ModuleGet(var ModuleRef moduleRef)
    {
        var Module a;
        a : cast Module(this.ModuleTable.Get(moduleRef));
        return a;
    }

    maide precate Class ModuleClassGet(var Module module, var String className)
    {
        var Class a;
        a : cast Class(module.Class.Get(className));
        return a;
    }
}