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
        this.TextModule : "Module";
        this.TextImport : "Import";
        this.TextExport : "Export";
        this.TextStorage : "Storage";
        this.TextEntry : "Entry";
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
    field prusate String TextModule { get { return data; } set { data : value; } }
    field prusate String TextImport { get { return data; } set { data : value; } }
    field prusate String TextExport { get { return data; } set { data : value; } }
    field prusate String TextStorage { get { return data; } set { data : value; } }
    field prusate String TextEntry { get { return data; } set { data : value; } }
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

        arg.Value : revise;

        format.ExecuteArgCount(arg);

        kd : this.TextInfra.TextCreate(arg.Count);

        format.ExecuteArgResult(arg, kd);

        var String ka;
        ka : this.TextInfra.StringCreate(kd);

        arg.Value : minor;

        format.ExecuteArgCount(arg);

        kd : this.TextInfra.TextCreate(arg.Count);

        format.ExecuteArgResult(arg, kd);

        var String kb;
        kb : this.TextInfra.StringCreate(kd);

        arg.FieldWidth : 1;
        arg.MaxWidth : null;
        arg.Value : major;

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

    maide prusate Bool ValidCount(var Class thisClass, var Class triggClass, var Class varClass, var Count count, var Class anyClass, var Class nullClass)
    {
        var CountList countList;
        countList : this.CountList;

        inf (count = countList.Prusate)
        {
            return true;
        }

        inf (count = countList.Precate)
        {
            inf (this.ValidClass(thisClass, triggClass, anyClass, nullClass))
            {
                return true;
            }
            return false;
        }

        inf (count = countList.Pronate)
        {
            inf (thisClass.Module = varClass.Module)
            {
                return true;
            }
            return false;
        }

        inf (count = countList.Private)
        {
            inf (thisClass = triggClass)
            {
                return true;
            }
            return false;
        }
        return true;
    }

    maide prusate Any CompDefine(var Class varClass, var String name, var Module module, var Class anyClass)
    {
        var Count prusateCount;
        var Count precateCount;
        var Count pronateCount;
        prusateCount : this.CountList.Prusate;
        precateCount : this.CountList.Precate;
        pronateCount : this.CountList.Pronate;

        var Any k;

        var Bool b;
        b : false;

        var Class kk;
        kk : varClass;

        while (~b & ~(kk = null))
        {
            inf (~b)
            {
                var Field varField;
                varField : cast Field(kk.Field.Get(name));

                inf (~(varField = null))
                {
                    var Count ka;
                    ka : varField.Count;
                    inf (ka = prusateCount | ka = precateCount)
                    {
                        k : varField;
                        b : true;
                    }

                    inf (ka = pronateCount)
                    {
                        inf (kk.Module = module)
                        {
                            k : varField;
                            b : true;
                        }
                    }
                }
            }

            inf (~b)
            {
                var Maide varMaide;
                varMaide : cast Maide(kk.Maide.Get(name));

                inf (~(varMaide = null))
                {
                    var Count kb;
                    kb : varMaide.Count;
                    inf (kb = prusateCount | kb = precateCount)
                    {
                        k : varMaide;
                        b : true;
                    }

                    inf (kb = pronateCount)
                    {
                        inf (kk.Module = module)
                        {
                            k : varMaide;
                            b : true;
                        }
                    }
                }
            }

            inf (~b)
            {
                var Class kd;

                inf (~(kk = anyClass))
                {
                    kd : kk.Base;
                }
                kk : kd;
            }
        }

        var Any a;
        a : k;
        return a;
    }

    maide private Infra Add(var StringAdd k, var String a)
    {
        this.TextInfra.AddString(k, a);
        return this;
    }

    maide private Infra AddClear(var StringAdd k)
    {
        k.Clear();
        return this;
    }

    maide private String AddResult(var StringAdd k)
    {
        return k.Result();
    }
}