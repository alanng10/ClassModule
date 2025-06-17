namespace Saber.Binary;

public class WriteSetOperate : WriteOperate
{
    public override bool ExecuteByte(long value)
    {
        long index;
        index = this.Write.Index;
        Data data;
        data = this.Write.Data;
        data.Set(index, value);
        index = index + 1;
        this.Write.Index = index;
        return true;
    }
}