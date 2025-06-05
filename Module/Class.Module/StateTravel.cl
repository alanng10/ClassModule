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

    maide prusate Bool ExecuteAndOperate(var AndOperate andOperate)
    {
        inf (andOperate = null)
        {
            return true;
        }

        var Operate lite;
        lite : andOperate.Lite;
        var Operate rite;
        rite : andOperate.Rite;

        base.ExecuteAndOperate(andOperate);

        this.ExecuteTwoOperandOperate(andOperate, lite, rite, this.System.Bool, this.System.Bool);
        return true;
    }

    maide prusate Bool ExecuteOrnOperate(var OrnOperate ornOperate)
    {
        inf (ornOperate = null)
        {
            return true;
        }

        var Operate lite;
        lite : ornOperate.Lite;
        var Operate rite;
        rite : ornOperate.Rite;

        base.ExecuteOrnOperate(ornOperate);

        this.ExecuteTwoOperandOperate(ornOperate, lite, rite, this.System.Bool, this.System.Bool);
        return true;
    }

    maide prusate Bool ExecuteNotOperate(var NotOperate notOperate)
    {
        inf (notOperate = null)
        {
            return true;
        }

        var Operate value;
        value : notOperate.Value;

        base.ExecuteNotOperate(notOperate);

        this.ExecuteOneOperandOperate(notOperate, value, this.System.Bool, this.System.Bool);
        return true;
    }

    maide prusate Bool ExecuteLessOperate(var LessOperate lessOperate)
    {
        inf (lessOperate = null)
        {
            return true;
        }

        var Operate lite;
        lite : lessOperate.Lite;
        var Operate rite;
        rite : lessOperate.Rite;

        base.ExecuteLessOperate(lessOperate);

        this.ExecuteTwoOperandOperate(lessOperate, lite, rite, this.System.Bool, this.System.Int);
        return true;
    }

    maide prusate Bool ExecuteAddOperate(var AddOperate addOperate)
    {
        inf (addOperate = null)
        {
            return true;
        }

        var Operate lite;
        lite : addOperate.Lite;
        var Operate rite;
        rite : addOperate.Rite;

        base.ExecuteAddOperate(addOperate);

        this.ExecuteTwoOperandOperate(addOperate, lite, rite, this.System.Int, this.System.Int);
        return true;
    }

    maide prusate Bool ExecuteSubOperate(var SubOperate subOperate)
    {
        inf (subOperate = null)
        {
            return true;
        }

        var Operate lite;
        lite : subOperate.Lite;
        var Operate rite;
        rite : subOperate.Rite;

        base.ExecuteSubOperate(subOperate);

        this.ExecuteTwoOperandOperate(subOperate, lite, rite, this.System.Int, this.System.Int);
        return true;
    }

    maide prusate Bool ExecuteMulOperate(var MulOperate mulOperate)
    {
        inf (mulOperate = null)
        {
            return true;
        }

        var Operate lite;
        lite : mulOperate.Lite;
        var Operate rite;
        rite : mulOperate.Rite;

        base.ExecuteMulOperate(mulOperate);

        this.ExecuteTwoOperandOperate(mulOperate, lite, rite, this.System.Int, this.System.Int);
        return true;
    }

    maide prusate Bool ExecuteDivOperate(var DivOperate divOperate)
    {
        inf (divOperate = null)
        {
            return true;
        }

        var Operate lite;
        lite : divOperate.Lite;
        var Operate rite;
        rite : divOperate.Rite;

        base.ExecuteDivOperate(divOperate);

        this.ExecuteTwoOperandOperate(divOperate, lite, rite, this.System.Int, this.System.Int);
        return true;
    }

    maide prusate Bool ExecuteSignLessOperate(var SignLessOperate signLessOperate)
    {
        inf (signLessOperate = null)
        {
            return true;
        }

        var Operate lite;
        lite : signLessOperate.Lite;
        var Operate rite;
        rite : signLessOperate.Rite;

        base.ExecuteSignLessOperate(signLessOperate);

        this.ExecuteTwoOperandOperate(signLessOperate, lite, rite, this.System.Bool, this.System.Int);
        return true;
    }

    maide prusate Bool ExecuteSignMulOperate(var SignMulOperate signMulOperate)
    {
        inf (signMulOperate = null)
        {
            return true;
        }

        var Operate lite;
        lite : signMulOperate.Lite;
        var Operate rite;
        rite : signMulOperate.Rite;

        base.ExecuteSignMulOperate(signMulOperate);

        this.ExecuteTwoOperandOperate(signMulOperate, lite, rite, this.System.Int, this.System.Int);
        return true;
    }

    maide prusate Bool ExecuteSignDivOperate(var SignDivOperate signDivOperate)
    {
        inf (signDivOperate = null)
        {
            return true;
        }

        var Operate lite;
        lite : signDivOperate.Lite;
        var Operate rite;
        rite : signDivOperate.Rite;

        base.ExecuteSignDivOperate(signDivOperate);

        this.ExecuteTwoOperandOperate(signDivOperate, lite, rite, this.System.Int, this.System.Int);
        return true;
    }

    maide prusate Bool ExecuteBitAndOperate(var BitAndOperate bitAndOperate)
    {
        inf (bitAndOperate = null)
        {
            return true;
        }

        var Operate lite;
        lite : bitAndOperate.Lite;
        var Operate rite;
        rite : bitAndOperate.Rite;

        base.ExecuteBitAndOperate(bitAndOperate);

        this.ExecuteTwoOperandOperate(bitAndOperate, lite, rite, this.System.Int, this.System.Int);
        return true;
    }

    maide prusate Bool ExecuteBitOrnOperate(var BitOrnOperate bitOrnOperate)
    {
        inf (bitOrnOperate = null)
        {
            return true;
        }

        var Operate lite;
        lite : bitOrnOperate.Lite;
        var Operate rite;
        rite : bitOrnOperate.Rite;

        base.ExecuteBitOrnOperate(bitOrnOperate);

        this.ExecuteTwoOperandOperate(bitOrnOperate, lite, rite, this.System.Int, this.System.Int);
        return true;
    }

    maide prusate Bool ExecuteBitNotOperate(var BitNotOperate bitNotOperate)
    {
        inf (bitNotOperate = null)
        {
            return true;
        }

        var Operate value;
        value : bitNotOperate.Value;

        base.ExecuteBitNotOperate(bitNotOperate);

        this.ExecuteOneOperandOperate(bitNotOperate, value, this.System.Int, this.System.Int);
        return true;
    }

    maide prusate Bool ExecuteBitLiteOperate(var BitLiteOperate bitLiteOperate)
    {
        inf (bitLiteOperate = null)
        {
            return true;
        }

        var Operate value;
        value : bitLiteOperate.Value;
        var Operate count;
        count : bitLiteOperate.Count;

        base.ExecuteBitLiteOperate(bitLiteOperate);

        this.ExecuteTwoOperandOperate(bitLiteOperate, value, count, this.System.Int, this.System.Int);
        return true;
    }

    maide prusate Bool ExecuteBitRiteOperate(var BitRiteOperate bitRiteOperate)
    {
        inf (bitRiteOperate = null)
        {
            return true;
        }

        var Operate value;
        value : bitRiteOperate.Value;
        var Operate count;
        count : bitRiteOperate.Count;

        base.ExecuteBitRiteOperate(bitRiteOperate);

        this.ExecuteTwoOperandOperate(bitRiteOperate, value, count, this.System.Int, this.System.Int);
        return true;
    }

    maide prusate Bool ExecuteBitSignRiteOperate(var BitSignRiteOperate bitSignRiteOperate)
    {
        inf (bitSignRiteOperate = null)
        {
            return true;
        }

        var Operate value;
        value : bitSignRiteOperate.Value;
        var Operate count;
        count : bitSignRiteOperate.Count;

        base.ExecuteBitSignRiteOperate(bitSignRiteOperate);

        this.ExecuteTwoOperandOperate(bitSignRiteOperate, value, count, this.System.Int, this.System.Int);
        return true;
    }

    maide precate Bool ExecuteOneOperandOperate(var Operate operate, var Operate value, var Class resultClass, var Class operandClass)
    {
        var Class valueClass;
        inf (~(value = null))
        {
            valueClass : this.Info(value).OperateClass;
            inf (valueClass = null)
            {
                this.Error(this.ErrorKind.OperandUndefine, operate);
            }
        }

        inf (~(valueClass = null))
        {
            inf (~this.ValidClass(valueClass, operandClass))
            {
                this.Error(this.ErrorKind.OperandUnassign, operate);
            }
        }

        this.Info(operate).OperateClass : resultClass;
        return true;
    }

    maide precate Bool ExecuteTwoOperandOperate(var Operate operate, var Operate lite, var Operand rite, var Class resultClass, var Class operandClass)
    {
        var Bool operandUndefine;
        operandUndefine : false;

        var Bool operandUnassign;
        operandUnassign : false;

        var Class liteClass;
        inf (~(lite = null))
        {
            liteClass : this.Info(lite).OperateClass;
            inf (liteClass = null)
            {
                operandUndefine : this.ErrorUnique(this.ErrorKind.OperandUndefine, operate, operandUndefine);
            }
        }

        inf (~(liteClass = null))
        {
            inf (~this.ValidClass(liteClass, operandClass))
            {
                operandUnassign : this.ErrorUnique(this.ErrorKind.OperandUnassign, operate, operandUnassign);
            }
        }

        var Class riteClass;
        inf (~(rite = null))
        {
            riteClass : this.Info(rite).OperateClass;
            inf (riteClass = null)
            {
                operandUndefine : this.ErrorUnique(this.ErrorKind.OperandUndefine, operate, operandUndefine);
            }
        }

        inf (~(riteClass = null))
        {
            inf (~this.ValidClass(riteClass, operandClass))
            {
                operandUnassign : this.ErrorUnique(this.ErrorKind.OperandUnassign, operate, operandUnassign);
            }
        }

        this.Info(operate).OperateClass : resultClass;
        return true;
    }

    maide precate Bool ExecuteCondBodyExecute(var Execute execute, var Operate cond)
    {
        var Class condClass;
        inf (~(cond = null))
        {
            condClass : this.Info(cond).OperateClass;
            inf (condClass = null)
            {
                this.Error(this.ErrorKind.CondUndefine, execute);
            }
        }

        inf (~(condClass = null))
        {
            inf (~this.ValidClass(condClass, this.System.Bool))
            {
                this.Error(this.ErrorKind.CondUnassign, execute);
            }
        }
        return true;
    }

    maide precate Bool ExecuteWordClassOperate(var Operate operate, var ClassName nodeClass)
    {
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
                this.Error(this.ErrorKind.ClassUndefine, operate);
            }
        }

        this.Info(operate).OperateClass : varClass;
        return true;
    }

    maide precate Class ExecuteVarNameNode(var Node node, var VarName name)
    {
        var String varName;
        varName : name.Value;

        var Var varVar;
        varVar : this.VarStackVar(varName);
        inf (varVar = null)
        {
            this.Error(this.ErrorKind.VarUndefine, node);
        }

        var Class a;
        inf (~(varVar = null))
        {
            a : varVar.Class;
        }

        this.Info(node).Var : varVar;

        return a;
    }

    maide precate Field ExecuteThisFieldNode(var Node node, var Operate varThis, var FieldName nodeField)
    {
        var Class thisClass;
        inf (~(varThis = null))
        {
            thisClass : this.Info(varThis).OperateClass;
            inf (thisClass = null)
            {
                this.Error(this.ErrorKind.ThisUndefine, node);
            }
        }

        var String fieldName;
        inf (~(nodeField = null))
        {
            fieldName : nodeField.Value;
        }

        var Field varField;
        inf (~(thisClass = null))
        {
            inf (~(fieldName = null))
            {
                varField : this.Field(thisClass, fieldName);
                inf (varField = null)
                {
                    this.Error(this.ErrorKind.FieldUndefine, node);
                }
            }
        }
        return varField;
    }

    maide precate Field Field(var Class varClass, var String name)
    {
        return this.ClassInfra.FieldTrigg(varClass, name, this.ThisClass, this.System.Any, this.NullClass);
    }

    maide precate Maide Maide(var Class varClass, var String name)
    {
        return this.ClassInfra.MaideTrigg(varClass, name, this.ThisClass, this.System.Any, this.NullClass);
    }

    maide precate Bool ValidClass(var Class varClass, var Class requireClass)
    {
        return this.ClassInfra.ValidClass(varClass, requireClass, this.System.Any, this.NullClass);
    }

    maide precate Bool ValidArgue(var Maide varMaide, var Argue argue)
    {
        var Int count;
        count : varMaide.Param.Count;

        var Bool countSame;
        countSame : count = argue.Value.Count;
        inf (~countSame)
        {
            return false;
        }

        var Iter paramIter;
        paramIter : this.ParamIter;
        varMaide.Param.IterSet(paramIter);

        var Iter argueIter;
        argueIter : this.ArgueIter;
        argue.Value.IterSet(argueIter);

        var Bool b;
        b : false;

        var Int i;
        i : 0;
        while (i < count)
        {
            paramIter.Next();
            argueIter.Next();

            var Var varVar;
            var Operate operate;

            inf (~b)
            {
                varVar : cast Var(paramIter.Value);

                operate : cast Operate(argueIter.Value);
                inf (operate = null)
                {
                    b : true;
                }
            }

            var Class varClass;
            var Class operateClass;

            inf (~b)
            {
                varClass : varVar.Class;

                operateClass : this.Info(operate).OperateClass;
                inf (operateClass = null)
                {
                    b : true;
                }
            }

            inf (~b)
            {
                inf (~this.ValidClass(operateClass, varClass))
                {
                    b : true;
                }
            }
            i : i + 1;
        }

        paramIter.Clear();

        argueIter.Clear();

        var Bool ret;
        ret : ~b;
        return ret;
    }

    maide precate Bool VarTableAdd(var Table varTable, var Table other)
    {
        var Iter iter;
        iter : other.IterCreate();
        other.IterSet(iter);
        while (iter.Next())
        {
            var Var a;
            a : cast Var(iter.Value);

            this.ListInfra.TableAdd(varTable, a.Name, a);
        }
        return true;
    }

    maide precate Var VarStackVar(var String name)
    {
        var Iter iter;
        iter : this.VarStackIter;
        this.VarStack.IterSet(iter);

        while (iter.Next())
        {
            var Table varTable;
            varTable : cast Table(iter.Value);

            var Var varVar;
            varVar : cast Var(varTable.Get(name));
            inf (~(varVar = null))
            {
                return varVar;
            }
        }

        iter.Clear();

        return null;
    }
}