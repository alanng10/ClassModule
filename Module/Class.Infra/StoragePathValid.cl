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
        kb : text.Range.Index;

        text.Range.Index : (ka + kb) - 1;
        text.Range.Count : 1;

        var Bool ba;
        ba : textInfra.Same(text, this.TA("/"), this.TextLess);
    }
}