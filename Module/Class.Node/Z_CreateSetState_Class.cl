class ClassCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.Arg;

        var Class node;
        node : cast Class(arg.Node);
        node.Name : cast ClassName(k.Field00);
        node.Base : cast ClassName(k.Field01);
        node.Part : cast Part(k.Field02);
        return true;
    }
}