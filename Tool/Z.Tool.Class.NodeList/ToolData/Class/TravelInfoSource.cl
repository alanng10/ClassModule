class InfoTravel : Travel
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
        this.AddBool(value).Add(",").AddLine();
        return true;
    }

    maide precate Bool AddIntValue(var Int value)
    {
        this.Add("0h").AddIntHex(value).Add(",").AddLine();
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

    maide precate InfoTravel AddSpace()
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

        return this;
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

    maide prusate String Execute(var Node node)
    {
        this.AddClear();

        inf (node = null)
        {
            this.Null();
            return true;
        }

#ExecuteList#
        var String a;
        a : this.AddResult();
        return a;
    }

#NodeList#}