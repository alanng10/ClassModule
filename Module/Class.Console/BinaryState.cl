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
    field prusate Array StringArray { get { return data; } set { data : value; } }
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
        this.Arg.StringIndex : 0;
        this.Arg.StateIndex : 0;
        this.Arg.OperateIndex : 0;
        return true;
    }

    maide prusate Bool ExecuteStage()
    {
        this.ExecuteStringArray(this.StringArray);

        this.Travel.ResetBlockIndex();

        this.ExecuteCount(this.StateCount);

        var Iter iter;
        iter : this.ClassIter;

        this.Module.Class.IterSet(iter);

        while (iter.Next())
        {
            var Class varClass;
            varClass : cast Class(iter.Value);

            this.ExecuteClass(varClass);
        }

        iter.Clear();
        return true;
    }

    maide prusate Bool ExecuteStringArray(var Array array)
    {
        this.ExecuteCount(array.Count);

        var Int count;
        count : array.Count;

        var Int i;
        i : 0;
        while (i < count)
        {
            var String k;
            k : cast String(array.Get(i));

            this.ExecuteString(k);

            i : i + 1;
        }
        return true;
    }

    maide prusate Bool ExecuteClass(var Class varClass)
    {
        var Iter iter;
        iter : this.TableIter;

        varClass.Field.IterSet(iter);

        while (iter.Next())
        {
            var Field varField;
            varField : cast Field(iter.Value);

            this.ExecuteField(varField);
        }

        varClass.Maide.IterSet(iter);

        while (iter.Next())
        {
            var Maide varMaide;
            varMaide : cast Maide(iter.Value);

            this.ExecuteMaide(varMaide);
        }

        iter.Clear();
        return true;
    }

    maide prusate Bool ExecuteField(var Field varField)
    {
        this.ExecuteFieldGet(varField);

        this.ExecuteFieldSet(varField);
        return true;
    }

    maide prusate Bool ExecuteFieldGet(var Field varField)
    {
        var NodeField nodeField;
        nodeField : cast NodeField(varField.Any);

        this.ExecuteCompState(nodeField.Get, varField.Get.Count);
        return true;
    }

    maide prusate Bool ExecuteFieldSet(var Field varField)
    {
        var NodeField nodeField;
        nodeField : cast NodeField(varField.Any);

        this.ExecuteCompState(nodeField.Set, varField.Set.Count);
        return true;
    }

    maide prusate Bool ExecuteMaide(var Maide varMaide)
    {
        this.ExecuteMaideCall(varMaide);
        return true;
    }

    maide prusate Bool ExecuteMaideCall(var Maide varMaide)
    {
        var NodeMaide nodeMaide;
        nodeMaide : cast NodeMaide(varMaide.Any);

        this.ExecuteCompState(nodeMaide.Call, varMaide.Call.Count);
        return true;
    }

    maide prusate Bool ExecuteCompState(var State state, var Int varVar)
    {
        this.ExecuteCount(varVar);

        this.Operate.ExecuteTravelStart();

        this.Travel.ExecuteState(state);

        this.Operate.ExecuteTravelEnd();
        return true;
    }

    maide prusate Bool ExecuteOperate(var BinaryOperate operate)
    {
        this.ExecuteByte(operate.Kind);

        this.ExecuteOperateArg(operate.ArgA);
        this.ExecuteOperateArg(operate.ArgB);

        this.Operate.ExecuteOperate();
        return true;
    }

    maide prusate Bool ExecuteOperateArg(var Any arg)
    {
        inf (arg = null)
        {
            return true;
        }

        var Bool b;
        b : false;

        inf (~b)
        {
            var Bool bool;
            bool : cast Bool(arg);

            inf (~(bool = null))
            {
                this.ExecuteBool(bool);

                b : true;
            }
        }

        inf (~b)
        {
            var Int int;
            int : cast Int(arg);

            inf (~(int = null))
            {
                this.ExecuteInt(int);

                b : true;
            }
        }

        inf (~b)
        {
            var String string;
            string : cast String(arg);

            inf (~(string = null))
            {
                this.ExecuteStringArg();

                b : true;
            }
        }

        return true;
    }

    maide prusate Bool ExecuteStringArg()
    {
        var Int k;
        k : this.Operate.ExecuteString();

        this.ExecuteInt(k);
        return true;
    }

    maide prusate Bool ExecuteString(var String value)
    {
        var Int count;
        count : this.StringComp.Count(value);

        this.ExecuteCount(count);

        var Int i;
        i : 0;
        while (i < count)
        {
            var Int ka;
            ka : this.StringComp.Char(value, i);

            this.ExecuteMid(ka);

            i : i + 1;
        }
        return true;
    }

    maide prusate Bool ExecuteBool(var Bool value)
    {
        var Int k;
        k : 0;

        inf (value)
        {
            k : 1;
        }

        this.ExecuteByte(k);
        return true;
    }

    maide prusate Bool ExecuteCount(var Int value)
    {
        return this.ExecuteInt(value);
    }

    maide prusate Bool ExecuteMid(var Int value)
    {
        return this.ExecuteIntCount(value, 4);
    }

    maide prusate Bool ExecuteInt(var Int value)
    {
        return this.ExecuteIntCount(value, 8);
    }

    maide prusate Bool ExecuteIntCount(var Int value, var Int count)
    {
        var Int i;
        i : 0;
        while (i < count)
        {
            var Int shift;
            shift : i * 8;

            var Int ka;
            ka : bit >(value, shift);
            ka : bit &(ka, 0hff);

            this.ExecuteByte(ka);

            i : i + 1;
        }
        return true;
    }

    maide prusate Bool ExecuteByte(var Int value)
    {
        this.Operate.ExecuteByte(value);
        return true;
    }

    maide prusate Int ClassIndex(var Class varClass)
    {
        var Int k;
        k : cast Int(this.IndexTable.Get(varClass));

        var Int a;
        a : k;
        return a;
    }
}