class Infra : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        this.TextInfra : share TextInfra;
        this.CountList : share CountList;

        this.TextQuote : "\"";
        this.TextNext : "\\";
        this.TextNewLine : "\n";
        this.TextDot : ".";
        this.TextHyphen : "-";
        this.TextSpace : " ";
        this.IntSignNegateMax : bit <(1, 59);
        this.IntSignPositeMax : this.IntSignNegateMax - 1;
        return true;
    }

    field prusate String TextQuote { get { return data; } set { data : value; } }
    field prusate String TextNext { get { return data; } set { data : value; } }
    field prusate String TextNewLine { get { return data; } set { data : value; } }
    field prusate String TextDot { get { return data; } set { data : value; } }
    field prusate String TextHyphen { get { return data; } set { data : value; } }
    field prusate String TextSpace { get { return data; } set { data : value; } }
    field prusate Int IntSignPositeMax { get { return data; } set { data : value; } }
    field prusate Int IntSignNegateMax { get { return data; } set { data : value; } }
    field precate InfraInfra InfraInfra { get { return data; } set { data : value; } }
    field precate TextInfra TextInfra { get { return data; } set { data : value; } }
    field precate CountList CountList { get { return data; } set { data : value; } }

    maide prusate Bool IndexRange(var Range range, var Int index)
    {
        range.Start : index;
        range.End : index + 1;
        return true;
    }

    maide prusate Int Count(var Int start, var Int end)
    {
        return end - start;
    }

    maide prusate Bool ValidRange(var Int totalCount, var Int start, var Int end)
    {
        var Int count;
        count : this.Count(start, end);
        return this.InfraInfra.ValidRange(totalCount, start, count);
    }

    maide prusate Table TableCreateStringLess()
    {
        var StringLess less;
        less : this.TextInfra.StringLessCreate();

        var Table a;
        a : new Table;
        a.Less : less;
        a.Init();
        return a;
    }

    maide prusate Table TableCreateModuleRefLess()
    {
        var Table a;
        a : new Table;
        a.Less : new ModuleRefLess;
        a.Less.Init();
        a.Init();
        return a;
    }

    maide prusate Table TableCreateRefLess()
    {
        var Table a;
        a : new Table;
        a.Less : new RefLess;
        a.Less.Init();
        a.Init();
        return a;
    }

    maide prusate ModuleRef ModuleRefCreate(var String name, var Int ver)
    {
        var ModuleRef a;
        a : new ModuleRef;
        a.Init();
        a.Name : name;
        a.Ver : ver;
        return a;
    }

    maide prusate String ModuleRefString(var String name, var String verString)
    {
        var StringAdd k;
        k : new StringAdd;
        k.Init();

        this.Add(k, name).Add(k, this.TextHyphen).Add(k, verString);

        var String a;
        a : k.Result();
        return a;
    }
}