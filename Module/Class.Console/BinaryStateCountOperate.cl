class BinaryStateCountOperate : BinaryStateOperate
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        return true;
    }

    field precate InfraInfra InfraInfra { get { return data; } set { data : value; } }

    maide prusate Bool ExecuteTravelStart()
    {
        var BinaryStateArg arg;
        arg : this.State.Arg;

        this.State.ExecuteCount(0);

        arg.OperateIndex : 0;
        return true;
    }

    maide prusate Bool ExecuteTravelEnd()
    {
        var BinaryStateArg arg;
        arg : this.State.Arg;

        var Int count;
        count : arg.OperateIndex;

        var Int ka;
        ka : arg.StateIndex;
        ka : ka * 8;

        this.InfraInfra.DataIntSet(arg.OperateCountData, ka, count);

        arg.OperateIndex : 0;
        arg.StateIndex : arg.StateIndex + 1;
        return true;
    }

    maide prusate Bool ExecuteOperate()
    {
        var BinaryStateArg arg;
        arg : this.State.Arg;

        arg.OperateIndex : arg.OperateIndex + 1;
        return true;
    }

    maide prusate Bool ExecuteByte(var Int value)
    {
        var BinaryStateArg arg;
        arg : this.State.Arg;

        var Int index;
        index : arg.Index;
        index : index + 1;
        arg.Index : index;
        return true;
    }
}