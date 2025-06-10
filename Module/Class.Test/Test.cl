class Test : TextAdd
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.StorageInfra : share StorageInfra;
        this.ClassInfra : share ClassInfra;
        this.StorageComp : share StorageComp;
        this.SystemConsole : share Console;
        this.TaskKindList : share TaskKindList;

        this.Console : this.CreateConsole();
        this.LangName : this.CreateLangName();
        this.SetTable : this.CreateSetTable();
        this.DataFold : this.CreateDataFold();
        this.ResultSpace : this.CreateResultSpace();

        this.AddSetList();
        return true;
    }

    maide precate ClassConsole CreateConsole()
    {
        var ClassConsole a;
        a : new ClassConsole;
        a.Init();
        return a;
    }

    maide precate String CreateLangName()
    {
        return "Class";
    }

    maide precate Table CreateSetTable()
    {
        return this.ClassInfra.TableCreateStringLess();
    }

    maide precate String CreateDataFold()
    {
        return this.ClassInfra.TextDot;
    }

    maide precate String CreateResultSpace()
    {
        return this.StringComp.CreateChar(this.Char(" "), 4);
    }

    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate StorageInfra StorageInfra { get { return data; } set { data : value; } }
    field precate ClassInfra ClassInfra { get { return data; } set { data : value; } }
    field precate StorageComp StorageComp { get { return data; } set { data : value; } }
    field precate Console SystemConsole { get { return data; } set { data : value; } }
    field precate TaskKindList TaskKindList { get { return data; } set { data : value; } }
    field precate String LangName { get { return data; } set { data : value; } }
    field precate String DataFold { get { return data; } set { data : value; } }
    field precate List UnitList { get { return data; } set { data : value; } }
    field precate Table SetTable { get { return data; } set { data : value; } }
    field precate Set Set { get { return data; } set { data : value; } }
    field precate Unit Unit { get { return data; } set { data : value; } }
    field precate Int PassCount { get { return data; } set { data : value; } }
    field precate ClassConsole Console { get { return data; } set { data : value; } }
    field precate String UnitFold { get { return data; } set { data : value; } }
    field precate StringOut Out { get { return data; } set { data : value; } }
    field precate StringOut Err { get { return data; } set { data : value; } }
    field precate String InitThisFold { get { return data; } set { data : value; } }
    field precate String ResultSpace { get { return data; } set { data : value; } }
    field precate Int UnitIndex { get { return data; } set { data : value; } }
    field precate Bool UnitPass { get { return data; } set { data : value; } }

    maide precate String DataRootFold()
    {
        return "../../Saber/SaberTest/Test";
    }

    maide precate Bool AddSetList()
    {
        this.AddSet("Token", this.TaskKindList.Token, false, false, false);

        this.AddSet("Node", this.TaskKindList.Node, true, false, false);
        return true;
    }

    maide precate Bool AddSet(var String name, var TaskKind taskKind, var Bool addKindAfterTaskArg, var Bool addPathAfterTaskArg, var Bool sourceFold)
    {
        var Set k;
        k : new Set;
        k.Init();
        k.Name : name;
        k.TaskKind : taskKind;
        k.AddKindAfterTaskArg : addKindAfterTaskArg;
        k.AddPathAfterTaskArg : addPathAfterTaskArg;
        k.SourceFold : sourceFold;

        this.ListInfra.TableAdd(this.SetTable, k.name, k);
        return true;
    }

    maide precate Bool SetWorkFold()
    {
        var String k;
        k : this.DataRootFold();

        var Bool b;
        b : this.StorageComp.ThisFoldSet(k);

        inf (~b)
        {
            return false;
        }

        this.InitThisFold : this.StorageComp.ThisFoldGet();
        return true;
    }
}