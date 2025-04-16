class PathTravel : Travel
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        this.ClassInfra : share ClassInfra;

        this.TextBraceRightLite : "[";
        this.TextBraceRightRite : "]";
        return true;
    }

    field prusate Node Result { get { return data; } set { data : value; } }
    field prusate Text Path { get { return data; } set { data : value; } }
    field prusate Int ThisIndex { get { return data; } set { data : value; } }
    field precate InfraInfra InfraInfra { get { return data; } set { data : value; } }
    field precate ClassInfra ClassInfra { get { return data; } set { data : value; } }
    field precate InfraRange Field { get { return data; } set { data : value; } }
    field precate InfraRange FieldName { get { return data; } set { data : value; } }
    field precate Int FieldIndex { get { return data; } set { data : value; } }
    field precate String TextBraceRightLite { get { return data; } set { data : value; } }
    field precate String TextBraceRightRite { get { return data; } set { data : value; } }

    maide precate Bool ExecuteNode(var Node node)
    {
        inf (~(this.ThisIndex < this.Path.Range.Count))
        {
            this.Result : node;
            return true;
        }

        this.FieldSet();

        this.FieldNameIndexSet();

        this.ThisIndex : this.ThisIndex + this.Field.Count + this.StringCount(this.ClassInfra.TextDot);
        return true;
    }

    maide precate Bool FieldSet()
    {
        var Int start;
        start : this.ThisIndex;

        var Int end;

        InfraRange range;
        range = this.Path.Range;

        long ka;
        long kb;
        ka = range.Index;
        kb = range.Count;

        range.Index = ka + start;
        range.Count = kb - start;

        long u;
        u = this.TextIndex(this.Path, this.TA(this.ClassInfra.TextDot));

        bool b;
        b = (u < 0);
        if (b)
        {
            end = kb;
        }
        if (!b)
        {
            end = start + u;
        }

        long count;
        count = end - start;

        range.Index = ka;
        range.Count = kb;

        InfraRange a;
        a = this.Field;
        a.Index = start;
        a.Count = count;
        return true;
    }

    protected virtual bool FieldNameIndexSet()
    {
        this.TextA.Data = this.Path.Data;
        this.TextA.Range.Index = this.Path.Range.Index + this.Field.Index;
        this.TextA.Range.Count = this.Field.Count;

        long ka;
        ka = this.BraceRightLiteIndex(this.TextA);

        bool b;
        b = (ka < 0);

        if (!b)
        {
            long braceRightLite;
            braceRightLite = ka;

            this.FieldIndex = this.FieldIndexGet(this.Field, braceRightLite);

            this.FieldName.Index = this.Field.Index;
            this.FieldName.Count = braceRightLite;
        }

        if (b)
        {
            this.FieldIndex = -1;

            this.FieldName.Index = this.Field.Index;
            this.FieldName.Count = this.Field.Count;
        }
        return true;
    }

    protected virtual long BraceRightLiteIndex(Text text)
    {
        long a;
        a = this.TextIndex(text, this.TB(this.TextBraceRightLite));
        return a;
    }

    protected virtual long FieldIndexGet(InfraRange varField, long braceRightLite)
    {
        if (varField.Count < 1)
        {
            return -1;
        }

        this.TextA.Data = this.Path.Data;

        this.TextA.Range.Index = this.Path.Range.Index + varField.Index;
        this.TextA.Range.Count = varField.Count;

        bool b;
        b = this.TextEnd(this.TextA, this.TB(this.TextBraceRightRite));

        if (!b)
        {
            return -1;
        }

        long start;
        start = braceRightLite + this.StringCount(this.TextBraceRightLite);

        long end;
        end = varField.Count - this.StringCount(this.TextBraceRightRite);

        long count;
        count = end - start;

        this.TextA.Range.Index = this.TextA.Range.Index + start;
        this.TextA.Range.Count = count;

        long n;
        n = this.IntParse.Execute(this.TextA, 10, null);

        if (n == -1)
        {
            return -1;
        }

        long a;
        a = n;
        return a;
    }

    protected virtual bool HasResult()
    {
        return !(this.Result == null);
    }

    protected virtual bool FieldEqual(String name)
    {
        this.TextA.Data = this.Path.Data;

        this.TextA.Range.Index = this.Path.Range.Index + this.FieldName.Index;
        this.TextA.Range.Count = this.FieldName.Count;

        bool a;
        a = this.TextSame(this.TextA, this.TB(name));
        return a;
    }

#NodeList#}