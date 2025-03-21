namespace Saber.Infra;

public class StoragePathValid : Any
{
    public override bool Init()
    {
        base.Init();
        this.InfraInfra = InfraInfra.This;
        this.TextInfra = TextInfra.This;
        this.StorageInfra = StorageInfra.This;
        this.StringValue = StringValue.This;

        LessInt charLess;
        charLess = new LessInt();
        charLess.Init();
        TextForm textForm;
        textForm = new TextForm();
        textForm.Init();
        this.TextLess = new TextLess();
        this.TextLess.CharLess = charLess;
        this.TextLess.LiteForm = textForm;
        this.TextLess.RiteForm = textForm;
        this.TextLess.Init();

        this.Combine = this.TextInfra.TextCreateStringData(this.TextInfra.PathCombine, null);
        this.Slash = this.TextInfra.TextCreateStringData(this.S("/"), null);
        this.BackSlash = this.TextInfra.TextCreateStringData(this.S("\\"), null);
        this.SlashSlash = this.TextInfra.TextCreateStringData(this.S("//"), null);
        this.Dot = this.TextInfra.TextCreateStringData(this.S("."), null);
        this.DotDot = this.TextInfra.TextCreateStringData(this.S(".."), null);
        return true;
    }

    protected virtual InfraInfra InfraInfra { get; set; }
    protected virtual TextInfra TextInfra { get; set; }
    protected virtual StorageInfra StorageInfra { get; set; }
    protected virtual StringValue StringValue { get; set; }
    protected virtual TextLess TextLess { get; set; }
    protected virtual Text Combine { get; set; }
    protected virtual Text Slash { get; set; }
    protected virtual Text BackSlash { get; set; }
    protected virtual Text SlashSlash { get; set; }
    protected virtual Text Dot { get; set; }
    protected virtual Text DotDot { get; set; }

    public virtual bool IsValidSourcePath(Text text)
    {
        TextInfra textInfra;
        textInfra = this.TextInfra;

        if (text.Range.Count < 1)
        {
            return false;
        }

        long ka;
        long kb;
        ka = text.Range.Index;
        kb = text.Range.Count;

        text.Range.Index = ka + kb - 1;
        text.Range.Count = 1;

        bool b;
        b = textInfra.Same(text, this.Slash, this.TextLess);
        
        text.Range.Index = ka;
        text.Range.Count = kb;

        if (b)
        {
            return false;
        }

        long k;
        k = textInfra.Index(text, this.BackSlash, this.TextLess);

        if (!(k == -1))
        {
            return false;
        }

        k = textInfra.Index(text, this.SlashSlash, this.TextLess);

        if (!(k == -1))
        {
            return false;
        }

        return true;
    }

    public virtual bool IsValidDestPath(Text text)
    {
        if (!this.IsValidSourcePath(text))
        {
            return false;
        }

        Less less;
        less = this.TextLess;

        if (!this.StorageInfra.PathRelate(text, less))
        {
            return false;
        }

        if (this.HasDotOrnDotDot(text))
        {
            return false;
        }

        return true;
    }

    protected virtual bool HasDotOrnDotDot(Text text)
    {
        TextInfra textInfra;
        textInfra = this.TextInfra;

        Less less;
        less = this.TextLess;

        Text combine;
        combine = this.Combine;
        Text dot;
        dot = this.Dot;
        Text dotDot;
        dotDot = this.DotDot;

        long combineCount;
        combineCount = combine.Range.Count;

        InfraRange textRange;
        textRange = text.Range;

        long kaa;
        long kab;
        kaa = textRange.Index;
        kab = textRange.Count;

        bool b;
        b = false;

        long kk;
        kk = textInfra.Index(text, combine, less);
        while (!b & !(kk == -1))
        {
            long e;
            e = textRange.Count;

            textRange.Count = kk;

            if (!b)
            {
                if (textInfra.Same(text, dot, less))
                {
                    b = true;
                }
            }

            if (!b)
            {
                if (textInfra.Same(text, dotDot, less))
                {
                    b = true;
                }
            }

            if (!b)
            {
                textRange.Count = e;

                long ka;
                ka = kk + combineCount;

                textRange.Index = textRange.Index + ka;
                textRange.Count = textRange.Count - ka;

                kk = textInfra.Index(text, combine, less);
            }
        }

        if (!b)
        {
            if (textInfra.Same(text, dot, less))
            {
                b = true;
            }
        }

        if (!b)
        {
            if (textInfra.Same(text, dotDot, less))
            {
                b = true;
            }
        }

        textRange.Index = kaa;
        textRange.Count = kab;

        if (b)
        {
            return true;
        }

        return false;
    }

    private String S(string o)
    {
        return this.StringValue.Execute(o);
    }
}