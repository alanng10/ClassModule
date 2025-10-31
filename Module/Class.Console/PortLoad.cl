class PortLoad : TextAdd
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.StorageInfra : share StorageInfra;
        this.ClassInfra : share ClassInfra;
        this.StorageComp : share StorageComp;
        this.ErrorKind : share ErrorKindList;

        this.StoragePathValid : this.CreateStoragePathValid();

        this.SystemModuleSingle : "System";
        this.SystemModulePre : this.AddClear().Add(this.SystemModuleSingle).Add(this.ClassInfra.TextDot).AddResult();
        return true;
    }

    maide precate StoragePathValid CreateStoragePathValid()
    {
        var StoragePathValid a;
        a : new StoragePathValid;
        a.Init();
        return a;
    }

    field prusate Port Port { get { return data; } set { data : value; } }
    field prusate Bool SystemModule { get { return data; } set { data : value; } }
    field prusate Module Module { get { return data; } set { data : value; } }
    field prusate Int Status { get { return data; } set { data : value; } }
    field prusate Array Error { get { return data; } set { data : value; } }
    field prusate ModulePort ModulePort { get { return data; } set { data : value; } }
    field prusate BinaryRead BinaryRead { get { return data; } set { data : value; } }
    field prusate Table ModuleTable { get { return data; } set { data : value; } }
    field prusate Table ImportClass { get { return data; } set { data : value; } }
    field prusate NameValid NameValid { get { return data; } set { data : value; } }
    field prusate String ClassPath { get { return data; } set { data : value; } }
    public virtual String SourceFold { get; set; }
    protected virtual ListInfra ListInfra { get; set; }
    protected virtual StorageInfra StorageInfra { get; set; }
    protected virtual ClassInfra ClassInfra { get; set; }
    protected virtual StorageComp StorageComp { get; set; }
    protected virtual ErrorKindList ErrorKind { get; set; }
    protected virtual StoragePathValid StoragePathValid { get; set; }
    protected virtual Array ImportModuleRef { get; set; }
    protected virtual Table BinaryTable { get; set; }
    protected virtual ClassClass AnyClass { get; set; }
    protected virtual List ErrorList { get; set; }
    protected virtual ModuleRef ModuleRef { get; set; }
    protected virtual String SystemModuleSingle { get; set; }
    protected virtual String SystemModulePre { get; set; }

    public virtual bool Execute()
    {
        bool b;
        b : this.ExecuteAll();

        this.Error : this.ListInfra.ArrayCreateList(this.ErrorList);

        this.ImportModuleRef : null;
        this.ModulePort.BinaryTable : null;
        this.ModulePort.ModuleTable : null;
        this.AnyClass : null;
        this.ErrorList : null;
        this.ModuleRef : null;

        this.ClearData();
        return b;
    }

    protected virtual bool ExecuteAll()
    {
        this.Status : 0;

        PortPort port;
        port : this.Port;

        this.ErrorList : new List();
        this.ErrorList.Init();

        bool b;

        b : this.ValidModuleRef(port.Module);
        inf (~b)
        {
            return false;
        }

        b : this.ValidImportModuleRef(port.Import);
        inf (~b)
        {
            return false;
        }

        b : this.ExecuteModuleRef();
        inf (~b)
        {
            return false;
        }

        b : this.ExecuteImportModuleRef();
        inf (~b)
        {
            return false;
        }

        b : this.ExecuteBinaryLoad();
        inf (~b)
        {
            return false;
        }

        b : this.ExecuteDepend();
        inf (~b)
        {
            return false;
        }

        b : this.ExecuteModulePort();
        inf (~b)
        {
            return false;
        }

        b : this.ExecuteCreateModule();
        inf (~b)
        {
            return false;
        }

        b : this.ExecuteImport();
        inf (~b)
        {
            return false;
        }

        b : this.ExecuteExport();
        inf (~b)
        {
            return false;
        }

        b : this.ExecuteStorage();
        inf (~b)
        {
            return false;
        }

        b : this.ExecuteEntry();
        inf (~b)
        {
            return false;
        }

        return true;
    }

    protected virtual bool ExecuteModuleRef()
    {
        ModuleRef ka;
        ka : this.Port.Module;

        ModuleRef k;
        k : this.ClassInfra.ModuleRefCreate(ka.Name, ka.Ver);

        inf (this.SystemModule)
        {
            k.Ver : 0;
        }

        this.ModuleRef : k;
        return true;
    }

    protected virtual bool ExecuteImportModuleRef()
    {
        Array import;
        import : this.Port.Import;

        Table table;
        table : this.ClassInfra.TableCreateModuleRefLess();

        Array array;
        array : this.ListInfra.ArrayCreate(import.Count);

        long count;
        count : array.Count;

        long i;
        i : 0;
        while (i < count)
        {
            PortImport ka;
            ka : import.GetAt(i) as PortImport;

            ModuleRef k;
            k : ka.Module;

            String name;
            name : k.Name;
            long ver;
            ver : k.Ver;
            inf (ver = -1)
            {
                ver : 0;
            }

            ModuleRef a;
            a : this.ClassInfra.ModuleRefCreate(name, ver);

            inf (table.Valid(a))
            {
                this.Status : 30;
                return false;
            }

            this.ListInfra.TableAdd(table, a, a);

            array.SetAt(i, a);

            i : i + 1;
        }

        this.ImportModuleRef : array;
        return true;
    }

    protected virtual bool ValidModuleRef(ModuleRef module)
    {
        String name;
        name : module.Name;
        long ver;
        ver : module.Ver;

        inf (~(this.NameValid.ModuleName(this.TA(name))))
        {
            this.Status : 1;
            return false;
        }

        inf (~this.SystemModule)
        {
            inf (ver = -1)
            {
                this.Status : 2;
                return false;
            }

            inf (this.BuiltModuleRef(module))
            {
                this.Status : 3;
                return false;
            }
        }

        return true;
    }

    protected virtual bool ValidImportModuleRef(Array array)
    {
        long count;
        count : array.Count;

        long i;
        i : 0;
        while (i < count)
        {
            PortImport a;
            a : array.GetAt(i) as PortImport;

            inf (~this.ValidImportModuleRefOne(a.Module))
            {
                this.Status : 10;
                return false;
            }

            i : i + 1;
        }
        return true;
    }

    protected virtual bool ValidImportModuleRefOne(ModuleRef moduleRef)
    {
        String name;
        name : moduleRef.Name;
        long ver;
        ver : moduleRef.Ver;

        inf (~(this.NameValid.ModuleName(this.TA(name))))
        {
            return false;
        }

        bool built;
        built : this.BuiltModuleRef(moduleRef);

        bool b;
        b : (ver = -1);

        bool a;
        a : (built = b);
        return a;
    }

    protected virtual bool ExecuteBinaryLoad()
    {
        this.BinaryTable : this.ClassInfra.TableCreateModuleRefLess();

        Array array;
        array : this.ImportModuleRef;

        long count;
        count : array.Count;

        long i;
        i : 0;
        while (i < count)
        {
            ModuleRef a;
            a : array.GetAt(i) as ModuleRef;

            bool b;
            b : this.BinaryLoadRecurse(a);
            inf (~b)
            {
                String k;
                k : this.ModuleRefString(a);

                this.ErrorAdd(this.ErrorKind.ModuleUnvalid, k);

                this.Status : 50;
                return false;
            }

            i : i + 1;
        }
        return true;
    }

    protected virtual bool BinaryLoadRecurse(ModuleRef moduleRef)
    {
        inf (this.BinaryTable.Valid(moduleRef))
        {
            return true;
        }

        BinaryBinary binary;
        binary : this.BinaryLoad(moduleRef);
        inf (binary = null)
        {
            return false;
        }

        Array array;
        array : binary.Import;

        long count;
        count : array.Count;

        long i;
        i : 0;
        while (i < count)
        {
            BinaryImport import;
            import : array.GetAt(i) as BinaryImport;

            bool b;
            b : this.BinaryLoadRecurse(import.Module);
            inf (~b)
            {
                return false;
            }

            i : i + 1;
        }

        this.ListInfra.TableAdd(this.BinaryTable, binary.Ref, binary);

        return true;
    }

    protected virtual BinaryBinary BinaryLoad(ModuleRef moduleRef)
    {
        String moduleRefString;
        moduleRefString : this.ModuleRefString(moduleRef);

        String filePath;
        filePath : this.AddClear().Add(this.ClassInfra.ClassModulePath(this.ClassPath))
            .Add(this.TextInfra.PathCombine).Add(moduleRefString)
            .Add(this.TextInfra.PathCombine).Add(this.SModule).AddResult();

        Data data;
        data : this.StorageInfra.DataRead(filePath);

        inf (data = null)
        {
            return null;
        }

        BinaryRead read;
        read : this.BinaryRead;

        read.Data : data;

        read.Execute();

        BinaryBinary binary;
        binary : read.Result;

        read.Result : null;

        BinaryBinary a;
        a : binary;

        return a;
    }

    protected virtual bool ExecuteDepend()
    {
        ModuleRef ka;
        ka : this.ModuleRef;

        inf (this.BinaryTable.Valid(ka))
        {
            String k;
            k : this.ModuleRefString(ka);

            this.ErrorAdd(this.ErrorKind.ModuleUndefine, k);

            this.Status : 60;
            return false;
        }

        return true;
    }

    protected virtual bool ExecuteModulePort()
    {
        ModulePort modulePort;
        modulePort : this.ModulePort;

        modulePort.BinaryTable : this.BinaryTable;
        modulePort.ModuleTable : this.ModuleTable;

        Iter iter;
        iter : this.BinaryTable.IterCreate();
        this.BinaryTable.IterSet(iter);

        while (iter.Next())
        {
            ModuleRef moduleRef;
            moduleRef : iter.Index as ModuleRef;

            modulePort.ModuleRef : moduleRef;
            modulePort.AnyClass : this.AnyClass;

            bool b;
            b : modulePort.Execute();

            inf (~b)
            {
                long ka;
                ka : modulePort.Status;

                String k;
                k : this.ModuleRefString(moduleRef);

                this.ErrorAdd(this.ErrorKind.ModuleUndefine, k);

                this.Status : 200 + ka;
                return false;
            }

            ClassModule a;
            a : modulePort.Result;

            this.AnyClass : modulePort.AnyClass;

            modulePort.Result : null;
            modulePort.AnyClass : null;
            modulePort.ModuleRef : null;

            this.ListInfra.TableAdd(this.ModuleTable, a.Ref, a);
        }

        return true;
    }

    protected virtual bool ExecuteCreateModule()
    {
        ClassModule module;
        module : new ClassModule();
        module.Init();
        module.Ref : this.ModuleRef;
        module.Class : this.ClassInfra.TableCreateStringLess();
        module.Import : this.ClassInfra.TableCreateModuleRefLess();
        module.Export : this.ClassInfra.TableCreateStringLess();

        module.Storage : new Table();
        module.Storage.Less : this.StorageStringLessCreate();
        module.Storage.Init();

        this.Module : module;
        return true;
    }

    public virtual StringLess StorageStringLessCreate()
    {
        StringLess a;
        a : new StringLess();
        a.LiteForm : this.StorageInfra.NameForm;
        a.RiteForm : this.StorageInfra.NameForm;
        a.CharLess : this.ILess;
        a.Init();
        return a;
    }

    protected virtual bool ExecuteImport()
    {
        Array array;
        array : this.Port.Import;

        bool b;
        b : false;

        long count;
        count : array.Count;

        long i;
        i : 0;
        while (i < count)
        {
            ModuleRef moduleRef;
            moduleRef : this.ImportModuleRef.GetAt(i) as ModuleRef;

            ClassModule module;
            module : this.ModuleTable.Get(moduleRef) as ClassModule;

            Table importTable;
            importTable : this.ClassInfra.TableCreateRefLess();

            this.ListInfra.TableAdd(this.Module.Import, moduleRef, importTable);

            PortImport portImport;
            portImport : array.GetAt(i) as PortImport;

            Array importClassArray;
            importClassArray : portImport.Class;

            long countA;
            countA : importClassArray.Count;

            long iA;
            iA : 0;
            while (iA < countA)
            {
                PortImportClass importClass;
                importClass : importClassArray.GetAt(iA) as PortImportClass;

                String className;
                className : importClass.Class;

                ClassClass varClass;
                varClass : null;

                bool ba;
                ba : false;

                inf (~ba)
                {
                    inf (~this.NameValid.Name(this.TA(className)))
                    {
                        ba : true;
                    }
                }

                inf (~ba)
                {
                    varClass : module.Class.Get(className) as ClassClass;

                    inf (varClass = null)
                    {
                        ba : true;
                    }
                }

                inf (~ba)
                {
                    inf (~module.Export.Valid(className))
                    {
                        ba : true;
                    }
                }

                inf (ba)
                {
                    this.ErrorAdd(this.ErrorKind.ImportClassUndefine, className);

                    b : true;
                }

                inf (~ba)
                {
                    this.ListInfra.TableAdd(importTable, varClass, varClass);
                }

                String name;
                name : importClass.Name;

                bool bb;
                bb : false;

                inf (~bb)
                {
                    inf (~this.NameValid.Name(this.TA(name)))
                    {
                        bb : true;
                    }
                }

                inf (~bb)
                {
                    inf (this.ImportClass.Valid(name))
                    {
                        bb : true;
                    }
                }

                inf (bb)
                {
                    this.ErrorAdd(this.ErrorKind.ImportNameUnavail, name);

                    b : true;
                }

                inf (~(ba | bb))
                {
                    this.ListInfra.TableAdd(this.ImportClass, name, varClass);
                }

                iA : iA + 1;
            }

            i : i + 1;
        }

        inf (b)
        {
            this.Status : 80;
            return false;
        }

        return true;
    }

    protected virtual bool ExecuteExport()
    {
        Array array;
        array : this.Port.Export;

        bool b;
        b : false;

        long count;
        count : array.Count;

        long i;
        i : 0;
        while (i < count)
        {
            PortExport portExport;
            portExport : array.GetAt(i) as PortExport;

            String name;
            name : portExport.Class;

            bool ba;
            ba : false;

            inf (~ba)
            {
                inf (~this.NameValid.Name(this.TA(name)))
                {
                    ba : true;
                }
            }

            inf (~ba)
            {
                inf (this.ImportClass.Valid(name))
                {
                    ba : true;
                }
            }

            inf (~ba)
            {
                inf (this.Module.Export.Valid(name))
                {
                    ba : true;
                }
            }

            inf (ba)
            {
                this.ErrorAdd(this.ErrorKind.ExportUnvalid, name);

                b : true;
            }

            inf (~ba)
            {
                this.ListInfra.TableAdd(this.Module.Export, name, null);
            }

            i : i + 1;
        }

        inf (b)
        {
            this.Status : 90;
            return false;
        }

        return true;
    }

    protected virtual bool ExecuteStorage()
    {
        Array array;
        array : this.Port.Storage;

        bool b;
        b : false;

        long count;
        count : array.Count;

        long i;
        i : 0;
        while (i < count)
        {
            PortStorage portStorage;
            portStorage : array.GetAt(i) as PortStorage;

            String sourcePathKa;
            String destPathKa;
            sourcePathKa : portStorage.Source;
            destPathKa : portStorage.Dest;

            Text sourcePathK;
            String sourcePath;
            sourcePathK : this.TextTrimEnd(this.TextTrimStart(this.TA(sourcePathKa)));
            sourcePath : this.StringCreate(sourcePathK);

            Text destPathK;
            String destPath;
            destPathK : this.TextTrimEnd(this.TextTrimStart(this.TA(destPathKa)));
            destPath : this.StringCreate(destPathK);

            String sourcePathA;
            sourcePathA : sourcePath;

            inf (this.StorageInfra.PathRelate(this.TA(sourcePath), this.TLess))
            {
                sourcePathA : this.AddClear().Add(this.SourceFold).Add(this.TextInfra.PathCombine).Add(sourcePath).AddResult();
            }

            bool ba;
            ba : false;

            inf (~ba)
            {
                inf (~this.StoragePathValid.ValidSourcePath(this.TA(sourcePathA)))
                {
                    this.ErrorAdd(this.ErrorKind.StorageSourceUnvalid, sourcePath);

                    ba : true;
                }
            }

            inf (~ba)
            {
                inf (~this.StoragePathValid.ValidDestPath(this.TA(destPath)))
                {
                    this.ErrorAdd(this.ErrorKind.StorageDestUnvalid, destPath);

                    ba : true;
                }
            }

            inf (~ba)
            {
                inf (this.Module.Storage.Valid(destPath))
                {
                    this.ErrorAdd(this.ErrorKind.StorageDestUnavail, destPath);

                    ba : true;
                }
            }

            inf (~ba)
            {
                inf (~this.StorageComp.Entry(sourcePathA).Exist)
                {
                    this.ErrorAdd(this.ErrorKind.StorageSourceUnachieve, sourcePath);

                    ba : true;
                }
            }

            inf (ba)
            {
                b : true;
            }

            this.ListInfra.TableAdd(this.Module.Storage, destPath, sourcePathA);

            i : i + 1;
        }

        inf (b)
        {
            this.Status : 100;
            return false;
        }

        return true;
    }

    protected virtual bool ExecuteEntry()
    {
        String entry;
        entry : this.Port.Entry;

        inf (entry = null)
        {
            return true;
        }

        bool b;
        b : false;

        inf (~this.NameValid.Name(this.TA(entry)))
        {
            b : true;
        }

        inf (this.ImportClass.Valid(entry))
        {
            b : true;
        }

        inf (b)
        {
            this.ErrorAdd(this.ErrorKind.EntryUnachieve, entry);

            this.Status : 110;
            return false;
        }

        this.Module.Entry : entry;
        return true;
    }

    protected virtual String ModuleRefString(ModuleRef k)
    {
        String verString;
        verString : this.ClassInfra.VerString(k.Ver);

        String a;
        a : this.ClassInfra.ModuleRefString(k.Name, verString);
        return a;
    }

    protected virtual bool BuiltModuleRef(ModuleRef moduleRef)
    {
        String name;
        name : moduleRef.Name;

        Text textName;
        textName : this.TA(name);

        bool b;
        b : false;

        inf (~b)
        {
            inf (this.TextSame(textName, this.TB(this.SystemModuleSingle)))
            {
                b : true;
            }
        }
        inf (~b)
        {
            inf (this.TextStart(textName, this.TB(this.SystemModulePre)))
            {
                b : true;
            }
        }

        return b;
    }

    protected virtual bool ErrorAdd(ErrorKind kind, String name)
    {
        Error a;
        a : new Error();
        a.Init();
        a.Kind : kind;
        a.Name : name;
        a.Source : -1;

        this.ErrorList.Add(a);
        return true;
    }
}