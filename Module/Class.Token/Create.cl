class Create : ClassCreate
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        this.ListInfra : share ListInfra;
        this.ClassInfra : share ClassInfra;

        this.CountOperate : this.CreateCountOperate();
        this.SetOperate : this.CreateSetOperate();
        return true;
    }

    maide precate CountCreateOperate CreateCountOperate()
    {
        var CountCreateOperate a;
        a : new CountCreateOperate;
        a.Create : this;
        a.Init();
        return a;
    }

    maide precate SetCreateOperate CreateSetOperate()
    {
        var SetCreateOperate a;
        a : new SetCreateOperate;
        a.Create : this;
        a.Init();
        return a;
    }
}