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

    maide precate Bool FieldGet(var Field varField, var State nodeGet)
    {
        inf (nodeGet = null)
        {
            return true;
        }

        this.ThisResultClass : varField.Class;

        this.StateVar : varField.Get;

        var Var dataVar;
        dataVar : new Var;
        dataVar.Init();
        dataVar.Name : "data";
        dataVar.Class : varField.Class;
        dataVar.Index : this.StateVar.Count;

        this.ListInfra.TableAdd(this.StateVar, dataVar.Name, dataVar);

        var Table k;
        k : this.ClassInfra.TableCreateStringLess();

        this.ListInfra.TableAdd(k, dataVar.Name, dataVar);

        this.VarStack.Push(k);

        this.ExecuteState(nodeGet);

        this.VarStack.Pop();

        this.StackVar : null;
        this.ThisResultClass : null;
        return true;
    }

    maide precate Bool FieldSet(var Field varField, var State nodeSet)
    {
        inf (nodeSet = null)
        {
            return true;
        }

        this.ThisResultClass : this.System.Bool;

        this.StateVar : varField.Set;

        var Var dataVar;
        dataVar : new Var;
        dataVar.Init();
        dataVar.Name : "data";
        dataVar.Class : varField.Class;
        dataVar.Index : this.StateVar.Count;

        this.ListInfra.TableAdd(this.StateVar, dataVar.Name, dataVar);

        var Var valueVar;
        valueVar : new Var;
        valueVar.Init();
        valueVar.Name : "value";
        valueVar.Class : varField.Class;
        valueVar.Index : this.StateVar.Count;

        this.ListInfra.TableAdd(this.StateVar, valueVar.Name, valueVar);

        var Table k;
        k : this.ClassInfra.TableCreateStringLess();

        this.ListInfra.TableAdd(k, dataVar.Name, dataVar);
        this.ListInfra.TableAdd(k, valueVar.Name, valueVar);

        this.VarStack.Push(k);

        this.ExecuteState(nodeSet);

        this.VarStack.Pop();

        this.StackVar : null;
        this.ThisResultClass : null;
        return true;
    }

    maide prusate Bool ExecuteMaide(var NodeMaide nodeMaide)
    {
        inf (nodeMaide = null)
        {
            return true;
        }

        var Param param;
        param : nodeMaide.Param;
        var State call;
        call : nodeMaide.Call;

        var Maide varMaide;
        varMaide : this.Info(nodeMaide).Maide;
        inf (varMaide = null)
        {
            return true;
        }

        this.ThisResultClass : varMaide.Class;

        this.StateVar : varMaide.Call;

        this.VarTableAdd(this.StateVar, varMaide.Param);

        this.VarStack.Push(varMaide.Param);

        this.ExecuteState(call);

        this.VarStack.Pop();

        this.StateVar : null;
        this.ThisResultClass : null;
        return true;
    }

    maide prusate Bool ExecuteVar(var NodeVar nodeVar)
    {
        inf (nodeVar = null)
        {
            return true;
        }

        var VarName name;
        name : nodeVar.Name;
        var ClassName nodeClass;
        nodeClass : nodeVar.Class;

        var String varName;
        inf (~(name = null))
        {
            varName : name.Value;
        }

        var String className;
        inf (~(nodeClass = null))
        {
            className : nodeClass.Value;
        }

        inf (~(varName = null))
        {
            inf (this.StateVar.Valid(varName))
            {
                this.Error(this.ErrorKind.NameUnavail, nodeVar);
                return true;
            }
        }

        var Class varClass;

        inf (~(className = null))
        {
            varClass : this.Class(className);
            inf (varClass = null)
            {
                this.Error(this.ErrorKind.ClassUndefine, nodeVar);
                return true;
            }
        }

        var Var a;
        a : new Var;
        a.Init();
        a.Name : varName;
        a.Class : varClass;
        a.Index : this.StateVar.Count;
        a.Any : nodeVar;

        var Table k;
        k : cast Table(this.VarStack.Top);

        this.ListInfra.TableAdd(k, a.Name, a);
        this.ListInfra.TableAdd(this.StateVar, a.Name, a);

        this.Info(nodeVar).Var : a;
        return true;
    }

    maide prusate Bool ExecuteState(var State state)
    {
        inf (state = null)
        {
            return true;
        }

        var Table k;
        k : this.ClassInfra.TableCreateStringLess();

        this.VarStack.Push(k);

        base.ExecuteState(state);

        this.VarStack.Pop();

        this.Info(state).StateVar : k;

        return true;
    }

    maide prusate Bool ExecuteInfExecute(var InfExecute infExecute)
    {
        inf (infExecute = null)
        {
            return true;
        }

        var Operate cond;
        cond : infExecute.Cond;
        var State then;
        then : infExecute.Then;

        base.ExecuteInfExecute(infExecute);

        this.ExecuteCondBodyExecute(infExecute, cond);
        return true;
    }

    maide prusate Bool ExecuteWhileExecute(var WhileExecute whileExecute)
    {
        inf (whileExecute = null)
        {
            return true;
        }

        var Operate cond;
        cond : whileExecute.Cond;
        var State loop;
        loop : whileExecute.Loop;

        base.ExecuteWhileExecute(whileExecute);

        this.ExecuteCondBodyExecute(whileExecute, cond);
        return true;
    }

    maide prusate Bool ExecuteReturnExecute(var ReturnExecute returnExecute)
    {
        inf (returnExecute = null)
        {
            return true;
        }

        var Operate result;
        result : returnExecute.Result;

        base.ExecuteReturnExecute(returnExecute);

        var Class resultClass;
        inf (~(result = null))
        {
            resultClass : this.Info(result).OperateClass;
            inf (resultClass = null)
            {
                this.Error(this.ErrorKind.ResultUndefine, returnExecute);
            }
        }

        inf (~(resultClass = null))
        {
            inf (~this.ValidClass(resultClass, this.ThisResultClass))
            {
                this.Error(this.ErrorKind.ResultUnassign, returnExecute);
            }
        }
        return true;
    }
}