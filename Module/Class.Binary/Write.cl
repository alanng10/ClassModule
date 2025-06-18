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

    field prusate Binary Binary { get { return data; } set { data : value; } }
    field prusate Data Result { get { return data; } set { data : value; } }
    field prusate WriteArg Arg { get { return data; } set { data : value; } }
    field prusate WriteOperate Operate { get { return data; } set { data : value; } }
    field prusate WriteCountOperate CountOperate { get { return data; } set { data : value; } }
    field prusate WriteSetOperate SetOperate { get { return data; } set { data : value; } }
    field precate InfraInfra InfraInfra { get { return data; } set { data : value; } }
    field precate StringComp StringComp { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        this.Arg : new WriteArg;
        this.Arg.Init();

        this.Operate : this.CountOperate;

        this.ResetStage();
        this.ExecuteStage();

        var Int count;
        count : this.Index;
        this.Arg.Data : new Data;
        this.Arg.Data.Count : count;
        this.Arg.Data.Init();

        this.Operate : this.CountOperate;

        this.ResetStage();
        this.ExecuteStage();

        this.Result : this.Arg.Data;

        this.Operate : null;
        this.Arg : null;
        return true;
    }
}