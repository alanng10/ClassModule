class Console : TextAdd
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.StorageInfra : share StorageInfra;
        this.ClassInfra : share ClassInfra;
        this.StorageComp : share StorageComp;
        this.TaskKind : share TaskKindList;

        this.ErrorWrite : true;

        this.ErrorString : this.CreateErrorString();

        this.Create : this.CreateCreate();

        this.ModuleRefLess : this.CreateModuleRefLess();

        this.StorageTextLess : this.CreateStorageTextLess();
        return true;
    }
}