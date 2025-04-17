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

        var InfraRange range;
        range : this.Path.Range;

        var Int ka;
        var Int kb;
        ka : range.Index;
        kb : range.Count;

        range.Index : ka + start;
        range.Count : kb - start;

        var Int kaa;
        kaa : this.TextIndex(this.Path, this.TA(this.ClassInfra.TextDot));

        var Bool b;
        b : (kaa = null);
        inf (b)
        {
            end : kb;
        }
        inf (~b)
        {
            end : start + kaa;
        }

        var Int count;
        count : this.ClassInfra.Count(start, end);

        range.Index : ka;
        range.Count : kb;

        var InfraRange a;
        a : this.Field;
        a.Index : start;
        a.Count : count;
        return true;
    }

    maide precate Bool FieldNameIndexSet()
    {
        this.TextA.Data : this.Path.Data;
        this.TextA.Range.Index : this.Path.Range.Index + this.Field.Index;
        this.TextA.Range.Count : this.Field.Count;

        var Int ka;
        ka : this.BraceRightLiteIndex(this.TextA);

        var Bool b;
        b : (ka = null);

        inf (~b)
        {
            var Int braceRightLite;
            braceRightLite : ka;

            this.FieldIndex : this.FieldIndexGet(this.Field, braceRightLite);

            this.FieldName.Index : this.Field.Index;
            this.FieldName.Count : braceRightLite;
        }

        inf (b)
        {
            this.FieldIndex : null;

            this.FieldName.Index : this.Field.Index;
            this.FieldName.Count : this.Field.Count;
        }
        return true;
    }

    maide precate Int BraceRightLiteIndex(var Text text)
    {
        var Int a;
        a : this.TextIndex(text, this.TB(this.TextBraceRightLite));
        return a;
    }

    maide precate Int FieldIndexGet(var InfraRange varField, var Int braceRightLite)
    {
        inf (varField.Count < 1)
        {
            return null;
        }

        this.TextA.Data : this.Path.Data;

        this.TextA.Range.Index : this.Path.Range.Index + varField.Index;
        this.TextA.Range.Count : varField.Count;

        var Bool b;
        b : this.TextEnd(this.TextA, this.TB(this.TextBraceRightRite));

        inf (~b)
        {
            return null;
        }

        var Int start;
        start : braceRightLite + this.StringCount(this.TextBraceRightLite);

        var Int end;
        end : varField.Count - this.StringCount(this.TextBraceRightRite);

        var Int count;
        count : this.ClassInfra.Count(start, end);

        this.TextA.Range.Index : this.TextA.Range.Index + start;
        this.TextA.Range.Count : count;

        var Int n;
        n : this.IntParse.Execute(this.TextA, 10, null);

        inf (n = null)
        {
            return null;
        }

        var Int a;
        a : n;
        return a;
    }

    maide precate Bool HasResult()
    {
        return ~(this.Result = null);
    }

    maide precate Bool FieldEqual(var String name)
    {
        this.TextA.Data : this.Path.Data;

        this.TextA.Range.Index : this.Path.Range.Index + this.FieldName.Index;
        this.TextA.Range.Count : this.FieldName.Count;

        var Bool a;
        a : this.TextSame(this.TextA, this.TB(name));
        return a;
    }

#NodeList#}