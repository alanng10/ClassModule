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

    maide prusate Bool Execute()
    {
        this.StateCount : this.StateCountGet();

        this.Arg : new BinaryStateArg;
        this.Arg.Init();

        this.Arg.OperateCountData : new Data;
        this.Arg.OperateCountData.Count : this.StateCount * 8;
        this.Arg.OperateCountData.Init();

        this.Operate : this.CountOperate;

        this.ResetStage();
        this.ExecuteStage();

        var Int count;
        count : this.Arg.Index;
        this.Arg.Data : new Data;
        this.Arg.Data.Count : count;
        this.Arg.Data.Init();

        this.Operate : this.SetOperate;

        this.ResetStage();
        this.ExecuteStage();

        this.Result : this.Arg.Data;

        this.Operate : null;
        this.Arg : null;
        this.StateCount : null;
        return true;
    }

    maide prusate Int StateCountGet()
    {
        var Int count;
        count : 0;

        var Iter iter;
        iter : this.ClassIter;

        this.Module.Class.IterSet(iter);

        while (iter.Next())
        {
            var Class varClass;
            varClass : cast Class(iter.Value);

            count : count + varClass.Field.Count * 2;

            count : count + varClass.Maide.Count;
        }

        iter.Clear();

        return count;
    }

    maide prusate Bool ResetStage()
    {
        this.Arg.Index : 0;
        this.Arg.StateIndex : 0;
        this.Arg.OperateIndex : 0;
        return true;
    }
}