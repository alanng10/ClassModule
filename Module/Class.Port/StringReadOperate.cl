class StringReadOperate : ReadOperate
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        this.ListInfra : share ListInfra;
        this.TextInfra : share TextInfra;
        this.ClassInfra : share ClassInfra;

        this.String : this.CreateString();
        this.Array : this.CreateArray();
        this.Port : this.CreatePort();
        this.ModuleRef : this.CreateModuleRef();
        this.Import : this.CreateImport();
        this.ImportClass : this.CreateImportClass();
        this.Export : this.CreateExport();
        this.Storage : this.CreateStorage();
        return true;
    }

    maide precate String CreateString()
    {
        return this.TextInfra.Zero;
    }

    maide precate Array CreateArray()
    {
        return this.ListInfra.ArrayCreate(0);
    }

    maide precate Port CreatePort()
    {
        var Port a;
        a : new Port;
        a.Init();
        return a;
    }

    maide precate ModuleRef CreateModuleRef()
    {
        return this.ClassInfra.ModuleRefCreate(null, 0);
    }

    maide precate Import CreateImport()
    {
        var Import a;
        a : new Import;
        a.Init();
        return a;
    }

    maide precate ImportClass CreateImportClass()
    {
        var ImportClass a;
        a : new ImportClass;
        a.Init();
        return a;
    }

    maide precate Export CreateExport()
    {
        var Export a;
        a : new Export;
        a.Init();
        return a;
    }

    maide precate Storage CreateStorage()
    {
        var Storage a;
        a : new Storage;
        a.Init();
        return a;
    }

    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate TextInfra TextInfra { get { return data; } set { data : value; } }
    field precate ClassInfra ClassInfra { get { return data; } set { data : value; } }
    field precate String String { get { return data; } set { data : value; } }
    field precate Array Array { get { return data; } set { data : value; } }
    field precate Port Port { get { return data; } set { data : value; } }
    field precate ModuleRef ModuleRef { get { return data; } set { data : value; } }
    field precate Import Import { get { return data; } set { data : value; } }
    field precate ImportClass ImportClass { get { return data; } set { data : value; } }
    field precate Export Export { get { return data; } set { data : value; } }
    field precate Storage Storage { get { return data; } set { data : value; } }

    maide prusate String ExecuteString(var Int row, var Range range)
    {
        var InfraInfra infraInfra;
        infraInfra : this.InfraInfra;

        var ReadArg arg;
        arg : this.Arg;

        var Int index;
        index : arg.StringIndex;

        var Data data;
        data : arg.StringTextData;
        var Int nn;
        nn : index;
        nn : nn * 3;
        var Int ka;
        ka : 8;

        var Int na;
        na : nn * ka;
        infraInfra.DataIntSet(data, na, row);

        na : (nn + 1) * ka;
        infraInfra.DataIntSet(data, na, range.Index);

        na : (nn + 2) * ka;
        infraInfra.DataIntSet(data, na, range.Count);

        arg.StringIndex : index + 1;
        return this.String;
    }
}