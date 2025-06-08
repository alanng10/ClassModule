class InfoTravel : Travel
{
    field precate Int Space { get { return data; } set { data : value; } }

    maide precate Bool Start(var String name)
    {
        this.Add(name).AddLine();
        this.AddSpace().Add("{").AddLine();

        this.Space : this.Space + 4;
        return true;
    }

    maide precate Bool End()
    {
        this.Space : this.Space - 4;

        this.AddSpace().Add("}").Add(",").AddLine();
        return true;
    }

    maide precate Bool StartArray()
    {
        this.AddSpace().Add("[").AddLine();

        this.Space : this.Space + 4;
        return true;
    }

    maide precate Bool EndArray()
    {
        this.Space : this.Space - 4;

        this.AddSpace().Add("]").Add(",").AddLine();
        return true;
    }

    maide precate Bool Field(var String name)
    {
        this.AddSpace().Add(name).Add(" : ");
        this.Space : this.Space + this.StringCount(name) + 3;
        return true;
    }

    maide precate Bool AddBoolValue(var Bool value)
    {
        this.AddStringBool(value).Add(",").AddLine();
        return true;
    }

    maide precate Bool AddIntValue(var Int value)
    {
        this.Add("0h").AddStringIntHex(value).Add(",").AddLine();
        return true;
    }

    maide precate Bool AddStringValue(var String value)
    {
        this.Add("\"");

        var Int count;
        count : this.StringCount(value);

        var Int i;
        i : 0;
        while (i < count)
        {
            var Int n;
            n : this.StringComp.Char(value, i);

            var Bool b;
            b : false;

            inf (~b)
            {
                inf (n = this.Char("\""))
                {
                    this.Add("\\\"");
                    b : true;
                }
            }
            inf (~b)
            {
                inf (n = this.Char("\n"))
                {
                    this.Add("\\n");
                    b : true;
                }
            }
            inf (~b)
            {
                this.AddChar(n);
            }

            i : i + 1;
        }

        this.Add("\"").Add(",").AddLine();
        return true;
    }

    maide precate Bool AddSpace()
    {
        var Int count;
        count : this.Space;
        var Int i;
        i : 0;
        while (i < count)
        {
            this.Add(" ");

            i : i + 1;
        }

        return true;
    }

    maide precate Bool Null()
    {
        this.Add("null").Add(",").AddLine();
        return true;
    }

    maide prusate Bool Execute(var Node node)
    {
        this.AddClear();

        inf (node = null)
        {
            this.Null();
            return true;
        }

        inf (~(cast NodeClass(node) = null))
        {
            this.ExecuteClass(cast NodeClass(node));
        }
        inf (~(cast Part(node) = null))
        {
            this.ExecutePart(cast Part(node));
        }
        inf (~(cast Comp(node) = null))
        {
            this.ExecuteComp(cast Comp(node));
        }
        inf (~(cast NodeField(node) = null))
        {
            this.ExecuteField(cast NodeField(node));
        }
        inf (~(cast NodeMaide(node) = null))
        {
            this.ExecuteMaide(cast NodeMaide(node));
        }
        inf (~(cast Param(node) = null))
        {
            this.ExecuteParam(cast Param(node));
        }
        inf (~(cast NodeVar(node) = null))
        {
            this.ExecuteVar(cast NodeVar(node));
        }
        inf (~(cast NodeCount(node) = null))
        {
            this.ExecuteCount(cast NodeCount(node));
        }
        inf (~(cast PrusateCount(node) = null))
        {
            this.ExecutePrusateCount(cast PrusateCount(node));
        }
        inf (~(cast PrecateCount(node) = null))
        {
            this.ExecutePrecateCount(cast PrecateCount(node));
        }
        inf (~(cast PronateCount(node) = null))
        {
            this.ExecutePronateCount(cast PronateCount(node));
        }
        inf (~(cast PrivateCount(node) = null))
        {
            this.ExecutePrivateCount(cast PrivateCount(node));
        }
        inf (~(cast State(node) = null))
        {
            this.ExecuteState(cast State(node));
        }
        inf (~(cast Execute(node) = null))
        {
            this.ExecuteExecute(cast Execute(node));
        }
        inf (~(cast InfExecute(node) = null))
        {
            this.ExecuteInfExecute(cast InfExecute(node));
        }
        inf (~(cast WhileExecute(node) = null))
        {
            this.ExecuteWhileExecute(cast WhileExecute(node));
        }
        inf (~(cast ReturnExecute(node) = null))
        {
            this.ExecuteReturnExecute(cast ReturnExecute(node));
        }
        inf (~(cast ReferExecute(node) = null))
        {
            this.ExecuteReferExecute(cast ReferExecute(node));
        }
        inf (~(cast AreExecute(node) = null))
        {
            this.ExecuteAreExecute(cast AreExecute(node));
        }
        inf (~(cast OperateExecute(node) = null))
        {
            this.ExecuteOperateExecute(cast OperateExecute(node));
        }
        inf (~(cast Argue(node) = null))
        {
            this.ExecuteArgue(cast Argue(node));
        }
        inf (~(cast Mark(node) = null))
        {
            this.ExecuteMark(cast Mark(node));
        }
        inf (~(cast VarMark(node) = null))
        {
            this.ExecuteVarMark(cast VarMark(node));
        }
        inf (~(cast SetMark(node) = null))
        {
            this.ExecuteSetMark(cast SetMark(node));
        }
        inf (~(cast Operate(node) = null))
        {
            this.ExecuteOperate(cast Operate(node));
        }
        inf (~(cast GetOperate(node) = null))
        {
            this.ExecuteGetOperate(cast GetOperate(node));
        }
        inf (~(cast CallOperate(node) = null))
        {
            this.ExecuteCallOperate(cast CallOperate(node));
        }
        inf (~(cast ThisOperate(node) = null))
        {
            this.ExecuteThisOperate(cast ThisOperate(node));
        }
        inf (~(cast BaseOperate(node) = null))
        {
            this.ExecuteBaseOperate(cast BaseOperate(node));
        }
        inf (~(cast NullOperate(node) = null))
        {
            this.ExecuteNullOperate(cast NullOperate(node));
        }
        inf (~(cast NewOperate(node) = null))
        {
            this.ExecuteNewOperate(cast NewOperate(node));
        }
        inf (~(cast ShareOperate(node) = null))
        {
            this.ExecuteShareOperate(cast ShareOperate(node));
        }
        inf (~(cast CastOperate(node) = null))
        {
            this.ExecuteCastOperate(cast CastOperate(node));
        }
        inf (~(cast VarOperate(node) = null))
        {
            this.ExecuteVarOperate(cast VarOperate(node));
        }
        inf (~(cast ValueOperate(node) = null))
        {
            this.ExecuteValueOperate(cast ValueOperate(node));
        }
        inf (~(cast BraceOperate(node) = null))
        {
            this.ExecuteBraceOperate(cast BraceOperate(node));
        }
        inf (~(cast Value(node) = null))
        {
            this.ExecuteValue(cast Value(node));
        }
        inf (~(cast BoolValue(node) = null))
        {
            this.ExecuteBoolValue(cast BoolValue(node));
        }
        inf (~(cast IntValue(node) = null))
        {
            this.ExecuteIntValue(cast IntValue(node));
        }
        inf (~(cast IntSignValue(node) = null))
        {
            this.ExecuteIntSignValue(cast IntSignValue(node));
        }
        inf (~(cast IntHexValue(node) = null))
        {
            this.ExecuteIntHexValue(cast IntHexValue(node));
        }
        inf (~(cast IntHexSignValue(node) = null))
        {
            this.ExecuteIntHexSignValue(cast IntHexSignValue(node));
        }
        inf (~(cast StringValue(node) = null))
        {
            this.ExecuteStringValue(cast StringValue(node));
        }
        inf (~(cast ClassName(node) = null))
        {
            this.ExecuteClassName(cast ClassName(node));
        }
        inf (~(cast FieldName(node) = null))
        {
            this.ExecuteFieldName(cast FieldName(node));
        }
        inf (~(cast MaideName(node) = null))
        {
            this.ExecuteMaideName(cast MaideName(node));
        }
        inf (~(cast VarName(node) = null))
        {
            this.ExecuteVarName(cast VarName(node));
        }
        inf (~(cast SameOperate(node) = null))
        {
            this.ExecuteSameOperate(cast SameOperate(node));
        }
        inf (~(cast AndOperate(node) = null))
        {
            this.ExecuteAndOperate(cast AndOperate(node));
        }
        inf (~(cast OrnOperate(node) = null))
        {
            this.ExecuteOrnOperate(cast OrnOperate(node));
        }
        inf (~(cast NotOperate(node) = null))
        {
            this.ExecuteNotOperate(cast NotOperate(node));
        }
        inf (~(cast LessOperate(node) = null))
        {
            this.ExecuteLessOperate(cast LessOperate(node));
        }
        inf (~(cast AddOperate(node) = null))
        {
            this.ExecuteAddOperate(cast AddOperate(node));
        }
        inf (~(cast SubOperate(node) = null))
        {
            this.ExecuteSubOperate(cast SubOperate(node));
        }
        inf (~(cast MulOperate(node) = null))
        {
            this.ExecuteMulOperate(cast MulOperate(node));
        }
        inf (~(cast DivOperate(node) = null))
        {
            this.ExecuteDivOperate(cast DivOperate(node));
        }
        inf (~(cast SignMulOperate(node) = null))
        {
            this.ExecuteSignMulOperate(cast SignMulOperate(node));
        }
        inf (~(cast SignDivOperate(node) = null))
        {
            this.ExecuteSignDivOperate(cast SignDivOperate(node));
        }
        inf (~(cast SignLessOperate(node) = null))
        {
            this.ExecuteSignLessOperate(cast SignLessOperate(node));
        }
        inf (~(cast BitAndOperate(node) = null))
        {
            this.ExecuteBitAndOperate(cast BitAndOperate(node));
        }
        inf (~(cast BitOrnOperate(node) = null))
        {
            this.ExecuteBitOrnOperate(cast BitOrnOperate(node));
        }
        inf (~(cast BitNotOperate(node) = null))
        {
            this.ExecuteBitNotOperate(cast BitNotOperate(node));
        }
        inf (~(cast BitLiteOperate(node) = null))
        {
            this.ExecuteBitLiteOperate(cast BitLiteOperate(node));
        }
        inf (~(cast BitRiteOperate(node) = null))
        {
            this.ExecuteBitRiteOperate(cast BitRiteOperate(node));
        }
        inf (~(cast BitSignRiteOperate(node) = null))
        {
            this.ExecuteBitSignRiteOperate(cast BitSignRiteOperate(node));
        }

        return true;
    }

    maide prusate Bool ExecuteClass(var NodeClass varClass)
    {
        inf (varClass = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(varClass);

        this.Start("Class");

        this.Field("Name");
        this.ExecuteClassName(varClass.Name);
        this.Field("Base");
        this.ExecuteClassName(varClass.Base);
        this.Field("Part");
        this.ExecutePart(varClass.Part);

        this.End();
        return true;
    }

    maide prusate Bool ExecutePart(var Part part)
    {
        inf (part = null)
        {
            this.Null();
            return true;
        }

        return true;
    }

    maide prusate Bool ExecuteComp(var Comp comp)
    {
        inf (comp = null)
        {
            this.Null();
            return true;
        }

        base.ExecuteComp(comp);
        return true;
    }

    maide prusate Bool ExecuteField(var NodeField varField)
    {
        inf (varField = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(varField);

        this.Start("Field");

        this.Field("Class");
        this.ExecuteClassName(varField.Class);
        this.Field("Name");
        this.ExecuteFieldName(varField.Name);
        this.Field("Count");
        this.ExecuteCount(varField.Count);
        this.Field("Get");
        this.ExecuteState(varField.Get);
        this.Field("Set");
        this.ExecuteState(varField.Set);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteMaide(var NodeMaide varMaide)
    {
        inf (varMaide = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(varMaide);

        this.Start("Maide");

        this.Field("Class");
        this.ExecuteClassName(varMaide.Class);
        this.Field("Name");
        this.ExecuteMaideName(varMaide.Name);
        this.Field("Count");
        this.ExecuteCount(varMaide.Count);
        this.Field("Param");
        this.ExecuteParam(varMaide.Param);
        this.Field("Call");
        this.ExecuteState(varMaide.Call);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteParam(var Param param)
    {
        inf (param = null)
        {
            this.Null();
            return true;
        }

        return true;
    }

    maide prusate Bool ExecuteVar(var NodeVar varVar)
    {
        inf (varVar = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(varVar);

        this.Start("Var");

        this.Field("Class");
        this.ExecuteClassName(varVar.Class);
        this.Field("Name");
        this.ExecuteVarName(varVar.Name);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteCount(var NodeCount count)
    {
        inf (count = null)
        {
            this.Null();
            return true;
        }

        base.ExecuteCount(count);
        return true;
    }

    maide prusate Bool ExecutePrusateCount(var PrusateCount prusateCount)
    {
        inf (prusateCount = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(prusateCount);

        this.Start("PrusateCount");

        this.End();
        return true;
    }

    maide prusate Bool ExecutePrecateCount(var PrecateCount precateCount)
    {
        inf (precateCount = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(precateCount);

        this.Start("PrecateCount");

        this.End();
        return true;
    }

    maide prusate Bool ExecutePronateCount(var PronateCount pronateCount)
    {
        inf (pronateCount = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(pronateCount);

        this.Start("PronateCount");

        this.End();
        return true;
    }

    maide prusate Bool ExecutePrivateCount(var PrivateCount privateCount)
    {
        inf (privateCount = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(privateCount);

        this.Start("PrivateCount");

        this.End();
        return true;
    }

    maide prusate Bool ExecuteState(var State state)
    {
        inf (state = null)
        {
            this.Null();
            return true;
        }

        return true;
    }

    maide prusate Bool ExecuteExecute(var Execute execute)
    {
        inf (execute = null)
        {
            this.Null();
            return true;
        }

        base.ExecuteExecute(execute);
        return true;
    }

    maide prusate Bool ExecuteInfExecute(var InfExecute infExecute)
    {
        inf (infExecute = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(infExecute);

        this.Start("InfExecute");

        this.Field("Cond");
        this.ExecuteOperate(infExecute.Cond);
        this.Field("Then");
        this.ExecuteState(infExecute.Then);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteWhileExecute(var WhileExecute whileExecute)
    {
        inf (whileExecute = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(whileExecute);

        this.Start("WhileExecute");

        this.Field("Cond");
        this.ExecuteOperate(whileExecute.Cond);
        this.Field("Loop");
        this.ExecuteState(whileExecute.Loop);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteReturnExecute(var ReturnExecute returnExecute)
    {
        inf (returnExecute = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(returnExecute);

        this.Start("ReturnExecute");

        this.Field("Result");
        this.ExecuteOperate(returnExecute.Result);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteReferExecute(var ReferExecute referExecute)
    {
        inf (referExecute = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(referExecute);

        this.Start("ReferExecute");

        this.Field("Var");
        this.ExecuteVar(referExecute.Var);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteAreExecute(var AreExecute areExecute)
    {
        inf (areExecute = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(areExecute);

        this.Start("AreExecute");

        this.Field("Mark");
        this.ExecuteMark(areExecute.Mark);
        this.Field("Value");
        this.ExecuteOperate(areExecute.Value);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteOperateExecute(var OperateExecute operateExecute)
    {
        inf (operateExecute = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(operateExecute);

        this.Start("OperateExecute");

        this.Field("Any");
        this.ExecuteOperate(operateExecute.Any);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteArgue(var Argue argue)
    {
        inf (argue = null)
        {
            this.Null();
            return true;
        }

        return true;
    }

    maide prusate Bool ExecuteMark(var Mark mark)
    {
        inf (mark = null)
        {
            this.Null();
            return true;
        }

        base.ExecuteMark(mark);
        return true;
    }

    maide prusate Bool ExecuteVarMark(var VarMark varMark)
    {
        inf (varMark = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(varMark);

        this.Start("VarMark");

        this.Field("Var");
        this.ExecuteVarName(varMark.Var);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteSetMark(var SetMark setMark)
    {
        inf (setMark = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(setMark);

        this.Start("SetMark");

        this.Field("This");
        this.ExecuteOperate(setMark.This);
        this.Field("Field");
        this.ExecuteFieldName(setMark.Field);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteOperate(var Operate operate)
    {
        inf (operate = null)
        {
            this.Null();
            return true;
        }

        base.ExecuteOperate(operate);
        return true;
    }

    maide prusate Bool ExecuteGetOperate(var GetOperate getOperate)
    {
        inf (getOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(getOperate);

        this.Start("GetOperate");

        this.Field("This");
        this.ExecuteOperate(getOperate.This);
        this.Field("Field");
        this.ExecuteFieldName(getOperate.Field);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteCallOperate(var CallOperate callOperate)
    {
        inf (callOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(callOperate);

        this.Start("CallOperate");

        this.Field("This");
        this.ExecuteOperate(callOperate.This);
        this.Field("Maide");
        this.ExecuteMaideName(callOperate.Maide);
        this.Field("Argue");
        this.ExecuteArgue(callOperate.Argue);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteThisOperate(var ThisOperate thisOperate)
    {
        inf (thisOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(thisOperate);

        this.Start("ThisOperate");

        this.End();
        return true;
    }

    maide prusate Bool ExecuteBaseOperate(var BaseOperate baseOperate)
    {
        inf (baseOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(baseOperate);

        this.Start("BaseOperate");

        this.End();
        return true;
    }

    maide prusate Bool ExecuteNullOperate(var NullOperate nullOperate)
    {
        inf (nullOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(nullOperate);

        this.Start("NullOperate");

        this.End();
        return true;
    }

    maide prusate Bool ExecuteNewOperate(var NewOperate newOperate)
    {
        inf (newOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(newOperate);

        this.Start("NewOperate");

        this.Field("Class");
        this.ExecuteClassName(newOperate.Class);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteShareOperate(var ShareOperate shareOperate)
    {
        inf (shareOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(shareOperate);

        this.Start("ShareOperate");

        this.Field("Class");
        this.ExecuteClassName(shareOperate.Class);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteCastOperate(var CastOperate castOperate)
    {
        inf (castOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(castOperate);

        this.Start("CastOperate");

        this.Field("Class");
        this.ExecuteClassName(castOperate.Class);
        this.Field("Any");
        this.ExecuteOperate(castOperate.Any);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteVarOperate(var VarOperate varOperate)
    {
        inf (varOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(varOperate);

        this.Start("VarOperate");

        this.Field("Var");
        this.ExecuteVarName(varOperate.Var);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteValueOperate(var ValueOperate valueOperate)
    {
        inf (valueOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(valueOperate);

        this.Start("ValueOperate");

        this.Field("Value");
        this.ExecuteValue(valueOperate.Value);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteBraceOperate(var BraceOperate braceOperate)
    {
        inf (braceOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(braceOperate);

        this.Start("BraceOperate");

        this.Field("Any");
        this.ExecuteOperate(braceOperate.Any);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteValue(var Value value)
    {
        inf (value = null)
        {
            this.Null();
            return true;
        }

        base.ExecuteValue(value);
        return true;
    }

    maide prusate Bool ExecuteBoolValue(var BoolValue boolValue)
    {
        inf (boolValue = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(boolValue);

        this.Start("BoolValue");

        this.Field("Value");
        this.AddBoolValue(boolValue.Value);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteIntValue(var IntValue intValue)
    {
        inf (intValue = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(intValue);

        this.Start("IntValue");

        this.Field("Value");
        this.AddIntValue(intValue.Value);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteIntSignValue(var IntSignValue intSignValue)
    {
        inf (intSignValue = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(intSignValue);

        this.Start("IntSignValue");

        this.Field("Value");
        this.AddIntValue(intSignValue.Value);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteIntHexValue(var IntHexValue intHexValue)
    {
        inf (intHexValue = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(intHexValue);

        this.Start("IntHexValue");

        this.Field("Value");
        this.AddIntValue(intHexValue.Value);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteIntHexSignValue(var IntHexSignValue intHexSignValue)
    {
        inf (intHexSignValue = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(intHexSignValue);

        this.Start("IntHexSignValue");

        this.Field("Value");
        this.AddIntValue(intHexSignValue.Value);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteStringValue(var StringValue stringValue)
    {
        inf (stringValue = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(stringValue);

        this.Start("StringValue");

        this.Field("Value");
        this.AddStringValue(stringValue.Value);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteClassName(var ClassName className)
    {
        inf (className = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(className);

        this.Start("ClassName");

        this.Field("Value");
        this.AddStringValue(className.Value);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteFieldName(var FieldName fieldName)
    {
        inf (fieldName = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(fieldName);

        this.Start("FieldName");

        this.Field("Value");
        this.AddStringValue(fieldName.Value);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteMaideName(var MaideName maideName)
    {
        inf (maideName = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(maideName);

        this.Start("MaideName");

        this.Field("Value");
        this.AddStringValue(maideName.Value);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteVarName(var VarName varName)
    {
        inf (varName = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(varName);

        this.Start("VarName");

        this.Field("Value");
        this.AddStringValue(varName.Value);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteSameOperate(var SameOperate sameOperate)
    {
        inf (sameOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(sameOperate);

        this.Start("SameOperate");

        this.Field("Lite");
        this.ExecuteOperate(sameOperate.Lite);
        this.Field("Rite");
        this.ExecuteOperate(sameOperate.Rite);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteAndOperate(var AndOperate andOperate)
    {
        inf (andOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(andOperate);

        this.Start("AndOperate");

        this.Field("Lite");
        this.ExecuteOperate(andOperate.Lite);
        this.Field("Rite");
        this.ExecuteOperate(andOperate.Rite);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteOrnOperate(var OrnOperate ornOperate)
    {
        inf (ornOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(ornOperate);

        this.Start("OrnOperate");

        this.Field("Lite");
        this.ExecuteOperate(ornOperate.Lite);
        this.Field("Rite");
        this.ExecuteOperate(ornOperate.Rite);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteNotOperate(var NotOperate notOperate)
    {
        inf (notOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(notOperate);

        this.Start("NotOperate");

        this.Field("Value");
        this.ExecuteOperate(notOperate.Value);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteLessOperate(var LessOperate lessOperate)
    {
        inf (lessOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(lessOperate);

        this.Start("LessOperate");

        this.Field("Lite");
        this.ExecuteOperate(lessOperate.Lite);
        this.Field("Rite");
        this.ExecuteOperate(lessOperate.Rite);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteAddOperate(var AddOperate addOperate)
    {
        inf (addOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(addOperate);

        this.Start("AddOperate");

        this.Field("Lite");
        this.ExecuteOperate(addOperate.Lite);
        this.Field("Rite");
        this.ExecuteOperate(addOperate.Rite);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteSubOperate(var SubOperate subOperate)
    {
        inf (subOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(subOperate);

        this.Start("SubOperate");

        this.Field("Lite");
        this.ExecuteOperate(subOperate.Lite);
        this.Field("Rite");
        this.ExecuteOperate(subOperate.Rite);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteMulOperate(var MulOperate mulOperate)
    {
        inf (mulOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(mulOperate);

        this.Start("MulOperate");

        this.Field("Lite");
        this.ExecuteOperate(mulOperate.Lite);
        this.Field("Rite");
        this.ExecuteOperate(mulOperate.Rite);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteDivOperate(var DivOperate divOperate)
    {
        inf (divOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(divOperate);

        this.Start("DivOperate");

        this.Field("Lite");
        this.ExecuteOperate(divOperate.Lite);
        this.Field("Rite");
        this.ExecuteOperate(divOperate.Rite);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteSignMulOperate(var SignMulOperate signMulOperate)
    {
        inf (signMulOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(signMulOperate);

        this.Start("SignMulOperate");

        this.Field("Lite");
        this.ExecuteOperate(signMulOperate.Lite);
        this.Field("Rite");
        this.ExecuteOperate(signMulOperate.Rite);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteSignDivOperate(var SignDivOperate signDivOperate)
    {
        inf (signDivOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(signDivOperate);

        this.Start("SignDivOperate");

        this.Field("Lite");
        this.ExecuteOperate(signDivOperate.Lite);
        this.Field("Rite");
        this.ExecuteOperate(signDivOperate.Rite);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteSignLessOperate(var SignLessOperate signLessOperate)
    {
        inf (signLessOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(signLessOperate);

        this.Start("SignLessOperate");

        this.Field("Lite");
        this.ExecuteOperate(signLessOperate.Lite);
        this.Field("Rite");
        this.ExecuteOperate(signLessOperate.Rite);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteBitAndOperate(var BitAndOperate bitAndOperate)
    {
        inf (bitAndOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(bitAndOperate);

        this.Start("BitAndOperate");

        this.Field("Lite");
        this.ExecuteOperate(bitAndOperate.Lite);
        this.Field("Rite");
        this.ExecuteOperate(bitAndOperate.Rite);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteBitOrnOperate(var BitOrnOperate bitOrnOperate)
    {
        inf (bitOrnOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(bitOrnOperate);

        this.Start("BitOrnOperate");

        this.Field("Lite");
        this.ExecuteOperate(bitOrnOperate.Lite);
        this.Field("Rite");
        this.ExecuteOperate(bitOrnOperate.Rite);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteBitNotOperate(var BitNotOperate bitNotOperate)
    {
        inf (bitNotOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(bitNotOperate);

        this.Start("BitNotOperate");

        this.Field("Value");
        this.ExecuteOperate(bitNotOperate.Value);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteBitLiteOperate(var BitLiteOperate bitLiteOperate)
    {
        inf (bitLiteOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(bitLiteOperate);

        this.Start("BitLiteOperate");

        this.Field("Value");
        this.ExecuteOperate(bitLiteOperate.Value);
        this.Field("Count");
        this.ExecuteOperate(bitLiteOperate.Count);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteBitRiteOperate(var BitRiteOperate bitRiteOperate)
    {
        inf (bitRiteOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(bitRiteOperate);

        this.Start("BitRiteOperate");

        this.Field("Value");
        this.ExecuteOperate(bitRiteOperate.Value);
        this.Field("Count");
        this.ExecuteOperate(bitRiteOperate.Count);

        this.End();
        return true;
    }

    maide prusate Bool ExecuteBitSignRiteOperate(var BitSignRiteOperate bitSignRiteOperate)
    {
        inf (bitSignRiteOperate = null)
        {
            this.Null();
            return true;
        }
        this.ExecuteNode(bitSignRiteOperate);

        this.Start("BitSignRiteOperate");

        this.Field("Value");
        this.ExecuteOperate(bitSignRiteOperate.Value);
        this.Field("Count");
        this.ExecuteOperate(bitSignRiteOperate.Count);

        this.End();
        return true;
    }

}