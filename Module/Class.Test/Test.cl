class Test : TextAdd
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.StorageInfra : share StorageInfra;
        this.ClassInfra : share ClassInfra;
        this.SystemConsole : share Console;
        this.StorageComp : share StorageComp;
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
}