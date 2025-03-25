class NameValid : TextAdd
{
    maide prusate Bool Init()
    {
        base.Init();
        this.IndexList : share IndexList;
        return true;
    }

    field precate IndexList IndexList { get { return data; } set { data : value; } }

    maide prusate Bool Name(var Text text)
    {
        inf (this.Index(text))
        {
            return false;
        }

        return this.NamePart(text);
    }

    maide prusate Bool NamePart(var Text text)
    {
        var TextInfra textInfra;
        textInfra : this.TextInfra;

        var TextForm textForm;
        textForm : this.TextForm;

        inf (text.Range.Count = 0)
        {
            return false;
        }

        var Data data;
        data : text.Data;
        var Int start;
        start : text.Range.Index;

        var Int index;
        index : start;
        var Int n;
        n : textInfra.DataCharGet(data, index);

        n : textForm.Execute(n);

        inf (~(textInfra.Alpha(n, true) | textInfra.Alpha(n, false)))
        {
            return false;
        }

        var Int line;
        line : textInfra.Char("_");

        var Bool b;
        b : false;

        var Int count;
        count : text.Range.Count;
        count : count - 1;

        start : start + 1;

        var Int i;
        i : 0;
        while (~b & i < count)
        {
            index : start + i;

            n : textInfra.DataCharGet(data, index);

            n : textForm.Execute(n);

            var Bool ba;
            ba: textInfra.Alpha(n, true) | textInfra.Alpha(n, false) | textInfra.Digit(n) | n = line;

            inf (~ba)
            {
                b : true;
            }
            i : i + 1;
        }

        var Bool a;
        a : ~b;
        return a;
    }

    maide prusate Bool ModuleName(var Text text)
    {
        var TextInfra textInfra;
        textInfra : this.TextInfra;

        var Less less;
        less : this.TextLess;

        var Text dot;
        dot : this.TA(".");

        var InfraRange range;
        range : text.Range;

        var Int ka;
        var Int kb;
        ka : range.Index;
        kb : range.Count;
        var Int kc;
        kc : ka + kb;

        var Bool b;
        b : false;

        var Int kk;
        kk : textInfra.Index(text, dot, less);

        var Int index;
        var Int count;
        index : ka;
        count : kb;
        while (~b & ~(kk = null))
        {
            count : kk;
            range.Count : count;

            inf (~this.NamePart(text))
            {
                b : true;
            }

            inf (~b)
            {
                index : index + kk + 1;
                count : kc - index;

                range.Index : index;
                range.Count : count;

                kk : textInfra.Index(text, dot, less);
            }
        }

        var Bool ba;
        ba : false;

        inf (~ba)
        {
            inf (b)
            {
                ba : true;
            }
        }
        inf (~ba)
        {
            count : kc - index;
            range.Count : count;

            inf (~this.NamePart(text))
            {
                ba : true;
            }
        }

        range.Index : ka;
        range.Count : kb;

        var Bool a;
        a : ~ba;
        return a;
    }

    maide prusate Bool Index(var Text text)
    {
        var TextInfra textInfra;
        textInfra : this.TextInfra;
        var IndexList indexList;
        indexList : this.IndexList;

        var TextLess less;
        less : this.TextLess;

        var Bool b;
        b : false;

        var Int count;
        count : indexList.Count;
        var Int i;
        i : 0;
        while (~b & i < count)
        {
            var Index ka;
            ka : indexList.Get(i);
            var String kb;
            kb : ka.Text;

            inf (textInfra.Same(text, this.TA(kb), less))
            {
                b : true;
            }
            i : i + 1;
        }

        this.ClearData();

        var Bool a;
        a : b;
        return a;
    }
}