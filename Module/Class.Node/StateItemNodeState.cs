namespace Saber.Node;

public class StateItemNodeState : NodeState
{
    public override bool Execute()
    {
        Range range;
        range = this.Arg as Range;

        Node a;
        a = this.Create.ExecuteExecute(range);
        this.Result = a;
        return true;
    }
}