namespace Saber.Infra;

public class StringWrite : Any
{
    public override bool Init()
    {
        base.Init();
        this.TextInfra = TextInfra.This;
        this.ClassInfra = Infra.This;
        this.StringComp = StringComp.This;

        this.Arg = this.CreateArg();
        this.CountOperate = this.CreateCountOperate();
        this.SetOperate = this.CreateSetOperate();
        return true;
    }

    protected virtual StringWriteArg CreateArg()
    {
        StringWriteArg a;
        a = new StringWriteArg();
        a.Init();
        return a;
    }

    protected virtual StringCountWriteOperate CreateCountOperate()
    {
        StringCountWriteOperate a;
        a = new StringCountWriteOperate();
        a.Arg = this.Arg;
        a.Init();
        return a;
    }

    protected virtual StringSetWriteOperate CreateSetOperate()
    {
        StringSetWriteOperate a;
        a = new StringSetWriteOperate();
        a.Arg = this.Arg;
        a.Init();
        return a;
    }

    public virtual StringCountWriteOperate CountOperate { get; set; }
    public virtual StringSetWriteOperate SetOperate { get; set; }
    public virtual StringWriteOperate Operate { get; set; }
    public virtual StringWriteArg Arg { get; set; }
    protected virtual TextInfra TextInfra { get; set; }
    protected virtual Infra ClassInfra { get; set; }
    protected virtual StringComp StringComp { get; set; }

    public virtual String Execute(Text text)
    {
        bool b;
        b = this.ValidValue(text);
        if (!b)
        {
            return null;
        }

        this.Arg = new StringWriteArg();
        this.Arg.Init();

        this.Operate = this.CountOperate;
        this.ArgClearIndex();

        this.ExecuteStage(text);

        long count;
        count = this.Index;
        
        long k;
        k = count;
        k = k * sizeof(uint);

        this.Arg.Data = new Data();
        this.Arg.Data.Count = k;
        this.Arg.Data.Init();

        this.Operate = this.SetOperate;
        this.ArgClearIndex();

        this.ExecuteStage(text);

        String a;
        a = this.StringComp.CreateData(this.Arg.Data, null);

        this.Operate = null;
        this.Arg = null;
        return a;
    }

    public virtual bool ValidValue(Text text)
    {
        TextInfra textInfra;
        textInfra = this.TextInfra;
        Infra classInfra;
        classInfra = this.ClassInfra;
        StringComp stringComp;
        stringComp = this.StringComp;

        InfraRange range;
        range = text.Range;
        long kk;
        kk = range.Count;
        if (kk < 2)
        {
            return false;
        }

        Data data;
        data = text.Data;
        long rangeStart;
        long rangeEnd;
        rangeStart = range.Index;
        rangeEnd = rangeStart + range.Count;

        long quote;
        quote = textInfra.Char(classInfra.TextQuote);

        long oc;
        oc = textInfra.DataCharGet(data, rangeStart);
        if (!(oc == quote))
        {
            return false;
        }
        oc = textInfra.DataCharGet(data, rangeEnd - 1);
        if (!(oc == quote))
        {
            return false;
        }

        long backSlash;
        backSlash = textInfra.Char(classInfra.TextBackSlash);
        long newLine;
        newLine = textInfra.Char(classInfra.TextNewLine);

        long countA;
        countA = 8;

        long count;
        count = kk - 2;
        long start;
        start = rangeStart + 1;
        long i;
        i = 0;
        while (i < count)
        {
            long index;
            index = start + i;

            long c;
            c = textInfra.DataCharGet(data, index);

            bool b;
            b = (c == backSlash);
            if (b)
            {
                long j;
                j = i + 1;
                if (!(j < count))
                {
                    return false;
                }
                long indexA;
                indexA = start + j;

                long u;
                u = textInfra.DataCharGet(data, indexA);

                bool bba;
                bba = false;                
                if (u == quote)
                {
                    bba = true;
                }
                if (u == 'n')
                {
                    bba = true;
                }
                if (u == backSlash)
                {
                    bba = true;
                }
                if (u == 'u')
                {
                    long k;
                    k = j + countA;
                    if (!(k < count))
                    {
                        return false;
                    }
                    long indexAa;
                    indexAa = start + j + 1;
                    long iA;
                    iA = 0;
                    while (iA < countA)
                    {
                        long oa;
                        oa = indexAa + iA;
                        long ua;
                        ua = textInfra.DataCharGet(data, oa);

                        if (!(textInfra.Digit(ua) | textInfra.HexAlpha(ua, false)))
                        {
                            return false;
                        }

                        iA = iA + 1;
                    }

                    i = i + countA;
                    bba = true;
                }
                if (!bba)
                {
                    return false;
                }
                i = i + 1;
            }
            if (!b)
            {
                if (c == quote)
                {
                    return false;
                }                
            }
            i = i + 1;
        }
        return true;
    }

    public virtual bool ArgClearIndex()
    {
        this.Arg.Index = 0;
        return true;
    }

    public virtual bool ExecuteStage(Text text)
    {
        TextInfra textInfra;
        textInfra = this.TextInfra;
        Infra classInfra;
        classInfra = this.ClassInfra;
        StringComp stringComp;
        stringComp = this.StringComp;

        Data data;
        data = text.Data;
        InfraRange range;
        range = text.Range;
        long kk;
        kk = range.Count;

        long backSlash;
        backSlash = textInfra.Char(classInfra.TextBackSlash);
        long quote;
        quote = textInfra.Char(classInfra.TextQuote);
        long newLine;
        newLine = textInfra.Char(classInfra.TextNewLine);
        
        long countA;
        countA = 8;
        long count;
        count = kk - 2;
        long start;
        start = range.Index + 1;
        long i;
        i = 0;
        while (i < count)
        {
            long index;
            index = start + i;

            long c;
            c = textInfra.DataCharGet(data, index);

            bool b;
            b = (c == backSlash);
            if (b)
            {
                long j;
                j = i + 1;

                bool bb;
                bb = (j < count);
                if (bb)
                {
                    long indexA;
                    indexA = start + j;
                    long u;
                    u = textInfra.DataCharGet(data, indexA);

                    long escapeValue;
                    escapeValue = 0;
                    if (u == quote)
                    {
                        escapeValue = u;
                    }
                    if (u == 'n')
                    {
                        escapeValue = newLine;
                    }
                    if (u == backSlash)
                    {
                        escapeValue = u;
                    }
                    if (u == 'u')
                    {
                        long ka;
                        ka = 0;
                        long indexAa;
                        indexAa = start + j + 1;
                        long iA;
                        iA = 0;
                        while (iA < countA)
                        {
                            long oa;
                            oa = indexAa + iA;
                            long ua;
                            ua = textInfra.DataCharGet(data, oa);

                            long od;
                            od = textInfra.DigitValue(ua, 16);

                            long na;
                            na = countA - 1 - iA;

                            int shiftCount;
                            shiftCount = (int)(na * 4);

                            long nn;
                            nn = od << shiftCount;

                            ka = ka | nn;

                            iA = iA + 1;
                        }

                        escapeValue = ka;

                        i = i + countA;
                    }

                    this.ExecuteChar(escapeValue);

                    i = i + 1;
                }
            }

            if (!b)
            {
                this.ExecuteChar(c);
            }

            i = i + 1;
        }
        return true;
    }

    protected virtual bool ExecuteChar(long n)
    {
        this.WriteOperate.ExecuteChar(n);
        return true;
    }
}