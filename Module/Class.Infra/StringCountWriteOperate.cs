namespace Saber.Infra;

public class StringCountWriteOperate : WriteOperate
{
    public override bool ExecuteChar(long n)
    {
        long index;
        index = this.Write.Index;
        index = index + 1;
        this.Write.Index = index;
        return true;
    }
}