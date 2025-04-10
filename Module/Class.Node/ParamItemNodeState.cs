namespace Saber.Node;

public class ParamItemNodeState : NodeState
{
    public override bool Execute()
    {
        Range range;
        range = this.Arg as Range;

        Node a;
        a = this.Create.ExecuteVar(range);
        this.Result = a;
        return true;
    }
}