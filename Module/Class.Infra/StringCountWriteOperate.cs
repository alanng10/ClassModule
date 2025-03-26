namespace Saber.Infra;

public class StringCountWriteOperate : WriteOperate
{
    public override bool ExecuteChar(long n)
    {
        long index;
        index = this.Arg.Index;
        index = index + 1;
        this.Arg.Index = index;
        return true;
    }
}