class Read : TextAdd
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        this.ListInfra : share ListInfra;
        this.ClassInfra : share ClassInfra;

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
    field precate InfraInfra InfraInfra { get { return data; } set { data : value; } }
    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate ClassInfra ClassInfra { get { return data; } set { data : value; } }
    field precate ReadOperate Operate { get { return data; } set { data : value; } }
    field precate CountReadOperate CountOperate { get { return data; } set { data : value; } }
    field precate StringReadOperate StringOperate { get { return data; } set { data : value; } }
    field precate SetReadOperate SetOperate { get { return data; } set { data : value; } }

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
        var Array array;
        array : this.Arg.StringArray;

        var Data data;
        data : this.Arg.StringRangeData;

        var Int ka;
        ka : 8;
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
            row : this.InfraInfra.DataIntGet(data, na);

            na : (nn + 1) * ka;
            index : this.InfraInfra.DataIntGet(data, na);

            na : (nn + 2) * ka;
            countA : this.InfraInfra.DataIntGet(data, na);

            var Text line;
            line : this.LineText(row);

            this.TextA.Data : line.Data;
            this.TextA.Range.Index : index;
            this.TextA.Range.Count : countA;

            var String a;
            a : this.StringCreate(this.TextA);

            this.TextA.Range.Count : null;
            this.TextA.Range.Index : null;
            this.TextA.Data : null;

            array.Set(i, a);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteCreateArray()
    {
        var Array array;
        array : this.Arg.ArrayArray;

        var Data data;
        data : this.Arg.ArrayCountData;

        var Int ka;
        ka : 8;
        var Int count;
        count : array.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Int nn;
            nn : i * ka;

            var Int k;
            k : this.InfraInfra.DataIntGet(data, nn);

            var Array a;
            a : this.ListInfra.ArrayCreate(k);

            array.Set(i, a);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteCreatePort()
    {
        var Array array;
        array : this.Arg.PortArray;

        var Int count;
        count : array.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Port a;
            a : new Port;
            a.Init();

            array.Set(i, a);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteCreateModuleRef()
    {
        var Array array;
        array : this.Arg.ModuleRefArray;

        var Int count;
        count : array.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var ModuleRef a;
            a : new ModuleRef;
            a.Init();

            array.Set(i, a);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteCreateImport()
    {
        var Array array;
        array : this.Arg.ImportArray;

        var Int count;
        count : array.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Import a;
            a : new Import;
            a.Init();

            array.Set(i, a);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteCreateImportClass()
    {
        var Array array;
        array : this.Arg.ImportClassArray;

        var Int count;
        count : array.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var ImportClass a;
            a : new ImportClass;
            a.Init();

            array.Set(i, a);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteCreateExport()
    {
        var Array array;
        array : this.Arg.ExportArray;

        var Int count;
        count : array.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Export a;
            a : new Export;
            a.Init();

            array.Set(i, a);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteCreateStorage()
    {
        var Array array;
        array : this.Arg.StorageArray;

        var Int count;
        count : array.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Storage a;
            a : new Storage;
            a.Init();

            array.Set(i, a);

            i : i + 1;
        }
        return true;
    }

    maide prusate Bool ExecuteStage()
    {
        this.Result : this.ExecutePort();

        this.ClearData();
        return true;
    }

    maide precate Port ExecutePort()
    {
        var Int row;
        row : 0;

        var Bool b;
        b : this.ValidHead(row, this.ClassInfra.TextModule);
        inf (~b)
        {
            return null;
        }

        row : this.NextRow(row);
        inf (row = null)
        {
            return null;
        }

        var Module module;
        module : this.ExecuteModuleRef(row);
        inf (module = null)
        {
            return null;
        }

        row : this.NextRow(row);
        inf (row = null)
        {
            return null;
        }
        row : this.NextRow(row);
        inf (row = null)
        {
            return null;
        }

        b : this.ValidHead(row, this.ClassInfra.TextImport);
        inf (~b)
        {
            return null;
        }

        row : row + 1;
        var Int ka;
        ka : this.SectionLineCount(row);

        var Array import;
        import : this.ExecuteImportArray(row, ka);
        inf (import = null)
        {
            return null;
        }

        row : row + ka;
        inf (~this.ValidRow(row))
        {
            return null;
        }

        row : this.NextRow(row);
        inf (row = null)
        {
            return null;
        }

        b : this.ValidHead(row, this.ClassInfra.TextExport);
        inf (~b)
        {
            return null;
        }

        row : row + 1;
        ka : this.SectionLineCount(row);

        var Array export;
        export : this.ExecuteExportArray(row, ka);
        inf (export = null)
        {
            return null;
        }

        row : row + ka;
        inf (~this.ValidRow(row))
        {
            return null;
        }

        row : this.NextRow(row);
        inf (row = null)
        {
            return null;
        }

        b : this.ValidHead(row, this.ClassInfra.TextStorage);
        inf (~b)
        {
            return null;
        }

        row : row + 1;
        ka : this.SectionLineCount(row);

        var Array storage;
        storage : this.ExecuteStorageArray(row, ka);
        inf (storage = null)
        {
            return null;
        }

        row : row + ka;
        inf (~this.ValidRow(row))
        {
            return null;
        }

        row : this.NextRow(row);
        inf (row = null)
        {
            return null;
        }

        b : this.ValidHead(row, this.ClassInfra.TextEntry);
        inf (~b)
        {
            return null;
        }

        row : row + 1;

        var String entry;

        inf (this.ValidRow(row))
        {
            entry : this.ExecuteEntry(row);

            row : row + 1;
        }

        inf (~(row = this.Source.Count))
        {
            return null;
        }

        var Port a;
        a : this.Operate.ExecutePort();
        a.Module : module;
        a.Import : import;
        a.Export : export;
        a.Storage : storage;
        a.Entry : entry;
        return a;
    }

    maide precate Array ExecuteImportArray(var Int row, var Int lineCount)
    {
        var Int count;
        count : this.ImportCount(row, lineCount);

        var Array array;
        array : this.Operate.ExecuteArray(count);

        var Int k;
        k : row;

        var Int i;
        i : 0;
        while (i < count)
        {
            var Int kk;
            kk : k + 1;

            var Int ka;
            ka : this.SubSectionLineCount(kk);

            var Import a;
            a : this.ExecuteImport(k, ka);
            inf (a = null)
            {
                return null;
            }

            this.Operate.ExecuteArrayItemSet(array, i, a);

            k : kk + ka;

            i : i + 1;
        }
        return array;
    }

    maide precate Int ImportCount(var Int row, var Int lineCount)
    {
        var Int k;
        k : 0;

        var Int count;
        count : lineCount;

        var Int i;
        i : 0;
        while (i < count)
        {
            var Text text;
            text : this.LineText(row + i);

            inf (~this.TextStart(text, this.TA(this.ClassInfra.TextSpace)))
            {
                k : k + 1;
            }

            i : i + 1;
        }

        var Int a;
        a : k;
        return a;
    }

    maide precate Import ExecuteImport(var Int row, var Int lineCount)
    {
        var ModuleRef module;
        module : this.ExecuteModuleRef(row);
        inf (module = null)
        {
            return null;
        }

        row : row + 1;

        var Int count;
        count : lineCount;

        var Array array;
        array : this.Operate.ExecuteArray(count);

        var Int i;
        i : 0;
        while (i < count)
        {
            var ImportClass ka;
            ka : this.ExecuteImportClass(row + i);

            inf (ka = null)
            {
                return null;
            }

            array.Set(i, ka);

            i : i + 1;
        }

        var Import a;
        a : this.Operate.ExecuteImport();
        a.Module : module;
        a.Class : array;
        return a;
    }

    maide precate ImportClass ExecuteImportClass(var Int row)
    {
        var String indent;
        indent : "    ";

        var Text text;
        text : this.LineText(row);

        inf (~this.TextStart(text, this.TA(indent)))
        {
            return null;
        }

        var Int kaa;
        kaa : this.StringCount(indent);

        var Range range;
        range : text.Range;

        var Int index;
        var Int count;
        index : range.Index;
        count : range.Count;

        var Int indexA;
        var Int countA;
        indexA : index + kaa;
        countA : count - kaa;

        range.Index : indexA;
        range.Count : countA;

        var Int kk;
        kk : this.TextIndex(text, this.TA(this.ClassInfra.TextSpace));

        range.Index : index;
        range.Count : count;

        inf (kk = null)
        {
            return null;
        }

        var Range rangeA;
        rangeA : this.Range;

        rangeA.Index : indexA;
        rangeA.Count : kk;

        var String name;
        name : this.ExecuteString(row, rangeA);

        var Int k;
        k : kk + 1;

        rangeA.Index : indexA + k;
        rangeA.Count : countA - k;

        var String varClass;
        varClass : this.ExecuteString(row, rangeA);

        var ImportClass a;
        a : this.Operate.ExecuteImportClass();
        a.Name : name;
        a.Class : varClass;
        return a;
    }

    maide precate Array ExecuteExportArray(var Int row, var Int lineCount)
    {
        var Int count;
        count : lineCount;

        var Array array;
        array : this.Operate.ExecuteArray(count);

        var Int i;
        i : 0;
        while (i < count)
        {
            var Export a;
            a : this.ExecuteExport(row + i);
            inf (a = null)
            {
                return null;
            }

            this.Operate.ExecuteArrayItemSet(array, i, a);

            i : i + 1;
        }

        return array;
    }

    maide precate Export ExecuteExport(var Int row)
    {
        var Text text;
        text : this.LineText(row);

        var String varClass;
        varClass : this.ExecuteString(row, text.Range);

        var Export a;
        a : this.Operate.ExecuteExport();
        a.Class : varClass;
        return a;
    }

    maide precate Array ExecuteStorageArray(var Int row, var Int lineCount)
    {
        var Int count;
        count : lineCount;

        var Array array;
        array : this.Operate.ExecuteArray(count);

        var Int i;
        i : 0;
        while (i < count)
        {
            var Storage a;
            a : this.ExecuteStorage(row + i);
            inf (a = null)
            {
                return null;
            }

            this.Operate.ExecuteArrayItemSet(array, i, a);

            i : i + 1;
        }

        return array;
    }

    maide precate Storage ExecuteStorage(var Int row)
    {
        var Text text;
        text : this.LineText(row);

        var Int kk;
        kk : this.TextIndex(text, this.TA(":"));
        inf (kk = null)
        {
            return null;
        }

        var Int index;
        var Int count;
        index : text.Range.Index;
        count : text.Range.Count;

        var Range range;
        range : this.Range;

        range.Index : index;
        range.Count : kk;

        var String dest;
        dest : this.ExecuteString(row, range);

        var Int k;
        k : kk + 1;

        range.Index : index + k;
        range.Count : count - k;

        var String source;
        source : this.ExecuteString(row, range);

        var Storage a;
        a : this.Operate.ExecuteStorage();
        a.Dest : dest;
        a.Source : source;
        return a;
    }

    maide precate String ExecuteEntry(var Int row)
    {
        var Text text;
        text : this.LineText(row);

        var String a;
        a : this.ExecuteString(row, text.Range);
        return a;
    }

    maide precate Int SectionLineCount(var Int row)
    {
        var Int lineCount;
        lineCount : this.Source.Count;

        var Int k;

        var Bool b;
        b : false;

        var Int count;
        count : lineCount - row;

        var Int i;
        i : 0;

        while (~b & i < count)
        {
            var Text text;
            text : this.LineText(row + i);
            inf (text.Range.Count = 0)
            {
                b : true;
                k : i;
            }

            i : i + 1;
        }

        inf (~b)
        {
            return count;
        }

        var Int a;
        a : k;
        return a;
    }

    maide precate Int SubSectionLineCount(var Int row)
    {
        var Int lineCount;
        lineCount : this.Source.Count;

        var Int k;

        var Bool b;
        b : false;

        var Int count;
        count : lineCount - row;

        var Int i;
        i : 0;

        while (~b & i < count)
        {
            var Text text;
            text : this.LineText(row + i);

            inf (~this.TextStart(text, this.TA(" ")))
            {
                b : true;
                k : i;
            }

            i : i + 1;
        }

        inf (~b)
        {
            return count;
        }

        var Int a;
        a : k;
        return a;
    }

    maide precate Bool ValidHead(var Int row, var String head)
    {
        var Text text;
        text : this.LineText(row);

        var Range range;
        range : text.Range;

        var Int index;
        var Int count;
        index : range.Index;
        count : range.Count;

        var Bool a;
        a : this.ValidHeadAll(text, head);

        range.Index : index;
        range.Count : count;

        return a;
    }

    maide private Bool ValidHeadAll(var Text text, var String head)
    {
        var Range range;
        range : text.Range;

        var Int index;
        var Int count;
        index : range.Index;
        count : range.Count;

        var Int kk;
        kk : this.StringComp.Count(head);

        inf (~((kk + 2) = count))
        {
            return false;
        }

        range.Count : 1;

        inf (~this.TextSame(text, this.TA("[")))
        {
            return false;
        }

        range.Index : (index + count) - 1;

        inf (~this.TextSame(text, this.TA("]")))
        {
            return false;
        }

        range.Index : index + 1;
        range.Count : count - 2;

        inf (~this.TextSame(text, this.TA(head)))
        {
            return false;
        }

        return true;
    }

    maide precate ModuleRef ExecuteModuleRef(var Int row)
    {
        var Text text;
        text : this.LineText(row);

        var Range range;
        range : text.Range;

        var Int nameCount;
        var Int ver;

        var Int kk;
        kk : this.TextIndex(text, this.TA(":"));

        var Bool b;
        b : (kk = null);
        inf (b)
        {
            nameCount : range.Count;
            ver : null;
        }
        inf (~b)
        {
            nameCount : kk;

            var Int ka;
            var Int kb;
            ka : range.Index;
            kb : range.Count;

            var Int kd;
            kd : kk + 1;

            range.Index : ka + kd;
            range.Count : kb - kd;

            ver : this.ExecuteModuleVer(text);

            range.Index : ka;
            range.Count : kb;

            inf (ver = null)
            {
                return null;
            }
        }

        var Range rangeA;
        rangeA : this.Range;
        rangeA.Index : range.Index;
        rangeA.Count : nameCount;

        var String name;
        name : this.ExecuteString(row, rangeA);

        var ModuleRef a;
        a : this.Operate.ExecuteModuleRef();
        a.Name : name;
        a.Ver : ver;
        return a;
    }

    maide precate Int ExecuteModuleVer(var Text text)
    {
        var Range range;
        range : text.Range;

        var Int index;
        var Int count;
        index : range.Index;
        count : range.Count;

        var Int a;
        a : this.ExecuteModuleVerAll(text);

        range.Index : index;
        range.Count : count;

        return a;
    }

    maide private Int ExecuteModuleVerAll(var Text text)
    {
        var Range range;
        range : text.Range;

        var Int index;
        var Int count;
        index : range.Index;
        count : range.Count;

        var String dot;
        dot : ".";

        var Int kka;
        kka : this.TextIndex(text, this.TA(dot));
        inf (kka = null)
        {
            return null;
        }

        var Int ka;
        ka : kka + 1;

        range.Index : index + ka;
        range.Count : count - ka;

        var Int kaa;
        kaa : 2;

        var Int kkb;
        kkb : this.TextIndex(text, this.TA(dot));
        inf (~(kkb = kaa))
        {
            return null;
        }

        var Int kb;
        kb : ka + kkb + 1;

        var Int kkc;
        kkc : kb + kaa;
        inf (~(kkc = count))
        {
            return null;
        }

        range.Index : index;
        range.Count : kka;

        var Int major;
        major : this.IntText(text, 10);
        inf (major = null)
        {
            return null;
        }

        var Int kc;
        kc : 1;
        kc : bit <(kc, 44);
        inf (~(major < kc))
        {
            return null;
        }

        range.Index : index + ka;
        range.Count : kkb;

        var Int minor;
        minor : this.IntText(text, 10);
        inf (minor = null)
        {
            return null;
        }

        range.Index : index + kb;
        range.Count : kaa;

        var Int revise;
        revise : this.IntText(text, 10);
        inf (revise = null)
        {
            return null;
        }

        var Int k;
        k : 0;
        k : bit |(k, revise);
        k : bit |(k, bit <(minor, 8));
        k : bit |(k, bit <(major, 16));

        var Int a;
        a : k;
        return a;
    }

    maide precate Text LineText(var Int row)
    {
        return cast Text(this.Source.Get(row));
    }

    maide precate Bool ValidRow(var Int row)
    {
        return this.InfraInfra.ValidIndex(this.Source.Count, row);
    }

    maide precate Int NextRow(var Int row)
    {
        var Int k;
        k : row + 1;

        inf (~this.ValidRow(k))
        {
            return null;
        }
        return k;
    }

    maide precate String ExecuteString(var Int row, var Range range)
    {
        var String a;
        a : this.Operate.ExecuteString(row, range);
        return a;
    }
}