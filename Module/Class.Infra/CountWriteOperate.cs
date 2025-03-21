namespace Saber.Infra;

public class CountWriteOperate : WriteOperate
{
    public virtual StringValueWrite Write { get; set; }

    public override bool ExecuteChar(long n)
    {
        long index;
        index = this.Write.Index;
        index = index + 1;
        this.Write.Index = index;
        return true;
    }
}