namespace Saber.Infra;

public class StringSetWriteOperate : WriteOperate
{
    public override bool Init()
    {
        base.Init();
        this.TextInfra = TextInfra.This;
        return true;
    }

    protected virtual TextInfra TextInfra { get; set; }

    public override bool ExecuteChar(long n)
    {
        long index;
        index = this.Arg.Index;

        this.TextInfra.DataCharSet(this.Arg.Data, index, n);
        
        index = index + 1;

        this.Arg.Index = index;
        return true;
    }
}