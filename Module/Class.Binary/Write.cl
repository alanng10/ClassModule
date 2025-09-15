class Write : Any
{
    maide prusate Bool Init()
    {
        base.Init();
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
    field precate StringComp StringComp { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        this.Arg : new WriteArg;
        this.Arg.Init();

        this.Operate : this.CountOperate;

        this.ResetStage();
        this.ExecuteStage();

        var Int count;
        count : this.Arg.Index;
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

    maide precate Bool ExecutePart(var Part part)
    {
        this.ExecuteIndex(part.FieldStart);
        this.ExecuteIndex(part.MaideStart);

        this.ExecuteFieldArray(part.Field);
        this.ExecuteMaideArray(part.Maide);
        return true;
    }

    maide precate Bool ExecuteFieldArray(var Array array)
    {
        var Int count;
        count : array.Count;

        this.ExecuteCount(count);

        var Int i;
        i : 0;
        while (i < count)
        {
            var Field varField;
            varField : cast Field(array.Get(i));

            this.ExecuteField(varField);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteField(var Field varField)
    {
        this.ExecuteIndex(varField.Class);
        this.ExecuteByte(varField.Count);
        this.ExecuteName(varField.Name);
        return true;
    }

    maide precate Bool ExecuteMaideArray(var Array array)
    {
        var Int count;
        count : array.Count;

        this.ExecuteCount(count);

        var Int i;
        i : 0;
        while (i < count)
        {
            var Maide varMaide;
            varMaide : cast Maide(array.Get(i));

            this.ExecuteMaide(varMaide);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteMaide(var Maide varMaide)
    {
        this.ExecuteIndex(varMaide.Class);
        this.ExecuteByte(varMaide.Count);
        this.ExecuteName(varMaide.Name);
        this.ExecuteVarArray(varMaide.Param);
        return true;
    }

    maide precate Bool ExecuteVarArray(var Array array)
    {
        var Int count;
        count : array.Count;

        this.ExecuteCount(count);

        var Int i;
        i : 0;
        while (i < count)
        {
            var Var varVar;
            varVar : cast Var(array.Get(i));

            this.ExecuteVar(varVar);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteVar(var Var varVar)
    {
        this.ExecuteIndex(varVar.Class);
        this.ExecuteName(varVar.Name);
        return true;
    }

    maide precate Bool ExecuteEntry(var Int entry)
    {
        inf (entry = null)
        {
            this.ExecuteByte(0);
            return true;
        }

        this.ExecuteByte(1);

        this.ExecuteIndex(entry);
        return true;
    }

    maide precate Bool ExecuteData(var Data data)
    {
        var Int count;
        count : data.Count;

        this.ExecuteCount(count);

        var Int i;
        i : 0;
        while (i < count)
        {
            var Int ka;
            ka : data.Get(i);

            this.ExecuteByte(ka);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteModuleRef(var ModuleRef ref)
    {
        this.ExecuteName(ref.Name);
        this.ExecuteInt(ref.Ver);
        return true;
    }

    maide precate Bool ExecuteClassIndexArray(var Array array)
    {
        var Int count;
        count : array.Count;

        this.ExecuteCount(count);

        var Int i;
        i : 0;
        while (i < count)
        {
            var Int classIndex;
            classIndex : cast Int(array.Get(i));

            this.ExecuteClassIndex(classIndex);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteClassIndex(var Int classIndex)
    {
        this.ExecuteIndex(classIndex);
        return true;
    }

    maide precate Bool ExecuteName(var String value)
    {
        var Int count;
        count : this.StringComp.Count(value);

        this.ExecuteCount(count);

        var Int i;
        i : 0;
        while (i < count)
        {
            var Int ka;
            ka : this.StringComp.Char(value, i);

            this.ExecuteByte(ka);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteIndex(var Int value)
    {
        return this.ExecuteInt(value);
    }

    maide precate Bool ExecuteCount(var Int value)
    {
        return this.ExecuteInt(value);
    }

    maide precate Bool ExecuteInt(var Int value)
    {
        return this.ExecuteIntCount(value, 8);
    }

    maide precate Bool ExecuteIntCount(var Int value, var Int count)
    {
        var Int i;
        i : 0;
        while (i < count)
        {
            var Int shift;
            shift : i * 8;

            var Int ka;
            ka : bit >(value, shift);
            ka : bit &(ka, 0hff);

            this.ExecuteByte(ka);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteByte(var Int value)
    {
        this.Operate.ExecuteByte(value);
        return true;
    }
}