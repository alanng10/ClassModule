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
        this.ClassPath : this.StorageComp.ModuleFoldPath;
        this.Create : this.CreateCreate();
        this.PortRead : this.CreatePortRead();
        this.BinaryRead : this.CreateBinaryRead();
        this.BinaryWrite : this.CreateBinaryWrite();
        this.ModulePort : this.CreateModulePort();
        this.PortLoad : this.CreatePortLoad();
        this.BinaryGen : this.CreateBinaryGen();
        this.StorageGen : this.CreateStorageGen();
        this.ErrorString : this.CreateErrorString();
        this.InfoToken : this.CreateInfoToken();
        this.InfoTravel : this.CreateInfoTravel();
        this.NameValid : this.CreateNameValid();
        this.ModuleRefLess : this.CreateModuleRefLess();
        this.StorageNameLess : this.CreateStorageNameLess();
        return true;
    }

    maide precate Create CreateCreate()
    {
        var Create a;
        a : new Create;
        a.Console : this;
        a.Init();
        return a;
    }

    maide precate PortRead CreatePortRead()
    {
        var PortRead a;
        a : new PortRead;
        a.Init();
        return a;
    }

    maide precate BinaryRead CreateBinaryRead()
    {
        var BinaryRead a;
        a : new BinaryRead;
        a.Init();
        return a;
    }

    maide precate BinaryWrite CreateBinaryWrite()
    {
        var BinaryWrite a;
        a : new BinaryWrite;
        a.Init();
        return a;
    }

    maide precate ModulePort CreateModulePort()
    {
        var ModulePort a;
        a : new ModulePort;
        a.Init();
        return a;
    }

    maide precate PortLoad CreatePortLoad()
    {
        var PortLoad a;
        a : new PortLoad;
        a.Init();
        return a;
    }

    maide precate BinaryGen CreateBinaryGen()
    {
        var BinaryGen a;
        a : new BinaryGen;
        a.Init();
        return a;
    }

    maide precate StorageGen CreateStorageGen()
    {
        var StorageGen a;
        a : new StorageGen;
        a.Init();
        return a;
    }

    maide precate ErrorString CreateErrorString()
    {
        var ErrorString a;
        a : new ErrorString;
        a.Init();
        return a;
    }

    maide precate InfoToken CreateInfoToken()
    {
        var InfoToken a;
        a : new InfoToken;
        a.Init();
        return a;
    }

    maide precate InfoTravel CreateInfoTravel()
    {
        var InfoTravel a;
        a : new InfoTravel;
        a.Init();
        return a;
    }

    maide precate NameValid CreateNameValid()
    {
        var NameValid a;
        a : new NameValid;
        a.Init();
        return a;
    }

    maide precate ModuleRefLess CreateModuleRefLess()
    {
        var ModuleRefLess a;
        a : new ModuleRefLess;
        a.Init();
        return a;
    }

    maide precate TextLess CreateStorageNameLess()
    {
        var TextLess a;
        a : new TextLess;
        a.LiteForm : this.StorageInfra.NameForm;
        a.RiteForm : this.StorageInfra.NameForm;
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
    field prusate Module PortModule { get { return data; } set { data : value; } }
    field prusate TaskKindList TaskKind { get { return data; } set { data : value; } }
    field prusate Table ModuleTable { get { return data; } set { data : value; } }
    field prusate Table ImportClass { get { return data; } set { data : value; } }
    field prusate Bool ErrorWrite { get { return data; } set { data : value; } }
    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate StorageInfra StorageInfra { get { return data; } set { data : value; } }
    field precate ClassInfra ClassInfra { get { return data; } set { data : value; } }
    field precate StorageComp StorageComp { get { return data; } set { data : value; } }
    field precate BinaryRead BinaryRead { get { return data; } set { data : value; } }
    field precate BinaryWrite BinaryWrite { get { return data; } set { data : value; } }
    field precate ModulePort ModulePort { get { return data; } set { data : value; } }
    field precate PortRead PortRead { get { return data; } set { data : value; } }
    field precate PortLoad PortLoad { get { return data; } set { data : value; } }
    field precate BinaryGen BinaryGen { get { return data; } set { data : value; } }
    field precate StorageGen StorageGen { get { return data; } set { data : value; } }
    field precate ErrorString ErrorString { get { return data; } set { data : value; } }
    field precate NameValid NameValid { get { return data; } set { data : value; } }
    field precate InfoToken InfoToken { get { return data; } set { data : value; } }
    field precate InfoTravel InfoTravel { get { return data; } set { data : value; } }
    field precate Out Out { get { return data; } set { data : value; } }
    field precate Out Err { get { return data; } set { data : value; } }
    field precate String ClassPath { get { return data; } set { data : value; } }
    field precate Port Port { get { return data; } set { data : value; } }
    field precate Array PortError { get { return data; } set { data : value; } }
    field precate Bool MakeSystem { get { return data; } set { data : value; } }
    field precate ModuleRefLess ModuleRefLess { get { return data; } set { data : value; } }
    field precate TextLess StorageNameLess { get { return data; } set { data : value; } }

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

        var Bool b;
        b : kind = kindList.Console | kind = kindList.Module;
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

            inf (~baaa)
            {
                fileName : this.StringCreateIndex(file, combineIndex + 1);

                this.SourceFold : this.StringCreateRange(file, 0, combineIndex);
            }

            sourceNameList : this.ListInfra.ArrayCreate(1);
            sourceNameList.Set(0, fileName);
        }

        inf (b)
        {
            this.SourceFold : this.Task.Source;

            this.MakeSystem : this.Task.ArgBool;

            inf (this.SourceFold = null)
            {
                this.Status : 1010;
                return false;
            }

            bool baa;
            baa : this.ReadPort();
            inf (~baa)
            {
                this.Status : 1100;
                return false;
            }

            baa : this.PortModuleLoad();
            inf (~baa)
            {
                this.WriteErrorList(this.PortError);
                return false;
            }

            hasFileExtend : true;
            sourceNameList : this.SourceNameList(this.SourceFold);
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

    maide precate Bool PrintTokenResult()
    {
        var Iter iter;
        iter : this.Result.Token.Code.IterCreate();
        this.Result.Token.Code.IterSet(iter);

        while (iter.Next())
        {
            var Code code;
            code : cast Code(iter.Value);

            var String a;
            a : this.InfoToken.Execute(code);

            this.Out.Write(a);
        }
        return true;
    }

    maide precate Bool PrintNodeResult()
    {
        var Iter iter;
        iter : this.Result.Node.Root.IterCreate();
        this.Result.Node.Root.IterSet(iter);

        while (iter.Next())
        {
            var Node root;
            root : cast Node(iter.Value);

            var String a;
            a : this.InfoTravel.Execute(root);

            this.Out.Write(a);
        }
        return true;
    }

    maide precate Array FileList(var String foldPath)
    {
        var Array a;
        a : this.StorageComp.EntryList(foldPath, false);

        return a;
    }

    maide precate Bool SetSource(var Array array)
    {
        var Int count;
        count : array.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var String name;
            name : cast String(array.Get(i));

            var Source a;
            a : new Source;
            a.Init();
            a.Index : i;
            a.Name : name;

            array.Set(i, a);
            i : i + 1;
        }

        this.Source : array;
        return true;
    }

    maide precate Bool ReadSourceText(var Bool fileExtend)
    {
        var Array array;
        array : this.Source;

        var Int count;
        count : array.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Source a;
            a : cast Source(array.Get(i));

            var String k;
            k : this.TextInfra.Zero;
            inf (fileExtend)
            {
                k : ".cl";
            }

            var String filePath;
            filePath : this.AddClear().Add(this.SourceFold).Add(this.TextInfra.PathCombine).Add(a.Name).Add(k).AddResult();

            var String kk;
            kk : this.StorageInfra.TextRead(filePath);

            var Array text;
            text : this.TextLine(this.TextCreate(kk));

            a.Text : text;

            i : i + 1;
        }
        return true;
    }
}