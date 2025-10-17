class StringTravel : Travel
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;

        this.CountOperate : this.CreateCountOperate();
        this.SetOperate : this.CreateSetOperate();
        this.TableIter : this.CreateTableIter();
        return true;
    }

    maide precate StringCountOperate CreateCountOperate()
    {
        var StringCountOperate a;
        a : new StringCountOperate;
        a.Travel : this;
        a.Init();
        return a;
    }

    maide precate StringSetOperate CreateSetOperate()
    {
        var StringSetOperate a;
        a : new StringSetOperate;
        a.Travel : this;
        a.Init();
        return a;
    }

    maide precate TableIter CreateTableIter()
    {
        var TableIter a;
        a : new TableIter;
        a.Init();
        return a;
    }

    field prusate Module Module { get { return data; } set { data : value; } }
    field prusate Array Result { get { return data; } set { data : value; } }
    field prusate StringArg Arg { get { return data; } set { data : value; } }
    field prusate StringOperate Operate { get { return data; } set { data : value; } }
    field prusate StringCountOperate CountOperate { get { return data; } set { data : value; } }
    field prusate StringSetOperate SetOperate { get { return data; } set { data : value; } }
    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate TableIter TableIter { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        this.Arg : new StringArg;
        this.Arg.Init();

        this.Operate : this.CountOperate;

        this.ResetStage();
        this.ExecuteStage();

        this.Arg.Array : this.ListInfra.ArrayCreate(this.Arg.Index);

        this.Operate : this.SetOperate;

        this.ResetStage();
        this.ExecuteStage();

        this.Result : this.Arg.Array;

        this.Operate : null;
        this.Arg : null;
        return true;
    }

    maide prusate Bool ResetStage()
    {
        this.Arg.Index : 0;
        return true;
    }

    maide prusate Bool ExecuteStage()
    {
        var Iter iter;
        iter : this.TableIter;

        this.Module.Class.IterSet(iter);

        while (iter.Next())
        {
            var Class varClass;
            varClass : cast Class(iter.Value);

            var NodeClass nodeClass;
            nodeClass : cast NodeClass(varClass.Any);

            this.ExecuteClass(nodeClass);
        }

        iter.Clear();
        return true;
    }

    public override bool ExecuteStringValue(StringValue stringValue)
    {
        this.Operate.ExecuteString(stringValue.Value);
        return true;
    }
}