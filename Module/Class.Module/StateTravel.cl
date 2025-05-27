class StateTravel : Travel
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.ClassInfra : share ClassInfra;

        this.System : this.Create.System;
        this.NullClass : this.Create.NullClass;

        this.VarStack : this.CreateVarStack();
        this.VarStackIter : this.CreateVarStackIter();
        this.ParamIter : this.CreateParamIter();
        this.ArgueIter : this.CreateArgueIter();
        return true;
    }

    maide precate Stack CreateVarStack()
    {
        var Stack a;
        a : new Stack;
        a.Init();
        return a;
    }

    maide precate Iter CreateVarStackIter()
    {
        var Iter a;
        a : new Iter;
        a.Init();
        return a;
    }

    maide precate TableIter CreateParamIter()
    {
        var TableIter a;
        a : new TableIter;
        a.Init();
        return a;
    }

    maide precate ArrayIter CreateArgueIter()
    {
        var ArrayIter a;
        a : new ArrayIter;
        a.Init();
        return a;
    }

    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate ClassInfra ClassInfra { get { return data; } set { data : value; } }
    field precate System System { get { return data; } set { data : value; } }
    field precate Class NullClass { get { return data; } set { data : value; } }
    field precate Class ThisClass { get { return data; } set { data : value; } }
    field precate Class ThisResultClass { get { return data; } set { data : value; } }
    field precate Table StateVar { get { return data; } set { data : value; } }
    field precate Stack VarStack { get { return data; } set { data : value; } }
    field precate Iter VarStackIter { get { return data; } set { data : value; } }
    field precate Iter ParamIter { get { return data; } set { data : value; } }
    field precate Iter ArgueIter { get { return data; } set { data : value; } }

    maide prusate Bool ExecuteClass(var NodeClass varClass)
    {
        inf (varClass = null)
        {
            return true;
        }

        this.ThisClass : this.Info(varClass).Class;

        base.ExecuteClass(varClass);

        this.ThisClass : null;

        return true;
    }

    maide prusate Bool ExecuteField(var NodeField nodeField)
    {
        inf (nodeField = null)
        {
            return true;
        }

        var State nodeGet;
        nodeGet : nodeField.Get;
        var State nodeSet;
        nodeSet : nodeField.Set;

        var Field varField;
        varField : this.Info(nodeField).Field;
        inf (varField = null)
        {
            return true;
        }

        this.FieldGet(varField, nodeGet);
        this.FieldSet(varField, nodeSet);
        return true;
    }
}