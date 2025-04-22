class StringWrite : TextAdd
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        this.ClassInfra : share Infra;

        this.CountOperate : this.CreateCountOperate();
        this.SetOperate : this.CreateSetOperate();
        return true;
    }

    maide precate StringWriteCountOperate CreateCountOperate()
    {
        var StringWriteCountOperate a;
        a : new StringWriteCountOperate;
        a.Write : this;
        a.Init();
        return a;
    }

    maide precate StringWriteSetOperate CreateSetOperate()
    {
        var StringWriteSetOperate a;
        a : new StringWriteSetOperate;
        a.Write : this;
        a.Init();
        return a;
    }

    field prusate Text Text { get { return data; } set { data : value; } }
    field prusate String Result { get { return data; } set { data : value; } }
    field prusate StringWriteArg Arg { get { return data; } set { data : value; } }
    field prusate StringWriteOperate Operate { get { return data; } set { data : value; } }
    field prusate StringWriteCountOperate CountOperate { get { return data; } set { data : value; } }
    field prusate StringWriteSetOperate SetOperate { get { return data; } set { data : value; } }
    field precate InfraInfra InfraInfra { get { return data; } set { data : value; } }
    field precate Infra ClassInfra { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        this.Result : null;

        var Bool b;
        b : this.ValidValue(this.Text);
        inf (~b)
        {
            return false;
        }

        this.Arg : new StringWriteArg;
        this.Arg.Init();

        var StringWriteArg arg;
        arg : this.Arg;

        this.Operate : this.CountOperate;

        this.ResetStage();
        this.ExecuteStage();

        var Int count;
        count : arg.Index;

        var Int k;
        k : count;
        k : k * 4;

        arg.Data : new Data;
        arg.Data.Count : k;
        arg.Data.Init();

        this.Operate : this.SetOperate;

        this.ResetStage();
        this.ExecuteStage();

        this.Result : this.StringComp.CreateData(arg.Data, null);

        this.Arg : null;
        this.Operate : null;
        return true;
    }

    maide prusate Bool ValidValue(var Text text)
    {
        var InfraInfra infraInfra;
        infraInfra : this.InfraInfra;
        var TextInfra textInfra;
        textInfra : this.TextInfra;
        var Infra classInfra;
        classInfra : this.ClassInfra;

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

        var Int charQuote;
        var Int charNext;
        var Int charAlphaN;
        var Int charAlphaU;
        charQuote : this.Char(classInfra.TextQuote);
        charNext : this.Char(classInfra.TextNext);
        charAlphaN : this.Char(classInfra.TextAlphaN);
        charAlphaU : this.Char(classInfra.TextAlphaU);

        var Int na;
        na : textInfra.DataCharGet(data, rangeStart);
        inf (~(na = charQuote))
        {
            return false;
        }
        na : textInfra.DataCharGet(data, rangeEnd - 1);
        inf (~(na = charQuote))
        {
            return false;
        }

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
            b : (n = charNext);
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
                inf (nc = charNext)
                {
                    bba : true;
                }
                inf (nc = charQuote)
                {
                    bba : true;
                }
                inf (nc = charAlphaN)
                {
                    bba : true;
                }
                inf (nc = charAlphaU)
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
                inf (n = charQuote)
                {
                    return false;
                }
            }
            i : i + 1;
        }
        return true;
    }

    maide prusate Bool ResetStage()
    {
        this.Arg.Index : 0;
        return true;
    }

    maide prusate Bool ExecuteStage()
    {
        var TextInfra textInfra;
        textInfra : this.TextInfra;
        var Infra classInfra;
        classInfra : this.ClassInfra;
        var StringComp stringComp;
        stringComp : this.StringComp;

        var Data data;
        data : this.Text.Data;
        var InfraRange range;
        range : this.Text.Range;
        var Int kk;
        kk : range.Count;

        var Int charQuote;
        var Int charNext;
        var Int charNewLine;
        var Int charAlphaN;
        var Int charAlphaU;
        charQuote : this.Char(classInfra.TextQuote);
        charNext : this.Char(classInfra.TextNext);
        charNewLine : this.Char(classInfra.TextNewLine);
        charAlphaN : this.Char(classInfra.TextAlphaN);
        charAlphaU : this.Char(classInfra.TextAlphaU);

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
            b : (n = charNext);
            inf (b)
            {
                var Int j;
                j : i + 1;

                var Int indexA;
                indexA : start + j;
                var Int nc;
                nc : textInfra.DataCharGet(data, indexA);
                
                var Int escapeValue;
                inf (nc = charNext)
                {
                    escapeValue : nc;
                }
                inf (nc = charQuote)
                {
                    escapeValue : nc;
                }
                inf (nc = charAlphaN)
                {
                    escapeValue : charNewLine;
                }
                inf (nc = charAlphaU)
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