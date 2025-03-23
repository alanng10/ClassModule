class NameValid : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.TextInfra : share TextInfra;
        this.StringComp : share StringComp;
        this.IndexList : share IndexList;

        this.StringData : new StringData;
        this.StringData.Init();

        var Text text;
        text : new Text;
        text.Init();
        text.Range : new InfraRange;
        text.Range.Init();
        this.Text : text;

        this.TextDot : this.TextInfra.TextCreateStringData(".", null);
        return true;
    }

    field prusate TextLess TextLess { get { return data; } set { data : value; } }
    field prusate IntLess CharLess { get { return data; } set { data : value; } }
    field prusate TextForm TextForm { get { return data; } set { data : value; } }
    field precate TextInfra TextInfra { get { return data; } set { data : value; } }
    field precate StringComp StringComp { get { return data; } set { data : value; } }
    field precate IndexList IndexList { get { return data; } set { data : value; } }
    field precate StringData StringData { get { return data; } set { data : value; } }
    field precate Text Text { get { return data; } set { data : value; } }
    field precate Text TextDot { get { return data; } set { data : value; } }

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
        dot : this.TextDot;
    }
}