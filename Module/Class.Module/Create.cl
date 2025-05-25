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
    field precate CountList CountList { get { return data; } set { data : value; } }
    field precate ErrorKindList ErrorKindList { get { return data; } set { data : value; } }
}