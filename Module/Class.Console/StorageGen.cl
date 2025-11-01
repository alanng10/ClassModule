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
    field prusate String ClassPath { get { return data; } set { data : value; } }
    field precate StorageInfra StorageInfra { get { return data; } set { data : value; } }
    field precate ClassInfra ClassInfra { get { return data; } set { data : value; } }
    field precate StorageComp StorageComp { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        var String moduleRefString;
        moduleRefString : this.ClassInfra.ModuleRefString(this.Module.Ref);

        var String dataFoldPath;
        dataFoldPath : this.AddClear().Add(this.ClassInfra.ClassModulePath(this.ClassPath))
            .Add(this.TextInfra.PathCombine)
            .Add(moduleRefString).Add(this.TextInfra.PathCombine).Add("Data").AddResult();

        this.StorageComp.FoldDelete(dataFoldPath);

        this.StorageComp.FoldCreate(dataFoldPath);

        StorageEntry entry;
        entry : this.StorageComp.Entry(dataFoldPath);

        var Bool ba;

        ba : entry.Exist;
        if (~ba)
        {
            return false;
        }

        ba : entry.Fold;
        if (~ba)
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

            if (~(combine == -1))
            {
                pathA : this.StringCreateRange(destPath, 0, combine);
            }
            
            if (~(pathA == null))
            {
                String destFoldPath;
                destFoldPath : this.AddClear().Add(dataFoldPath).Add(this.TextInfra.PathCombine).Add(pathA).AddResult();

                this.StorageComp.FoldCreate(destFoldPath);

                StorageEntry entryA;
                entryA : this.StorageComp.Entry(destFoldPath);

                if (~entryA.Exist)
                {
                    return false;
                }

                if (~entryA.Fold)
                {
                    return false;
                }
            }

            String finalDestPath;
            finalDestPath : this.AddClear().Add(dataFoldPath).Add(this.TextInfra.PathCombine).Add(destPath).AddResult();

            var Bool fold;
            fold : this.StorageComp.Entry(sourcePath).Fold;

            if (fold)
            {
                var Bool bb;
                bb : this.StorageComp.FoldCopy(sourcePath, finalDestPath);

                if (~bb)
                {
                    return false;
                }
            }

            if (~fold)
            {
                var Bool bc;
                bc : this.StorageComp.FileCopy(sourcePath, finalDestPath);

                if (~bc)
                {
                    return false;
                }
            }
        }

        return true;
    }
}