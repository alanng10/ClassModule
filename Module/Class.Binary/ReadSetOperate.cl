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
}