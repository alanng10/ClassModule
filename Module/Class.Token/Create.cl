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

    field prusate Array Source { get { return data; } set { data : value; } }
    field prusate Result Result { get { return data; } set { data : value; } }
    field prusate CreateArg Arg { get { return data; } set { data : value; } }
    field precate CountCreateOperate CountOperate { get { return data; } set { data : value; } }
    field precate SetCreateOperate SetOperate { get { return data; } set { data : value; } }
    field precate CreateOperate Operate { get { return data; } set { data : value; } }
    field precate Array Code { get { return data; } set { data : value; } }
    field precate Source SourceItem { get { return data; } set { data : value; } }
    field precate Int Row { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        this.Result : new Result;
        this.Result.Init();

        this.Code : this.CreateCodeArray();

        this.Result.Code : this.Code;
        this.Result.Error : this.ListInfra.ArrayCreate(0);

        this.Arg : new CreateArg;
        this.Arg.Init();

        var CreateArg arg;
        arg : this.Arg;
    }
}