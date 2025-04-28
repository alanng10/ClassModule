namespace Class.Infra;

public class IntParse : TextAdd
{
    public virtual long HexValue(Text text)
    {
        long count;
        count = text.Range.Count;

        if (count < 3)
        {
            return null;
        }

        Data data;
        data = text.Data;
        long index;
        index = text.Range.Index;

        if (!(this.TextInfra.DataCharGet(data, index) == '0'))
        {
            return null;
        }
        if (!(this.TextInfra.DataCharGet(data, index + 1) == 'h'))
        {
            return null;
        }

        long indexA;
        long countA;
        indexA = index + 2;
        countA = count - 2;
        this.TextA.Data = data;
        this.TextA.Range.Index = indexA;
        this.TextA.Range.Count = countA;
        if (!this.IntHex(this.TextA))
        {
            return false;
        }

        this.TextA.Data = data;
        this.TextA.Range.Index = index + 2;
        this.TextA.Range.Count = count - 2;

        long value;
        value = this.IntText(this.TextA, 16);
        if (value == -1)
        {
            return null;
        }

        long a;
        a = value;
        return a;
    }
}