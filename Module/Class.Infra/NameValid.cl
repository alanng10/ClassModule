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

        this.DotText : this.TextInfra.TextCreateStringData(".", null);
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
    field precate Text DotText { get { return data; } set { data : value; } }

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
    }
}