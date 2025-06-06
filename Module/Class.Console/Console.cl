class Console : TextAdd
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.StorageInfra : share StorageInfra;
        this.ClassInfra : share ClassInfra;
        this.StorageComp : share StorageComp;
        this.TaskKind : share TaskKindList;

        this.ErrorWrite : true;

        this.ErrorString : this.CreateErrorString();
        this.Create : this.CreateCreate();
        this.StorageTextLess : this.CreateStorageTextLess();
        return true;
    }

    maide precate ErrorString CreateErrorString()
    {
        var ErrorString a;
        a : new ErrorString;
        a.Init();
        return a;
    }

    maide precate Create CreateCreate()
    {
        var Create a;
        a : new Create;
        a.Console : this;
        a.Init();
        return a;
    }

    maide precate TextLess CreateStorageTextLess()
    {
        var TextForm nameForm;
        nameForm : new StorageNameForm;
        nameForm.Init();

        var TextLess a;
        a : new TextLess;
        a.LiteForm : nameForm;
        a.RiteForm : nameForm;
        a.CharLess : this.ILess;
        a.Init();
        return a;
    }

    field prusate Int Status { get { return data; } set { data : value; } }
    field prusate Array Arg { get { return data; } set { data : value; } }
    field prusate Task Task { get { return data; } set { data : value; } }
    field prusate Array Source { get { return data; } set { data : value; } }
    field prusate String SourceFold { get { return data; } set { data : value; } }
    field prusate Create Create { get { return data; } set { data : value; } }
    field prusate Result Result { get { return data; } set { data : value; } }
    field prusate ErrorString ErrorString { get { return data; } set { data : value; } }
    field prusate TaskKindList TaskKind { get { return data; } set { data : value; } }
    field prusate Bool ErrorWrite { get { return data; } set { data : value; } }
    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate StorageInfra StorageInfra { get { return data; } set { data : value; } }
    field precate ClassInfra ClassInfra { get { return data; } set { data : value; } }
    field precate StorageComp StorageComp { get { return data; } set { data : value; } }
    field precate Out Out { get { return data; } set { data : value; } }
    field precate Out Err { get { return data; } set { data : value; } }
    field precate TextLess StorageTextLess { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        this.Status : 0;

        inf (this.Task = null)
        {
            this.Status : 1000;
            return false;
        }

        this.Out : this.Task.Out;
        this.Err : this.Task.Err;

        var TaskKindList kindList;
        kindList : this.TaskKind;
        var TaskKind kind;
        kind : this.Task.Kind;

        var Bool ba;
        ba : kind = kindList.Token | kind = kindList.Node;

        var Bool fileExtend;
        fileExtend : false;
        var Array sourceNameList;
        inf (ba)
        {
            var String file;
            file : this.Task.Source;
        }
    }
}