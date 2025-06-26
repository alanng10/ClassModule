class Read : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        this.ListInfra : share ListInfra;
        this.TextInfra : share TextInfra;
        this.ClassInfra : share ClassInfra;

        this.CountOperate : this.CreateCountOperate();
        this.StringOperate : this.CreateStringOperate();
        this.SetOperate : this.CreateSetOperate();
        return true;
    }

    maide precate ReadCountOperate CreateCountOperate()
    {
        var ReadCountOperate a;
        a : new ReadCountOperate;
        a.Read : this;
        a.Init();
        return a;
    }

    maide precate ReadStringOperate CreateStringOperate()
    {
        var ReadStringOperate a;
        a : new ReadStringOperate;
        a.Read : this;
        a.Init();
        return a;
    }

    maide precate ReadSetOperate CreateSetOperate()
    {
        var ReadSetOperate a;
        a : new ReadSetOperate;
        a.Read : this;
        a.Init();
        return a;
    }

    field prusate Data Data { get { return data; } set { data : value; } }
    field prusate Binary Result { get { return data; } set { data : value; } }
    field prusate ReadArg Arg { get { return data; } set { data : value; } }
    field prusate ReadOperate Operate { get { return data; } set { data : value; } }
    field prusate ReadCountOperate CountOperate { get { return data; } set { data : value; } }
    field prusate ReadStringOperate StringOperate { get { return data; } set { data : value; } }
    field prusate ReadSetOperate SetOperate { get { return data; } set { data : value; } }
    field precate InfraInfra InfraInfra { get { return data; } set { data : value; } }
    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate TextInfra TextInfra { get { return data; } set { data : value; } }
    field precate ClassInfra ClassInfra { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        this.Arg : new ReadArg;
        this.Arg.Init();

        this.Operate : this.CountOperate;

        this.ResetStage();
        this.ExecuteStage();

        arg.StringCountData : new Data;
        arg.StringCountData.Count : arg.StringIndex * 8;
        arg.StringCountData.Init();

        arg.StringTextData : new Data;
        arg.StringTextData.Count : arg.StringTextIndex * 4;
        arg.StringTextData.Init();

        arg.ArrayCountData : new Data;
        arg.ArrayCountData.Count : arg.ArrayIndex * 8;
        arg.ArrayCountData.Init();

        this.Operate : this.StringOperate;

        this.ResetStage();
        this.ExecuteStage();

        arg.BinaryArray : this.ListInfra.ArrayCreate(arg.BinaryIndex);
        arg.ClassArray : this.ListInfra.ArrayCreate(arg.ClassIndex);
        arg.ImportArray : this.ListInfra.ArrayCreate(arg.ImportIndex);
        arg.PartArray : this.ListInfra.ArrayCreate(arg.PartIndex);
        arg.FieldArray : this.ListInfra.ArrayCreate(arg.FieldIndex);
        arg.MaideArray : this.ListInfra.ArrayCreate(arg.MaideIndex);
        arg.VarArray : this.ListInfra.ArrayCreate(arg.VarIndex);
        arg.ModuleRefArray : this.ListInfra.ArrayCreate(arg.ModuleRefIndex);
        arg.StringArray : this.ListInfra.ArrayCreate(arg.StringIndex);
        arg.ArrayArray : this.ListInfra.ArrayCreate(arg.ArrayIndex);
    }
}