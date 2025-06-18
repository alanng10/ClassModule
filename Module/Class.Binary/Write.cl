class Write : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        this.StringComp : share StringComp;
        this.CountOperate : this.CreateCountOperate();
        this.SetOperate : this.CreateSetOperate();
        return true;
    }

    maide precate WriteCountOperate CreateCountOperate()
    {
        var WriteCountOperate a;
        a : new WriteCountOperate;
        a.Write : this;
        a.Init();
        return a;
    }

    maide precate WriteSetOperate CreateSetOperate()
    {
        var WriteSetOperate a;
        a : new WriteSetOperate;
        a.Write : this;
        a.Init();
        return a;
    }
}