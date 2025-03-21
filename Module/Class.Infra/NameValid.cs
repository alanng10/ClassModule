namespace Saber.Infra;

public class NameValid : Any
{
    public override bool Init()
    {
        base.Init();
        this.TextInfra = TextInfra.This;
        this.StringComp = StringComp.This;
        this.StringValue = StringValue.This;
        this.IndexList = IndexList.This;

        this.StringData = new StringData();
        this.StringData.Init();

        Text text;
        text = new Text();
        text.Init();
        text.Range = new InfraRange();
        text.Range.Init();
        this.Text = text;

        String o;
        o = this.StringValue.Execute(".");

        this.DotText = this.TextInfra.TextCreateStringData(o, null);
        return true;
    }

    public virtual TextLess TextLess { get; set; }
    public virtual LessInt CharLess { get; set; }
    public virtual TextForm TextForm { get; set; }
    protected virtual TextInfra TextInfra { get; set; }
    protected virtual StringComp StringComp { get; set; }
    protected virtual StringValue StringValue { get; set; }
    protected virtual IndexList IndexList { get; set; }
    protected virtual StringData StringData { get; set; }
    protected virtual Text Text { get; set; }
    protected virtual Text DotText { get; set; }

    public virtual bool Name(Text text)
    {
        if (this.Index(text))
        {
            return false;
        }

        return this.NamePart(text);
    }

    public virtual bool NamePart(Text text)
    {
        TextInfra textInfra;
        textInfra = this.TextInfra;

        TextForm textForm;
        textForm = this.TextForm;

        if (text.Range.Count < 1)
        {
            return false;
        }

        Data data;
        data = text.Data;
        long start;
        start = text.Range.Index;

        long index;
        index = start;
        long n;
        n = textInfra.DataCharGet(data, index);

        n = textForm.Execute(n);

        if (!(textInfra.Alpha(n, true) | textInfra.Alpha(n, false)))
        {
            return false;
        }

        bool b;
        b = false;

        long count;
        count = text.Range.Count;
        count = count - 1;

        start = start + 1;

        long i;
        i = 0;
        while (!b & i < count)
        {
            index = start + i;

            n = textInfra.DataCharGet(data, index);

            n = textForm.Execute(n);

            bool ba;
            ba = textInfra.Alpha(n, true) | textInfra.Alpha(n, false) | textInfra.Digit(n) | n == '_';

            if (!ba)
            {
                b = true;
            }
            i = i + 1;
        }

        bool a;
        a = !b;
        return a;
    }

    public virtual bool ModuleName(Text text)
    {
        TextInfra textInfra;
        textInfra = this.TextInfra;

        Less less;
        less = this.TextLess;

        Text dot;
        dot = this.DotText;

        InfraRange range;
        range = text.Range;

        long aa;
        long ab;
        aa = range.Index;
        ab = range.Count;
        long ac;
        ac = aa + ab;

        bool b;
        b = false;

        long u;
        u = textInfra.Index(text, dot, less);

        long index;
        long count;
        index = aa;
        count = ab;
        while (!b & !(u == -1))
        {
            count = u;
            range.Count = count;

            if (!this.NamePart(text))
            {
                b = true;
            }

            if (!b)
            {
                index = index + u + 1;
                count = ac - index;

                range.Index = index;
                range.Count = count;

                u = textInfra.Index(text, dot, less);
            }
        }

        bool ba;
        ba = false;

        if (!ba)
        {
            if (b)
            {
                ba = true;
            }
        }
        if (!ba)
        {
            count = ac - index;
            range.Count = count;

            if (!this.NamePart(text))
            {
                ba = true;
            }
        }

        range.Index = aa;
        range.Count = ab;

        bool a;
        a = !ba;
        return a;
    }

    public virtual bool Index(Text text)
    {
        TextInfra textInfra;
        textInfra = this.TextInfra;
        IndexList indexList;
        indexList = this.IndexList;

        TextLess less;
        less = this.TextLess;

        Text oo;
        oo = this.Text;
        long count;
        count = indexList.Count;
        long i;
        i = 0;
        while (i < count)
        {
            Index a;
            a = indexList.Get(i);
            String o;
            o = a.Text;

            this.TextStringGet(oo, o);

            if (textInfra.Same(text, oo, less))
            {
                return true;
            }
            i = i + 1;
        }
        return false;
    }

    protected virtual bool TextStringGet(Text text, String o)
    {
        StringData d;
        d = this.StringData;
        d.ValueString = o;

        text.Data = d;
        text.Range.Index = 0;
        text.Range.Count = this.StringComp.Count(o);
        return true;
    }
}