namespace Saber.Node;

public class ArgueItemNodeState : NodeState
{
    public override bool Execute()
    {
        Range range;
        range = this.Arg as Range;

        Node a;
        a = this.Create.ExecuteOperate(range);
        this.Result = a;
        return true;
    }
}