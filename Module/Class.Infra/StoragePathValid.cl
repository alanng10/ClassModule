class StoragePathValid : TextAdd
{
    maide prusate Bool Init()
    {
        base.Init();
        this.StorageInfra : share StorageInfra;
        return true;
    }

    field precate StorageInfra StorageInfra { get { return data; } set { data : value; } }

    maide prusate Bool ValidSourcePath(var Text text)
    {
        var Bool a;
        a : this.PrivateValidSourcePath(text);

        this.ClearData();
        return a;
    }

    maide private Bool PrivateValidSourcePath(var Text text)
    {
        var TextInfra textInfra;
        textInfra : this.TextInfra;

        inf (text.Range.Count = 0)
        {
            return false;
        }

        var Int ka;
        var Int kb;
        ka : text.Range.Index;
        kb : text.Range.Count;

        text.Range.Index : (ka + kb) - 1;
        text.Range.Count : 1;

        var Bool ba;
        ba : textInfra.Same(text, this.TA("/"), this.TextLess);

        text.Range.Index : ka;
        text.Range.Count : kb;

        inf (ba)
        {
            return false;
        }

        var Int kaa;
        kaa : textInfra.Index(text, this.TA("\\"), this.TextLess);

        inf (~(kaa = null))
        {
            return false;
        }

        var Int kab;
        kab : textInfra.Index(text, this.TA("//"), this.TextLess);

        inf (~(kab = null))
        {
            return false;
        }

        return true;
    }

    maide prusate Bool ValidDestPath(var Text text)
    {
        inf (~this.ValidSourcePath(text))
        {
            return false;
        }

        inf (~this.StorageInfra.PathRelate(text, this.TextLess))
        {
            return false;
        }

        inf (this.HasDotOrnDotDot(text))
        {
            return false;
        }

        return true;
    }

    maide precate Bool HasDotOrnDotDot(var Text text)
    {
        var TextInfra textInfra;
        textInfra : this.TextInfra;
        
        var Less less;
        less : this.TextLess;

        var Text combine;
        combine : this.TA(this.TextInfra.PathCombine);
        var Text dot;
        dot : this.TB(".");
        var Text dotDot;
        dotDot : this.TC("..");

        var Int combineCount;
        combineCount : combine.Range.Count;

        var InfraRange textRange;
        textRange : text.Range;

        var Int kaa;
        var Int kab;
        kaa : textRange.Index;
        kab : textRange.Count;

        var Bool b;
        b : false;
    }
}