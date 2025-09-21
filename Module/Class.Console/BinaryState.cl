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
}