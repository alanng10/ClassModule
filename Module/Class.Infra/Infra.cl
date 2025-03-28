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

    maide prusate String VerString(var Int value)
    {
        var Int revise;
        revise : bit &(value, 0hff);

        var Int minor;
        minor : bit &(bit >(value, 8), 0hff);

        var Int major;
        major : bit >(value, 16);

        var Format format;
        format : new Format;
        format.Init();

        var FormatArg arg;
        arg : new FormatArg;
        arg.Init();

        arg.Kind : 1;
        arg.Base : 10;
        arg.AlignLeft : false;
        arg.FieldWidth : 2;
        arg.MaxWidth : 2;
        arg.FillChar : this.TextInfra.Char("0");

        var Text kd;

        arg.Value.Int : revise;

        format.ExecuteArgCount(arg);

        kd : this.TextInfra.TextCreate(arg.Count);

        format.ExecuteArgResult(arg, kd);

        var String ka;
        ka : this.TextInfra.StringCreate(kd);

        arg.Value.Int : minor;

        format.ExecuteArgCount(arg);

        kd : this.TextInfra.TextCreate(arg.Count);

        format.ExecuteArgResult(arg, kd);

        var String kb;
        kb : this.TextInfra.StringCreate(kd);

        arg.FieldWidth : 1;
        arg.MaxWidth : null;
        arg.Value.Int : major;

        format.ExecuteArgCount(arg);

        kd : this.TextInfra.TextCreate(arg.Count);

        format.ExecuteArgResult(arg, kd);

        var String kc;
        kc : this.TextInfra.StringCreate(kd);

        var String dot;
        dot : this.TextDot;

        var StringAdd kk;
        kk : new StringAdd;
        kk.Init();

        this.Add(kk, kc).Add(kk, dot).Add(kk, kb).Add(kk, dot).Add(kk, ka);

        var String a;
        a : kk.Result();
        return a;
    }

    maide prusate Int BaseCount(var Class varClass, var Class anyClass)
    {
        var Class kk;
        kk : varClass;

        var Int k;
        k : 0;

        while (~(kk = null))
        {
            k : k + 1;

            var Class ka;

            inf (~(kk = anyClass))
            {
                ka : kk.Base;
            }
            kk : ka;
        }

        return k;
    }

    maide prusate Bool ValidClass(var Class varClass, var Class requireClass, var Class anyClass, var Class nullClass)
    {
        var Class k;
        k : varClass;

        inf (k = nullClass)
        {
            return true;
        }

        var Bool b;
        b : false;
        while (~b & ~(k = null))
        {
            inf (k = requireClass)
            {
                b : true;
            }

            inf (~b)
            {
                var Class ka;

                inf (~(k = anyClass))
                {
                    ka : k.Base;
                }
                k : ka;
            }
        }

        var Bool a;
        a : b;
        return a;
    }
}