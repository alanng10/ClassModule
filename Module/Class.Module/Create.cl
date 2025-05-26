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
}