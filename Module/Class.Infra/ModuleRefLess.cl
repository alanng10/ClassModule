class ModuleRefLess : Less
{
    maide prusate Bool Init()
    {
        base.Init();
        this.TextInfra : share TextInfra;

        this.StringLess : this.TextInfra.StringLessCreate();

        this.IntLess : new IntLess;
        this.IntLess.Init();
        return true;
    }

    field precate TextInfra TextInfra { get { return data; } set { data : value; } }
    field precate StringLess StringLess { get { return data; } set { data : value; } }
    field precate IntLess IntLess { get { return data; } set { data : value; } }
}