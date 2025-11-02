class ErrorString : TextAdd
{
    maide prusate Bool Init()
    {
        base.Init();

        this.StartPos : this.CreateStartPos();
        this.EndPos : this.CreateEndPos();
        this.Bord : this.CreateBord();
        return true;
    }

    maide precate Pos CreateStartPos()
    {
        return this.CreatePos();
    }

    maide precate Pos CreateEndPos()
    {
        return this.CreatePos();
    }

    maide precate Pos CreatePos()
    {
        var Pos a;
        a : new Pos;
        a.Init();
        return a;
    }

    maide precate String CreateBord()
    {
        return this.StringComp.CreateChar(this.Char("-"), 50);
    }

    field prusate Bool RangePos { get { return data; } set { data : value; } }
    field prusate Array CodeArray { get { return data; } set { data : value; } }
    field prusate Array SourceArray { get { return data; } set { data : value; } }
    field precate Pos StartPos { get { return data; } set { data : value; } }
    field precate Pos EndPos { get { return data; } set { data : value; } }
    field precate String Bord { get { return data; } set { data : value; } }

    maide prusate String Execute(var Error error)
    {
        this.AddClear();

        this.AddBord();

        this.AddField("Kind", this.KindString(error));

        var Bool b;
        b : error.Source = null;

        inf (b)
        {
            var String kk;
            kk : error.Name;

            inf (~(kk = null))
            {
                this.AddField("Name", kk);
            }
        }
        inf (~b)
        {
            var Bool ba;
            ba : this.RangePos;

            var String kaa;
            inf (ba)
            {
                kaa : this.RangePosString(error);
            }
            inf (~ba)
            {
                kaa : this.RangeString(error);
            }

            this.AddField("Range", kaa);

            this.AddField("Source", this.SourceString(error));
        }

        this.AddBord();

        var String a;
        a : this.AddResult();
        
        return a;
    }

    maide precate Bool AddBord()
    {
        this.Add(this.Bord).AddLine();
        return true;
    }

    maide precate Bool AddField(var String index, var String value)
    {
        this.Add(index).Add(":").Add(" ").Add(value).AddLine();
        return true;
    }

    maide precate String KindString(var Error error)
    {
        var String a;
        a : error.Kind.Text;
        return a;
    }

    maide precate String RangePosString(var Error error)
    {
        var StringAdd kk;
        kk : this.StringAdd;

        var StringAdd k;
        k : new StringAdd;
        k.Init();

        this.StringAdd : k;

        var Range range;
        range : error.Range;

        var Code code;
        code : cast Code(this.CodeArray.Get(error.Source));

        var Array tokenArray;
        tokenArray : code.Token;

        this.PosRange(this.StartPos, this.EndPos, range, tokenArray);

        this.AddClear();

        this.AddPos(this.StartPos);

        this.Add(" ");
        this.Add("-");
        this.Add(" ");

        this.AddPos(this.EndPos);

        var String a;
        a : this.AddResult();

        this.StringAdd : kk;

        return a;
    }

    maide precate Bool AddPos(var Pos pos)
    {
        var String row;
        var String col;
        row : this.StringInt(pos.Row);
        col : this.StringInt(pos.Col);

        this.Add("(");
        this.Add("Row");
        this.Add(" ");
        this.Add(row);
        this.Add(",");
        this.Add(" ");
        this.Add("Col");
        this.Add(" ");
        this.Add(col);
        this.Add(")");

        return true;
    }

    public virtual bool PosRange(Pos resultStart, Pos resultEnd, Range range, Array tokenArray)
    {
        long tokenCount;
        tokenCount = tokenArray.Count;

        long start;
        long end;
        start = range.Start;
        end = range.End;

        long startRow;
        long startCol;
        long endRow;
        long endCol;
        startRow = 0;
        startCol = 0;
        endRow = 0;
        endCol = 0;

        TokenToken token;

        InfraRange tokenRange;

        bool b;
        b = (start == tokenCount);
        if (b)
        {
            bool ba;
            ba = (tokenCount == 0);
            if (ba)
            {
                startRow = 0;
                startCol = 0;
                endRow = 0;
                endCol = 0;
            }
            if (!ba)
            {
                long prev;
                prev = start - 1;

                token = tokenArray.GetAt(prev) as TokenToken;

                tokenRange = token.Range;

                startRow = token.Row;
                startCol = tokenRange.Index + tokenRange.Count;
                endRow = startRow;
                endCol = startCol;
            }
        }
        if (!b)
        {
            token = tokenArray.GetAt(start) as TokenToken;

            tokenRange = token.Range;

            startRow = token.Row;
            startCol = tokenRange.Index;

            bool bb;
            bb = (start < end);
            if (bb)
            {
                token = tokenArray.GetAt(end - 1) as TokenToken;

                tokenRange = token.Range;

                endRow = token.Row;
                endCol = tokenRange.Index + tokenRange.Count;
            }
            if (!bb)
            {
                endRow = startRow;
                endCol = startCol;
            }
        }

        resultStart.Row = startRow;
        resultStart.Col = startCol;

        resultEnd.Row = endRow;
        resultEnd.Col = endCol;
        return true;
    }

    maide precate String RangeString(var Error error)
    {
        var StringAdd kk;
        kk : this.StringAdd;

        var Range range;
        range : error.Range;

        var StringAdd k;
        k : new StringAdd;
        k.Init();

        this.StringAdd : k;

        var String ka;
        ka : this.StringInt(range.Start);

        var String kb;
        kb : this.StringInt(range.End);

        this.AddClear();

        this.Add("(");
        this.Add(ka);
        this.Add(",");
        this.Add(" ");
        this.Add(kb);
        this.Add(")");

        var String a;
        a : this.AddResult();

        this.StringAdd : kk;

        return a;
    }

    maide precate String SourceString(var Error error)
    {
        var Source k;
        k : cast Source(this.SourceArray.Get(error.Source));

        var String a;
        a : k.Name;
        return a;
    }
}