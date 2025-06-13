class IntParse : TextAdd
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ClassInfra : share Infra;
        return true;
    }

    field precate Infra ClassInfra { get { return data; } set { data : value; } }

    maide prusate Int HexSignValue(var Text text)
    {
        var Int index;
        var Int count;
        index : text.Range.Index;
        count : text.Range.Count;

        inf (count < 5)
        {
            return null;
        }

        inf (19 < count)
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

        var Bool negate;
        negate : this.Sign(kaa);

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

        var Int a;
        a : this.Negate(negate, k);
        return a;
    }

    maide prusate Int HexValue(var Text text)
    {
        var Int index;
        var Int count;
        index : text.Range.Index;
        count : text.Range.Count;

        inf (count < 3)
        {
            return null;
        }

        inf (17 < count)
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

        var Int indexA;
        var Int countA;
        indexA : index + 2;
        countA : count - 2;
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

        var Int a;
        a : k;
        return a;
    }

    maide prusate Int SignValue(var Text text)
    {
        var Int index;
        var Int count;
        index : text.Range.Index;
        count : text.Range.Count;

        inf (count < 4)
        {
            return null;
        }

        var Data data;
        data : text.Data;

        inf (~(this.TextInfra.DataCharGet(data, index) = this.Char("0")))
        {
            return null;
        }
        inf (~(this.TextInfra.DataCharGet(data, index + 1) = this.Char("s")))
        {
            return null;
        }

        var Int kaa;
        kaa : this.TextInfra.DataCharGet(data, index + 2);

        var Bool negate;
        negate : this.Sign(kaa);

        inf (negate = null)
        {
            return null;
        }

        var Int indexA;
        var Int countA;
        indexA : index + 3;
        countA : count - 3;
        text.Range.Index : indexA;
        text.Range.Count : countA;

        var Int k;
        k : this.IntText(text, 10);

        text.Range.Index : index;
        text.Range.Count : count;

        inf (k = null)
        {
            return null;
        }

        var Int a;
        a : this.Negate(negate, k);
        return a;
    }

    maide prusate Int Value(var Text text)
    {
        inf (text.Range.Count < 1)
        {
            return null;
        }

        var Int k;
        k : this.IntText(text, 10);

        inf (k = null)
        {
            return null;
        }

        var Int a;
        a : k;
        return a;
    }

    maide precate Int Negate(var Bool negate, var Int value)
    {
        var Int max;
        inf (~negate)
        {
            max : this.ClassInfra.IntSignPositeMax;
        }
        inf (negate)
        {
            max : this.ClassInfra.IntSignNegateMax;
        }

        inf (max < value)
        {
            return null;
        }

        var Int a;

        inf (~negate)
        {
            a : value;
        }
        inf (negate)
        {
            a : 0 - value;
        }
        return a;
    }

    maide precate Bool Sign(var Int value)
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