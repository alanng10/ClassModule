class StoragePathValid : TextAdd
{
    maide prusate Bool Init()
    {
        base.Init();
        this.StorageInfra : share StorageInfra;
        return true;
    }

    field precate StorageInfra StorageInfra { get { return data; } set { data : value; } }
}