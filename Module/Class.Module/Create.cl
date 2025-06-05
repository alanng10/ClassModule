class Create : ClassCreate
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.ClassInfra : share ClassInfra;
        this.Count : share CountList;
        this.ErrorKind : share ErrorKindList;

        this.System : this.CreateSystem();
        this.NullClass : this.CreateNullClass();
        this.InitTravel : this.CreateInitTravel();
        this.ClassTravel : this.CreateClassTravel();
        this.CompTravel : this.CreateCompTravel();
        this.StateTravel : this.CreateStateTravel();
        this.ModuleRef : this.CreateModuleRef();
        return true;
    }

    maide precate System CreateSystem()
    {
        var System a;
        a : new System;
        a.Init();
        return a;
    }

    maide precate Class CreateNullClass()
    {
        var Class a;
        a : new Class;
        a.Init();
        a.Name : "_";
        return a;
    }

    maide precate InitTravel CreateInitTravel()
    {
        var InitTravel a;
        a : new InitTravel;
        a.Create : this;
        a.Init();
        return a;
    }

    maide precate ClassTravel CreateClassTravel()
    {
        var ClassTravel a;
        a : new ClassTravel;
        a.Create : this;
        a.Init();
        return a;
    }

    maide precate CompTravel CreateCompTravel()
    {
        var CompTravel a;
        a : new CompTravel;
        a.Create : this;
        a.Init();
        return a;
    }

    maide precate StateTravel CreateStateTravel()
    {
        var StateTravel a;
        a : new StateTravel;
        a.Create : this;
        a.Init();
        return a;
    }

    maide precate ModuleRef CreateModuleRef()
    {
        return this.ClassInfra.ModuleRefCreate(null, 0);
    }

    field prusate Array Source { get { return data; } set { data : value; } }
    field prusate Array RootNode { get { return data; } set { data : value; } }
    field prusate Module Module { get { return data; } set { data : value; } }
    field prusate Table ModuleTable { get { return data; } set { data : value; } }
    field prusate Table ImportClass { get { return data; } set { data : value; } }
    field prusate Result Result { get { return data; } set { data : value; } }
    field prusate Int SourceIndex { get { return data; } set { data : value; } }
    field prusate System System { get { return data; } set { data : value; } }
    field prusate Class NullClass { get { return data; } set { data : value; } }
    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate ClassInfra ClassInfra { get { return data; } set { data : value; } }
    field precate CountList Count { get { return data; } set { data : value; } }
    field precate ErrorKindList ErrorKind { get { return data; } set { data : value; } }
    field precate InitTravel InitTravel { get { return data; } set { data : value; } }
    field precate ClassTravel ClassTravel { get { return data; } set { data : value; } }
    field precate CompTravel CompTravel { get { return data; } set { data : value; } }
    field precate StateTravel StateTravel { get { return data; } set { data : value; } }
    field precate List ErrorList { get { return data; } set { data : value; } }
    field precate Table BaseTable { get { return data; } set { data : value; } }
    field precate Table VirtualTable { get { return data; } set { data : value; } }
    field precate Table RangeTable { get { return data; } set { data : value; } }
    field precate ModuleRef ModuleRef { get { return data; } set { data : value; } }
    field precate Bool SystemInfra { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        this.Result : new Result;
        this.Result.Init();

        this.ErrorList : new List;
        this.ErrorList.Init();

        this.SystemInfra : this.ModuleSystemInfra();

        this.ExecuteInit();
        this.ExecuteClass();
        this.ExecuteBase();
        this.ExecuteComp();
        this.ExecuteVirtual();
        this.ExecuteExport();
        this.ExecuteEntry();
        this.ExecuteState();

        this.Result.Module : this.Module;
        this.Result.Error : this.ListInfra.ArrayCreateList(this.ErrorList);
        this.ErrorList : null;
        return true;
    }

    maide precate Bool SystemSet()
    {
        var Module k;

        inf (this.SystemInfra)
        {
            k : this.Module;
        }
        inf (~this.SystemInfra)
        {
            k : this.ModuleGet("System.Infra");
        }

        this.System.Any : this.ModuleClassGet(k, "Any");
        this.System.Bool : this.ModuleClassGet(k, "Bool");
        this.System.Int : this.ModuleClassGet(k, "Int");
        this.System.String : this.ModuleClassGet(k, "String");
        return true;
    }

    maide precate Module ModuleGet(var String moduleName)
    {
        this.ModuleRef.Name : moduleName;

        var Module a;
        a : cast Module(this.ModuleTable.Get(this.ModuleRef));
        return a;
    }

    maide precate Class ModuleClassGet(var Module module, var String className)
    {
        return cast Class(module.Class.Get(className));
    }

    maide precate Bool ModuleSystemInfra()
    {
        return this.TextSame(this.TA(this.Module.Ref.Name), this.TB("System.Infra"));
    }

    maide precate Bool ExecuteInit()
    {
        this.ExecuteTravel(this.InitTravel);
        return true;
    }

    maide precate Bool ExecuteClass()
    {
        this.ExecuteTravel(this.ClassTravel);

        this.SystemSet();
        return true;
    }

    maide precate Bool ExecuteBase()
    {
        this.BaseTableSet();

        this.BaseClassSet();

        this.BaseTable : null;

        this.BaseCountSet();
        return true;
    }

    maide precate Bool BaseTableSet()
    {
        this.BaseTable : this.ClassInfra.TableCreateRefLess();

        var Iter iter;
        iter : this.Module.Class.IterCreate();
        this.Module.Class.IterSet(iter);
        while (iter.Next())
        {
            var Class varClass;
            varClass : cast Class(iter.Value);
            this.BaseTableAdd(varClass);
        }
        return true;
    }

    maide precate Bool BaseTableAdd(var Class varClass)
    {
        var NodeClass nodeClass;
        nodeClass : cast NodeClass(varClass.Any);

        var ClassName nodeBase;
        nodeBase : nodeClass.Base;

        var String baseName;
        inf (~(nodeBase = null))
        {
            baseName : nodeBase.Value;
        }

        var Class varBase;
        inf (~(baseName = null))
        {
            varBase : this.Class(baseName);
        }

        var Bool b;
        b : false;

        var Bool ba;
        ba : (varBase = null);
        inf (ba)
        {
            this.Error(this.ErrorKind.BaseUndefine, nodeClass, varClass.Index);
            b : true;
        }

        inf (~ba)
        {
            inf (~this.BaseValidClass(varBase))
            {
                this.Error(this.ErrorKind.BaseUndefine, nodeClass, varClass.Index);
                b : true;
            }
        }

        var Class a;
        a : varBase;

        inf (b)
        {
            a : this.System.Any;
        }

        this.ListInfra.TableAdd(this.BaseTable, varClass, a);
        return true;
    }

    maide precate Bool BaseValidClass(var Class varClass)
    {
        var System k;
        k : this.System;

        inf (varClass = k.Bool | varClass = k.Int | varClass = k.String)
        {
            return false;
        }
        return true;
    }

    maide precate Bool BaseClassSet()
    {
        var Class anyClass;
        anyClass : this.System.Any;

        var Iter iter;
        iter : this.BaseTable.IterCreate();
        this.BaseTable.IterSet(iter);

        while (iter.Next())
        {
            var Class varClass;
            varClass : cast Class(iter.Index);

            var Bool b;
            b : false;

            var Bool ba;
            ba : varClass = anyClass;

            inf (ba)
            {
                b : true;
            }

            inf (~ba)
            {
                b : this.BaseValidDepend(varClass);
            }

            var Class a;

            inf (~b)
            {
                var NodeClass nodeClass;
                nodeClass : cast NodeClass(varClass.Any);

                this.Error(this.ErrorKind.BaseUndefine, nodeClass, varClass.Index);

                a : anyClass;
            }

            inf (b)
            {
                a : cast Class(iter.Value);
            }

            varClass.Base : a;
        }

        return true;
    }

    maide precate Bool BaseValidDepend(var Class varClass)
    {
        var Table table;
        table : this.ClassInfra.TableCreateRefLess();

        var Class a;
        a : varClass;

        while (~(a = null))
        {
            inf (~(a.Module = this.Module))
            {
                return true;
            }

            inf (table.Valid(a))
            {
                return false;
            }

            this.ListInfra.TableAdd(table, a, a);

            var Class ka;
            inf (~(a = this.System.Any))
            {
                ka : cast Class(this.BaseTable.Get(a));
            }
            a : ka;
        }

        return true;
    }

    maide precate Bool BaseCountSet()
    {
        var Iter iter;
        iter : this.Module.Class.IterCreate();
        this.Module.Class.IterSet(iter);
        while (iter.Next())
        {
            var Class k;
            k : cast Class(iter.Value);

            var Int ka;
            ka : this.ClassInfra.BaseCount(k, this.System.Any);

            k.BaseCount : ka;
        }

        return true;
    }

    maide precate Bool ExecuteComp()
    {
        this.ExecuteTravel(this.CompTravel);
        return true;
    }

    maide precate Bool ExecuteVirtual()
    {
        this.VirtualSet();

        this.VirtualRange();
        return true;
    }

    maide precate Bool VirtualSet()
    {
        this.VirtualTable : this.ClassInfra.TableCreateRefLess();

        var Iter iter;
        iter : this.Module.Class.IterCreate();
        this.Module.Class.IterSet(iter);
        while (iter.Next())
        {
            var Class a;
            a : cast Class(iter.Value);

            this.VirtualSetClass(a);
        }

        this.VirtualTable : null;

        return true;
    }

    maide precate Bool VirtualSetClass(var Class varClass)
    {
        inf (this.VirtualTable.Valid(varClass))
        {
            return true;
        }

        inf (~(varClass.Module = this.Module))
        {
            return true;
        }

        var Bool b;
        b : varClass = this.System.Any;

        inf (~b)
        {
            var Class baseClass;
            baseClass : varClass.Base;

            this.VirtualSetClass(baseClass);
        }

        this.VirtualSetClassComp(varClass);

        this.ListInfra.TableAdd(this.VirtualTable, varClass, varClass);

        return true;
    }

    maide precate Bool VirtualSetClassComp(var Class varClass)
    {
        var Table fieldTable;
        fieldTable : this.ClassInfra.TableCreateStringLess();

        var Table maideTable;
        maideTable : this.ClassInfra.TableCreateStringLess();

        var Iter iter;
        iter : varClass.Field.IterCreate();
        varClass.Field.IterSet(iter);
        while (iter.Next())
        {
            var Field varField;
            varField : cast Field(iter.Value);

            var Bool ba;
            ba : this.ClassInfra.VirtualField(varField, this.System.Any);

            var NodeField node;
            node : cast NodeField(varField.Any);

            inf (~ba)
            {
                this.Error(this.ErrorKind.FieldUndefine, node, varClass.Index);
            }

            inf (ba)
            {
                varField.Index : fieldTable.Count;

                this.Info(node).Field : varField;

                this.ListInfra.TableAdd(fieldTable, varField.Name, varField);
            }
        }

        var Iter iterA;
        iterA : new TableIter;
        iterA.Init();

        var Iter iterB;
        iterB : new TableIter;
        iterB.Init();

        iter : varClass.Maide.IterCreate();
        varClass.Maide.IterSet(iter);
        while (iter.Next())
        {
            var Maide varMaide;
            varMaide : cast Maide(iter.Value);

            var Bool bb;
            bb : this.ClassInfra.VirtualMaide(varMaide, this.System.Any, iterA, iterB);

            var NodeMaide node;
            node : cast NodeMaide(varMaide.Any);

            inf (~bb)
            {
                this.Error(this.ErrorKind.MaideUndefine, node, varClass.Index);
            }

            inf (bb)
            {
                varMaide.Index : maideTable.Count;

                this.Info(node).Maide : varMaide;

                this.ListInfra.TableAdd(maideTable, varMaide.Name, varMaide);
            }
        }

        varClass.Field : fieldTable;
        varClass.Maide : maideTable;
        return true;
    }

    maide prusate Info Info(var Node node)
    {
        return cast Info(node.NodeAny);
    }

    maide precate Bool VirtualRange()
    {
        this.RangeTable : this.ClassInfra.TableCreateRefLess();

        var Iter iter;
        iter : this.Module.Class.IterCreate();
        this.Module.Class.IterSet(iter);
        while (iter.Next())
        {
            var Class a;
            a : cast Class(iter.Value);

            this.VirtualRangeClass(a);
        }

        this.RangeTable : null;
        return true;
    }

    maide precate Bool VirtualRangeClass(var Class varClass)
    {
        inf (this.RangeTable.Valid(varClass))
        {
            return true;
        }

        inf (~(varClass.Module = this.Module))
        {
            return true;
        }

        var Bool b;
        b : varClass = this.System.Any;

        inf (b)
        {
            varClass.FieldStart : 0;

            varClass.MaideStart : 0;
        }
        inf (~b)
        {
            var Class baseClass;
            baseClass : varClass.Base;

            this.VirtualRangeClass(baseClass);

            varClass.FieldStart : baseClass.FieldStart + baseClass.Field.Count;

            varClass.MaideStart : baseClass.MaideStart + baseClass.Maide.Count;
        }

        this.ListInfra.TableAdd(this.RangeTable, varClass, varClass);

        return true;
    }

    maide precate Bool ExecuteExport()
    {
        var List list;
        list : new List;
        list.Init();

        var Iter iter;
        iter : this.Module.Export.IterCreate();
        this.Module.Export.IterSet(iter);
        while (iter.Next())
        {
            var String name;
            name : cast String(iter.Index);

            var Class varClass;
            varClass : this.ModuleClassGet(this.Module, name);

            var Bool b;
            b : varClass = null;
            inf (b)
            {
                this.ErrorModule(this.ErrorKind.ExportUndefine, name);
            }
            inf (~b)
            {
                this.ExportValidSet(varClass);

                list.Add(varClass);
            }
        }

        iter : list.IterCreate();
        list.IterSet(iter);
        while (iter.Next())
        {
            var Class kk;
            kk : cast Class(iter.Value);

            this.Module.Export.Set(kk.Name, kk);
        }
        return true;
    }

    maide precate Bool ExportValidSet(var Class varClass)
    {
        inf (~this.ExportValidClass(varClass.Base))
        {
            var NodeClass ka;
            ka : cast NodeClass(varClass.Any);
            this.Error(this.ErrorKind.ClassUnexport, ka, varClass.Index);
        }

        var Iter iter;
        iter : varClass.Field.IterCreate();
        varClass.Field.IterSet(iter);
        while (iter.Next())
        {
            var Field varField;
            varField : cast Field(iter.Value);
            inf (this.ExportValidCount(varField.Count))
            {
                inf (~this.ExportValidClass(varField.Class))
                {
                    var NodeField kb;
                    kb : cast NodeField(varField.Any);
                    this.Error(this.ErrorKind.FieldUnexport, kb, varClass.Index);
                }
            }
        }

        iter : varClass.Maide.IterCreate();
        varClass.Maide.IterSet(iter);
        while (iter.Next())
        {
            var Maide varMaide;
            varMaide : cast Maide(iter.Value);
            inf (this.ExportValidCount(varMaide.Count))
            {
                var Bool b;
                b : false;
                inf (~this.ExportValidClass(varMaide.Class))
                {
                    b : true;
                }
                inf (~b)
                {
                    var Iter iterA;
                    iterA : varMaide.Param.IterCreate();
                    varMaide.Param.IterSet(iterA);
                    while (~b & iterA.Next())
                    {
                        var Var varVar;
                        varVar : cast Var(iterA.Value);
                        inf (~this.ExportValidClass(varVar.Class))
                        {
                            b : true;
                        }
                    }
                }
                inf (b)
                {
                    var NodeMaide kc;
                    kc : cast NodeMaide(varMaide.Any);
                    this.Error(this.ErrorKind.MaideUnexport, kc, varClass.Index);
                }
            }
        }
        return true;
    }

    maide precate Bool ExportValidCount(var Count count)
    {
        inf (count = this.Count.Prusate | count = this.Count.Precate)
        {
            return true;
        }
        return false;
    }

    maide precate Bool ExportValidClass(var Class varClass)
    {
        inf (~(varClass.Module = this.Module))
        {
            return true;
        }

        var Bool a;
        a : this.Module.Export.Valid(varClass.Name);
        return a;
    }

    maide precate Bool ExecuteEntry()
    {
        var String entry;
        entry : this.Module.Entry;
        inf (entry = null)
        {
            return true;
        }

        var Class varClass;
        varClass : this.ModuleClassGet(this.Module, entry);
        inf (varClass = null)
        {
            this.ErrorModule(this.ErrorKind.EntryUndefine, null);
            return true;
        }

        var Bool b;
        b : false;

        var Moduke ka;

        var Class entryClass;
        
        inf (~b)
        {
            ka : this.ModuleGet("System.Entry");

            inf (ka = null)
            {
                b : true;
            }
        }

        inf (~b)
        {
            entryClass = this.ModuleClassGet(ka, "Entry");

            inf (entryClass = null)
            {
                b : true;
            }
        }

        inf (~b)
        {
            inf (~(this.ClassInfra.ValidClass(varClass, entryClass, this.System.Any, this.NullClass)))
            {
                b : true;
            }
        }

        inf (b)
        {
            var NodeClass k;
            k : cast NodeClass(varClass.Any);

            this.Error(this.ErrorKind.EntryUnachieve, k, varClass.Index);
        }

        return true;
    }

    maide precate Bool ExecuteState()
    {
        this.ExecuteTravel(this.StateTravel);
        return true;
    }

    maide precate Bool ExecuteTravel(var Travel travel)
    {
        var Int count;
        count : this.Source.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Node root;
            root : cast Node(this.RootNode.Get(i));

            var NodeClass nodeClass;
            nodeClass : cast NodeClass(root);

            this.SourceIndex : i;

            travel.ExecuteClass(nodeClass);

            this.SourceIndex : null;

            i : i + 1;
        }
        return true;
    }

    maide prusate Class Class(var String name)
    {
        var Class a;
        a : cast Class(this.ImportClass.Get(name));
        inf (~(a = null))
        {
            return a;
        }

        a : cast Class(this.Module.Class.Get(name));
        return a;
    }

    maide prusate Bool Error(var ErrorKind kind, var Node node, var Int source)
    {
        var Error a;
        a : new Error;
        a.Init();
        a.Stage : this.Stage;
        a.Kind : kind;
        a.Range : node.Range;
        a.Source : source;

        this.ErrorList.Add(a);
        return true;
    }

    maide prusate Bool ErrorModule(var ErrorKind kind, var String name)
    {
        var Error a;
        a : new Error;
        a.Init();
        a.Stage : this.Stage;
        a.Kind : kind;
        a.Name : name;

        this.ErrorList.Add(a);
        return true;
    }
}