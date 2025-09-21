class BinaryStateSetOperate : BinaryStateOperate
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        return true;
    }

    field precate InfraInfra InfraInfra { get { return data; } set { data : value; } }

    public override bool ExecuteTravelStart()
    {
        BinaryStateArg arg;
        arg : this.State.Arg;

        long ka;
        ka : arg.StateIndex;
        ka : ka * sizeof(long);

        long count;
        count : this.InfraInfra.DataIntGet(arg.OperateCountData, ka);

        this.State.ExecuteCount(count);

        arg.OperateIndex : 0;
        return true;
    }

    public override bool ExecuteTravelEnd()
    {
        BinaryStateArg arg;
        arg : this.State.Arg;

        arg.OperateIndex : 0;
        arg.StateIndex : arg.StateIndex + 1;
        return true;
    }

    public override bool ExecuteOperate()
    {
        BinaryStateArg arg;
        arg : this.State.Arg;

        arg.OperateIndex : arg.OperateIndex + 1;
        return true;
    }

    public override bool ExecuteByte(long value)
    {
        BinaryStateArg arg;
        arg : this.State.Arg;

        long index;
        index : arg.Index;

        arg.Data.Set(index, value);

        index : index + 1;
        arg.Index : index;
        return true;
    }
}