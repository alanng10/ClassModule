class ReadCountOperate : ReadOperate
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.TextInfra : share TextInfra;
        this.ClassInfra : share ClassInfra;

        this.Binary : this.CreateBinary();
        this.Class : this.CreateClass();
        this.Import : this.CreateImport();
        this.Part : this.CreatePart();
        this.Field : this.CreateField();
        this.Maide : this.CreateMaide();
        this.Var : this.CreateVar();
        this.ModuleRef : this.CreateModuleRef();
        this.String : this.CreateString();
        this.Array : this.CreateArray();
        this.Data : this.CreateData();
        return true;
    }

    maide precate Binary CreateBinary()
    {
        var Binary a;
        a : new Binary;
        a.Init();
        return a;
    }

    maide precate Class CreateClass()
    {
        var Class a;
        a : new Class;
        a.Init();
        return a;
    }

    maide precate Import CreateImport()
    {
        var Import a;
        a : new Import;
        a.Init();
        return a;
    }

    maide precate Part CreatePart()
    {
        var Part a;
        a : new Part;
        a.Init();
        return a;
    }

    maide precate Field CreateField()
    {
        var Field a;
        a : new Field;
        a.Init();
        return a;
    }

    maide precate Maide CreateMaide()
    {
        var Maide a;
        a : new Maide;
        a.Init();
        return a;
    }

    maide precate Var CreateVar()
    {
        var Var a;
        a : new Var;
        a.Init();
        return a;
    }

    maide precate ModuleRef CreateModuleRef()
    {
        return this.ClassInfra.ModuleRefCreate(null, null);
    }

    maide precate String CreateString()
    {
        return this.TextInfra.Zero;
    }

    maide precate Array CreateArray()
    {
        return this.ListInfra.ArrayCreate(0);
    }

    maide precate Data CreateData()
    {
        var Data a;
        a : new Data;
        a.Count : 0;
        a.Init();
        return a;
    }

    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate TextInfra TextInfra { get { return data; } set { data : value; } }
    field precate ClassInfra ClassInfra { get { return data; } set { data : value; } }
    field precate Binary Binary { get { return data; } set { data : value; } }
    field precate Class Class { get { return data; } set { data : value; } }
    field precate Import Import { get { return data; } set { data : value; } }
    field precate Part Part { get { return data; } set { data : value; } }
    field precate Field Field { get { return data; } set { data : value; } }
    field precate Maide Maide { get { return data; } set { data : value; } }
    field precate Var Var { get { return data; } set { data : value; } }
    field precate ModuleRef ModuleRef { get { return data; } set { data : value; } }
    field precate String String { get { return data; } set { data : value; } }
    field precate Array Array { get { return data; } set { data : value; } }
    field precate Data Data { get { return data; } set { data : value; } }

    maide prusate Binary ExecuteBinary()
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        arg.BinaryIndex : arg.BinaryIndex + 1;
        return this.Binary;
    }

    maide prusate Class ExecuteClass()
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        arg.ClassIndex : arg.ClassIndex + 1;
        return this.Class;
    }

    maide prusate Import ExecuteImport()
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        arg.ImportIndex : arg.ImportIndex + 1;
        return this.Import;
    }

    maide prusate Part ExecutePart()
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        arg.PartIndex : arg.PartIndex + 1;
        return this.Part;
    }

    maide prusate Field ExecuteField()
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        arg.FieldIndex : arg.FieldIndex + 1;
        return this.Field;
    }

    maide prusate Maide ExecuteMaide()
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        arg.MaideIndex : arg.MaideIndex + 1;
        return this.Maide;
    }

    maide prusate Var ExecuteVar()
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        arg.VarIndex : arg.VarIndex + 1;
        return this.Var;
    }

    maide prusate ModuleRef ExecuteModuleRef()
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        arg.ModuleRefIndex : arg.ModuleRefIndex + 1;
        return this.ModuleRef;
    }

    maide prusate String ExecuteName(var Int count)
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        arg.Index : arg.Index + count;
        arg.StringIndex : arg.StringIndex + 1;
        arg.StringTextIndex : arg.StringTextIndex + count;
        return this.String;
    }

    maide prusate Array ExecuteArray(var Int count)
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        arg.ArrayIndex : arg.ArrayIndex + 1;
        return this.Array;
    }

    maide prusate Bool ExecuteArrayItemSet(var Array array, var Int index, var Any value)
    {
        return true;
    }
}