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
}