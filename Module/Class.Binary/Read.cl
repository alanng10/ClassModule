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

        var ReadArg arg;
        arg : this.Arg;

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

        this.ExecuteCreateBinary();
        this.ExecuteCreateClass();
        this.ExecuteCreateImport();
        this.ExecuteCreatePart();
        this.ExecuteCreateField();
        this.ExecuteCreateMaide();
        this.ExecuteCreateVar();
        this.ExecuteCreateModuleRef();
        this.ExecuteCreateString();
        this.ExecuteCreateArray();

        this.Operate : this.SetOperate;

        this.ResetStage();
        this.ExecuteStage();

        this.Operate : null;
        this.Arg : null;
        return true;
    }

    maide prusate Bool ResetStage()
    {
        var ReadArg a;
        a : this.Arg;
        a.Index : 0;
        a.BinaryIndex : 0;
        a.ClassIndex : 0;
        a.ImportIndex : 0;
        a.PartIndex : 0;
        a.FieldIndex : 0;
        a.MaideIndex : 0;
        a.VarIndex : 0;
        a.ModuleRefIndex : 0;
        a.StringIndex : 0;
        a.StringTextIndex : 0;
        a.ArrayIndex : 0;
        return true;
    }

    maide precate Bool ExecuteCreateBinary()
    {
        var Array array;
        array : this.Arg.BinaryArray;

        var Int count;
        count : array.Count;

        var Int i;
        i : 0;
        while (i < count)
        {
            var Binary k;
            k : new Binary;
            k.Init();

            array.Set(i, k);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteCreateClass()
    {
        var Array array;
        array : this.Arg.ClassArray;

        var Int count;
        count : array.Count;

        var Int i;
        i : 0;
        while (i < count)
        {
            var Class k;
            k : new Class;
            k.Init();

            array.Set(i, k);

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
            var Import k;
            k : new Import;
            k.Init();

            array.Set(i, k);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteCreatePart()
    {
        var Array array;
        array : this.Arg.PartArray;

        var Int count;
        count : array.Count;

        var Int i;
        i : 0;
        while (i < count)
        {
            var Part k;
            k : new Part;
            k.Init();

            array.Set(i, k);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteCreateField()
    {
        var Array array;
        array : this.Arg.FieldArray;

        var Int count;
        count : array.Count;

        var Int i;
        i : 0;
        while (i < count)
        {
            var Field k;
            k : new Field;
            k.Init();

            array.Set(i, k);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteCreateMaide()
    {
        var Array array;
        array : this.Arg.MaideArray;

        var Int count;
        count : array.Count;

        var Int i;
        i : 0;
        while (i < count)
        {
            var Maide k;
            k : new Maide;
            k.Init();

            array.Set(i, k);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteCreateVar()
    {
        var Array array;
        array : this.Arg.VarArray;

        var Int count;
        count : array.Count;

        var Int i;
        i : 0;
        while (i < count)
        {
            var Var k;
            k : new Var;
            k.Init();

            array.Set(i, k);

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
            var ModuleRef k;
            k : this.ClassInfra.ModuleRefCreate(null, null);

            array.Set(i, k);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteCreateString()
    {
        var ReadArg arg;
        arg : this.Arg;

        var Array array;
        array : arg.StringArray;

        var Text text;
        text : new Text;
        text.Init();
        text.Range : new Range;
        text.Range.Init();
        text.Data : arg.StringTextData;

        var Int total;
        total : 0;

        var Int count;
        count : array.Count;

        var Int i;
        i : 0;
        while (i < count)
        {
            var Int kaa;
            kaa : i * 8;

            var Int ka;
            ka : this.InfraInfra.DataIntGet(arg.StringCountData, kaa);

            text.Range.Index : total;
            text.Range.Count : ka;

            var String k;
            k : this.TextInfra.StringCreate(text);

            array.Set(i, k);

            total : total + ka;

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteCreateArray()
    {
        var ReadArg arg;
        arg : this.Arg;

        var Array array;
        array : arg.ArrayArray;

        var Int count;
        count : array.Count;

        var Int i;
        i : 0;
        while (i < count)
        {
            var Int index;
            index : i * 8;

            var Int ka;
            ka : this.InfraInfra.DataIntGet(arg.ArrayCountData, index);

            var Array k;
            k : this.ListInfra.ArrayCreate(ka);

            array.Set(i, k);

            i : i + 1;
        }
        return true;
    }

    maide prusate Bool ExecuteStage()
    {
        this.Result : this.ExecuteBinary();
        return true;
    }

    maide precate Binary ExecuteBinary()
    {
        var ModuleRef ref;
        ref : this.ExecuteModuleRef();
        inf (ref = null)
        {
            return null;
        }

        var Array varClass;
        varClass : this.ExecuteClassArray();
        inf (varClass = null)
        {
            return null;
        }

        var Array import;
        import : this.ExecuteImportArray();
        inf (import = null)
        {
            return null;
        }

        var Array export;
        export : this.ExecuteExportArray();
        inf (export = null)
        {
            return null;
        }

        var Array varBase;
        varBase : this.ExecuteBaseArray();
        inf (varBase = null)
        {
            return null;
        }

        var Array part;
        part : this.ExecutePartArray();
        inf (part = null)
        {
            return null;
        }

        var Int entry;
        entry : this.ExecuteEntry();

        var Binary a;
        a : this.Operate.ExecuteBinary();
        a.Ref : ref;
        a.Class : varClass;
        a.Import : import;
        a.Export : export;
        a.Base : varBase;
        a.Part : part;
        a.Entry : entry;
        return a;
    }

    maide precate Array ExecuteClassArray()
    {
        var Int count;
        count : this.ExecuteCount();
        inf (count = null)
        {
            return null;
        }

        var Array array;
        array : this.ExecuteArray(count);
        inf (array = null)
        {
            return null;
        }

        var Int i;
        i : 0;
        while (i < count)
        {
            var Class a;
            a : this.ExecuteClass();
            inf (a = null)
            {
                return null;
            }

            this.Operate.ExecuteArrayItemSet(array, i, a);

            i : i + 1;
        }
        return array;
    }

    maide precate Class ExecuteClass()
    {
        var String name;
        name : this.ExecuteString();
        inf (name = null)
        {
            return null;
        }

        var Class a;
        a : this.Operate.ExecuteClass();
        a.Name : name;
        return a;
    }

    maide precate Array ExecuteImportArray()
    {
        var Int count;
        count : this.ExecuteCount();
        inf (count = null)
        {
            return null;
        }

        var Array array;
        array : this.ExecuteArray(count);
        inf (array = null)
        {
            return null;
        }

        var Int i;
        i : 0;
        while (i < count)
        {
            var Import a;
            a : this.ExecuteImport();
            inf (a = null)
            {
                return null;
            }

            this.Operate.ExecuteArrayItemSet(array, i, a);

            i : i + 1;
        }
        return array;
    }

    maide precate Import ExecuteImport()
    {
        var ModuleRef module;
        module : this.ExecuteModuleRef();
        inf (module = null)
        {
            return null;
        }

        var Array varClass;
        varClass : this.ExecuteImportClassArray();
        inf (varClass = null)
        {
            return null;
        }

        var Import a;
        a : this.Operate.ExecuteImport();
        a.Module : module;
        a.Class : varClass;
        return a;
    }

    maide precate Array ExecuteImportClassArray()
    {
        return this.ExecuteClassIndexArray();
    }

    maide precate Array ExecuteExportArray()
    {
        return this.ExecuteClassIndexArray();
    }

    maide precate Array ExecuteBaseArray()
    {
        return this.ExecuteClassIndexArray();
    }

    maide precate Array ExecutePartArray()
    {
        var Int count;
        count : this.ExecuteCount();
        inf (count = null)
        {
            return null;
        }

        var Array array;
        array : this.ExecuteArray(count);
        inf (array = null)
        {
            return null;
        }

        var Int i;
        i : 0;
        while (i < count)
        {
            var Part a;
            a : this.ExecutePart();
            inf (a = null)
            {
                return null;
            }

            this.Operate.ExecuteArrayItemSet(array, i, a);

            i : i + 1;
        }
        return array;
    }

    maide precate Part ExecutePart()
    {
        var Int fieldStart;
        fieldStart : this.ExecuteIndex();
        inf (fieldStart = null)
        {
            return null;
        }

        var Int maideStart;
        maideStart : this.ExecuteIndex();
        inf (maideStart = null)
        {
            return null;
        }

        var Array varField;
        varField : this.ExecuteFieldArray();
        inf (varField = null)
        {
            return null;
        }

        var Array varMaide;
        varMaide : this.ExecuteMaideArray();
        inf (varMaide = null)
        {
            return null;
        }

        var Part a;
        a : this.Operate.ExecutePart();
        a.FieldStart : fieldStart;
        a.MaideStart : maideStart;
        a.Field : varField;
        a.Maide : varMaide;
        return a;
    }

    maide precate Array ExecuteFieldArray()
    {
        var Int count;
        count : this.ExecuteCount();
        inf (count = null)
        {
            return null;
        }

        var Array array;
        array : this.ExecuteArray(count);
        inf (array = null)
        {
            return null;
        }

        var Int i;
        i : 0;
        while (i < count)
        {
            var Field a;
            a : this.ExecuteField();
            inf (a = null)
            {
                return null;
            }

            this.Operate.ExecuteArrayItemSet(array, i, a);

            i : i + 1;
        }
        return array;
    }

    maide precate Field ExecuteField()
    {
        var Int varClass;
        varClass : this.ExecuteIndex();
        inf (varClass = null)
        {
            return null;
        }

        var Int count;
        count : this.ExecuteByte();
        inf (count = null)
        {
            return null;
        }

        var String name;
        name : this.ExecuteString();
        inf (name = null)
        {
            return null;
        }

        var Field a;
        a : this.Operate.ExecuteField();
        a.Class : varClass;
        a.Count : count;
        a.Name : name;
        return a;
    }

    maide precate Array ExecuteMaideArray()
    {
        var Int count;
        count : this.ExecuteCount();
        inf (count = null)
        {
            return null;
        }

        var Array array;
        array : this.ExecuteArray(count);
        inf (array = null)
        {
            return null;
        }

        var Int i;
        i : 0;
        while (i < count)
        {
            var Maide a;
            a : this.ExecuteMaide();
            inf (a = null)
            {
                return null;
            }

            this.Operate.ExecuteArrayItemSet(array, i, a);

            i : i + 1;
        }
        return array;
    }

    maide precate Maide ExecuteMaide()
    {
        var Int varClass;
        varClass : this.ExecuteIndex();
        inf (varClass = null)
        {
            return null;
        }

        var Int count;
        count : this.ExecuteByte();
        inf (count = null)
        {
            return null;
        }

        var String name;
        name : this.ExecuteString();
        inf (name = null)
        {
            return null;
        }

        var Array param;
        param : this.ExecuteVarArray();
        inf (param = null)
        {
            return null;
        }

        var Maide a;
        a : this.Operate.ExecuteMaide();
        a.Class : varClass;
        a.Count : count;
        a.Name : name;
        a.Param : param;
        return a;
    }

    maide precate Array ExecuteVarArray()
    {
        var Int count;
        count : this.ExecuteCount();
        inf (count = null)
        {
            return null;
        }

        var Array array;
        array : this.ExecuteArray(count);
        inf (array = null)
        {
            return null;
        }

        var Int i;
        i : 0;
        while (i < count)
        {
            var Var a;
            a : this.ExecuteVar();
            inf (a = null)
            {
                return null;
            }

            this.Operate.ExecuteArrayItemSet(array, i, a);

            i : i + 1;
        }
        return array;
    }

    maide precate Var ExecuteVar()
    {
        var Int varClass;
        varClass : this.ExecuteIndex();
        inf (varClass = null)
        {
            return null;
        }

        var String name;
        name : this.ExecuteString();
        inf (name = null)
        {
            return null;
        }

        var Var a;
        a : this.Operate.ExecuteVar();
        a.Class : varClass;
        a.Name : name;
        return a;
    }

    maide precate Int ExecuteEntry()
    {
        var Int k;
        k : this.ExecuteClassIndex();

        var Int a;
        a : k;
        return a;
    }

    maide precate Array ExecuteClassIndexArray()
    {
        var Int count;
        count : this.ExecuteCount();
        inf (count = null)
        {
            return null;
        }

        var Array array;
        array : this.ExecuteArray(count);
        inf (array = null)
        {
            return null;
        }

        var Int i;
        i : 0;
        while (i < count)
        {
            var Int a;
            a : this.ExecuteClassIndex();
            inf (a = null)
            {
                return null;
            }

            this.Operate.ExecuteArrayItemSet(array, i, a);

            i : i + 1;
        }
        return array;
    }

    maide precate Int ExecuteClassIndex()
    {
        return this.ExecuteIndex();
    }

    maide precate ModuleRef ExecuteModuleRef()
    {
        var String name;
        name : this.ExecuteString();
        inf (name = null)
        {
            return null;
        }

        var Int ver;
        ver : this.ExecuteInt();
        inf (ver = null)
        {
            return null;
        }

        var ModuleRef a;
        a : this.Operate.ExecuteModuleRef();
        a.Name : name;
        a.Ver : ver;
        return a;
    }

    maide precate Array ExecuteArray(var Int count)
    {
        return this.Operate.ExecuteArray(count);
    }

    maide precate String ExecuteString()
    {
        var Int count;
        count : this.ExecuteCount();
        inf (count = null)
        {
            return null;
        }

        inf (~this.ValidCount(count))
        {
            return null;
        }

        var String a;
        a : this.Operate.ExecuteString(count);
        return a;
    }

    maide precate Int ExecuteIndex()
    {
        return this.ExecuteInt();
    }

    maide precate Int ExecuteCount()
    {
        return this.ExecuteInt();
    }

    maide precate Int ExecuteInt()
    {
        var Int count;
        count : 8;
        inf (~this.ValidCount(count))
        {
            return null;
        }

        var ReadArg arg;
        arg : this.Arg;
        var Int index;
        index : arg.Index;

        var Int a;
        a : this.InfraInfra.DataIntGet(this.Data, index);

        index : index + count;
        arg.Index : index;
        return a;
    }

    maide precate Int ExecuteByte()
    {
        inf (~this.ValidCount(1))
        {
            return null;
        }

        var ReadArg arg;
        arg : this.Arg;
        var Int index;
        index : arg.Index;
        var Int a;
        a : this.Data.Get(index);
        index : index + 1;
        arg.Index : index;
        return a;
    }

    maide precate Bool ValidCount(var Int count)
    {
        return this.InfraInfra.ValidRange(this.Data.Count, this.Arg.Index, count);
    }
}