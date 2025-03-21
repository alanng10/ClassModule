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

    maide prusate Int Execute(var Any lite, var Any rite)
    {
        var ModuleRef liteA;
        var ModuleRef riteA;
        liteA : cast ModuleRef(lite);
        riteA : cast ModuleRef(rite);

        var Int k;
        k : this.StringLess.Execute(liteA.Name, riteA.Name);

        inf (~(k = 0))
        {
            return k;
        }

        return this.IntLess.Execute(liteA.Ver, riteA.Ver);
    }
}