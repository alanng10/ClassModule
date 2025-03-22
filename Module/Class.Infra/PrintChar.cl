class PrintChar : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.TextInfra : share TextInfra;
        return true;
    }

    field precate TextInfra TextInfra { get { return data; } set { data : value; } }

    maide prusate Bool Get(var Int index)
    {
        var Int first;
        var Int last;
        first : this.TextInfra.Char(" ");
        last : this.TextInfra.Char("~");

        var Bool a;
        a : this.TextInfra.Range(first, last, index);
        return a;
    }
}