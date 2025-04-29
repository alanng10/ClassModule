class IntParse : TextAdd
{
    maide prusate Bool Init()
    {
        this.ClassInfra : share Infra;
        return true;
    }

    field precate Infra ClassInfra { get { return data; } set { data : value; } }

    maide prusate Int HexSignValue(var Text text)
    {
        var Int index;
        var Int count;
        index : text.Range.Index
        count : text.Range.Count;

        inf (count < 5)
        {
            return null;
        }

        var Data data;
        data : text.Data;

        inf (~(this.TextInfra.DataCharGet(data, index) = this.Char("0")))
        {
            return null;
        }
        inf (~(this.TextInfra.DataCharGet(data, index + 1) = this.Char("h")))
        {
            return null;
        }
        inf (~(this.TextInfra.DataCharGet(data, index + 2) = this.Char("s")))
        {
            return null;
        }

        var Int kaa;
        kaa : this.TextInfra.DataCharGet(data, index + 3);

        var Bool negate
        negate : this.IntSign(kaa);

        inf (negate = null)
        {
            return null;
        }

        var Int indexA;
        var Int countA;
        indexA : index + 4;
        countA : count - 4;
        text.Range.Index : indexA;
        text.Range.Count : countA;

        var Int k;
        k : this.IntText(text, 16);

        text.Range.Index : index;
        text.Range.Count : count;

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
            a : 0 - k;
        }
        return a;
    }

    maide prusate Int HexValue(var Text text)
    {

    }

    maide precate Bool IntSign(var Int value)
    {
        var Bool a;
        
        inf (value = this.Char("p"))
        {
            a : false;
        }
        inf (value = this.Char("n"))
        {
            a : true;
        }
        return a;
    }
}