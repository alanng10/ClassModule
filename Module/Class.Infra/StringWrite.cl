class StringWrite : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        this.TextInfra : share TextInfra;
        this.ClassInfra : share Infra;
        this.StringComp : share StringComp;

        this.Arg : this.CreateArg();
        this.CountOperate : this.CreateCountOperate();
        this.SetOperate : this.CreateSetOperate();
        return true;
    }

    maide precate StringWriteArg CreateArg()
    {
        var StringWriteArg a;
        a : new StringWriteArg;
        a.Init();
        return a;
    }

    maide precate StringCountWriteOperate CreateCountOperate()
    {
        var StringCountWriteOperate a;
        a : new StringCountWriteOperate;
        a.Write : this;
        a.Init();
        return a;
    }

    maide precate StringSetWriteOperate CreateSetOperate()
    {
        var StringSetWriteOperate a;
        a : new StringSetWriteOperate;
        a.Write : this;
        a.Init();
        return a;
    }

    field prusate StringCountWriteOperate CountOperate { get { return data; } set { data : value; } }
    field prusate StringSetWriteOperate SetOperate { get { return data; } set { data : value; } }
    field prusate StringWriteOperate Operate { get { return data; } set { data : value; } }
    field prusate StringWriteArg Arg { get { return data; } set { data : value; } }
    field precate InfraInfra InfraInfra { get { return data; } set { data : value; } }
    field precate TextInfra TextInfra { get { return data; } set { data : value; } }
    field precate Infra ClassInfra { get { return data; } set { data : value; } }
    field precate StringComp StringComp { get { return data; } set { data : value; } }

    maide prusate String Execute(var Text text)
    {
        var Bool b;
        b : this.ValidValue(text);
        inf (~b)
        {
            return null;
        }

        this.Arg : new StringWriteArg;
        this.Arg.Init();

        this.Operate : this.CountOperate;
        this.ArgClearIndex();

        this.ExecuteStage(text);

        var Int count;
        count : this.Arg.Index;

        var Int k;
        k : count;
        k : k * 4;

        this.Arg.Data : new Data;
        this.Arg.Data.Count : k;
        this.Arg.Data.Init();

        this.Operate : this.SetOperate;
        this.ArgClearIndex();

        this.ExecuteStage(text);

        var String a;
        a : this.StringComp.CreateData(this.Arg.Data, null);

        this.Operate : null;
        this.Arg : null;
        return a;
    }

    maide prusate Bool ValidValue(var Text text)
    {
        var InfraInfra infraInfra;
        infraInfra : this.InfraInfra;
        var TextInfra textInfra;
        textInfra : this.TextInfra;
        var Infra classInfra;
        classInfra : this.ClassInfra;
        var StringComp stringComp;
        stringComp : this.StringComp;

        var InfraRange range;
        range : text.Range;
        var Int kk;
        kk : range.Count;
        inf (kk < 2)
        {
            return false;
        }

        var Data data;
        data : text.Data;
        var Int rangeStart;
        var Int rangeEnd;
        rangeStart : range.Index;
        rangeEnd : rangeStart + kk;

        var Int quote;
        quote : textInfra.Char(classInfra.TextQuote);

        var Int na;
        na : textInfra.DataCharGet(data, rangeStart);
        inf (~(na = quote))
        {
            return false;
        }
        na : textInfra.DataCharGet(data, rangeEnd - 1);
        inf (~(na = quote))
        {
            return false;
        }

        var Int next;
        next : textInfra.Char(classInfra.TextNext);
        var Int newLine;
        newLine : textInfra.Char(classInfra.TextNewLine);
        var Int alphaN;
        alphaN : textInfra.Char("n");
        var Int alphaU;
        alphaU : textInfra.Char("u");

        var Int countA;
        countA : 8;

        var Int count;
        count : kk - 2;
        var Int start;
        start : range.Index + 1;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Int index;
            index : start + i;

            var Int n;
            n : textInfra.DataCharGet(data, index);

            var Bool b;
            b : (n = next);
            inf (b)
            {
                var Int j;
                j : i + 1;
                inf (~(j < count))
                {
                    return false;
                }
                var Int indexA;
                indexA : start + j;

                var Int nc;
                nc : textInfra.DataCharGet(data, indexA);

                var Bool bba;
                bba : false;
                inf (nc = next)
                {
                    bba : true;
                }
                inf (nc = quote)
                {
                    bba : true;
                }
                inf (nc = alphaN)
                {
                    bba : true;
                }
                inf (nc = alphaU)
                {
                    var Int ja;
                    ja : j + 1;
                    inf (~infraInfra.ValidRange(count, ja, countA))
                    {
                        return false;
                    }
                    var Int indexAa;
                    indexAa : start + ja;
                    var Int iA;
                    iA : 0;
                    while (iA < countA)
                    {
                        var Int ka;
                        ka : indexAa + iA;
                        var Int nd;
                        nd : textInfra.DataCharGet(data, ka);

                        inf (~(textInfra.Digit(nd) | textInfra.HexAlpha(nd, false)))
                        {
                            return false;
                        }

                        iA : iA + 1;
                    }

                    i : i + countA;
                    bba : true;
                }
                inf (~bba)
                {
                    return false;
                }
                i : i + 1;
            }
            inf (~b)
            {
                inf (n = quote)
                {
                    return false;
                }
            }
            i : i + 1;
        }
        return true;
    }

    maide prusate Bool ArgClearIndex()
    {
        this.Arg.Index : 0;
        return true;
    }

    maide prusate Bool ExecuteStage(var Text text)
    {
        var TextInfra textInfra;
        textInfra : this.TextInfra;
        var Infra classInfra;
        classInfra : this.ClassInfra;
        var StringComp stringComp;
        stringComp : this.StringComp;

        var Data data;
        data : text.Data;
        var InfraRange range;
        range : text.Range;
        var Int kk;
        kk : range.Count;

        var Int quote;
        quote : textInfra.Char(classInfra.TextQuote);
        var Int next;
        next : textInfra.Char(classInfra.TextNext);
        var Int newLine;
        newLine : textInfra.Char(classInfra.TextNewLine);
        var Int alphaN;
        alphaN : textInfra.Char("n");
        var Int alphaU;
        alphaU : textInfra.Char("u");

        var Int countA;
        countA : 8;
        var Int count;
        count : kk - 2;
        var Int start;
        start : range.Index + 1;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Int index;
            index : start + i;

            var Int n;
            n : textInfra.DataCharGet(data, index);

            var Bool b;
            b : (n = next);
            inf (b)
            {
                var Int j;
                j : i + 1;

                var Int indexA;
                indexA : start + j;
                var Int nc;
                nc : textInfra.DataCharGet(data, indexA);
                
                var Int escapeValue;
                inf (nc = next)
                {
                    escapeValue : nc;
                }
                inf (nc = quote)
                {
                    escapeValue : nc;
                }
                inf (nc = alphaN)
                {
                    escapeValue : newLine;
                }
                inf (nc = alphaU)
                {
                    var Int ka;
                    ka : 0;
                    var Int indexAa;
                    indexAa : start + j + 1;
                    var Int iA;
                    iA : 0;
                    while (iA < countA)
                    {
                        var Int kb;
                        kb : indexAa + iA;
                        var Int nd;
                        nd : textInfra.DataCharGet(data, kb);

                        var Int kc;
                        kc : textInfra.DigitValue(nd, 16);

                        var Int na;
                        na : (countA - 1) - iA;

                        var Int shiftCount;
                        shiftCount : na * 4;

                        var Int nn;
                        nn : bit <(kc, shiftCount);

                        ka : bit |(ka, nn);

                        iA : iA + 1;
                    }

                    escapeValue : ka;

                    i : i + countA;
                }

                this.ExecuteChar(escapeValue);

                i : i + 1;
            }

            inf (~b)
            {
                this.ExecuteChar(n);
            }

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteChar(var Int n)
    {
        this.Operate.ExecuteChar(n);
        return true;
    }
}