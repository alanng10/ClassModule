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

        this.ListInfra.TableAdd(this.SetTable, k.Name, k);
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

    maide prusate Int Execute()
    {
        var Bool b;
        b : this.SetWorkFold();
        inf (~b)
        {
            return 700;
        }

        this.ExecuteSetList();
        return 0;
    }

    maide precate Bool ExecuteSetList()
    {
        var Iter iter;
        iter : this.SetTable.IterCreate();
        this.SetTable.IterSet(iter);
        while (iter.Next())
        {
            this.Set : cast Set(iter.Value);

            this.AddSetUnitList();

            this.ExecuteSet();

            this.Set : null;
        }
        return true;
    }

    maide precate Bool AddSetUnitList()
    {
        this.UnitList : new List;
        this.UnitList.Init();

        var String combine;
        combine : this.TextInfra.PathCombine;

        var String varSet;
        varSet : this.Set.Name;

        var String setFold;
        setFold : this.AddClear().Add(this.DataFold).Add(combine).Add(varSet).AddResult();

        var Array kindList;
        kindList : this.FoldList(setFold);

        var Iter kindIter;
        kindIter : kindList.IterCreate();
        kindList.IterSet(kindIter);
        while (kindIter.Next())
        {
            var String kind;
            kind : cast String(kindIter.Value);

            var String kindFold;
            kindFold : this.AddClear().Add(setFold).Add(combine).Add(kind).AddResult();

            var Array unitList;
            unitList : this.FoldList(kindFold);

            var Iter unitIter;
            unitIter : unitList.IterCreate();
            unitList.IterSet(unitIter);
            while (unitIter.Next())
            {
                var String unit;
                unit : cast String(unitIter.Value);

                var String unitFold;
                unitFold : this.AddClear().Add(kindFold).Add(combine).Add(unit).AddResult();

                var String expectFile;
                expectFile : this.AddClear().Add(unitFold).Add(combine).Add("Expect").AddResult();

                var String expect;
                expect : this.StorageInfra.TextRead(expectFile);

                var String path;

                var Unit a;
                a : new Unit;
                a.Init();
                a.Set : this.Set;
                a.Kind : kind;
                a.Name : unit;
                a.Expect : expect;
                a.Path : path;
                this.UnitList.Add(a);
            }
        }
        return true;
    }

    maide precate Bool ExecuteSet()
    {
        this.WriteHead(this.Set.Name);

        this.PassCount : 0;
        this.UnitIndex : 0;

        var Iter iter;
        iter : this.UnitList.IterCreate();
        this.UnitList.IterSet(iter);
        while (iter.Next())
        {
            this.Unit : cast Unit(iter.Value);

            this.ExecuteUnit();

            this.WriteUnitResult();

            this.Unit : null;

            this.UnitIndex : this.UnitIndex + 1;

            inf (this.UnitPass)
            {
                this.PassCount : this.PassCount + 1;
            }
        }

        this.WriteTotalResult();
        return true;
    }

    maide precate Bool ExecuteUnit()
    {
        var String combine;
        combine : this.TextInfra.PathCombine;

        this.UnitFold : this.AddClear().Add(this.DataFold).Add(combine)
            .Add(this.Unit.Set.Name).Add(combine)
            .Add(this.Unit.Kind).Add(combine)
            .Add(this.Unit.Name).AddResult();

        this.Out : new StringOut;
        this.Out.Init();
        this.Err : new StringOut;
        this.Err.Init();

        this.StorageComp.ThisFoldSet(this.UnitFold);

        var Task task;
        task : this.CreateTask();
        this.Console.Task : task;

        this.Console.Execute();

        this.StorageComp.ThisFoldSet(this.InitThisFold);

        var String actual;
        var String actualOut;
        var String actualErr;

        actualOut : this.Out.Result();
        actualErr : this.Err.Result();

        actual : this.AddClear().Add(actualErr).Add(actualOut).AddResult();

        var String actualFile;
        actualFile : this.AddClear().Add(this.UnitFold).Add(combine).Add("Actual").AddResult();

        this.StorageInfra.TextWrite(actualFile, actual);

        this.Unit.Actual : actual;

        var Bool pass;
        pass : this.TextSame(this.TA(this.Unit.Actual), this.TB(this.Unit.Expect));

        this.UnitPass : pass;
        return true;
    }

    maide precate Bool WriteUnitResult()
    {
        this.WriteResultLine(this.UnitPass, this.Unit.Set.Name, this.Unit.Kind, this.Unit.Name);
        return true;
    }

    maide precate Bool WriteResultLine(var Bool pass, var String varSet, var String kind, var String unit)
    {
        var String a;

        var Bool b;
        b : pass;
        inf (b)
        {
            a : "Pass";
        }
        inf (~b)
        {
            a : "Fail";
        }

        var String u;
        u : this.StringTextFormat(this.TA(varSet), true, 8, null, this.Char(" "));

        var String k;
        k : this.StringTextFormat(this.TA(kind), true, 24, null, this.Char(" "));

        var String j;
        j : unit;

        var Int n;
        n : this.UnitIndex;

        var String p;
        p : this.StringIntFormat(n, 10, false, 3, null, this.Char("0"));

        var String t;
        t : this.ResultSpace;

        var String s;
        s : this.AddClear().Add(p).Add(t).Add(a).Add(t).Add(u).Add(t)
            .Add(k).Add(" ").Add(j).AddLine().AddResult();

        this.SystemConsole.Out.Write(s);
        return true;
    }

    maide precate Bool WriteTotalResult()
    {
        var String k;

        var Int unitCount;
        unitCount : this.UnitIndex;

        var Bool b;
        b : this.PassCount = unitCount;
        inf (b)
        {
            k : "All";
        }
        inf (~b)
        {
            k : this.StringInt(this.PassCount);
        }

        var String a;
        a : this.AddClear().Add(k).Add(" ").Add("Pass").AddLine().AddResult();

        this.SystemConsole.Out.Write(a);
        return true;
    }

    maide precate Bool WriteHead(var String setName)
    {
        var String s;
        s : this.StringCreate(this.TextAlphaNite(this.TA(this.LangName)));

        var String k;
        k : this.StringCreate(this.TextAlphaNite(this.TA(setName)));

        var String line;
        line : "==============================";

        var String a;
        a : this.AddClear()
            .Add(line)
            .Add(" ").Add(s).Add(" ").Add(k).Add(" ").Add("TEST").Add(" ")
            .Add(line)
            .AddLine()
            .AddResult();

        this.SystemConsole.Out.Write(a);
        return true;
    }

    maide precate Task CreateTask()
    {
        var Task task;
        task : new Task;
        task.Init();
        task.Kind : this.Unit.Set.TaskKind;

        var Bool ba;
        ba : this.Set.AddKindAfterTaskArg;
        inf (ba)
        {
            task.Node : this.Unit.Kind;
        }
        inf (~ba)
        {
            task.Node : "Class";
        }

        task.Print : true;

        var String source;
        
        var Bool b;
        b : this.Set.SourceFold;
        inf (b)
        {
            source : "Source";
        }
        inf (~b)
        {
            source : "Code";
        }
        task.Source : source;

        task.Out : this.Out;
        task.Err : this.Err;

        var Task ret;
        ret : task;
        return ret;
    }

    maide precate Array FoldList(var String foldPath)
    {
        var Array a;
        a : this.StorageComp.EntryInfoList(foldPath, true, false);
        return a;
    }
}