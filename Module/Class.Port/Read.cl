class Read : TextAdd
{
    maide prusate Bool Init()
    {
        base.Init();

        this.CountOperate : this.CreateCountOperate();
        this.StringOperate : this.CreateStringOperate();
        this.SetOperate : this.CreateSetOperate();
        return true;
    }

    maide precate CountReadOperate CreateCountOperate()
    {
        var CountReadOperate a;
        a : new CountReadOperate;
        a.Read : this;
        a.Init();
        return a;
    }

    maide precate StringReadOperate CreateStringOperate()
    {
        var StringReadOperate a;
        a : new StringReadOperate;
        a.Read : this;
        a.Init();
        return a;
    }

    maide precate SetReadOperate CreateSetOperate()
    {
        var SetReadOperate a;
        a : new SetReadOperate;
        a.Read : this;
        a.Init();
        return a;
    }
}