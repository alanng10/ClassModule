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
}