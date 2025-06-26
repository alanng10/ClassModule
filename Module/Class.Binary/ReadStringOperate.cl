class ReadStringOperate : ReadOperate
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
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
}