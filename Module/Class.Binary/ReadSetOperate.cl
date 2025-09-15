class ReadSetOperate : ReadOperate
{
    maide prusate Binary ExecuteBinary()
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        var Int index;
        index : arg.BinaryIndex;
        var Binary a;
        a : cast Binary(arg.BinaryArray.Get(index));
        arg.BinaryIndex : index + 1;
        return a;
    }

    maide prusate Class ExecuteClass()
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        var Int index;
        index : arg.ClassIndex;
        var Class a;
        a : cast Class(arg.ClassArray.Get(index));
        arg.ClassIndex : index + 1;
        return a;
    }

    maide prusate Import ExecuteImport()
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        var Int index;
        index : arg.ImportIndex;
        var Import a;
        a : cast Import(arg.ImportArray.Get(index));
        arg.ImportIndex : index + 1;
        return a;
    }

    maide prusate Part ExecutePart()
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        var Int index;
        index : arg.PartIndex;
        var Part a;
        a : cast Part(arg.PartArray.Get(index));
        arg.PartIndex : index + 1;
        return a;
    }

    maide prusate Field ExecuteField()
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        var Int index;
        index : arg.FieldIndex;
        var Field a;
        a : cast Field(arg.FieldArray.Get(index));
        arg.FieldIndex : index + 1;
        return a;
    }

    maide prusate Maide ExecuteMaide()
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        var Int index;
        index : arg.MaideIndex;
        var Maide a;
        a : cast Maide(arg.MaideArray.Get(index));
        arg.MaideIndex : index + 1;
        return a;
    }

    maide prusate Var ExecuteVar()
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        var Int index;
        index : arg.VarIndex;
        var Var a;
        a : cast Var(arg.VarArray.Get(index));
        arg.VarIndex : index + 1;
        return a;
    }

    maide prusate Entry ExecuteEntry()
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        var Int index;
        index : arg.EntryIndex;
        var Var a;
        a : cast Var(arg.EntryArray.Get(index));
        arg.EntryIndex : index + 1;
        return a;
    }

    maide prusate ModuleRef ExecuteModuleRef()
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        var Int index;
        index : arg.ModuleRefIndex;
        var ModuleRef a;
        a : cast ModuleRef(arg.ModuleRefArray.Get(index));
        arg.ModuleRefIndex : index + 1;
        return a;
    }

    maide prusate String ExecuteName(var Int count)
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        var Int index;
        index : arg.StringIndex;
        var String a;
        a : cast String(arg.StringArray.Get(index));

        arg.Index : arg.Index + count;
        arg.StringIndex : index + 1;
        arg.StringTextIndex : arg.StringTextIndex + count;
        return a;
    }

    maide prusate Array ExecuteArray(var Int count)
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        var Int index;
        index : arg.ArrayIndex;
        var Array a;
        a : cast Array(arg.ArrayArray.Get(index));
        arg.ArrayIndex : index + 1;
        return a;
    }

    maide prusate Bool ExecuteArrayItemSet(var Array array, var Int index, var Any value)
    {
        array.Set(index, value);
        return true;
    }

    maide prusate Data ExecuteData(var Int count)
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        var Int index;
        index : arg.DataIndex;
        var Data a;
        a : cast Data(arg.DataArray.Get(index));
        arg.DataIndex : index + 1;
        return a;
    }

    maide prusate Bool ExecuteDataSet(var Data data, var Int count)
    {
        return true;
    }
}