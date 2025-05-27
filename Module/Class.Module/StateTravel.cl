class StateTravel : Travel
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.ClassInfra : share ClassInfra;

        this.System : this.Create.System;
        this.NullClass : this.Create.NullClass;

        this.VarStack : this.CreateVarStack();
        this.VarStackIter : this.CreateVarStackIter();
        this.ParamIter : this.CreateParamIter();
        this.ArgueIter : this.CreateArgueIter();
        return true;
    }

    maide precate Stack CreateVarStack()
    {
        var Stack a;
        a : new Stack;
        a.Init();
        return a;
    }
}