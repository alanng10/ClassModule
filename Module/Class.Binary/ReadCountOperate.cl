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

    maide prusate Binary ExecuteBinary()
    {
        var ReadArg arg;
        arg : this.Read.Arg;
        arg.BinaryIndex : arg.BinaryIndex + 1;
        return this.Binary;
    }
}