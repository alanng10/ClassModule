namespace Saber.Node;

public class PartItemNodeState : NodeState
{
    public override bool Execute()
    {
        Range range;
        range = this.Arg as Range;

        Node a;
        a = this.Create.ExecuteComp(range);
        this.Result = a;
        return true;
    }
}