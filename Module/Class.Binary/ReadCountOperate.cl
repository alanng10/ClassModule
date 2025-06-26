class ReadCountOperate : ReadOperate
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.TextInfra : share TextInfra;
        this.ClassInfra : share ClassInfra;

        this.Binary : this.CreateBinary();
        this.Class : this.CreateClass();
        this.Import : this.CreateImport();
        this.Part : this.CreatePart();
        this.Field : this.CreateField();
        this.Maide : this.CreateMaide();
        this.Var : this.CreateVar();
        this.ModuleRef : this.CreateModuleRef();
        this.String : this.CreateString();
        this.Array : this.CreateArray();
        return true;
    }

    maide precate Binary CreateBinary()
    {
        var Binary a;
        a : new Binary;
        a.Init();
        return a;
    }

    maide precate Class CreateClass()
    {
        var Class a;
        a : new Class;
        a.Init();
        return a;
    }

    maide precate Import CreateImport()
    {
        var Import a;
        a : new Import;
        a.Init();
        return a;
    }

    maide precate Part CreatePart()
    {
        var Part a;
        a : new Part;
        a.Init();
        return a;
    }
}