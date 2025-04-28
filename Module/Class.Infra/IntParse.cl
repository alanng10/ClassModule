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

        var Int kaa;
        kaa : this.TextInfra.DataCharGet(data, start + 3);

        var Bool negate
        negate : this.IntSign(kaa);

        inf (negate = null)
        {
            return null;
        }

        var Int startA;
        startA : start + 4;
        var Int countA;
        countA : count - 4;
        this.TextA.Data : data;
        this.TextA.Range.Index : startA;
        this.TextA.Range.Count : countA;
        inf (~this.IntHex(this.TextA))
        {
            return null;
        }

        var Int k;
        k : this.IntText(text, 16);
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

    maide precate Bool IntHex(var Text text)
    {
        var TextInfra textInfra;
        textInfra : this.TextInfra;

        var Data data;
        data : text.Data;
        var Int index;
        index : text.Range.Index;
        var Int count;
        count : text.Range.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Int kk;
            kk : index + i;

            var Int ka;
            ka : textInfra.DataCharGet(data, kk);

            inf (~(textInfra.Digit(ka) | textInfra.HexAlpha(ka, false)))
            {
                return false;
            }
            i : i + 1;
        }
        return true;
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