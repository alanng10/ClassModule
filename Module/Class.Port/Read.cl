class Read : TextAdd
{
    maide prusate Bool Init()
    {
        base.Init();

        this.CountOperate : this.CreateCountOperate();
        this.StringOperate : this.CreateStringOperate();
        this.SetOperate : this.CreateSetOperate();
        return true;
    }

    maide precate CountReadOperate CreateCountOperate()
    {
        var CountReadOperate a;
        a : new CountReadOperate;
        a.Read : this;
        a.Init();
        return a;
    }

    maide precate StringReadOperate CreateStringOperate()
    {
        var StringReadOperate a;
        a : new StringReadOperate;
        a.Read : this;
        a.Init();
        return a;
    }

    maide precate SetReadOperate CreateSetOperate()
    {
        var SetReadOperate a;
        a : new SetReadOperate;
        a.Read : this;
        a.Init();
        return a;
    }

    field prusate Array Source { get { return data; } set { data : value; } }
    field prusate Port Result { get { return data; } set { data : value; } }
    field prusate ReadArg Arg { get { return data; } set { data : value; } }
    field precate ReadOperate Operate { get { return data; } set { data : value; } }
    field precate CountReadOperate CountOperate { get { return data; } set { data : value; } }
    field precate StringReadOpeate StringOperate { get { return data; } set { data : value; } }
    field precate SetReadOpeate SetOperate { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        var ListInfra listInfra;
        listInfra : this.ListInfra;

        this.Arg : new ReadArg;
        this.Arg.Init();

        var ReadArg arg;
        arg : this.Arg;

        this.Operate : this.CountOperate;

        this.ResetStage();
        this.ExecuteStage();

        var Int ka;
        ka : arg.StringIndex;
        ka : ka * 8 * 3;
        arg.StringRangeData : new Data;
        arg.StringRangeData.Count : ka;
        arg.StringRangeData.Init();

        ka : arg.ArrayIndex;
        ka : ka * 8;
        arg.ArrayCountData : new Data;
        arg.ArrayCountData.Count : ka;
        arg.ArrayCountData.Init();

        this.Operate : this.StringOperate;

        this.ResetStage();
        this.ExecuteStage();

        arg.StringArray : listInfra.ArrayCreate(arg.StringIndex);
        arg.ArrayArray : listInfra.ArrayCreate(arg.ArrayIndex);
        arg.PortArray : listInfra.ArrayCreate(arg.PortIndex);
        arg.ModuleRefArray : listInfra.ArrayCreate(arg.ModuleRefIndex);
        arg.ImportArray : listInfra.ArrayCreate(arg.ImportIndex);
        arg.ImportClassArray : listInfra.ArrayCreate(arg.ImportClassIndex);
        arg.ExportArray : listInfra.ArrayCreate(arg.ExportIndex);
        arg.StorageArray : listInfra.ArrayCreate(arg.StorageIndex);

        this.ExecuteCreateString();
        this.ExecuteCreateArray();
        this.ExecuteCreatePort();
        this.ExecuteCreateModuleRef();
        this.ExecuteCreateImport();
        this.ExecuteCreateImportClass();
        this.ExecuteCreateExport();
        this.ExecuteCreateStorage();

        this.Operate : this.SetOperate;

        this.ResetStage();
        this.ExecuteStage();

        this.Arg : null;
        this.Operate : null;
        return true;
    }

    maide precate Bool ResetStage()
    {
        var ReadArg arg;
        arg : this.Arg;
        arg.StringIndex : 0;
        arg.ArrayIndex : 0;
        arg.PortIndex : 0;
        arg.ModuleRefIndex : 0;
        arg.ImportIndex : 0;
        arg.ImportClassIndex : 0;
        arg.ExportIndex : 0;
        arg.StorageIndex : 0;
        return true;
    }

    maide precate Bool ExecuteCreateString()
    {
        var ReadArg arg;
        arg : this.Arg;
        var Text text;
        text : this.TextA;
        var Range range;
        range : text.Range;
        var Data rangeData;
        rangeData : arg.StringRangeData;
        var Int ka;
        ka : 8;
        var Array array;
        array : arg.StringArray;
        var Int count;
        count : array.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Int nn;
            nn : i;
            nn : nn * 3;
            var Int row;
            var Int index;
            var Int countA;
            var Int na;
            na : nn * ka;
            row : this.InfraInfra.DataIntGet(rangeData, na);

            na : (nn + 1) * ka;
            index : this.InfraInfra.DataIntGet(rangeData, na);

            na : (nn + 2) * ka;
            countA : this.InfraInfra.DataIntGet(rangeData, na);

            var Text line;
            line : this.LineText(row);

            text.Data : line.Data;
            range.Index : index;
            range.Count : countA;

            var String a;
            a : this.StringCreate(text);

            range.Count : null;
            range.Index : null;
            text.Data : null;

            array.Set(i, a);

            i : i + 1;
        }
        return true;
    }
}