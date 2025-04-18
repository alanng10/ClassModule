class Create : ClassCreate
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        this.ListInfra : share ListInfra;
        this.ClassInfra : share ClassInfra;

        this.Index : share IndexList;
        this.Limit : share LimitList;
        this.ErrorKind : share ErrorKindList;
        this.NodeKind : share NodeKindList;

        this.CountOperate : this.CreateCountOperate();
        this.KindOperate : this.CreateKindOperate();
        this.SetOperate : this.CreateSetOperate();
        this.SetArg : this.CreateSetArg();
    }
}