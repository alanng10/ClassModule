class Travel : TextAdd
{
    maide prusate Bool ExecuteClass(var Class varClass)
    {
        inf (varClass = null)
        {
            return true;
        }
        this.ExecuteNode(varClass);

        this.ExecuteClassName(varClass.Name);
        this.ExecuteClassName(varClass.Base);
        this.ExecutePart(varClass.Part);
        return true;
    }

    maide prusate Bool ExecutePart(var Part part)
    {
        inf (part = null)
        {
            return true;
        }
        this.ExecuteNode(part);

        var Int count;
        count : part.Value.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Comp item;
            item : cast Comp(part.Value.Get(i));
            this.ExecuteComp(item);

            i : i + 1;
        }
        return true;
    }

    maide prusate Bool ExecuteComp(var Comp comp)
    {
        inf (comp = null)
        {
            return true;
        }

        inf (~(cast Field(comp) = null))
        {
            this.ExecuteField(cast Field(comp));
        }
        inf (~(cast Maide(comp) = null))
        {
            this.ExecuteMaide(cast Maide(comp));
        }
        return true;
    }

    maide prusate Bool ExecuteField(var Field varField)
    {
        inf (varField = null)
        {
            return true;
        }
        this.ExecuteNode(varField);

        this.ExecuteClassName(varField.Class);
        this.ExecuteFieldName(varField.Name);
        this.ExecuteCount(varField.Count);
        this.ExecuteState(varField.Get);
        this.ExecuteState(varField.Set);
        return true;
    }

    maide prusate Bool ExecuteMaide(var Maide varMaide)
    {
        inf (varMaide = null)
        {
            return true;
        }
        this.ExecuteNode(varMaide);

        this.ExecuteClassName(varMaide.Class);
        this.ExecuteMaideName(varMaide.Name);
        this.ExecuteCount(varMaide.Count);
        this.ExecuteParam(varMaide.Param);
        this.ExecuteState(varMaide.Call);
        return true;
    }

    maide prusate Bool ExecuteParam(var Param param)
    {
        inf (param = null)
        {
            return true;
        }
        this.ExecuteNode(param);

        var Int count;
        count : param.Value.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Var item;
            item : cast Var(param.Value.Get(i));
            this.ExecuteVar(item);

            i : i + 1;
        }
        return true;
    }

    maide prusate Bool ExecuteVar(var Var varVar)
    {
        inf (varVar = null)
        {
            return true;
        }
        this.ExecuteNode(varVar);

        this.ExecuteClassName(varVar.Class);
        this.ExecuteVarName(varVar.Name);
        return true;
    }

    maide prusate Bool ExecuteCount(var Count count)
    {
        inf (count = null)
        {
            return true;
        }

        inf (~(cast PrusateCount(count) = null))
        {
            this.ExecutePrusateCount(cast PrusateCount(count));
        }
        inf (~(cast PrecateCount(count) = null))
        {
            this.ExecutePrecateCount(cast PrecateCount(count));
        }
        inf (~(cast PronateCount(count) = null))
        {
            this.ExecutePronateCount(cast PronateCount(count));
        }
        inf (~(cast PrivateCount(count) = null))
        {
            this.ExecutePrivateCount(cast PrivateCount(count));
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
        return true;
    }

    maide prusate Bool ExecutePrecateCount(var PrecateCount precateCount)
    {
        inf (precateCount = null)
        {
            return true;
        }
        this.ExecuteNode(precateCount);
        return true;
    }

    maide prusate Bool ExecutePronateCount(var PronateCount pronateCount)
    {
        inf (pronateCount = null)
        {
            return true;
        }
        this.ExecuteNode(pronateCount);
        return true;
    }

    maide prusate Bool ExecutePrivateCount(var PrivateCount privateCount)
    {
        inf (privateCount = null)
        {
            return true;
        }
        this.ExecuteNode(privateCount);
        return true;
    }

    maide prusate Bool ExecuteState(var State state)
    {
        inf (state = null)
        {
            return true;
        }
        this.ExecuteNode(state);

        var Int count;
        count : state.Value.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Execute item;
            item : cast Execute(state.Value.Get(i));
            this.ExecuteExecute(item);

            i : i + 1;
        }
        return true;
    }

    maide prusate Bool ExecuteExecute(var Execute execute)
    {
        inf (execute = null)
        {
            return true;
        }

        inf (~(cast InfExecute(execute) = null))
        {
            this.ExecuteInfExecute(cast InfExecute(execute));
        }
        inf (~(cast WhileExecute(execute) = null))
        {
            this.ExecuteWhileExecute(cast WhileExecute(execute));
        }
        inf (~(cast ReturnExecute(execute) = null))
        {
            this.ExecuteReturnExecute(cast ReturnExecute(execute));
        }
        inf (~(cast ReferExecute(execute) = null))
        {
            this.ExecuteReferExecute(cast ReferExecute(execute));
        }
        inf (~(cast AreExecute(execute) = null))
        {
            this.ExecuteAreExecute(cast AreExecute(execute));
        }
        inf (~(cast OperateExecute(execute) = null))
        {
            this.ExecuteOperateExecute(cast OperateExecute(execute));
        }
        return true;
    }

    maide prusate Bool ExecuteInfExecute(var InfExecute infExecute)
    {
        inf (infExecute = null)
        {
            return true;
        }
        this.ExecuteNode(infExecute);

        this.ExecuteOperate(infExecute.Cond);
        this.ExecuteState(infExecute.Then);
        return true;
    }

    maide prusate Bool ExecuteWhileExecute(var WhileExecute whileExecute)
    {
        inf (whileExecute = null)
        {
            return true;
        }
        this.ExecuteNode(whileExecute);

        this.ExecuteOperate(whileExecute.Cond);
        this.ExecuteState(whileExecute.Loop);
        return true;
    }

    maide prusate Bool ExecuteReturnExecute(var ReturnExecute returnExecute)
    {
        inf (returnExecute = null)
        {
            return true;
        }
        this.ExecuteNode(returnExecute);

        this.ExecuteOperate(returnExecute.Result);
        return true;
    }

    maide prusate Bool ExecuteReferExecute(var ReferExecute referExecute)
    {
        inf (referExecute = null)
        {
            return true;
        }
        this.ExecuteNode(referExecute);

        this.ExecuteVar(referExecute.Var);
        return true;
    }

    maide prusate Bool ExecuteAreExecute(var AreExecute areExecute)
    {
        inf (areExecute = null)
        {
            return true;
        }
        this.ExecuteNode(areExecute);

        this.ExecuteMark(areExecute.Mark);
        this.ExecuteOperate(areExecute.Value);
        return true;
    }

    maide prusate Bool ExecuteOperateExecute(var OperateExecute operateExecute)
    {
        inf (operateExecute = null)
        {
            return true;
        }
        this.ExecuteNode(operateExecute);

        this.ExecuteOperate(operateExecute.Any);
        return true;
    }

    maide prusate Bool ExecuteArgue(var Argue argue)
    {
        inf (argue = null)
        {
            return true;
        }
        this.ExecuteNode(argue);

        var Int count;
        count : argue.Value.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Operate item;
            item : cast Operate(argue.Value.Get(i));
            this.ExecuteOperate(item);

            i : i + 1;
        }
        return true;
    }

    maide prusate Bool ExecuteMark(var Mark mark)
    {
        inf (mark = null)
        {
            return true;
        }

        inf (~(cast VarMark(mark) = null))
        {
            this.ExecuteVarMark(cast VarMark(mark));
        }
        inf (~(cast SetMark(mark) = null))
        {
            this.ExecuteSetMark(cast SetMark(mark));
        }
        return true;
    }

    maide prusate Bool ExecuteVarMark(var VarMark varMark)
    {
        inf (varMark = null)
        {
            return true;
        }
        this.ExecuteNode(varMark);

        this.ExecuteVarName(varMark.Var);
        return true;
    }

    maide prusate Bool ExecuteSetMark(var SetMark setMark)
    {
        inf (setMark = null)
        {
            return true;
        }
        this.ExecuteNode(setMark);

        this.ExecuteOperate(setMark.This);
        this.ExecuteFieldName(setMark.Field);
        return true;
    }

    maide prusate Bool ExecuteOperate(var Operate operate)
    {
        inf (operate = null)
        {
            return true;
        }

        inf (~(cast GetOperate(operate) = null))
        {
            this.ExecuteGetOperate(cast GetOperate(operate));
        }
        inf (~(cast CallOperate(operate) = null))
        {
            this.ExecuteCallOperate(cast CallOperate(operate));
        }
        inf (~(cast ThisOperate(operate) = null))
        {
            this.ExecuteThisOperate(cast ThisOperate(operate));
        }
        inf (~(cast BaseOperate(operate) = null))
        {
            this.ExecuteBaseOperate(cast BaseOperate(operate));
        }
        inf (~(cast NullOperate(operate) = null))
        {
            this.ExecuteNullOperate(cast NullOperate(operate));
        }
        inf (~(cast NewOperate(operate) = null))
        {
            this.ExecuteNewOperate(cast NewOperate(operate));
        }
        inf (~(cast ShareOperate(operate) = null))
        {
            this.ExecuteShareOperate(cast ShareOperate(operate));
        }
        inf (~(cast CastOperate(operate) = null))
        {
            this.ExecuteCastOperate(cast CastOperate(operate));
        }
        inf (~(cast VarOperate(operate) = null))
        {
            this.ExecuteVarOperate(cast VarOperate(operate));
        }
        inf (~(cast ValueOperate(operate) = null))
        {
            this.ExecuteValueOperate(cast ValueOperate(operate));
        }
        inf (~(cast BraceOperate(operate) = null))
        {
            this.ExecuteBraceOperate(cast BraceOperate(operate));
        }
        inf (~(cast SameOperate(operate) = null))
        {
            this.ExecuteSameOperate(cast SameOperate(operate));
        }
        inf (~(cast AndOperate(operate) = null))
        {
            this.ExecuteAndOperate(cast AndOperate(operate));
        }
        inf (~(cast OrnOperate(operate) = null))
        {
            this.ExecuteOrnOperate(cast OrnOperate(operate));
        }
        inf (~(cast NotOperate(operate) = null))
        {
            this.ExecuteNotOperate(cast NotOperate(operate));
        }
        inf (~(cast LessOperate(operate) = null))
        {
            this.ExecuteLessOperate(cast LessOperate(operate));
        }
        inf (~(cast AddOperate(operate) = null))
        {
            this.ExecuteAddOperate(cast AddOperate(operate));
        }
        inf (~(cast SubOperate(operate) = null))
        {
            this.ExecuteSubOperate(cast SubOperate(operate));
        }
        inf (~(cast MulOperate(operate) = null))
        {
            this.ExecuteMulOperate(cast MulOperate(operate));
        }
        inf (~(cast DivOperate(operate) = null))
        {
            this.ExecuteDivOperate(cast DivOperate(operate));
        }
        inf (~(cast SignMulOperate(operate) = null))
        {
            this.ExecuteSignMulOperate(cast SignMulOperate(operate));
        }
        inf (~(cast SignDivOperate(operate) = null))
        {
            this.ExecuteSignDivOperate(cast SignDivOperate(operate));
        }
        inf (~(cast SignLessOperate(operate) = null))
        {
            this.ExecuteSignLessOperate(cast SignLessOperate(operate));
        }
        inf (~(cast BitAndOperate(operate) = null))
        {
            this.ExecuteBitAndOperate(cast BitAndOperate(operate));
        }
        inf (~(cast BitOrnOperate(operate) = null))
        {
            this.ExecuteBitOrnOperate(cast BitOrnOperate(operate));
        }
        inf (~(cast BitNotOperate(operate) = null))
        {
            this.ExecuteBitNotOperate(cast BitNotOperate(operate));
        }
        inf (~(cast BitLiteOperate(operate) = null))
        {
            this.ExecuteBitLiteOperate(cast BitLiteOperate(operate));
        }
        inf (~(cast BitRiteOperate(operate) = null))
        {
            this.ExecuteBitRiteOperate(cast BitRiteOperate(operate));
        }
        inf (~(cast BitSignRiteOperate(operate) = null))
        {
            this.ExecuteBitSignRiteOperate(cast BitSignRiteOperate(operate));
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

        this.ExecuteOperate(getOperate.This);
        this.ExecuteFieldName(getOperate.Field);
        return true;
    }

    maide prusate Bool ExecuteCallOperate(var CallOperate callOperate)
    {
        inf (callOperate = null)
        {
            return true;
        }
        this.ExecuteNode(callOperate);

        this.ExecuteOperate(callOperate.This);
        this.ExecuteMaideName(callOperate.Maide);
        this.ExecuteArgue(callOperate.Argue);
        return true;
    }

    maide prusate Bool ExecuteThisOperate(var ThisOperate thisOperate)
    {
        inf (thisOperate = null)
        {
            return true;
        }
        this.ExecuteNode(thisOperate);
        return true;
    }

    maide prusate Bool ExecuteBaseOperate(var BaseOperate baseOperate)
    {
        inf (baseOperate = null)
        {
            return true;
        }
        this.ExecuteNode(baseOperate);
        return true;
    }

    maide prusate Bool ExecuteNullOperate(var NullOperate nullOperate)
    {
        inf (nullOperate = null)
        {
            return true;
        }
        this.ExecuteNode(nullOperate);
        return true;
    }

    maide prusate Bool ExecuteNewOperate(var NewOperate newOperate)
    {
        inf (newOperate = null)
        {
            return true;
        }
        this.ExecuteNode(newOperate);

        this.ExecuteClassName(newOperate.Class);
        return true;
    }

    maide prusate Bool ExecuteShareOperate(var ShareOperate shareOperate)
    {
        inf (shareOperate = null)
        {
            return true;
        }
        this.ExecuteNode(shareOperate);

        this.ExecuteClassName(shareOperate.Class);
        return true;
    }

    maide prusate Bool ExecuteCastOperate(var CastOperate castOperate)
    {
        inf (castOperate = null)
        {
            return true;
        }
        this.ExecuteNode(castOperate);

        this.ExecuteClassName(castOperate.Class);
        this.ExecuteOperate(castOperate.Any);
        return true;
    }

    maide prusate Bool ExecuteVarOperate(var VarOperate varOperate)
    {
        inf (varOperate = null)
        {
            return true;
        }
        this.ExecuteNode(varOperate);

        this.ExecuteVarName(varOperate.Var);
        return true;
    }

    maide prusate Bool ExecuteValueOperate(var ValueOperate valueOperate)
    {
        inf (valueOperate = null)
        {
            return true;
        }
        this.ExecuteNode(valueOperate);

        this.ExecuteValue(valueOperate.Value);
        return true;
    }

    maide prusate Bool ExecuteBraceOperate(var BraceOperate braceOperate)
    {
        inf (braceOperate = null)
        {
            return true;
        }
        this.ExecuteNode(braceOperate);

        this.ExecuteOperate(braceOperate.Any);
        return true;
    }

    maide prusate Bool ExecuteValue(var Value value)
    {
        inf (value = null)
        {
            return true;
        }

        inf (~(cast BoolValue(value) = null))
        {
            this.ExecuteBoolValue(cast BoolValue(value));
        }
        inf (~(cast IntValue(value) = null))
        {
            this.ExecuteIntValue(cast IntValue(value));
        }
        inf (~(cast IntSignValue(value) = null))
        {
            this.ExecuteIntSignValue(cast IntSignValue(value));
        }
        inf (~(cast IntHexValue(value) = null))
        {
            this.ExecuteIntHexValue(cast IntHexValue(value));
        }
        inf (~(cast IntHexSignValue(value) = null))
        {
            this.ExecuteIntHexSignValue(cast IntHexSignValue(value));
        }
        inf (~(cast StringValue(value) = null))
        {
            this.ExecuteStringValue(cast StringValue(value));
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
        return true;
    }

    maide prusate Bool ExecuteIntValue(var IntValue intValue)
    {
        inf (intValue = null)
        {
            return true;
        }
        this.ExecuteNode(intValue);
        return true;
    }

    maide prusate Bool ExecuteIntSignValue(var IntSignValue intSignValue)
    {
        inf (intSignValue = null)
        {
            return true;
        }
        this.ExecuteNode(intSignValue);
        return true;
    }

    maide prusate Bool ExecuteIntHexValue(var IntHexValue intHexValue)
    {
        inf (intHexValue = null)
        {
            return true;
        }
        this.ExecuteNode(intHexValue);
        return true;
    }

    maide prusate Bool ExecuteIntHexSignValue(var IntHexSignValue intHexSignValue)
    {
        inf (intHexSignValue = null)
        {
            return true;
        }
        this.ExecuteNode(intHexSignValue);
        return true;
    }

    maide prusate Bool ExecuteStringValue(var StringValue stringValue)
    {
        inf (stringValue = null)
        {
            return true;
        }
        this.ExecuteNode(stringValue);
        return true;
    }

    maide prusate Bool ExecuteClassName(var ClassName className)
    {
        inf (className = null)
        {
            return true;
        }
        this.ExecuteNode(className);
        return true;
    }

    maide prusate Bool ExecuteFieldName(var FieldName fieldName)
    {
        inf (fieldName = null)
        {
            return true;
        }
        this.ExecuteNode(fieldName);
        return true;
    }

    maide prusate Bool ExecuteMaideName(var MaideName maideName)
    {
        inf (maideName = null)
        {
            return true;
        }
        this.ExecuteNode(maideName);
        return true;
    }

    maide prusate Bool ExecuteVarName(var VarName varName)
    {
        inf (varName = null)
        {
            return true;
        }
        this.ExecuteNode(varName);
        return true;
    }

    maide prusate Bool ExecuteSameOperate(var SameOperate sameOperate)
    {
        inf (sameOperate = null)
        {
            return true;
        }
        this.ExecuteNode(sameOperate);

        this.ExecuteOperate(sameOperate.Lite);
        this.ExecuteOperate(sameOperate.Rite);
        return true;
    }

    maide prusate Bool ExecuteAndOperate(var AndOperate andOperate)
    {
        inf (andOperate = null)
        {
            return true;
        }
        this.ExecuteNode(andOperate);

        this.ExecuteOperate(andOperate.Lite);
        this.ExecuteOperate(andOperate.Rite);
        return true;
    }

    maide prusate Bool ExecuteOrnOperate(var OrnOperate ornOperate)
    {
        inf (ornOperate = null)
        {
            return true;
        }
        this.ExecuteNode(ornOperate);

        this.ExecuteOperate(ornOperate.Lite);
        this.ExecuteOperate(ornOperate.Rite);
        return true;
    }

    maide prusate Bool ExecuteNotOperate(var NotOperate notOperate)
    {
        inf (notOperate = null)
        {
            return true;
        }
        this.ExecuteNode(notOperate);

        this.ExecuteOperate(notOperate.Value);
        return true;
    }

    maide prusate Bool ExecuteLessOperate(var LessOperate lessOperate)
    {
        inf (lessOperate = null)
        {
            return true;
        }
        this.ExecuteNode(lessOperate);

        this.ExecuteOperate(lessOperate.Lite);
        this.ExecuteOperate(lessOperate.Rite);
        return true;
    }

    maide prusate Bool ExecuteAddOperate(var AddOperate addOperate)
    {
        inf (addOperate = null)
        {
            return true;
        }
        this.ExecuteNode(addOperate);

        this.ExecuteOperate(addOperate.Lite);
        this.ExecuteOperate(addOperate.Rite);
        return true;
    }

    maide prusate Bool ExecuteSubOperate(var SubOperate subOperate)
    {
        inf (subOperate = null)
        {
            return true;
        }
        this.ExecuteNode(subOperate);

        this.ExecuteOperate(subOperate.Lite);
        this.ExecuteOperate(subOperate.Rite);
        return true;
    }

    maide prusate Bool ExecuteMulOperate(var MulOperate mulOperate)
    {
        inf (mulOperate = null)
        {
            return true;
        }
        this.ExecuteNode(mulOperate);

        this.ExecuteOperate(mulOperate.Lite);
        this.ExecuteOperate(mulOperate.Rite);
        return true;
    }

    maide prusate Bool ExecuteDivOperate(var DivOperate divOperate)
    {
        inf (divOperate = null)
        {
            return true;
        }
        this.ExecuteNode(divOperate);

        this.ExecuteOperate(divOperate.Lite);
        this.ExecuteOperate(divOperate.Rite);
        return true;
    }

    maide prusate Bool ExecuteSignMulOperate(var SignMulOperate signMulOperate)
    {
        inf (signMulOperate = null)
        {
            return true;
        }
        this.ExecuteNode(signMulOperate);

        this.ExecuteOperate(signMulOperate.Lite);
        this.ExecuteOperate(signMulOperate.Rite);
        return true;
    }

    maide prusate Bool ExecuteSignDivOperate(var SignDivOperate signDivOperate)
    {
        inf (signDivOperate = null)
        {
            return true;
        }
        this.ExecuteNode(signDivOperate);

        this.ExecuteOperate(signDivOperate.Lite);
        this.ExecuteOperate(signDivOperate.Rite);
        return true;
    }

    maide prusate Bool ExecuteSignLessOperate(var SignLessOperate signLessOperate)
    {
        inf (signLessOperate = null)
        {
            return true;
        }
        this.ExecuteNode(signLessOperate);

        this.ExecuteOperate(signLessOperate.Lite);
        this.ExecuteOperate(signLessOperate.Rite);
        return true;
    }

    maide prusate Bool ExecuteBitAndOperate(var BitAndOperate bitAndOperate)
    {
        inf (bitAndOperate = null)
        {
            return true;
        }
        this.ExecuteNode(bitAndOperate);

        this.ExecuteOperate(bitAndOperate.Lite);
        this.ExecuteOperate(bitAndOperate.Rite);
        return true;
    }

    maide prusate Bool ExecuteBitOrnOperate(var BitOrnOperate bitOrnOperate)
    {
        inf (bitOrnOperate = null)
        {
            return true;
        }
        this.ExecuteNode(bitOrnOperate);

        this.ExecuteOperate(bitOrnOperate.Lite);
        this.ExecuteOperate(bitOrnOperate.Rite);
        return true;
    }

    maide prusate Bool ExecuteBitNotOperate(var BitNotOperate bitNotOperate)
    {
        inf (bitNotOperate = null)
        {
            return true;
        }
        this.ExecuteNode(bitNotOperate);

        this.ExecuteOperate(bitNotOperate.Value);
        return true;
    }

    maide prusate Bool ExecuteBitLiteOperate(var BitLiteOperate bitLiteOperate)
    {
        inf (bitLiteOperate = null)
        {
            return true;
        }
        this.ExecuteNode(bitLiteOperate);

        this.ExecuteOperate(bitLiteOperate.Value);
        this.ExecuteOperate(bitLiteOperate.Count);
        return true;
    }

    maide prusate Bool ExecuteBitRiteOperate(var BitRiteOperate bitRiteOperate)
    {
        inf (bitRiteOperate = null)
        {
            return true;
        }
        this.ExecuteNode(bitRiteOperate);

        this.ExecuteOperate(bitRiteOperate.Value);
        this.ExecuteOperate(bitRiteOperate.Count);
        return true;
    }

    maide prusate Bool ExecuteBitSignRiteOperate(var BitSignRiteOperate bitSignRiteOperate)
    {
        inf (bitSignRiteOperate = null)
        {
            return true;
        }
        this.ExecuteNode(bitSignRiteOperate);

        this.ExecuteOperate(bitSignRiteOperate.Value);
        this.ExecuteOperate(bitSignRiteOperate.Count);
        return true;
    }

    maide precate Bool ExecuteNode(var Node node)
    {
        return true;
    }
}