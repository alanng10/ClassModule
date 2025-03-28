class StringWrite : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.TextInfra : share TextInfra;
        this.ClassInfra : share Infra;
        this.StringComp : share StringComp;

        this.Arg : this.CreateArg();
        this.CountOperate : this.CreateCountOperate();
        this.SetOperate : this.CreateSetOperate();
        return true;
    }

    maide precate StringWriteArg CreateArg()
    {
        var StringWriteArg a;
        a : new StringWriteArg;
        a.Init();
        return a;
    }
}