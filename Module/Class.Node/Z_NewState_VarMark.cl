class VarMarkNewState : InfraState
{
    maide prusate Bool Execute()
    {
        this.Result : new VarMark;
        return true;
    }
}