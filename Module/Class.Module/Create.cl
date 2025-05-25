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
}