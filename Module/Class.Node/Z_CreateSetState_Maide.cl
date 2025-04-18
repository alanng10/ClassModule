class MaideCreateSetState : CreateSetState
{
    maide prusate Bool Execute()
    {
        var CreateSetStateArg arg;
        arg : cast CreateSetStateArg(this.Arg);
        var CreateSetArg k;
        k : arg.Arg;

        var Maide node;
        node : cast Maide(arg.Node);
        node.Class : cast ClassName(k.Field00);
        node.Name : cast MaideName(k.Field01);
        node.Count : cast Count(k.Field02);
        node.Param : cast Param(k.Field03);
        node.Call : cast State(k.Field04);
        return true;
    }
}