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
        ba : this.TextSame(text, this.TA("/"));

        text.Range.Index : ka;
        text.Range.Count : kb;

        inf (ba)
        {
            return false;
        }

        var Int kaa;
        kaa : this.TextIndex(text, this.TA("\\"));

        inf (~(kaa = null))
        {
            return false;
        }

        var Int kab;
        kab : this.TextIndex(text, this.TA("//"));

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

        inf (~this.StorageInfra.PathRelate(text, this.TLess))
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
        var Text combine;
        var Text dot;
        var Text dotDot;
        combine : this.TA(this.TextInfra.PathCombine);
        dot : this.TB(".");
        dotDot : this.TC("..");

        var Int combineCount;
        combineCount : combine.Range.Count;

        var InfraRange range;
        range : text.Range;

        var Int kaa;
        var Int kab;
        kaa : range.Index;
        kab : range.Count;

        var Bool b;
        b : false;

        var Int kk;
        kk : this.TextIndex(text, combine);
        while (~b & ~(kk = null))
        {
            var Int ke;
            ke : range.Count;

            range.Count : kk;

            inf (~b)
            {
                inf (this.TextSame(text, dot))
                {
                    b : true;
                }
            }

            inf (~b)
            {
                inf (this.TextSame(text, dotDot))
                {
                    b : true;
                }
            }

            inf (~b)
            {
                range.Count : ke;

                var Int ka;
                ka : kk + combineCount;

                range.Index : range.Index + ka;
                range.Count : range.Count - ka;

                kk : this.TextIndex(text, combine);
            }
        }

        inf (~b)
        {
            inf (this.TextSame(text, dot))
            {
                b : true;
            }
        }

        inf (~b)
        {
            inf (this.TextSame(text, dotDot))
            {
                b : true;
            }
        }

        range.Index : kaa;
        range.Count : kab;

        var Bool a;
        a : b;

        this.ClearData();
        return a;
    }
}