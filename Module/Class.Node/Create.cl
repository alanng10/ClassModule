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
        this.NameValid : this.CreateNameValid();
        this.StringWrite : this.CreateStringWrite();
        this.RangeA : this.CreateClassRange();
        this.RangeB : this.CreateClassRange();
        this.RangeC : this.CreateClassRange();
        this.RangeD : this.CreateClassRange();
        this.TokenA : this.CreateToken();
        this.TokenB : this.CreateToken();
        this.TokenC : this.CreateToken();
        this.TokenD : this.CreateToken();
        this.TokenE : this.CreateToken();
        this.TokenF : this.CreateToken();
        this.TokenG : this.CreateToken();
        this.TokenH : this.CreateToken();
        this.TokenI : this.CreateToken();

        this.InitListItemState();
        this.InitNodeState();
        return true;
    }

    maide precate CreateCountOperate CreateCountOperate()
    {
        var CreateCountOperate a;
        a : new CreateCountOperate;
        a.Create : this;
        a.Init();
        return a;
    }

    maide precate CreateKindOperate CreateKindOperate()
    {
        var CreateKindOperate a;
        a : new CreateKindOperate;
        a.Create : this;
        a.Init();
        return a;
    }

    maide precate CreateSetOperate CreateSetOperate()
    {
        var CreateSetOperate a;
        a : new CreateSetOperate;
        a.Create : this;
        a.Init();
        return a;
    }
}