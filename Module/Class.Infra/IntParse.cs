namespace Class.Infra;

public class IntParse : TextAdd
{
    public virtual long HexSignValue(Text text)
    {
        long count;
        count = text.Range.Count;

        if (count < 5)
        {
            return -1;
        }

        Data data;
        data = text.Data;
        long index;
        index = text.Range.Index;

        if (!(this.TextInfra.DataCharGet(data, index) = '0'))
        {
            return -1;
        }
        if (!(this.TextInfra.DataCharGet(data, index + 1) = 'h'))
        {
            return -1;
        }
        if (!(this.TextInfra.DataCharGet(data, index + 2) = 's'))
        {
            return -1;
        }

        long kaa;
        kaa = this.TextInfra.DataCharGet(data, index + 3);

        long negate;
        negate = this.IntSign(kaa);

        if (negate == -1)
        {
            return -1;
        }

        long indexA;
        long countA;
        indexA = index + 4;
        countA = count - 4;
        this.TextA.Data = data;
        this.TextA.Range.Index = indexA;
        this.TextA.Range.Count = countA;

        var Int k;
        k : this.IntText(this.TextA, 16);
        inf (k = null)
        {
            return null;
        }

        var Int max;
        inf (~negate)
        {
            max : this.ClassInfra.IntSignPositeMax;
        }
        inf (negate)
        {
            max : this.ClassInfra.IntSignNegateMax;
        }

        inf (max < k)
        {
            return null;
        }

        var Int a;

        inf (~negate)
        {
            a : k;
        }
        inf (negate)
        {
            a : -k;
        }
        return a;
    }

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
            return null;
        }

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