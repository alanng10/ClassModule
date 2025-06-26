class Read : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        this.ListInfra : share ListInfra;
        this.TextInfra : share TextInfra;
        this.ClassInfra : share ClassInfra;

        this.CountOperate : this.CreateCountOperate();
        this.StringOperate : this.CreateStringOperate();
        this.SetOperate : this.CreateSetOperate();
        return true;
    }

    maide precate ReadCountOperate CreateCountOperate()
    {
        var ReadCountOperate a;
        a : new ReadCountOperate;
        a.Read : this;
        a.Init();
        return a;
    }

    maide precate ReadStringOperate CreateStringOperate()
    {
        var ReadStringOperate a;
        a : new ReadStringOperate;
        a.Read : this;
        a.Init();
        return a;
    }

    maide precate ReadSetOperate CreateSetOperate()
    {
        var ReadSetOperate a;
        a : new ReadSetOperate;
        a.Read : this;
        a.Init();
        return a;
    }
}