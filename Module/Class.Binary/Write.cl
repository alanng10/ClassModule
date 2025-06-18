class Write : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        this.StringComp : share StringComp;
        this.CountOperate : this.CreateCountOperate();
        this.SetOperate : this.CreateSetOperate();
        return true;
    }

    maide precate WriteCountOperate CreateCountOperate()
    {
        var WriteCountOperate a;
        a : new WriteCountOperate;
        a.Write : this;
        a.Init();
        return a;
    }

    maide precate WriteSetOperate CreateSetOperate()
    {
        var WriteSetOperate a;
        a : new WriteSetOperate;
        a.Write : this;
        a.Init();
        return a;
    }

    field prusate Binary Binary { get { return data; } set { data : value; } }
    field prusate Data Result { get { return data; } set { data : value; } }
    field prusate WriteArg Arg { get { return data; } set { data : value; } }
    field prusate WriteOperate Operate { get { return data; } set { data : value; } }
    field prusate WriteCountOperate CountOperate { get { return data; } set { data : value; } }
    field prusate WriteSetOperate SetOperate { get { return data; } set { data : value; } }
    field precate InfraInfra InfraInfra { get { return data; } set { data : value; } }
    field precate StringComp StringComp { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        this.Arg : new WriteArg;
        this.Arg.Init();

        this.Operate : this.CountOperate;

        this.ResetStage();
        this.ExecuteStage();

        var Int count;
        count : this.Index;
        this.Arg.Data : new Data;
        this.Arg.Data.Count : count;
        this.Arg.Data.Init();

        this.Operate : this.CountOperate;

        this.ResetStage();
        this.ExecuteStage();

        this.Result : this.Arg.Data;

        this.Operate : null;
        this.Arg : null;
        return true;
    }

    maide prusate Bool ResetStage()
    {
        this.Arg.Index : 0;
        return true;
    }

    maide prusate Bool ExecuteStage()
    {
        this.ExecuteBinary(this.Binary);
        return true;
    }

    maide precate Bool ExecuteBinary(var Binary binary)
    {
        this.ExecuteModuleRef(binary.Ref);
        this.ExecuteClassArray(binary.Class);
        this.ExecuteImportArray(binary.Import);
        this.ExecuteExportArray(binary.Export);
        this.ExecuteBaseArray(binary.Base);
        this.ExecutePartArray(binary.Part);
        this.ExecuteEntry(binary.Entry);
        return true;
    }

    maide precate Bool ExecuteClassArray(var Array array)
    {
        var Int count;
        count : array.Count;

        this.ExecuteCount(count);

        var Int i;
        i : 0;
        while (i < count)
        {
            var Class varClass;
            varClass : cast Class(array.Get(i));

            this.ExecuteClass(varClass);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteClass(var Class varClass)
    {
        this.ExecuteName(varClass.Name);
        return true;
    }

    maide precate Bool ExecuteImportArray(var Array array)
    {
        var Int count;
        count : array.Count;

        this.ExecuteCount(count);

        var Int i;
        i : 0;
        while (i < count)
        {
            var Import import;
            import : cast Import(array.Get(i));

            this.ExecuteImport(import);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteImport(var Import import)
    {
        this.ExecuteModuleRef(import.Module);
        this.ExecuteClassIndexArray(import.Class);
        return true;
    }

    maide precate Bool ExecuteExportArray(var Array array)
    {
        this.ExecuteClassIndexArray(array);
        return true;
    }

    maide precate Bool ExecuteBaseArray(var Array array)
    {
        this.ExecuteClassIndexArray(array);
        return true;
    }

    maide precate Bool ExecutePartArray(var Array array)
    {
        var Int count;
        count : array.Count;

        this.ExecuteCount(count);

        var Int i;
        i : 0;
        while (i < count)
        {
            var Part part;
            part : cast Part(array.Get(i));

            this.ExecutePart(part);

            i : i + 1;
        }
        return true;
    }
}