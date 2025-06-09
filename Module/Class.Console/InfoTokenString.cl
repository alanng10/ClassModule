class InfoTokenString : TextAdd
{
    field precate Int Space { get { return data; } set { data : value; } }

    maide precate Bool Start(var String name)
    {
        this.Add(name).AddLine();
        this.AddSpace().Add("{").AddLine();

        this.Space : this.Space + 4;
        return true;
    }

    maide precate Bool End()
    {
        this.Space : this.Space - 4;

        this.AddSpace().Add("}").Add(",").AddLine();
        return true;
    }

    maide precate Bool StartArray()
    {
        this.AddSpace().Add("[").AddLine();

        this.Space : this.Space + 4;
        return true;
    }

    maide precate Bool EndArray()
    {
        this.Space : this.Space - 4;

        this.AddSpace().Add("]").Add(",").AddLine();
        return true;
    }

    maide precate Bool FieldStart(var String name)
    {
        this.AddSpace().Add(name).Add(" : ");
        this.Space : this.Space + this.StringCount(name) + 3;
        return true;
    }

    maide precate Bool FieldEnd(var String name)
    {
        this.Space : this.Space - (this.StringCount(name) + 3);
        return true;
    }

    maide precate Bool AddBoolValue(var Bool value)
    {
        this.AddStringBool(value).Add(",").AddLine();
        return true;
    }

    maide precate Bool AddIntValue(var Int value)
    {
        this.Add("0h").AddStringIntHex(value).Add(",").AddLine();
        return true;
    }

    maide precate Bool AddStringValue(var String value)
    {
        this.Add("\"");

        var Int count;
        count : this.StringCount(value);

        var Int i;
        i : 0;
        while (i < count)
        {
            var Int n;
            n : this.StringComp.Char(value, i);

            var Bool b;
            b : false;

            inf (~b)
            {
                inf (n = this.Char("\""))
                {
                    this.Add("\\\"");
                    b : true;
                }
            }
            inf (~b)
            {
                inf (n = this.Char("\n"))
                {
                    this.Add("\\n");
                    b : true;
                }
            }
            inf (~b)
            {
                this.AddChar(n);
            }

            i : i + 1;
        }

        this.Add("\"").Add(",").AddLine();
        return true;
    }

    maide precate Bool AddSpace()
    {
        var Int count;
        count : this.Space;
        var Int i;
        i : 0;
        while (i < count)
        {
            this.Add(" ");

            i : i + 1;
        }

        return true;
    }

    maide precate Bool Null()
    {
        this.Add("null").Add(",").AddLine();
        return true;
    }

    maide prusate Bool ExecuteBool(var Bool value)
    {
        inf (value = null)
        {
            this.Null();
            return true;
        }
        this.AddBoolValue(value);
        return true;
    }

    maide prusate Bool ExecuteInt(var Int value)
    {
        inf (value = null)
        {
            this.Null();
            return true;
        }
        this.AddIntValue(value);
        return true;
    }

    maide prusate Bool ExecuteString(var String value)
    {
        inf (value = null)
        {
            this.Null();
            return true;
        }
        this.AddStringValue(value);
        return true;
    }

    maide prusate String Execute(var Code code)
    {
        this.AddClear();

        this.ExecuteCode(code);

        var String a;
        a : this.AddResult();
        return a;
    }

    maide prusate Bool ExecuteCode(var Code code)
    {
        inf (code = null)
        {
            this.Null();
            return true;
        }

        this.Start("Code");

        this.FieldStart("Token");

        this.StartArray();

        var Int count;
        count : code.Token.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Token token;
            token : cast Token(code.Token.Get(i));

            this.ExecuteToken(token);

            i : i + 1;
        }
        this.EndArray();

        this.FieldEnd("Token");

        this.FieldStart("Comment");

        this.StartArray();

        count : code.Comment.Count;
        i : 0;
        while (i < count)
        {
            var Comment comment;
            comment : cast Comment(code.Comment.Get(i));

            this.ExecuteComment(comment);

            i : i + 1;
        }
        this.EndArray();

        this.FieldEnd("Comment");

        this.End();
        return true;
    }

    maide prusate Bool ExecuteToken(var Token token)
    {
        inf (token = null)
        {
            this.Null();
            return true;
        }

        this.Start("Token");

        this.FieldStart("Row");
        this.ExecuteInt(token.Row);
        this.FieldEnd("Row");

        this.FieldStart("Range");
        this.ExecuteRange(token.Range);
        this.FieldEnd("Range");

        this.End();
        return true;
    }

    maide prusate Bool ExecuteComment(var Comment comment)
    {
        inf (comment = null)
        {
            this.Null();
            return true;
        }

        this.Start("Comment");

        this.FieldStart("Row");
        this.ExecuteInt(comment.Row);
        this.FieldEnd("Row");

        this.FieldStart("Range");
        this.ExecuteRange(comment.Range);
        this.FieldEnd("Range");

        this.End();
        return true;
    }

    maide prusate Bool ExecuteRange(var InfraRange range)
    {
        inf (range = null)
        {
            this.Null();
            return true;
        }

        this.Start("Range");

        this.FieldStart("Index");
        this.ExecuteInt(range.Index);
        this.FieldEnd("Index");

        this.FieldStart("Count");
        this.ExecuteInt(range.Count);
        this.FieldEnd("Count");

        this.End();
        return true;
    }
}