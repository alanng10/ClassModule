class Test : TextAdd
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.StorageInfra : share StorageInfra;
        this.ClassInfra : share ClassInfra;
        this.Console : share Console;
        this.StorageComp : share StorageComp;

        this.DataFold : this.ClassInfra.TextDot;

        this.ResultSpace : this.StringComp.CreateChar(this.Char(" "), 4);

        this.LangName : this.CreateLangName();

        this.SetTable : this.ClassInfra.TableCreateStringLess();

        this.AddSetList();
    }
}