class BinaryState : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        this.StringComp : share StringComp;

        this.CountOperate : this.CreateCountOperate();
        this.SetOperate : this.CreateSetOperate();
        this.Travel : this.CreateTravel();
        this.ClassIter : this.CreateClassIter();
        this.TableIter : this.CreateTableIter();
        return true;
    }

    maide precate BinaryStateCountOperate CreateCountOperate()
    {
        var BinaryStateCountOperate a;
        a : new BinaryStateCountOperate;
        a.State : this;
        a.Init();
        return a;
    }

    maide precate BinaryStateSetOperate CreateSetOperate()
    {
        var BinaryStateSetOperate a;
        a : new BinaryStateSetOperate;
        a.State : this;
        a.Init();
        return a;
    }

    maide precate BinaryStateTravel CreateTravel()
    {
        var BinaryStateTravel a;
        a : new BinaryStateTravel;
        a.State : this;
        a.Init();
        return a;
    }

    maide precate TableIter CreateClassIter()
    {
        return this.CreateTableIter();
    }

    maide precate TableIter CreateTableIter()
    {
        var TableIter a;
        a : new TableIter;
        a.Init();
        return a;
    }

    field prusate Module Module { get { return data; } set { data : value; } }
    field prusate Table IndexTable { get { return data; } set { data : value; } }
    field prusate Data Result { get { return data; } set { data : value; } }
    field prusate BinaryStateArg Arg { get { return data; } set { data : value; } }
    field prusate BinaryStateOperate Operate { get { return data; } set { data : value; } }
    field prusate BinaryStateCountOperate CountOperate { get { return data; } set { data : value; } }
    field prusate BinaryStateSetOperate SetOperate { get { return data; } set { data : value; } }
    field prusate Int StateCount { get { return data; } set { data : value; } }
    field precate InfraInfra InfraInfra { get { return data; } set { data : value; } }
    field precate StringComp StringComp { get { return data; } set { data : value; } }
    field precate BinaryStateTravel Travel { get { return data; } set { data : value; } }
    field precate TableIter ClassIter { get { return data; } set { data : value; } }
    field precate TableIter TableIter { get { return data; } set { data : value; } }
}