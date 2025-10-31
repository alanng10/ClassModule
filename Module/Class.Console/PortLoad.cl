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
    field prusate String SourceFold { get { return data; } set { data : value; } }
    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate StorageInfra StorageInfra { get { return data; } set { data : value; } }
    field precate ClassInfra ClassInfra { get { return data; } set { data : value; } }
    field precate StorageComp StorageComp { get { return data; } set { data : value; } }
    field precate ErrorKindList ErrorKind { get { return data; } set { data : value; } }
    field precate StoragePathValid StoragePathValid { get { return data; } set { data : value; } }
    field precate Array ImportModuleRef { get { return data; } set { data : value; } }
    field precate Table BinaryTable { get { return data; } set { data : value; } }
    field precate Class AnyClass { get { return data; } set { data : value; } }
    field precate List ErrorList { get { return data; } set { data : value; } }
    field precate ModuleRef ModuleRef { get { return data; } set { data : value; } }
    field precate String SystemModuleSingle { get { return data; } set { data : value; } }
    field precate String SystemModulePre { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        var Bool b;
        b : this.ExecuteAll();

        this.Error : this.ListInfra.ArrayCreateList(this.ErrorList);

        this.ImportModuleRef : null;
        this.ModulePort.BinaryTable : null;
        this.ModulePort.ModuleTable : null;
        this.ModulePort.ModuleRef : null;
        this.ModulePort.AnyClass : null;
        this.ModulePort.Status : null;
        this.ModulePort.Result : null;
        this.AnyClass : null;
        this.ErrorList : null;
        this.ModuleRef : null;

        this.ClearData();
        return b;
    }

    maide precate Bool ExecuteAll()
    {
        this.Status : 0;

        this.ErrorList : new List;
        this.ErrorList.Init();

        var Bool b;

        b : this.ValidModuleRef(this.Port.Module);
        inf (~b)
        {
            return false;
        }

        b : this.ValidImportModuleRef(this.Port.Import);
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

    maide precate Bool ExecuteModuleRef()
    {
        var ModuleRef ka;
        ka : this.Port.Module;

        var ModuleRef k;
        k : this.ClassInfra.ModuleRefCreate(ka.Name, ka.Ver);

        inf (this.SystemModule)
        {
            k.Ver : 0;
        }

        this.ModuleRef : k;
        return true;
    }

    maide precate Bool ExecuteImportModuleRef()
    {
        var Array import;
        import : this.Port.Import;

        var Table table;
        table : this.ClassInfra.TableCreateModuleRefLess();

        var Array array;
        array : this.ListInfra.ArrayCreate(import.Count);

        var Int count;
        count : array.Count;

        var Int i;
        i : 0;
        while (i < count)
        {
            var PortImport ka;
            ka : cast PortImport(import.Get(i));

            var ModuleRef k;
            k : ka.Module;

            var String name;
            name : k.Name;
            var Int ver;
            ver : k.Ver;
            inf (ver = null)
            {
                ver : 0;
            }

            var ModuleRef a;
            a : this.ClassInfra.ModuleRefCreate(name, ver);

            inf (table.Valid(a))
            {
                this.Status : 30;
                return false;
            }

            this.ListInfra.TableAdd(table, a, a);

            array.Set(i, a);

            i : i + 1;
        }

        this.ImportModuleRef : array;
        return true;
    }

    maide precate Bool ValidModuleRef(var ModuleRef module)
    {
        var String name;
        name : module.Name;
        var Int ver;
        ver : module.Ver;

        inf (~this.NameValid.ModuleName(this.TA(name)))
        {
            this.Status : 1;
            return false;
        }

        inf (~this.SystemModule)
        {
            inf (ver = null)
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

    maide precate Bool ValidImportModuleRef(var Array array)
    {
        var Int count;
        count : array.Count;

        var Int i;
        i : 0;
        while (i < count)
        {
            var PortImport a;
            a : cast PortImport(array.Get(i));

            inf (~this.ValidImportModuleRefOne(a.Module))
            {
                this.Status : 10;
                return false;
            }

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ValidImportModuleRefOne(var ModuleRef moduleRef)
    {
        var String name;
        name : moduleRef.Name;
        var Int ver;
        ver : moduleRef.Ver;

        inf (~this.NameValid.ModuleName(this.TA(name)))
        {
            return false;
        }

        var Bool built;
        built : this.BuiltModuleRef(moduleRef);

        var Bool b;
        b : ver = null;

        var Bool a;
        a : built = b;
        return a;
    }

    maide precate Bool ExecuteBinaryLoad()
    {
        this.BinaryTable : this.ClassInfra.TableCreateModuleRefLess();

        var Array array;
        array : this.ImportModuleRef;

        var Int count;
        count : array.Count;

        var Int i;
        i : 0;
        while (i < count)
        {
            var ModuleRef a;
            a : cast ModuleRef(array.Get(i));

            var Bool b;
            b : this.BinaryLoadRecurse(a);
            inf (~b)
            {
                var String k;
                k : this.ModuleRefString(a);

                this.ErrorAdd(this.ErrorKind.ModuleUnvalid, k);

                this.Status : 50;
                return false;
            }

            i : i + 1;
        }
        return true;
    }

    maide precate Bool BinaryLoadRecurse(var ModuleRef moduleRef)
    {
        inf (this.BinaryTable.Valid(moduleRef))
        {
            return true;
        }

        var Binary binary;
        binary : this.BinaryLoad(moduleRef);
        inf (binary = null)
        {
            return false;
        }

        var Array array;
        array : binary.Import;

        var Int count;
        count : array.Count;

        var Int i;
        i : 0;
        while (i < count)
        {
            var BinaryImport import;
            import : cast BinaryImport(array.Get(i));

            var Bool b;
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

    maide precate Binary BinaryLoad(var ModuleRef moduleRef)
    {
        var String moduleRefString;
        moduleRefString : this.ModuleRefString(moduleRef);

        var String filePath;
        filePath : this.AddClear().Add(this.ClassInfra.ClassModulePath(this.ClassPath))
            .Add(this.TextInfra.PathCombine).Add(moduleRefString)
            .Add(this.TextInfra.PathCombine).Add("Module").AddResult();

        var Data data;
        data : this.StorageInfra.DataRead(filePath);

        inf (data = null)
        {
            return null;
        }

        var BinaryRead read;
        read : this.BinaryRead;

        read.Data : data;

        read.Execute();

        var Binary binary;
        binary : read.Result;

        read.Result : null;
        read.Data : null;

        var Binary a;
        a : binary;
        return a;
    }

    maide precate Bool ExecuteDepend()
    {
        var ModuleRef ka;
        ka : this.ModuleRef;

        inf (this.BinaryTable.Valid(ka))
        {
            var String k;
            k : this.ModuleRefString(ka);

            this.ErrorAdd(this.ErrorKind.ModuleUndefine, k);

            this.Status : 60;
            return false;
        }

        return true;
    }

    maide precate Bool ExecuteModulePort()
    {
        var ModulePort modulePort;
        modulePort : this.ModulePort;

        modulePort.BinaryTable : this.BinaryTable;
        modulePort.ModuleTable : this.ModuleTable;

        var Iter iter;
        iter : this.BinaryTable.IterCreate();
        this.BinaryTable.IterSet(iter);

        while (iter.Next())
        {
            var ModuleRef moduleRef;
            moduleRef : cast ModuleRef(iter.Index);

            modulePort.ModuleRef : moduleRef;
            modulePort.AnyClass : this.AnyClass;

            var Bool b;
            b : modulePort.Execute();

            inf (~b)
            {
                var Int ka;
                ka : modulePort.Status;

                var String k;
                k : this.ModuleRefString(moduleRef);

                this.ErrorAdd(this.ErrorKind.ModuleUndefine, k);

                this.Status : 200 + ka;
                return false;
            }

            var Module a;
            a : modulePort.Result;

            this.AnyClass : modulePort.AnyClass;

            modulePort.Result : null;
            modulePort.Status : null;
            modulePort.AnyClass : null;
            modulePort.ModuleRef : null;

            this.ListInfra.TableAdd(this.ModuleTable, a.Ref, a);
        }

        return true;
    }

    maide precate Bool ExecuteCreateModule()
    {
        var Module module;
        module : new Module;
        module.Init();
        module.Ref : this.ModuleRef;
        module.Class : this.ClassInfra.TableCreateStringLess();
        module.Import : this.ClassInfra.TableCreateModuleRefLess();
        module.Export : this.ClassInfra.TableCreateStringLess();

        module.Storage : new Table;
        module.Storage.Less : this.StorageStringLessCreate();
        module.Storage.Init();

        this.Module : module;
        return true;
    }

    maide precate StringLess StorageStringLessCreate()
    {
        var StringLess a;
        a : new StringLess;
        a.LiteForm : this.StorageInfra.NameForm;
        a.RiteForm : this.StorageInfra.NameForm;
        a.CharLess : this.ILess;
        a.Init();
        return a;
    }

    maide precate Bool ExecuteImport()
    {
        var Array array;
        array : this.Port.Import;

        var Bool b;
        b : false;

        var Int count;
        count : array.Count;

        var Int i;
        i : 0;
        while (i < count)
        {
            var ModuleRef moduleRef;
            moduleRef : cast ModuleRef(this.ImportModuleRef.Get(i));

            var Module module;
            module : cast Module(this.ModuleTable.Get(moduleRef));

            var Table importTable;
            importTable : this.ClassInfra.TableCreateRefLess();

            this.ListInfra.TableAdd(this.Module.Import, moduleRef, importTable);

            var PortImport portImport;
            portImport : cast PortImport(array.Get(i));

            var Array importClassArray;
            importClassArray : portImport.Class;

            var Int countA;
            countA : importClassArray.Count;

            var Int iA;
            iA : 0;
            while (iA < countA)
            {
                var PortImportClass importClass;
                importClass : cast PortImportClass(importClassArray.Get(iA));

                var String className;
                className : importClass.Class;

                var Class varClass;
                varClass : null;

                var Bool ba;
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
                    varClass : cast Class(module.Class.Get(className));

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

                var String name;
                name : importClass.Name;

                var Bool bb;
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

    maide precate Bool ExecuteExport()
    {
        var Array array;
        array : this.Port.Export;

        var Bool b;
        b : false;

        var Int count;
        count : array.Count;

        var Int i;
        i : 0;
        while (i < count)
        {
            var PortExport portExport;
            portExport : cast PortExport(array.Get(i));

            var String name;
            name : portExport.Class;

            var Bool ba;
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

    maide precate Bool ExecuteStorage()
    {
        var Array array;
        array : this.Port.Storage;

        var Bool b;
        b : false;

        var Int count;
        count : array.Count;

        var Int i;
        i : 0;
        while (i < count)
        {
            var PortStorage portStorage;
            portStorage : cast PortStorage(array.Get(i));

            var String sourcePathKa;
            var String destPathKa;
            sourcePathKa : portStorage.Source;
            destPathKa : portStorage.Dest;

            var Text sourcePathK;
            var String sourcePath;
            sourcePathK : this.TextTrimEnd(this.TextTrimStart(this.TA(sourcePathKa)));
            sourcePath : this.StringCreate(sourcePathK);

            var Text destPathK;
            var String destPath;
            destPathK : this.TextTrimEnd(this.TextTrimStart(this.TA(destPathKa)));
            destPath : this.StringCreate(destPathK);

            var String sourcePathA;
            sourcePathA : sourcePath;

            inf (this.StorageInfra.PathRelate(this.TA(sourcePath), this.TLess))
            {
                sourcePathA : this.AddClear().Add(this.SourceFold).Add(this.TextInfra.PathCombine).Add(sourcePath).AddResult();
            }

            var Bool ba;
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

    maide precate Bool ExecuteEntry()
    {
        var String entry;
        entry : this.Port.Entry;

        inf (entry = null)
        {
            return true;
        }

        var Bool b;
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

    maide precate String ModuleRefString(ModuleRef k)
    {
        var String verString;
        verString : this.ClassInfra.VerString(k.Ver);

        var String a;
        a : this.ClassInfra.ModuleRefString(k.Name, verString);
        return a;
    }

    maide precate Bool BuiltModuleRef(ModuleRef moduleRef)
    {
        var String name;
        name : moduleRef.Name;

        var Text textName;
        textName : this.TA(name);

        var Bool b;
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

    maide precate Bool ErrorAdd(ErrorKind kind, String name)
    {
        var Error a;
        a : new Error;
        a.Init();
        a.Kind : kind;
        a.Name : name;
        a.Source : null;

        this.ErrorList.Add(a);
        return true;
    }
}