class IntParse : TextAdd
{
    maide prusate Int HexSign(var Text text)
    {
        var Int count;
        count : text.Range.Count;

        inf (count < 5)
        {
            return null;
        }

        var Data data;
        data : text.Data;
        var Int start;
        start : text.Range.Index

        inf (~(this.TextInfra.DataCharGet(data, start) = this.Char("0")))
        {
            return null;
        }
        inf (~(this.TextInfra.DataCharGet(data, start + 1) = this.Char("h")))
        {
            return null;
        }
        inf (~(this.TextInfra.DataCharGet(data, start + 2) = this.Char("s")))
        {
            return null;
        }

        var Int oa;
        oa : this.TextInfra.DataCharGet(data, start + 3);
        inf (~this.IntSignChar(oa))
        {
            return null;
        }

        var Int startA;
        startA : start + 4;
        var Int countA;
        countA : count - 4;
        this.TextA.Data = data;
        this.TextA.Range.Index = startA;
        this.TextA.Range.Count = countA;
        if (!this.IntHexChar(this.TextA))
        {
            return false;
        }
        return true;

        if (!this.IsIntHexSignValue(token))
        {
            return null;
        }



        bool negate;
        negate = this.TokenSignNegate(token, 3);

        Text line;
        line = this.SourceItem.Text.GetAt(token.Row) as Text;
        Text text;
        text = this.TextA;
        text.Data = line.Data;
        text.Range.Index = line.Range.Index + token.Range.Index + 4;
        text.Range.Count = token.Range.Count - 4;

        long o;
        o = this.IntText(text, 16);
        if (o == -1)
        {
            return null;
        }

        long max;
        max = 0;
        if (!negate)
        {
            max = this.ClassInfra.IntSignPositeMax;
        }
        if (negate)
        {
            max = this.ClassInfra.IntSignNegateMax;
        }

        if (max < o)
        {
            return null;
        }

        long value;
        value = 0;
        if (!negate)
        {
            value = o;
        }
        if (negate)
        {
            value = -o;
        }
    }

    protected virtual bool IntHexChar(Text text)
    {
        TextInfra textInfra;
        textInfra = this.TextInfra;

        Data data;
        data = text.Data;
        long start;
        start = text.Range.Index;
        long count;
        count = text.Range.Count;
        long i;
        i = 0;
        while (i < count)
        {
            long index;
            index = start + i;

            long ka;
            ka = textInfra.DataCharGet(data, index);

            if (!(textInfra.Digit(ka) | textInfra.HexAlpha(ka, false)))
            {
                return false;
            }
            i = i + 1;
        }
        return true;
    }

    maide precate Bool IntSignChar(var Int value)
    {
        return (value = this.Char("p")) | (value = this.Char("n"));
    }
}