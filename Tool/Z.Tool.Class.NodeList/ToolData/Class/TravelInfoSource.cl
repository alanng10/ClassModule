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

    maide precate Bool Field(var String name)
    {
        this.AddSpace().Add(name).Add(" : ");
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

    maide prusate Bool Execute(var Node node)
    {
        inf (node = null)
        {
            this.Null();
            return true;
        }

        #Execute#
        return true;
    }

#NodeList#}