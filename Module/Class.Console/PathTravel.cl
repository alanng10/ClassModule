class PathTravel : Travel
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        this.ClassInfra : share ClassInfra;

        this.TextBraceRightLite : "[";
        this.TextBraceRightRite : "]";
        return true;
    }

    field prusate Node Result { get { return data; } set { data : value; } }
    field prusate Text Path { get { return data; } set { data : value; } }
    field prusate Int ThisIndex { get { return data; } set { data : value; } }
    field precate InfraInfra InfraInfra { get { return data; } set { data : value; } }
    field precate ClassInfra ClassInfra { get { return data; } set { data : value; } }
    field precate InfraRange Field { get { return data; } set { data : value; } }
    field precate InfraRange FieldName { get { return data; } set { data : value; } }
    field precate Int FieldIndex { get { return data; } set { data : value; } }
    field precate String TextBraceRightLite { get { return data; } set { data : value; } }
    field precate String TextBraceRightRite { get { return data; } set { data : value; } }

    maide precate Bool ExecuteNode(var Node node)
    {
        inf (~(this.ThisIndex < this.Path.Range.Count))
        {
            this.Result : node;
            return true;
        }

        this.FieldSet();

        this.FieldNameIndexSet();

        this.ThisIndex : this.ThisIndex + this.Field.Count + this.StringCount(this.ClassInfra.TextDot);
        return true;
    }

    maide precate Bool FieldSet()
    {
        var Int start;
        start : this.ThisIndex;

        var Int end;

        var InfraRange range;
        range : this.Path.Range;

        var Int ka;
        var Int kb;
        ka : range.Index;
        kb : range.Count;

        range.Index : ka + start;
        range.Count : kb - start;

        var Int kaa;
        kaa : this.TextIndex(this.Path, this.TA(this.ClassInfra.TextDot));

        var Bool b;
        b : (kaa = null);
        inf (b)
        {
            end : kb;
        }
        inf (~b)
        {
            end : start + kaa;
        }

        var Int count;
        count : this.ClassInfra.Count(start, end);

        range.Index : ka;
        range.Count : kb;

        var InfraRange a;
        a : this.Field;
        a.Index : start;
        a.Count : count;
        return true;
    }

    maide precate Bool FieldNameIndexSet()
    {
        this.TextA.Data : this.Path.Data;
        this.TextA.Range.Index : this.Path.Range.Index + this.Field.Index;
        this.TextA.Range.Count : this.Field.Count;

        var Int ka;
        ka : this.BraceRightLiteIndex(this.TextA);

        var Bool b;
        b : (ka = null);

        inf (~b)
        {
            var Int braceRightLite;
            braceRightLite : ka;

            this.FieldIndex : this.FieldIndexGet(this.Field, braceRightLite);

            this.FieldName.Index : this.Field.Index;
            this.FieldName.Count : braceRightLite;
        }

        inf (b)
        {
            this.FieldIndex : null;

            this.FieldName.Index : this.Field.Index;
            this.FieldName.Count : this.Field.Count;
        }
        return true;
    }

    maide precate Int BraceRightLiteIndex(var Text text)
    {
        var Int a;
        a : this.TextIndex(text, this.TB(this.TextBraceRightLite));
        return a;
    }

    maide precate Int FieldIndexGet(var InfraRange varField, var Int braceRightLite)
    {
        inf (varField.Count < 1)
        {
            return null;
        }

        this.TextA.Data : this.Path.Data;

        this.TextA.Range.Index : this.Path.Range.Index + varField.Index;
        this.TextA.Range.Count : varField.Count;

        var Bool b;
        b : this.TextEnd(this.TextA, this.TB(this.TextBraceRightRite));

        inf (~b)
        {
            return null;
        }

        var Int start;
        start : braceRightLite + this.StringCount(this.TextBraceRightLite);

        var Int end;
        end : varField.Count - this.StringCount(this.TextBraceRightRite);

        var Int count;
        count : this.ClassInfra.Count(start, end);

        this.TextA.Range.Index : this.TextA.Range.Index + start;
        this.TextA.Range.Count : count;

        var Int n;
        n : this.IntParse.Execute(this.TextA, 10, null);

        inf (n = null)
        {
            return null;
        }

        var Int a;
        a : n;
        return a;
    }

    maide precate Bool HasResult()
    {
        return ~(this.Result = null);
    }

    maide precate Bool FieldEqual(var String name)
    {
        this.TextA.Data : this.Path.Data;

        this.TextA.Range.Index : this.Path.Range.Index + this.FieldName.Index;
        this.TextA.Range.Count : this.FieldName.Count;

        var Bool a;
        a : this.TextSame(this.TextA, this.TB(name));
        return a;
    }

    maide prusate Bool ExecuteClass(var NodeClass varClass)
    {
        inf (varClass = null)
        {
            return true;
        }
        this.ExecuteNode(varClass);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Name"))
        {
            this.ExecuteClassName(varClass.Name);
            return true;
        }
        inf (this.FieldEqual("Base"))
        {
            this.ExecuteClassName(varClass.Base);
            return true;
        }
        inf (this.FieldEqual("Part"))
        {
            this.ExecutePart(varClass.Part);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecutePart(var Part part)
    {
        inf (part = null)
        {
            return true;
        }

        inf (~this.InfraInfra.ValidIndex(part.Value.Count, this.FieldIndex))
        {
            return true;
        }

        var Comp item;
        item : cast Comp(part.Value.Get(this.FieldIndex));
        this.ExecuteComp(item);
        return true;
    }

    maide prusate Bool ExecuteField(var NodeField varField)
    {
        inf (varField = null)
        {
            return true;
        }
        this.ExecuteNode(varField);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Class"))
        {
            this.ExecuteClassName(varField.Class);
            return true;
        }
        inf (this.FieldEqual("Name"))
        {
            this.ExecuteFieldName(varField.Name);
            return true;
        }
        inf (this.FieldEqual("Count"))
        {
            this.ExecuteCount(varField.Count);
            return true;
        }
        inf (this.FieldEqual("Get"))
        {
            this.ExecuteState(varField.Get);
            return true;
        }
        inf (this.FieldEqual("Set"))
        {
            this.ExecuteState(varField.Set);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteMaide(var NodeMaide varMaide)
    {
        inf (varMaide = null)
        {
            return true;
        }
        this.ExecuteNode(varMaide);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Class"))
        {
            this.ExecuteClassName(varMaide.Class);
            return true;
        }
        inf (this.FieldEqual("Name"))
        {
            this.ExecuteMaideName(varMaide.Name);
            return true;
        }
        inf (this.FieldEqual("Count"))
        {
            this.ExecuteCount(varMaide.Count);
            return true;
        }
        inf (this.FieldEqual("Param"))
        {
            this.ExecuteParam(varMaide.Param);
            return true;
        }
        inf (this.FieldEqual("Call"))
        {
            this.ExecuteState(varMaide.Call);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteParam(var Param param)
    {
        inf (param = null)
        {
            return true;
        }

        inf (~this.InfraInfra.ValidIndex(param.Value.Count, this.FieldIndex))
        {
            return true;
        }

        var NodeVar item;
        item : cast NodeVar(param.Value.Get(this.FieldIndex));
        this.ExecuteVar(item);
        return true;
    }

    maide prusate Bool ExecuteVar(var NodeVar varVar)
    {
        inf (varVar = null)
        {
            return true;
        }
        this.ExecuteNode(varVar);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Class"))
        {
            this.ExecuteClassName(varVar.Class);
            return true;
        }
        inf (this.FieldEqual("Name"))
        {
            this.ExecuteVarName(varVar.Name);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecutePrusateCount(var PrusateCount prusateCount)
    {
        inf (prusateCount = null)
        {
            return true;
        }
        this.ExecuteNode(prusateCount);

        inf (this.HasResult())
        {
            return true;
        }
        return true;
    }

    maide prusate Bool ExecutePrecateCount(var PrecateCount precateCount)
    {
        inf (precateCount = null)
        {
            return true;
        }
        this.ExecuteNode(precateCount);

        inf (this.HasResult())
        {
            return true;
        }
        return true;
    }

    maide prusate Bool ExecutePronateCount(var PronateCount pronateCount)
    {
        inf (pronateCount = null)
        {
            return true;
        }
        this.ExecuteNode(pronateCount);

        inf (this.HasResult())
        {
            return true;
        }
        return true;
    }

    maide prusate Bool ExecutePrivateCount(var PrivateCount privateCount)
    {
        inf (privateCount = null)
        {
            return true;
        }
        this.ExecuteNode(privateCount);

        inf (this.HasResult())
        {
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteState(var State state)
    {
        inf (state = null)
        {
            return true;
        }

        inf (~this.InfraInfra.ValidIndex(state.Value.Count, this.FieldIndex))
        {
            return true;
        }

        var Execute item;
        item : cast Execute(state.Value.Get(this.FieldIndex));
        this.ExecuteExecute(item);
        return true;
    }

    maide prusate Bool ExecuteInfExecute(var InfExecute infExecute)
    {
        inf (infExecute = null)
        {
            return true;
        }
        this.ExecuteNode(infExecute);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Cond"))
        {
            this.ExecuteOperate(infExecute.Cond);
            return true;
        }
        inf (this.FieldEqual("Then"))
        {
            this.ExecuteState(infExecute.Then);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteWhileExecute(var WhileExecute whileExecute)
    {
        inf (whileExecute = null)
        {
            return true;
        }
        this.ExecuteNode(whileExecute);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Cond"))
        {
            this.ExecuteOperate(whileExecute.Cond);
            return true;
        }
        inf (this.FieldEqual("Loop"))
        {
            this.ExecuteState(whileExecute.Loop);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteReturnExecute(var ReturnExecute returnExecute)
    {
        inf (returnExecute = null)
        {
            return true;
        }
        this.ExecuteNode(returnExecute);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Result"))
        {
            this.ExecuteOperate(returnExecute.Result);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteReferExecute(var ReferExecute referExecute)
    {
        inf (referExecute = null)
        {
            return true;
        }
        this.ExecuteNode(referExecute);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Var"))
        {
            this.ExecuteVar(referExecute.Var);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteAreExecute(var AreExecute areExecute)
    {
        inf (areExecute = null)
        {
            return true;
        }
        this.ExecuteNode(areExecute);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Mark"))
        {
            this.ExecuteMark(areExecute.Mark);
            return true;
        }
        inf (this.FieldEqual("Value"))
        {
            this.ExecuteOperate(areExecute.Value);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteOperateExecute(var OperateExecute operateExecute)
    {
        inf (operateExecute = null)
        {
            return true;
        }
        this.ExecuteNode(operateExecute);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Any"))
        {
            this.ExecuteOperate(operateExecute.Any);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteArgue(var Argue argue)
    {
        inf (argue = null)
        {
            return true;
        }

        inf (~this.InfraInfra.ValidIndex(argue.Value.Count, this.FieldIndex))
        {
            return true;
        }

        var Operate item;
        item : cast Operate(argue.Value.Get(this.FieldIndex));
        this.ExecuteOperate(item);
        return true;
    }

    maide prusate Bool ExecuteVarMark(var VarMark varMark)
    {
        inf (varMark = null)
        {
            return true;
        }
        this.ExecuteNode(varMark);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Var"))
        {
            this.ExecuteVarName(varMark.Var);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteSetMark(var SetMark setMark)
    {
        inf (setMark = null)
        {
            return true;
        }
        this.ExecuteNode(setMark);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("This"))
        {
            this.ExecuteOperate(setMark.This);
            return true;
        }
        inf (this.FieldEqual("Field"))
        {
            this.ExecuteFieldName(setMark.Field);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteGetOperate(var GetOperate getOperate)
    {
        inf (getOperate = null)
        {
            return true;
        }
        this.ExecuteNode(getOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("This"))
        {
            this.ExecuteOperate(getOperate.This);
            return true;
        }
        inf (this.FieldEqual("Field"))
        {
            this.ExecuteFieldName(getOperate.Field);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteCallOperate(var CallOperate callOperate)
    {
        inf (callOperate = null)
        {
            return true;
        }
        this.ExecuteNode(callOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("This"))
        {
            this.ExecuteOperate(callOperate.This);
            return true;
        }
        inf (this.FieldEqual("Maide"))
        {
            this.ExecuteMaideName(callOperate.Maide);
            return true;
        }
        inf (this.FieldEqual("Argue"))
        {
            this.ExecuteArgue(callOperate.Argue);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteThisOperate(var ThisOperate thisOperate)
    {
        inf (thisOperate = null)
        {
            return true;
        }
        this.ExecuteNode(thisOperate);

        inf (this.HasResult())
        {
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteBaseOperate(var BaseOperate baseOperate)
    {
        inf (baseOperate = null)
        {
            return true;
        }
        this.ExecuteNode(baseOperate);

        inf (this.HasResult())
        {
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteNullOperate(var NullOperate nullOperate)
    {
        inf (nullOperate = null)
        {
            return true;
        }
        this.ExecuteNode(nullOperate);

        inf (this.HasResult())
        {
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteNewOperate(var NewOperate newOperate)
    {
        inf (newOperate = null)
        {
            return true;
        }
        this.ExecuteNode(newOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Class"))
        {
            this.ExecuteClassName(newOperate.Class);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteShareOperate(var ShareOperate shareOperate)
    {
        inf (shareOperate = null)
        {
            return true;
        }
        this.ExecuteNode(shareOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Class"))
        {
            this.ExecuteClassName(shareOperate.Class);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteCastOperate(var CastOperate castOperate)
    {
        inf (castOperate = null)
        {
            return true;
        }
        this.ExecuteNode(castOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Class"))
        {
            this.ExecuteClassName(castOperate.Class);
            return true;
        }
        inf (this.FieldEqual("Any"))
        {
            this.ExecuteOperate(castOperate.Any);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteVarOperate(var VarOperate varOperate)
    {
        inf (varOperate = null)
        {
            return true;
        }
        this.ExecuteNode(varOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Var"))
        {
            this.ExecuteVarName(varOperate.Var);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteValueOperate(var ValueOperate valueOperate)
    {
        inf (valueOperate = null)
        {
            return true;
        }
        this.ExecuteNode(valueOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Value"))
        {
            this.ExecuteValue(valueOperate.Value);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteBraceOperate(var BraceOperate braceOperate)
    {
        inf (braceOperate = null)
        {
            return true;
        }
        this.ExecuteNode(braceOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Any"))
        {
            this.ExecuteOperate(braceOperate.Any);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteBoolValue(var BoolValue boolValue)
    {
        inf (boolValue = null)
        {
            return true;
        }
        this.ExecuteNode(boolValue);

        inf (this.HasResult())
        {
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteIntValue(var IntValue intValue)
    {
        inf (intValue = null)
        {
            return true;
        }
        this.ExecuteNode(intValue);

        inf (this.HasResult())
        {
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteIntSignValue(var IntSignValue intSignValue)
    {
        inf (intSignValue = null)
        {
            return true;
        }
        this.ExecuteNode(intSignValue);

        inf (this.HasResult())
        {
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteIntHexValue(var IntHexValue intHexValue)
    {
        inf (intHexValue = null)
        {
            return true;
        }
        this.ExecuteNode(intHexValue);

        inf (this.HasResult())
        {
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteIntHexSignValue(var IntHexSignValue intHexSignValue)
    {
        inf (intHexSignValue = null)
        {
            return true;
        }
        this.ExecuteNode(intHexSignValue);

        inf (this.HasResult())
        {
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteStringValue(var StringValue stringValue)
    {
        inf (stringValue = null)
        {
            return true;
        }
        this.ExecuteNode(stringValue);

        inf (this.HasResult())
        {
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteClassName(var ClassName className)
    {
        inf (className = null)
        {
            return true;
        }
        this.ExecuteNode(className);

        inf (this.HasResult())
        {
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteFieldName(var FieldName fieldName)
    {
        inf (fieldName = null)
        {
            return true;
        }
        this.ExecuteNode(fieldName);

        inf (this.HasResult())
        {
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteMaideName(var MaideName maideName)
    {
        inf (maideName = null)
        {
            return true;
        }
        this.ExecuteNode(maideName);

        inf (this.HasResult())
        {
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteVarName(var VarName varName)
    {
        inf (varName = null)
        {
            return true;
        }
        this.ExecuteNode(varName);

        inf (this.HasResult())
        {
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteSameOperate(var SameOperate sameOperate)
    {
        inf (sameOperate = null)
        {
            return true;
        }
        this.ExecuteNode(sameOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Lite"))
        {
            this.ExecuteOperate(sameOperate.Lite);
            return true;
        }
        inf (this.FieldEqual("Rite"))
        {
            this.ExecuteOperate(sameOperate.Rite);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteAndOperate(var AndOperate andOperate)
    {
        inf (andOperate = null)
        {
            return true;
        }
        this.ExecuteNode(andOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Lite"))
        {
            this.ExecuteOperate(andOperate.Lite);
            return true;
        }
        inf (this.FieldEqual("Rite"))
        {
            this.ExecuteOperate(andOperate.Rite);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteOrnOperate(var OrnOperate ornOperate)
    {
        inf (ornOperate = null)
        {
            return true;
        }
        this.ExecuteNode(ornOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Lite"))
        {
            this.ExecuteOperate(ornOperate.Lite);
            return true;
        }
        inf (this.FieldEqual("Rite"))
        {
            this.ExecuteOperate(ornOperate.Rite);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteNotOperate(var NotOperate notOperate)
    {
        inf (notOperate = null)
        {
            return true;
        }
        this.ExecuteNode(notOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Value"))
        {
            this.ExecuteOperate(notOperate.Value);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteLessOperate(var LessOperate lessOperate)
    {
        inf (lessOperate = null)
        {
            return true;
        }
        this.ExecuteNode(lessOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Lite"))
        {
            this.ExecuteOperate(lessOperate.Lite);
            return true;
        }
        inf (this.FieldEqual("Rite"))
        {
            this.ExecuteOperate(lessOperate.Rite);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteAddOperate(var AddOperate addOperate)
    {
        inf (addOperate = null)
        {
            return true;
        }
        this.ExecuteNode(addOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Lite"))
        {
            this.ExecuteOperate(addOperate.Lite);
            return true;
        }
        inf (this.FieldEqual("Rite"))
        {
            this.ExecuteOperate(addOperate.Rite);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteSubOperate(var SubOperate subOperate)
    {
        inf (subOperate = null)
        {
            return true;
        }
        this.ExecuteNode(subOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Lite"))
        {
            this.ExecuteOperate(subOperate.Lite);
            return true;
        }
        inf (this.FieldEqual("Rite"))
        {
            this.ExecuteOperate(subOperate.Rite);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteMulOperate(var MulOperate mulOperate)
    {
        inf (mulOperate = null)
        {
            return true;
        }
        this.ExecuteNode(mulOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Lite"))
        {
            this.ExecuteOperate(mulOperate.Lite);
            return true;
        }
        inf (this.FieldEqual("Rite"))
        {
            this.ExecuteOperate(mulOperate.Rite);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteDivOperate(var DivOperate divOperate)
    {
        inf (divOperate = null)
        {
            return true;
        }
        this.ExecuteNode(divOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Lite"))
        {
            this.ExecuteOperate(divOperate.Lite);
            return true;
        }
        inf (this.FieldEqual("Rite"))
        {
            this.ExecuteOperate(divOperate.Rite);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteSignMulOperate(var SignMulOperate signMulOperate)
    {
        inf (signMulOperate = null)
        {
            return true;
        }
        this.ExecuteNode(signMulOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Lite"))
        {
            this.ExecuteOperate(signMulOperate.Lite);
            return true;
        }
        inf (this.FieldEqual("Rite"))
        {
            this.ExecuteOperate(signMulOperate.Rite);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteSignDivOperate(var SignDivOperate signDivOperate)
    {
        inf (signDivOperate = null)
        {
            return true;
        }
        this.ExecuteNode(signDivOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Lite"))
        {
            this.ExecuteOperate(signDivOperate.Lite);
            return true;
        }
        inf (this.FieldEqual("Rite"))
        {
            this.ExecuteOperate(signDivOperate.Rite);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteSignLessOperate(var SignLessOperate signLessOperate)
    {
        inf (signLessOperate = null)
        {
            return true;
        }
        this.ExecuteNode(signLessOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Lite"))
        {
            this.ExecuteOperate(signLessOperate.Lite);
            return true;
        }
        inf (this.FieldEqual("Rite"))
        {
            this.ExecuteOperate(signLessOperate.Rite);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteBitAndOperate(var BitAndOperate bitAndOperate)
    {
        inf (bitAndOperate = null)
        {
            return true;
        }
        this.ExecuteNode(bitAndOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Lite"))
        {
            this.ExecuteOperate(bitAndOperate.Lite);
            return true;
        }
        inf (this.FieldEqual("Rite"))
        {
            this.ExecuteOperate(bitAndOperate.Rite);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteBitOrnOperate(var BitOrnOperate bitOrnOperate)
    {
        inf (bitOrnOperate = null)
        {
            return true;
        }
        this.ExecuteNode(bitOrnOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Lite"))
        {
            this.ExecuteOperate(bitOrnOperate.Lite);
            return true;
        }
        inf (this.FieldEqual("Rite"))
        {
            this.ExecuteOperate(bitOrnOperate.Rite);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteBitNotOperate(var BitNotOperate bitNotOperate)
    {
        inf (bitNotOperate = null)
        {
            return true;
        }
        this.ExecuteNode(bitNotOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Value"))
        {
            this.ExecuteOperate(bitNotOperate.Value);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteBitLiteOperate(var BitLiteOperate bitLiteOperate)
    {
        inf (bitLiteOperate = null)
        {
            return true;
        }
        this.ExecuteNode(bitLiteOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Value"))
        {
            this.ExecuteOperate(bitLiteOperate.Value);
            return true;
        }
        inf (this.FieldEqual("Count"))
        {
            this.ExecuteOperate(bitLiteOperate.Count);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteBitRiteOperate(var BitRiteOperate bitRiteOperate)
    {
        inf (bitRiteOperate = null)
        {
            return true;
        }
        this.ExecuteNode(bitRiteOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Value"))
        {
            this.ExecuteOperate(bitRiteOperate.Value);
            return true;
        }
        inf (this.FieldEqual("Count"))
        {
            this.ExecuteOperate(bitRiteOperate.Count);
            return true;
        }
        return true;
    }

    maide prusate Bool ExecuteBitSignRiteOperate(var BitSignRiteOperate bitSignRiteOperate)
    {
        inf (bitSignRiteOperate = null)
        {
            return true;
        }
        this.ExecuteNode(bitSignRiteOperate);

        inf (this.HasResult())
        {
            return true;
        }

        inf (this.FieldEqual("Value"))
        {
            this.ExecuteOperate(bitSignRiteOperate.Value);
            return true;
        }
        inf (this.FieldEqual("Count"))
        {
            this.ExecuteOperate(bitSignRiteOperate.Count);
            return true;
        }
        return true;
    }

}