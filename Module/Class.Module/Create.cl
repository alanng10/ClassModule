class Create : ClassCreate
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.ClassInfra : share ClassInfra;
        this.Count : share CountList;
        this.ErrorKind : share ErrorKindList;

        this.System : this.CreateSystem();
        this.NullClass : this.CreateNullClass();
        this.InitTravel : this.CreateInitTravel();
        this.ClassTravel : this.CreateClassTravel();
        this.CompTravel : this.CreateCompTravel();
        this.StateTravel : this.CreateStateTravel();
        this.ModuleRef : this.CreateModuleRef();
        return true;
    }

    maide precate System CreateSystem()
    {
        var System a;
        a : new System;
        a.Init();
        return a;
    }

    maide precate Class CreateNullClass()
    {
        var Class a;
        a : new Class;
        a.Init();
        a.Name : "_";
        return a;
    }

    maide precate InitTravel CreateInitTravel()
    {
        var InitTravel a;
        a : new InitTravel;
        a.Create : this;
        a.Init();
        return a;
    }

    maide precate ClassTravel CreateClassTravel()
    {
        var ClassTravel a;
        a : new ClassTravel;
        a.Create : this;
        a.Init();
        return a;
    }

    maide precate CompTravel CreateCompTravel()
    {
        var CompTravel a;
        a : new CompTravel;
        a.Create : this;
        a.Init();
        return a;
    }

    maide precate StateTravel CreateStateTravel()
    {
        var StateTravel a;
        a : new StateTravel;
        a.Create : this;
        a.Init();
        return a;
    }

    maide precate ModuleRef CreateModuleRef()
    {
        return this.ClassInfra.ModuleRefCreate(null, 0);
    }

    field prusate Array Source { get { return data; } set { data : value; } }
    field prusate Array RootNode { get { return data; } set { data : value; } }
    field prusate Module Module { get { return data; } set { data : value; } }
    field prusate Table ModuleTable { get { return data; } set { data : value; } }
    field prusate Table ImportClass { get { return data; } set { data : value; } }
    field prusate Result Result { get { return data; } set { data : value; } }
    field prusate Int SourceIndex { get { return data; } set { data : value; } }
    field prusate System System { get { return data; } set { data : value; } }
    field prusate Class NullClass { get { return data; } set { data : value; } }
    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate ClassInfra ClassInfra { get { return data; } set { data : value; } }
    field precate CountList Count { get { return data; } set { data : value; } }
    field precate ErrorKindList ErrorKind { get { return data; } set { data : value; } }
    field precate InitTravel InitTravel { get { return data; } set { data : value; } }
    field precate ClassTravel ClassTravel { get { return data; } set { data : value; } }
    field precate CompTravel CompTravel { get { return data; } set { data : value; } }
    field precate StateTravel StateTravel { get { return data; } set { data : value; } }
    field precate List ErrorList { get { return data; } set { data : value; } }
    field precate Table BaseTable { get { return data; } set { data : value; } }
    field precate Table VirtualTable { get { return data; } set { data : value; } }
    field precate Table RangeTable { get { return data; } set { data : value; } }
    field precate ModuleRef ModuleRef { get { return data; } set { data : value; } }
    field precate Bool SystemInfra { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        this.Result : new Result;
        this.Result.Init();

        this.ErrorList : new List;
        this.ErrorList.Init();

        this.SystemInfra : this.ModuleSystemInfra();

        this.ExecuteInit();
        this.ExecuteClass();
        this.ExecuteBase();
        this.ExecuteComp();
        this.ExecuteVirtual();
        this.ExecuteExport();
        this.ExecuteEntry();
        this.ExecuteState();

        this.Result.Module : this.Module;
        this.Result.Error : this.ListInfra.ArrayCreateList(this.ErrorList);
        this.ErrorList : null;
        return true;
    }

    maide precate Bool SystemSet()
    {
        var Module k;

        inf (this.SystemInfra)
        {
            k : this.Module;
        }
        inf (~this.SystemInfra)
        {
            k : this.ModuleGet("System.Infra");
        }

        this.System.Any : this.ModuleClassGet(k, "Any");
        this.System.Bool : this.ModuleClassGet(k, "Bool");
        this.System.Int : this.ModuleClassGet(k, "Int");
        this.System.String : this.ModuleClassGet(k, "String");
        return true;
    }

    maide precate Module ModuleGet(var String moduleName)
    {
        this.ModuleRef.Name : moduleName;

        var Module a;
        a : cast Module(this.ModuleTable.Get(this.ModuleRef));
        return a;
    }

    maide precate Class ModuleClassGet(var Module module, var String className)
    {
        return cast Class(module.Class.Get(className));
    }

    maide precate Bool ModuleSystemInfra()
    {
        return this.TextSame(this.TA(this.Module.Ref.Name), this.TB("System.Infra"));
    }

    maide precate Bool ExecuteInit()
    {
        this.ExecuteTravel(this.InitTravel);
        return true;
    }

    maide precate Bool ExecuteClass()
    {
        this.ExecuteTravel(this.ClassTravel);

        this.SystemSet();
        return true;
    }

    maide precate Bool ExecuteBase()
    {
        this.BaseTableSet();

        this.BaseClassSet();

        this.BaseTable : null;

        this.BaseCountSet();
        return true;
    }

    maide precate Bool BaseTableSet()
    {
        this.BaseTable : this.ClassInfra.TableCreateRefLess();

        var Iter iter;
        iter : this.Module.Class.IterCreate();
        this.Module.Class.IterSet(iter);
        while (iter.Next())
        {
            var Class varClass;
            varClass : cast Class(iter.Value);
            this.BaseTableAdd(varClass);
        }
        return true;
    }

    maide precate Bool BaseTableAdd(var Class varClass)
    {
        var NodeClass nodeClass;
        nodeClass : cast NodeClass(varClass.Any);

        var ClassName nodeBase;
        nodeBase : nodeClass.Base;

        var String baseName;
        inf (~(nodeBase = null))
        {
            baseName : nodeBase.Value;
        }

        var Class varBase;
        inf (~(baseName = null))
        {
            varBase : this.Class(baseName);
        }

        var Bool b;
        b : false;

        var Bool ba;
        ba : (varBase = null);
        inf (ba)
        {
            this.Error(this.ErrorKind.BaseUndefine, nodeClass, varClass.Index);
            b : true;
        }

        inf (~ba)
        {
            inf (~this.BaseValidClass(varBase))
            {
                this.Error(this.ErrorKind.BaseUndefine, nodeClass, varClass.Index);
                b : true;
            }
        }

        var Class a;
        a : varBase;

        inf (b)
        {
            a : this.System.Any;
        }

        this.ListInfra.TableAdd(this.BaseTable, varClass, a);
        return true;
    }

    maide precate Bool BaseValidClass(var Class varClass)
    {
        var System k;
        k : this.System;

        inf (varClass = k.Bool | varClass = k.Int | varClass = k.String)
        {
            return false;
        }
        return true;
    }

    maide precate Bool BaseClassSet()
    {
        var Class anyClass;
        anyClass : this.System.Any;

        var Iter iter;
        itre : this.BaseTable.IterCreate();
        this.BaseTable.IterSet(iter);

        while (iter.Next())
        {
            var Class varClass;
            varClass : cast Class(iter.Index);

            var Bool b;
            b : false;

            var Bool ba;
            ba : varClass = anyClass;

            inf (ba)
            {
                b : true;
            }

            inf (~ba)
            {
                b : this.BaseValidDepend(varClass);
            }

            var Class a;

            inf (~b)
            {
                var NodeClass nodeClass;
                nodeClass : cast NodeClass(varClass.Any);

                this.Error(this.ErrorKind.BaseUndefine, nodeClass, varClass.Index);

                a : anyClass;
            }

            inf (b)
            {
                a : cast Class(iter.Value);
            }

            varClass.Base : a;
        }

        return true;
    }

    maide precate Bool BaseValidDepend(var Class varClass)
    {
        var Table table;
        table : this.ClassInfra.TableCreateRefLess();

        var Class a;
        a : varClass;

        while (~(a = null))
        {
            inf (~(a.Module = this.Module))
            {
                return true;
            }

            inf (table.Valid(a))
            {
                return false;
            }

            this.ListInfra.TableAdd(table, a, a);

            var Class ka;
            inf (~(a = this.System.Any))
            {
                ka : cast Class(this.BaseTable.Get(a));
            }
            a : ka;
        }

        return true;
    }

    maide precate Bool BaseCountSet()
    {
        var Iter iter;
        iter : this.Module.Class.IterCreate();
        this.Module.Class.IterSet(iter);
        while (iter.Next())
        {
            var Class k;
            k : cast Class(iter.Value);

            var Int ka;
            ka : this.ClassInfra.BaseCount(k, this.System.Any);

            k.BaseCount : ka;
        }

        return true;
    }
}