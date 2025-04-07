namespace Saber.Infra;

public class StoragePathValid : TextAdd
{
    public override bool Init()
    {
        base.Init();
        this.StorageInfra = StorageInfra.This;
        return true;
    }

    protected virtual StorageInfra StorageInfra { get; set; }

    public virtual bool ValidSourcePath(Text text)
    {
        bool a;
        a = this.PrivateValidSourcePath(text);

        this.ClearData();
        return a;
    }

    private bool PrivateValidSourcePath(Text text)
    {
        if (text.Range.Count == 0)
        {
            return false;
        }

        long ka;
        long kb;
        ka = text.Range.Index;
        kb = text.Range.Count;

        text.Range.Index = ka + kb - 1;
        text.Range.Count = 1;

        bool ba;
        ba = this.TextSame(text, this.TA("/"));

        text.Range.Index = ka;
        text.Range.Count = kb;

        if (ba)
        {
            return false;
        }

        long kaa;
        kaa = this.TextIndex(text, this.TA("\\"));

        if (!(kaa == -1))
        {
            return false;
        }

        long kab;
        kab = this.TextIndex(text, this.TA("//"));

        if (!(kab == -1))
        {
            return false;
        }

        return true;
    }

    public virtual bool ValidDestPath(Text text)
    {
        if (!this.ValidSourcePath(text))
        {
            return false;
        }

        if (!this.StorageInfra.PathRelate(text, this.TLess))
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
        combine = this.TA(this.TextInfra.PathCombine);
        Text dot;
        dot = this.TB(".");
        Text dotDot;
        dotDot = this.TC("..");

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
            long ke;
            ke = textRange.Count;

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
                textRange.Count = ke;

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

        bool a;
        a = b;

        this.ClearData();
        return a;
    }
}