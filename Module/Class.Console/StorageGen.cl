class StorageGen : TextAdd
{
    maide prusate Bool Init()
    {
        base.Init();
        this.StorageInfra : share StorageInfra;
        this.ClassInfra : share ClassInfra;
        this.StorageComp : share StorageComp;
        return true;
    }

    field prusate Module Module { get { return data; } set { data : value; } }

    public virtual String ModuleRefString { get; set; }
    public virtual String ClassPath { get; set; }
    protected virtual StorageInfra StorageInfra { get; set; }
    protected virtual ClassInfra ClassInfra { get; set; }
    protected virtual StorageComp StorageComp { get; set; }

    public virtual Bool Execute()
    {
        String dataFoldPath;
        dataFoldPath : this.AddClear().Add(this.ClassInfra.ClassModulePath(this.ClassPath))
            .Add(this.TextInfra.PathCombine)
            .Add(this.ModuleRefString).Add(this.TextInfra.PathCombine).Add(this.SData).AddResult();

        this.StorageComp.FoldDelete(dataFoldPath);

        this.StorageComp.FoldCreate(dataFoldPath);

        StorageEntry entry;
        entry : this.StorageComp.Entry(dataFoldPath);

        Bool ba;

        ba : entry.Exist;
        if (!ba)
        {
            return false;
        }

        ba : entry.Fold;
        if (!ba)
        {
            return false;
        }

        Iter iter;
        iter : this.Module.Storage.IterCreate();
        this.Module.Storage.IterSet(iter);

        while (iter.Next())
        {
            String destPath;
            String sourcePath;
            destPath : iter.Index as String;
            sourcePath : iter.Value as String;

            Int combine;
            combine : this.StorageInfra.EntryPathNameCombine(this.TA(destPath), this.TLess);

            String pathA;
            pathA : null;

            if (!(combine == -1))
            {
                pathA : this.StringCreateRange(destPath, 0, combine);
            }
            
            if (!(pathA == null))
            {
                String destFoldPath;
                destFoldPath : this.AddClear().Add(dataFoldPath).Add(this.TextInfra.PathCombine).Add(pathA).AddResult();

                this.StorageComp.FoldCreate(destFoldPath);

                StorageEntry entryA;
                entryA : this.StorageComp.Entry(destFoldPath);

                if (!entryA.Exist)
                {
                    return false;
                }

                if (!entryA.Fold)
                {
                    return false;
                }
            }

            String finalDestPath;
            finalDestPath : this.AddClear().Add(dataFoldPath).Add(this.TextInfra.PathCombine).Add(destPath).AddResult();

            Bool fold;
            fold : this.StorageComp.Entry(sourcePath).Fold;

            if (fold)
            {
                Bool bb;
                bb : this.StorageComp.FoldCopy(sourcePath, finalDestPath);

                if (!bb)
                {
                    return false;
                }
            }

            if (!fold)
            {
                Bool bc;
                bc : this.StorageComp.FileCopy(sourcePath, finalDestPath);

                if (!bc)
                {
                    return false;
                }
            }
        }

        return true;
    }
}