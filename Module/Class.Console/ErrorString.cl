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

    maide precate Pos CreatePos()
    {
        var Pos a;
        a : new Pos;
        a.Init();
        return a;
    }

    maide precate Pos CreateStartPos()
    {
        return this.CreatePos();
    }

    maide precate Pos CreateEndPos()
    {
        return this.CreatePos();
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
}