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

    maide prusate Bool ExecuteAreExecute(var AreExecute areExecute)
    {
        inf (areExecute = null)
        {
            return true;
        }

        var Mark mark;
        mark : areExecute.Mark;
        var Operate value;
        value : areExecute.Value;

        base.ExecuteAreExecute(areExecute);

        var Class markClass;
        inf (~(mark = null))
        {
            markClass : this.Info(mark).MarkClass;
            inf (markClass = null)
            {
                this.Error(this.ErrorKind.MarkUndefine, areExecute);
            }
        }

        var Class valueClass;
        inf (~(value = null))
        {
            valueClass : this.Info(value).OperateClass;
            inf (valueClass = null)
            {
                this.Error(this.ErrorKind.ValueUndefine, areExecute);
            }
        }

        inf (~(markClass = null) & ~(valueClass = null))
        {
            inf (~this.ValidClass(valueClass, markClass))
            {
                this.Error(this.ErrorKind.ValueUnassign, areExecute);
            }
        }
        return true;
    }

    maide prusate Bool ExecuteVarMark(var VarMark varMark)
    {
        inf (varMark = null)
        {
            return true;
        }

        var VarName name;
        name : varMark.Var;

        var Class varClass;
        varClass : this.ExecuteVarNameNode(varMark, name);

        this.Info(varMark).MarkClass : varClass;
        return true;
    }

    maide prusate Bool ExecuteSetMark(var SetMark setMark)
    {
        inf (setMark = null)
        {
            return true;
        }

        var Operate varThis;
        varThis : setMark.This;
        var FieldName nodeField;
        nodeField : setMark.Field;

        base.ExecuteSetMark(setMark);

        var Field varField;
        varField : this.ExecuteThisFieldNode(setMark, varThis, nodeField);

        var Class fieldClass;
        inf (~(varField = null))
        {
            fieldClass : varField.Class;
        }

        this.Info(setMark).SetField : varField;
        this.Info(setMark).MarkClass : fieldClass;
        return true;
    }

    maide prusate Bool ExecuteGetOperate(var GetOperate getOperate)
    {
        inf (getOperate = null)
        {
            return true;
        }

        var Operate varThis;
        varThis : getOperate.This;
        var FieldName nodeField;
        nodeField : getOperate.Field;

        base.ExecuteGetOperate(getOperate);

        var Field varField;
        varField : this.ExecuteThisFieldNode(getOperate, varThis, nodeField);

        var Class fieldClass;
        inf (~(varField = null))
        {
            fieldClass : varField.Class;
        }

        this.Info(getOperate).GetField : varField;
        this.Info(getOperate).OperateClass : fieldClass;
        return true;
    }

    maide prusate Bool ExecuteCallOperate(var CallOperate callOperate)
    {
        inf (callOperate = null)
        {
            return true;
        }

        var Operate varThis;
        varThis : callOperate.This;
        var MaideName nodeMaide;
        nodeMaide : callOperate.Maide;
        var Argue argue;
        argue : callOperate.Argue;

        base.ExecuteCallOperate(callOperate);

        var Class thisClass;
        inf (~(varThis = null))
        {
            thisClass : this.Info(varThis).OperateClass;
            inf (thisClass = null)
            {
                this.Error(this.ErrorKind.ThisUndefine, callOperate);
            }
        }

        var String maideName;
        inf (~(nodeMaide = null))
        {
            maideName : nodeMaide.Value;
        }

        var Maide varMaide;

        inf (~(thisClass = null))
        {
            inf (~(maideName = null))
            {
                varMaide : this.Maide(thisClass, maideName);
                inf (varMaide = null)
                {
                    this.Error(this.ErrorKind.MaideUndefine, callOperate);
                }
            }
        }

        inf (~(varMaide = null))
        {
            inf (~this.ValidArgue(varMaide, argue))
            {
                this.Error(this.ErrorKind.ArgueUnassign, callOperate);
            }
        }

        var Class operateClass;
        inf (~(varMaide = null))
        {
            operateClass : varMaide.Class;
        }

        this.Info(callOperate).CallMaide : varMaide;
        this.Info(callOperate).OperateClass : operateClass;
        return true;
    }

    maide prusate Bool ExecuteThisOperate(var ThisOperate thisOperate)
    {
        inf (thisOperate = null)
        {
            return true;
        }

        this.Info(thisOperate).OperateClass : this.ThisClass;
        return true;
    }

    maide prusate Bool ExecuteBaseOperate(var BaseOperate baseOperate)
    {
        inf (baseOperate = null)
        {
            return true;
        }

        this.Info(baseOperate).OperateClass : this.ThisClass.Base;
        return true;
    }

    maide prusate Bool ExecuteNullOperate(var NullOperate nullOperate)
    {
        inf (nullOperate = null)
        {
            return true;
        }

        this.Info(nullOperate).OperateClass : this.NullClass;
        return true;
    }

    maide prusate Bool ExecuteNewOperate(var NewOperate newOperate)
    {
        inf (newOperate = null)
        {
            return true;
        }

        var ClassName nodeClass;
        nodeClass : newOperate.Class;

        this.ExecuteWordClassOperate(newOperate, nodeClass);
        return true;
    }

    maide prusate Bool ExecuteShareOperate(var ShareOperate shareOperate)
    {
        inf (shareOperate = null)
        {
            return true;
        }

        var ClassName nodeClass;
        nodeClass : shareOperate.Class;

        this.ExecuteWordClassOperate(shareOperate, nodeClass);
        return true;
    }

    maide prusate Bool ExecuteCastOperate(var CastOperate castOperate)
    {
        inf (castOperate = null)
        {
            return true;
        }

        var ClassName nodeClass;
        nodeClass : castOperate.Class;
        var Operate any;
        any : castOperate.Any;

        base.ExecuteCastOperate(castOperate);

        var Class anyClass;
        inf (~(any = null))
        {
            anyClass : this.Info(any).OperateClass;
            inf (anyClass = null)
            {
                this.Error(this.ErrorKind.AnyUndefine, castOperate);
            }
        }

        var String className;
        inf (~(nodeClass = null))
        {
            className : nodeClass.Value;
        }

        var Class varClass;
        inf (~(className = null))
        {
            varClass : this.Class(className);
            inf (varClass = null)
            {
                this.Error(this.ErrorKind.ClassUndefine, castOperate);
            }
        }

        inf (~(anyClass = null))
        {
            inf (~(varClass = null))
            {
                inf (~this.ValidClass(anyClass, varClass))
                {
                    inf (~this.ValidClass(varClass, anyClass))
                    {
                        this.Error(this.ErrorKind.CastUnachieve, castOperate);
                    }
                }
            }
        }

        this.Info(castOperate).OperateClass : varClass;
        return true;
    }

    maide prusate Bool ExecuteVarOperate(var VarOperate varOperate)
    {
        inf (varOperate = null)
        {
            return true;
        }

        var VarName name;
        name : varOperate.Var;

        var Class varClass;
        varClass : this.ExecuteVarNameNode(varOperate, name);

        this.Info(varOperate).OperateClass : varClass;
        return true;
    }

    maide prusate Bool ExecuteValueOperate(var ValueOperate valueOperate)
    {
        inf (valueOperate = null)
        {
            return true;
        }

        var Value value;
        value : valueOperate.Value;

        base.ExecuteValueOperate(valueOperate);

        var Class valueClass;

        inf (~(cast BoolValue(value) = null))
        {
            valueClass : this.System.Bool;
        }
        inf (~(cast IntValue(value) = null) | ~(cast IntSignValue(value) = null) | ~(cast IntHexValue(value) = null) | ~(cast IntHexSignValue(value) = null))
        {
            valueClass : this.System.Int;
        }
        inf (~(cast StringValue(value) = null))
        {
            valueClass : this.System.String;
        }

        this.Info(valueOperate).OperateClass : valueClass;
        return true;
    }

    maide prusate Bool ExecuteBraceOperate(var BraceOperate braceOperate)
    {
        inf (braceOperate = null)
        {
            return true;
        }

        var Operate any;
        any : braceOperate.Any;

        base.ExecuteBraceOperate(braceOperate);

        var Class anyClass;
        inf (~(any = null))
        {
            anyClass : this.Info(any).OperateClass;
            inf (anyClass = null)
            {
                this.Error(this.ErrorKind.AnyUndefine, braceOperate);
            }
        }

        this.Info(braceOperate).OperateClass : anyClass;
        return true;
    }
    
    maide prusate Bool ExecuteSameOperate(var SameOperate sameOperate)
    {
        inf (sameOperate = null)
        {
            return true;
        }

        base.ExecuteSameOperate(sameOperate);

        this.Info(sameOperate).OperateClass : this.System.Bool;
        return true;
    }
}