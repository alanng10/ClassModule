namespace Saber.Infra;

public class Infra : Any
{
    public static Infra This { get; } = ShareCreate();

    private static Infra ShareCreate()
    {
        Infra share;
        share = new Infra();
        Any a;
        a = share;
        a.Init();
        return share;
    }

    public override bool Init()
    {
        base.Init();
        this.InfraInfra = InfraInfra.This;
        this.TextInfra = TextInfra.This;
        this.CountList = CountList.This;

        this.TextQuote = this.S("\"");
        this.TextNext = this.S("\\");
        this.TextNewLine = this.S("\n");
        this.TextDot = this.S(".");
        this.TextHyphen = this.S("-");
        this.TextSpace = this.S(" ");
        this.IntSignNegateMax = this.InfraInfra.IntCapValue / 2;
        this.IntSignPositeMax = this.IntSignNegateMax - 1;
        this.SModule = this.S("Module");
        return true;
    }

    public virtual String TextQuote { get; set; }
    public virtual String TextNext { get; set; }
    public virtual String TextNewLine { get; set; }
    public virtual String TextDot { get; set; }
    public virtual String TextHyphen { get; set; }
    public virtual String TextSpace { get; set; }
    public virtual long IntSignPositeMax { get; set; }
    public virtual long IntSignNegateMax { get; set; }
    protected virtual InfraInfra InfraInfra { get; set; }
    protected virtual TextInfra TextInfra { get; set; }
    protected virtual CountList CountList { get; set; }
    protected virtual String SModule { get; set; }

    public virtual bool IndexRange(Range range, long index)
    {
        range.Start = index;
        range.End = index + 1;
        return true;
    }

    public virtual long Count(long start, long end)
    {
        return end - start;
    }

    public virtual bool ValidRange(long totalCount, long start, long end)
    {
        long count;
        count = this.Count(start, end);
        return this.InfraInfra.ValidRange(totalCount, start, count);
    }

    public virtual Table TableCreateStringLess()
    {
        StringLess less;
        less = this.TextInfra.StringLessCreate();
        
        Table a;
        a = new Table();
        a.Less = less;
        a.Init();
        return a;
    }

    public virtual Table TableCreateModuleRefLess()
    {
        Table a;
        a = new Table();
        a.Less = new ModuleRefLess();
        a.Less.Init();
        a.Init();
        return a;
    }

    public virtual Table TableCreateRefLess()
    {
        Table a;
        a = new Table();
        a.Less = new RefLess();
        a.Less.Init();
        a.Init();
        return a;
    }

    public virtual ModuleRef ModuleRefCreate(String name, long ver)
    {
        ModuleRef a;
        a = new ModuleRef();
        a.Init();
        a.Name = name;
        a.Ver = ver;
        return a;
    }

    public virtual String ModuleRefString(String name, String verString)
    {
        StringAdd k;
        k = new StringAdd();
        k.Init();

        this.Add(k, name).Add(k, this.TextHyphen).Add(k, verString);

        String a;
        a = k.Result();
        return a;
    }

    public virtual String VerString(long o)
    {
        long ka;
        ka = this.InfraInfra.IntCapValue - 1;

        o = o & ka;

        long revise;
        revise = o & 0xff;

        long minor;
        minor = (o >> 8) & 0xff;

        long major;
        major = o >> 16;

        Format write;
        write = new Format();
        write.Init();

        FormatArg arg;
        arg = new FormatArg();
        arg.Init();

        arg.Kind = 1;
        arg.Base = 10;
        arg.AlignLeft = false;
        arg.FieldWidth = 2;
        arg.MaxWidth = 2;
        arg.FillChar = '0';

        arg.Value.Int = revise;

        write.ExecuteArgCount(arg);

        Text aa;
        aa = this.TextInfra.TextCreate(arg.Count);

        write.ExecuteArgResult(arg, aa);

        String oa;
        oa = this.TextInfra.StringCreate(aa);

        arg.Value.Int = minor;

        write.ExecuteArgCount(arg);

        Text ab;
        ab = this.TextInfra.TextCreate(arg.Count);

        write.ExecuteArgResult(arg, ab);

        String ob;
        ob = this.TextInfra.StringCreate(ab);

        arg.FieldWidth = 1;
        arg.MaxWidth = -1;
        arg.Value.Int = major;

        write.ExecuteArgCount(arg);

        Text ac;
        ac = this.TextInfra.TextCreate(arg.Count);

        write.ExecuteArgResult(arg, ac);

        String oc;
        oc = this.TextInfra.StringCreate(ac);

        String dot;
        dot = this.Dot;

        StringAdd h;
        h = new StringAdd();
        h.Init();

        this.Add(h, oc).Add(h, dot).Add(h, ob).Add(h, dot).Add(h, oa);

        String a;
        a = h.Result();
        return a;
    }

    public virtual long BaseCount(Class varClass, Class anyClass)
    {
        Class c;
        c = varClass;

        long k;
        k = 0;

        while (!(c == null))
        {
            k = k + 1;

            Class ka;
            ka = null;
            if (!(c == anyClass))
            {
                ka = c.Base;
            }
            c = ka;
        }

        return k;
    }

    public virtual bool ValidClass(Class varClass, Class requiredClass, Class anyClass, Class nullClass)
    {
        Class thisClass;
        thisClass = varClass;

        if (thisClass == nullClass)
        {
            return true;
        }

        bool b;
        b = false;
        while (!b & !(thisClass == null))
        {
            if (thisClass == requiredClass)
            {
                b = true;
            }

            Class k;
            k = null;
            if (!(thisClass == anyClass))
            {
                k = thisClass.Base;
            }
            thisClass = k;
        }

        bool a;
        a = b;
        return a;
    }

    public virtual bool ValidCount(Class thisClass, Class triggerClass, Class varClass, Count count, Class anyClass, Class nullClass)
    {
        CountList countList;
        countList = this.CountList;

        if (count == countList.Prusate)
        {
            return true;
        }

        if (count == countList.Precate)
        {
            if (this.ValidClass(thisClass, triggerClass, anyClass, nullClass))
            {
                return true;
            }
            return false;
        }

        if (count == countList.Pronate)
        {
            if (thisClass.Module == varClass.Module)
            {
                return true;
            }
            return false;
        }

        if (count == countList.Private)
        {
            if (triggerClass == varClass)
            {
                if (thisClass == triggerClass)
                {
                    return true;
                }
            }
            return false;
        }
        return true;
    }

    public virtual object CompDefined(Class varClass, String name, Module module, Class anyClass)
    {
        Count prusateCount;
        Count precateCount;
        Count pronateCount;
        prusateCount = this.CountList.Prusate;
        precateCount = this.CountList.Precate;
        pronateCount = this.CountList.Pronate;

        object k;
        k = null;

        bool b;
        b = false;

        Class c;
        c = varClass;

        while (!b & !(c == null))
        {
            if (!b)
            {
                Field field;
                field = (Field)c.Field.Get(name);

                if (!(field == null))
                {
                    Count ka;
                    ka = field.Count;
                    if (ka == prusateCount | ka == precateCount)
                    {
                        k = field;
                        b = true;
                    }

                    if (ka == pronateCount)
                    {
                        if (c.Module == module)
                        {
                            k = field;
                            b = true;
                        }
                    }
                }
            }

            if (!b)
            {
                Maide maide;
                maide = (Maide)c.Maide.Get(name);

                if (!(maide == null))
                {
                    Count kb;
                    kb = maide.Count;
                    if (kb == prusateCount | kb == precateCount)
                    {
                        k = maide;
                        b = true;
                    }

                    if (kb == pronateCount)
                    {
                        if (c.Module == module)
                        {
                            k = maide;
                            b = true;
                        }
                    }
                }
            }

            if (!b)
            {
                Class aa;
                aa = null;
                if (!(c == anyClass))
                {
                    aa = c.Base;
                }
                c = aa;
            }
        }

        return k;
    }

    public virtual String ClassModulePath(String classPath)
    {
        StringAdd k;
        k = new StringAdd();
        k.Init();

        return this.AddClear(k).Add(k, classPath).Add(k, this.TextInfra.PathCombine)
            .Add(k, this.SModule).AddResult(k);
    }

    private String S(string o)
    {
        return this.TextInfra.S(o);
    }

    private Infra Add(StringAdd k, String a)
    {
        this.TextInfra.AddString(k, a);
        return this;
    }

    private Infra AddClear(StringAdd k)
    {
        k.Clear();
        return this;
    }

    private String AddResult(StringAdd k)
    {
        return k.Result();
    }
}