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

            var Int combineIndex;
            combineIndex : this.StorageInfra.EntryPathNameCombine(this.TA(file), this.TLess);

            var String fileName;

            var Bool baaa;
            baaa : combineIndex = null;

            inf (baaa)
            {
                fileName : file;

                this.SourceFold : ".";
            }

            sourceNameList : new Array;
            sourceNameList.Count : 1;
            sourceNameList.Init();
            sourceNameList.Set(0, fileName);
        }

        this.SetSource(sourceNameList);

        this.ReadSourceText(fileExtend);

        this.ExecuteCreate();

        this.ErrorString.SourceArray : this.Source;

        this.WriteAllError();

        inf (this.Task.Print)
        {
            inf (kind = kindList.Token)
            {
                this.PrintTokenResult();
            }
            inf (kind = kindList.Node)
            {
                this.PrintNodeResult();
            }
        }
        return true;
    }

    maide prusate Bool ExecuteCreate()
    {
        this.Create.Execute();

        this.Result : this.Create.Result;

        this.Create.Result : null;
        return true;
    }

    maide precate Bool WriteAllError()
    {
        inf (~this.ErrorWrite)
        {
            return true;
        }

        var TaskKindList kindList;
        kindList : this.TaskKind;

        var TaskKind kind;
        kind : this.Task.Kind;

        var Bool kindConsole;
        kindConsole : kind = kindList.Console;

        inf (kindConsole | kind = kindList.Token)
        {
            inf (~(this.Result.Token = null))
            {
                this.WriteErrorList(this.Result.Token.Error);
            }
        }

        inf (kindConsole | kind = kindList.Node)
        {
            inf (~(this.Result.Node = null))
            {
                this.WriteErrorList(this.Result.Node.Error);
            }
        }
        return true;
    }

    maide precate Bool WriteErrorList(var Array errorList)
    {
        var Int count;
        count : errorList.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Error a;
            a : cast Error(errorList.Get(i));
            this.WriteError(a);
            i : i + 1;
        }
        return true;
    }

    maide precate Bool WriteError(var Error error)
    {
        var String a;
        a : this.ErrorString.Execute(error);
        this.Err.Write(a);
        return true;
    }
}