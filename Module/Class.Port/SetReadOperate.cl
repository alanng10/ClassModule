class SetReadOperate : ReadOperate
{
    maide prusate String ExecuteString(var Int row, var Range range)
    {
        var ReadArg arg;
        arg : this.Arg;
        var Int index;
        index : arg.StringIndex;
        var String a;
        a : cast String(arg.StringArray.Get(index));
        arg.StringIndex : index + 1;
        return a;
    }

    maide prusate Array ExecuteArray(var Int count)
    {
        var ReadArg arg;
        arg : this.Arg;
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

    maide prusate Port ExecutePort()
    {
        var ReadArg arg;
        arg : this.Arg;
        var Int index;
        index : arg.PortIndex;
        var Port a;
        a : cast Port(arg.PortArray.Get(index));
        arg.PortIndex : index + 1;
        return a;
    }

    maide prusate ModuleRef ExecuteModuleRef()
    {
        var ReadArg arg;
        arg : this.Arg;
        var Int index;
        index : arg.ModuleRefIndex;
        var ModuleRef a;
        a : cast ModuleRef(arg.ModuleRefArray.Get(index));
        arg.ModuleRefIndex : index + 1;
        return a;
    }

    maide prusate Import ExecuteImport()
    {
        var ReadArg arg;
        arg : this.Arg;
        var Int index;
        index : arg.ImportIndex;
        var Import a;
        a : cast Import(arg.ImportArray.Get(index));
        arg.ImportIndex : index + 1;
        return a;
    }

    maide prusate ImportClass ExecuteImportClass()
    {
        var ReadArg arg;
        arg : this.Arg;
        var Int index;
        index : arg.ImportClassIndex;
        var ImportClass a;
        a : cast ImportClass(arg.ImportClassArray.Get(index));
        arg.ImportClassIndex : index + 1;
        return a;
    }

    maide prusate Export ExecuteExport()
    {
        var ReadArg arg;
        arg : this.Arg;
        var Int index;
        index : arg.ExportIndex;
        var Export a;
        a : cast Export(arg.ExportArray.Get(index));
        arg.ExportIndex : index + 1;
        return a;
    }

    maide prusate Storage ExecuteStorage()
    {
        var ReadArg arg;
        arg : this.Arg;
        var Int index;
        index : arg.StorageIndex;
        var Storage a;
        a : cast Storage(arg.StorageArray.Get(index));
        arg.StorageIndex : index + 1;
        return a;
    }
}