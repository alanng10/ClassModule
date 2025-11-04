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

            var Bool baa;
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

            fileExtend : true;
            sourceNameList : this.SourceNameList(this.SourceFold);
        }

        this.SetSource(sourceNameList);

        this.ReadSourceText(fileExtend);

        this.ExecuteCreate();

        this.ErrorString.SourceArray : this.Source;

        inf (kind = kindList.Console)
        {
            inf (this.CanGen())
            {
                var Bool bea;
                bea : this.ExecuteGen();
                inf (~bea)
                {
                    return false;
                }
            }

            this.ErrorString.RangePos : true;
            this.ErrorString.CodeArray : this.Result.Token.Code;
        }

        this.WriteAllError();

        inf (this.Task.Print)
        {
            inf (kind = kindList.Token)
            {
                this.PrintTokenResult();
            }
            inf (kind = kindList.Node | kind = kindList.Console)
            {
                this.PrintNodeResult();
            }
            inf (kind = kindList.Module)
            {
                this.PrintModuleResult();
            }
        }
        return true;
    }

    maide precate Bool ReadPort()
    {
        var String combine;
        combine : this.TextInfra.PathCombine;

        var String fileName;
        fileName : "Class.Port";

        var String filePath;
        filePath : this.AddClear().Add(this.SourceFold).Add(combine).Add(fileName).AddResult();

        var String source;
        source : this.StorageInfra.TextRead(filePath);

        inf (source = null)
        {
            return false;
        }

        var Array lineArray;
        lineArray : this.TextLine(this.TextCreate(source));

        var PortRead read;
        read : this.PortRead;

        read.Source : lineArray;

        read.Execute();

        var Port port;
        port : read.Result;

        read.Result : null;
        read.Source : null;

        inf (port = null)
        {
            return false;
        }

        this.Port : port;
        return true;
    }

    maide precate Bool PortModuleLoad()
    {
        this.ModuleTable : this.ClassInfra.TableCreateModuleRefLess();
        this.ImportClass : this.ClassInfra.TableCreateStringLess();

        var PortLoad portLoad;
        portLoad : this.PortLoad;

        portLoad.Port : this.Port;
        portLoad.BinaryRead : this.BinaryRead;
        portLoad.ModulePort : this.ModulePort;
        portLoad.ModuleTable : this.ModuleTable;
        portLoad.ImportClass : this.ImportClass;
        portLoad.NameValid : this.NameValid;
        portLoad.SystemModule : this.MakeSystem;
        portLoad.ClassPath : this.ClassPath;
        portLoad.SourceFold : this.SourceFold;

        var Bool b;
        b : portLoad.Execute();

        inf (~b)
        {
            this.Status : 3000 + portLoad.Status;
            this.PortError : portLoad.Error;
            return false;
        }

        this.PortModule : portLoad.Module;

        portLoad.Error : null;
        portLoad.Module : null;
        portLoad.SourceFold : null;
        portLoad.ClassPath : null;
        portLoad.SystemModule : false;
        portLoad.NameValid : null;
        portLoad.ImportClass : null;
        portLoad.ModuleTable : null;
        portLoad.ModulePort : null;
        portLoad.BinaryRead : null;
        portLoad.Port : null;
        return true;
    }

    maide prusate Bool ExecuteCreate()
    {
        this.Create.Execute();

        this.Result : this.Create.Result;

        this.Create.Result : null;
        return true;
    }

    maide precate Bool ExecuteGen()
    {
        var Bool ba;
        ba : this.ExecuteGenBinary();

        inf (~ba)
        {
            return false;
        }

        var Module module;
        module : this.Result.Module.Module;

        this.StorageGen.Module : module;
        this.StorageGen.ClassPath : this.ClassPath;

        var Bool bb;
        bb : this.StorageGen.Execute();

        this.StorageGen.ClassPath : null;
        this.StorageGen.Module : null;

        inf (~bb)
        {
            this.Status : 5200;
            return false;
        }

        return true;
    }

    maide precate Bool ExecuteGenBinary()
    {
        var Module module;
        module : this.Result.Module.Module;

        this.BinaryGen.Module : module;

        this.BinaryGen.Execute();

        var Binary binary;
        binary : this.BinaryGen.Result;

        this.BinaryGen.Result : null;
        this.BinaryGen.Module : null;

        this.BinaryWrite.Binary : binary;

        this.BinaryWrite.Execute();

        var Data data;
        data : this.BinaryWrite.Result;

        this.BinaryWrite.Result : null;
        this.BinaryWrite.Binary : null;

        var String moduleRefString;
        moduleRefString : this.ClassInfra.ModuleRefString(module.Ref);

        var String foldPath;
        foldPath : this.AddClear().Add(this.ClassInfra.ClassModulePath(this.ClassPath))
            .Add(this.TextInfra.PathCombine)
            .Add(moduleRefString).AddResult();

        this.StorageComp.FoldDelete(foldPath);

        this.StorageComp.FoldCreate(foldPath);

        var StorageEntry entry;
        entry : this.StorageComp.Entry(foldPath);

        inf (~entry.Exist)
        {
            this.Status : 5000 + 10;
            return false;
        }

        inf (~entry.Fold)
        {
            this.Status : 5000 + 20;
            return false;
        }

        var String filePath;
        filePath : this.AddClear().Add(foldPath).Add(this.TextInfra.PathCombine)
            .Add(this.SModule).AddResult();

        var Bool b;
        b : this.StorageInfra.DataWrite(filePath, data);

        inf (~b)
        {
            this.Status : 5000 + 30;
            return false;
        }

        return true;
    }

    maide precate Bool CanGen()
    {
        inf (~(this.Result.Token = null))
        {
            inf (0 < this.Result.Token.Error.Count)
            {
                return false;
            }
        }

        inf (~(this.Result.Node = null))
        {
            inf (0 < this.Result.Node.Error.Count)
            {
                return false;
            }
        }

        inf (~(this.Result.Module = null))
        {
            inf (0 < this.Result.Module.Error.Count)
            {
                return false;
            }
        }

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

        inf (kindConsole | (kind = kindList.Module))
        {
            inf (~(this.Result.Module = null))
            {
                this.WriteErrorList(this.Result.Module.Error);
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

    maide precate Bool PrintModuleResult()
    {
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

    maide precate Array FileList(var String foldPath)
    {
        var Array a;
        a : this.StorageComp.EntryInfoList(foldPath, false, true);

        return a;
    }

    maide precate Array SourceNameList(var String foldPath)
    {
        var Array fileArray;
        fileArray : this.FileList(foldPath);

        var List list;
        list : new List;
        list.Init();

        var String ka;
        ka : ".cl";

        var Int count;
        count : fileArray.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var StorageEntry file;
            file : cast StorageEntry(fileArray.Get(i));

            var String fileName;
            fileName : file.Name;

            inf (this.TextInfra.End(this.TA(fileName), this.TB(ka), this.StorageNameLess))
            {
                var Int ke;
                ke : this.StringCount(fileName) - this.StringCount(ka);

                var String name;
                name : this.StringCreateRange(fileName, 0, ke);

                list.Add(name);
            }

            i : i + 1;
        }

        var Array a;
        a : this.ListInfra.ArrayCreateList(list);
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