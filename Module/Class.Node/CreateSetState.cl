class CreateSetState : InfraState
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Arg : new CreateSetStateArg;
        this.Arg.Init();
        return true;
    }
}