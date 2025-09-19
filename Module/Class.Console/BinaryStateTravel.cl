class BinaryStateTravel : Travel
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Kind : share BinaryOperateKindList;

        this.Operate : this.CreateOperate();
        return true;
    }

    maide precate BinaryOperate CreateOperate()
    {
        var BinaryOperate a;
        a : new BinaryOperate;
        a.Init();
        return a;
    }
}