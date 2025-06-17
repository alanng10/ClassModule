namespace Saber.Binary;

public class WriteCountOperate : WriteOperate
{
    public override bool ExecuteByte(long value)
    {
        long index;
        index = this.Write.Index;
        index = index + 1;
        this.Write.Index = index;
        return true;
    }
}