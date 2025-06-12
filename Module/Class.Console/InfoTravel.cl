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
        this.Add("[").AddLine();

        this.Space : this.Space + 4;
        return true;
    }

    maide precate Bool EndArray()
    {
        this.Space : this.Space - 4;

        this.AddSpace().Add("]").Add(",").AddLine();
        return true;
    }

    maide precate Bool FieldStart(var String name)
    {
        this.AddSpace().Add(name).Add(" : ");
        this.Space : this.Space + this.StringCount(name) + 3;
        return true;
    }

    maide precate Bool FieldEnd(var String name)
    {
        this.Space : this.Space - (this.StringCount(name) + 3);
        return true;
    }

    maide precate Bool AddBoolValue(var Bool value)
    {
        this.AddBool(value).Add(",").AddLine();
        return true;
    }

    maide precate Bool AddIntValue(var Int value)
    {
        this.Add("0h").AddIntHex(value).Add(",").AddLine();
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

    maide precate InfoTravel AddSpace()
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

        return this;
    }

    maide precate Bool Null()
    {
        this.Add("null").Add(",").AddLine();
        return true;
    }

    maide prusate Bool ExecuteBool(var Bool value)
    {
        inf (value = null)
        {
            this.Null();
            return true;
        }
        this.AddBoolValue(value);
        return true;
    }

    maide prusate Bool ExecuteInt(var Int value)
    {
        inf (value = null)
        {
            this.Null();
            return true;
        }
        this.AddIntValue(value);
        return true;
    }

    maide prusate Bool ExecuteString(var String value)
    {
        inf (value = null)
        {
            this.Null();
            return true;
        }
        this.AddStringValue(value);
        return true;
    }

    maide prusate String Execute(var Node node)
    {
        this.AddClear();

        inf (node = null)
        {
            this.Null();
            return this.AddResult();
        }

        var Bool b;
        b : false;

        inf (~b)
        {
            inf (~(cast NodeClass(node) = null))
            {
                this.ExecuteClass(cast NodeClass(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast Part(node) = null))
            {
                this.ExecutePart(cast Part(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast NodeField(node) = null))
            {
                this.ExecuteField(cast NodeField(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast NodeMaide(node) = null))
            {
                this.ExecuteMaide(cast NodeMaide(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast Param(node) = null))
            {
                this.ExecuteParam(cast Param(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast NodeVar(node) = null))
            {
                this.ExecuteVar(cast NodeVar(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast PrusateCount(node) = null))
            {
                this.ExecutePrusateCount(cast PrusateCount(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast PrecateCount(node) = null))
            {
                this.ExecutePrecateCount(cast PrecateCount(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast PronateCount(node) = null))
            {
                this.ExecutePronateCount(cast PronateCount(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast PrivateCount(node) = null))
            {
                this.ExecutePrivateCount(cast PrivateCount(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast State(node) = null))
            {
                this.ExecuteState(cast State(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast InfExecute(node) = null))
            {
                this.ExecuteInfExecute(cast InfExecute(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast WhileExecute(node) = null))
            {
                this.ExecuteWhileExecute(cast WhileExecute(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast ReturnExecute(node) = null))
            {
                this.ExecuteReturnExecute(cast ReturnExecute(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast ReferExecute(node) = null))
            {
                this.ExecuteReferExecute(cast ReferExecute(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast AreExecute(node) = null))
            {
                this.ExecuteAreExecute(cast AreExecute(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast OperateExecute(node) = null))
            {
                this.ExecuteOperateExecute(cast OperateExecute(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast Argue(node) = null))
            {
                this.ExecuteArgue(cast Argue(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast VarMark(node) = null))
            {
                this.ExecuteVarMark(cast VarMark(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast SetMark(node) = null))
            {
                this.ExecuteSetMark(cast SetMark(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast GetOperate(node) = null))
            {
                this.ExecuteGetOperate(cast GetOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast CallOperate(node) = null))
            {
                this.ExecuteCallOperate(cast CallOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast ThisOperate(node) = null))
            {
                this.ExecuteThisOperate(cast ThisOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast BaseOperate(node) = null))
            {
                this.ExecuteBaseOperate(cast BaseOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast NullOperate(node) = null))
            {
                this.ExecuteNullOperate(cast NullOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast NewOperate(node) = null))
            {
                this.ExecuteNewOperate(cast NewOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast ShareOperate(node) = null))
            {
                this.ExecuteShareOperate(cast ShareOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast CastOperate(node) = null))
            {
                this.ExecuteCastOperate(cast CastOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast VarOperate(node) = null))
            {
                this.ExecuteVarOperate(cast VarOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast ValueOperate(node) = null))
            {
                this.ExecuteValueOperate(cast ValueOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast BraceOperate(node) = null))
            {
                this.ExecuteBraceOperate(cast BraceOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast BoolValue(node) = null))
            {
                this.ExecuteBoolValue(cast BoolValue(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast IntValue(node) = null))
            {
                this.ExecuteIntValue(cast IntValue(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast IntSignValue(node) = null))
            {
                this.ExecuteIntSignValue(cast IntSignValue(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast IntHexValue(node) = null))
            {
                this.ExecuteIntHexValue(cast IntHexValue(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast IntHexSignValue(node) = null))
            {
                this.ExecuteIntHexSignValue(cast IntHexSignValue(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast StringValue(node) = null))
            {
                this.ExecuteStringValue(cast StringValue(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast ClassName(node) = null))
            {
                this.ExecuteClassName(cast ClassName(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast FieldName(node) = null))
            {
                this.ExecuteFieldName(cast FieldName(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast MaideName(node) = null))
            {
                this.ExecuteMaideName(cast MaideName(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast VarName(node) = null))
            {
                this.ExecuteVarName(cast VarName(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast SameOperate(node) = null))
            {
                this.ExecuteSameOperate(cast SameOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast AndOperate(node) = null))
            {
                this.ExecuteAndOperate(cast AndOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast OrnOperate(node) = null))
            {
                this.ExecuteOrnOperate(cast OrnOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast NotOperate(node) = null))
            {
                this.ExecuteNotOperate(cast NotOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast LessOperate(node) = null))
            {
                this.ExecuteLessOperate(cast LessOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast AddOperate(node) = null))
            {
                this.ExecuteAddOperate(cast AddOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast SubOperate(node) = null))
            {
                this.ExecuteSubOperate(cast SubOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast MulOperate(node) = null))
            {
                this.ExecuteMulOperate(cast MulOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast DivOperate(node) = null))
            {
                this.ExecuteDivOperate(cast DivOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast SignMulOperate(node) = null))
            {
                this.ExecuteSignMulOperate(cast SignMulOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast SignDivOperate(node) = null))
            {
                this.ExecuteSignDivOperate(cast SignDivOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast SignLessOperate(node) = null))
            {
                this.ExecuteSignLessOperate(cast SignLessOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast BitAndOperate(node) = null))
            {
                this.ExecuteBitAndOperate(cast BitAndOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast BitOrnOperate(node) = null))
            {
                this.ExecuteBitOrnOperate(cast BitOrnOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast BitNotOperate(node) = null))
            {
                this.ExecuteBitNotOperate(cast BitNotOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast BitLiteOperate(node) = null))
            {
                this.ExecuteBitLiteOperate(cast BitLiteOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast BitRiteOperate(node) = null))
            {
                this.ExecuteBitRiteOperate(cast BitRiteOperate(node));
                b : true;
            }
        }
        inf (~b)
        {
            inf (~(cast BitSignRiteOperate(node) = null))
            {
                this.ExecuteBitSignRiteOperate(cast BitSignRiteOperate(node));
                b : true;
            }
        }

        var String a;
        a : this.AddResult();
        return a;
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

        this.FieldStart("Name");
        this.ExecuteClassName(varClass.Name);
        this.FieldEnd("Name");
        this.FieldStart("Base");
        this.ExecuteClassName(varClass.Base);
        this.FieldEnd("Base");
        this.FieldStart("Part");
        this.ExecutePart(varClass.Part);
        this.FieldEnd("Part");

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
        this.ExecuteNode(part);

        this.Start("Part");

        this.FieldStart("Value");
        
        this.StartArray();

        var Int count;
        count : part.Value.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            this.AddSpace();

            var Comp item;
            item : cast Comp(part.Value.Get(i));
            this.ExecuteComp(item);

            i : i + 1;
        }

        this.EndArray();

        this.FieldEnd("Value");

        this.End();
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

        this.FieldStart("Class");
        this.ExecuteClassName(varField.Class);
        this.FieldEnd("Class");
        this.FieldStart("Name");
        this.ExecuteFieldName(varField.Name);
        this.FieldEnd("Name");
        this.FieldStart("Count");
        this.ExecuteCount(varField.Count);
        this.FieldEnd("Count");
        this.FieldStart("Get");
        this.ExecuteState(varField.Get);
        this.FieldEnd("Get");
        this.FieldStart("Set");
        this.ExecuteState(varField.Set);
        this.FieldEnd("Set");

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

        this.FieldStart("Class");
        this.ExecuteClassName(varMaide.Class);
        this.FieldEnd("Class");
        this.FieldStart("Name");
        this.ExecuteMaideName(varMaide.Name);
        this.FieldEnd("Name");
        this.FieldStart("Count");
        this.ExecuteCount(varMaide.Count);
        this.FieldEnd("Count");
        this.FieldStart("Param");
        this.ExecuteParam(varMaide.Param);
        this.FieldEnd("Param");
        this.FieldStart("Call");
        this.ExecuteState(varMaide.Call);
        this.FieldEnd("Call");

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
        this.ExecuteNode(param);

        this.Start("Param");

        this.FieldStart("Value");
        
        this.StartArray();

        var Int count;
        count : param.Value.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            this.AddSpace();

            var NodeVar item;
            item : cast NodeVar(param.Value.Get(i));
            this.ExecuteVar(item);

            i : i + 1;
        }

        this.EndArray();

        this.FieldEnd("Value");

        this.End();
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

        this.FieldStart("Class");
        this.ExecuteClassName(varVar.Class);
        this.FieldEnd("Class");
        this.FieldStart("Name");
        this.ExecuteVarName(varVar.Name);
        this.FieldEnd("Name");

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
        this.ExecuteNode(state);

        this.Start("State");

        this.FieldStart("Value");
        
        this.StartArray();

        var Int count;
        count : state.Value.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            this.AddSpace();

            var Execute item;
            item : cast Execute(state.Value.Get(i));
            this.ExecuteExecute(item);

            i : i + 1;
        }

        this.EndArray();

        this.FieldEnd("Value");

        this.End();
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

        this.FieldStart("Cond");
        this.ExecuteOperate(infExecute.Cond);
        this.FieldEnd("Cond");
        this.FieldStart("Then");
        this.ExecuteState(infExecute.Then);
        this.FieldEnd("Then");

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

        this.FieldStart("Cond");
        this.ExecuteOperate(whileExecute.Cond);
        this.FieldEnd("Cond");
        this.FieldStart("Loop");
        this.ExecuteState(whileExecute.Loop);
        this.FieldEnd("Loop");

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

        this.FieldStart("Result");
        this.ExecuteOperate(returnExecute.Result);
        this.FieldEnd("Result");

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

        this.FieldStart("Var");
        this.ExecuteVar(referExecute.Var);
        this.FieldEnd("Var");

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

        this.FieldStart("Mark");
        this.ExecuteMark(areExecute.Mark);
        this.FieldEnd("Mark");
        this.FieldStart("Value");
        this.ExecuteOperate(areExecute.Value);
        this.FieldEnd("Value");

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

        this.FieldStart("Any");
        this.ExecuteOperate(operateExecute.Any);
        this.FieldEnd("Any");

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
        this.ExecuteNode(argue);

        this.Start("Argue");

        this.FieldStart("Value");
        
        this.StartArray();

        var Int count;
        count : argue.Value.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            this.AddSpace();

            var Operate item;
            item : cast Operate(argue.Value.Get(i));
            this.ExecuteOperate(item);

            i : i + 1;
        }

        this.EndArray();

        this.FieldEnd("Value");

        this.End();
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

        this.FieldStart("Var");
        this.ExecuteVarName(varMark.Var);
        this.FieldEnd("Var");

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

        this.FieldStart("This");
        this.ExecuteOperate(setMark.This);
        this.FieldEnd("This");
        this.FieldStart("Field");
        this.ExecuteFieldName(setMark.Field);
        this.FieldEnd("Field");

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

        this.FieldStart("This");
        this.ExecuteOperate(getOperate.This);
        this.FieldEnd("This");
        this.FieldStart("Field");
        this.ExecuteFieldName(getOperate.Field);
        this.FieldEnd("Field");

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

        this.FieldStart("This");
        this.ExecuteOperate(callOperate.This);
        this.FieldEnd("This");
        this.FieldStart("Maide");
        this.ExecuteMaideName(callOperate.Maide);
        this.FieldEnd("Maide");
        this.FieldStart("Argue");
        this.ExecuteArgue(callOperate.Argue);
        this.FieldEnd("Argue");

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

        this.FieldStart("Class");
        this.ExecuteClassName(newOperate.Class);
        this.FieldEnd("Class");

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

        this.FieldStart("Class");
        this.ExecuteClassName(shareOperate.Class);
        this.FieldEnd("Class");

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

        this.FieldStart("Class");
        this.ExecuteClassName(castOperate.Class);
        this.FieldEnd("Class");
        this.FieldStart("Any");
        this.ExecuteOperate(castOperate.Any);
        this.FieldEnd("Any");

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

        this.FieldStart("Var");
        this.ExecuteVarName(varOperate.Var);
        this.FieldEnd("Var");

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

        this.FieldStart("Value");
        this.ExecuteValue(valueOperate.Value);
        this.FieldEnd("Value");

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

        this.FieldStart("Any");
        this.ExecuteOperate(braceOperate.Any);
        this.FieldEnd("Any");

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

        this.FieldStart("Value");
        this.ExecuteBool(boolValue.Value);
        this.FieldEnd("Value");

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

        this.FieldStart("Value");
        this.ExecuteInt(intValue.Value);
        this.FieldEnd("Value");

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

        this.FieldStart("Value");
        this.ExecuteInt(intSignValue.Value);
        this.FieldEnd("Value");

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

        this.FieldStart("Value");
        this.ExecuteInt(intHexValue.Value);
        this.FieldEnd("Value");

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

        this.FieldStart("Value");
        this.ExecuteInt(intHexSignValue.Value);
        this.FieldEnd("Value");

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

        this.FieldStart("Value");
        this.ExecuteString(stringValue.Value);
        this.FieldEnd("Value");

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

        this.FieldStart("Value");
        this.ExecuteString(className.Value);
        this.FieldEnd("Value");

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

        this.FieldStart("Value");
        this.ExecuteString(fieldName.Value);
        this.FieldEnd("Value");

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

        this.FieldStart("Value");
        this.ExecuteString(maideName.Value);
        this.FieldEnd("Value");

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

        this.FieldStart("Value");
        this.ExecuteString(varName.Value);
        this.FieldEnd("Value");

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

        this.FieldStart("Lite");
        this.ExecuteOperate(sameOperate.Lite);
        this.FieldEnd("Lite");
        this.FieldStart("Rite");
        this.ExecuteOperate(sameOperate.Rite);
        this.FieldEnd("Rite");

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

        this.FieldStart("Lite");
        this.ExecuteOperate(andOperate.Lite);
        this.FieldEnd("Lite");
        this.FieldStart("Rite");
        this.ExecuteOperate(andOperate.Rite);
        this.FieldEnd("Rite");

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

        this.FieldStart("Lite");
        this.ExecuteOperate(ornOperate.Lite);
        this.FieldEnd("Lite");
        this.FieldStart("Rite");
        this.ExecuteOperate(ornOperate.Rite);
        this.FieldEnd("Rite");

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

        this.FieldStart("Value");
        this.ExecuteOperate(notOperate.Value);
        this.FieldEnd("Value");

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

        this.FieldStart("Lite");
        this.ExecuteOperate(lessOperate.Lite);
        this.FieldEnd("Lite");
        this.FieldStart("Rite");
        this.ExecuteOperate(lessOperate.Rite);
        this.FieldEnd("Rite");

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

        this.FieldStart("Lite");
        this.ExecuteOperate(addOperate.Lite);
        this.FieldEnd("Lite");
        this.FieldStart("Rite");
        this.ExecuteOperate(addOperate.Rite);
        this.FieldEnd("Rite");

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

        this.FieldStart("Lite");
        this.ExecuteOperate(subOperate.Lite);
        this.FieldEnd("Lite");
        this.FieldStart("Rite");
        this.ExecuteOperate(subOperate.Rite);
        this.FieldEnd("Rite");

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

        this.FieldStart("Lite");
        this.ExecuteOperate(mulOperate.Lite);
        this.FieldEnd("Lite");
        this.FieldStart("Rite");
        this.ExecuteOperate(mulOperate.Rite);
        this.FieldEnd("Rite");

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

        this.FieldStart("Lite");
        this.ExecuteOperate(divOperate.Lite);
        this.FieldEnd("Lite");
        this.FieldStart("Rite");
        this.ExecuteOperate(divOperate.Rite);
        this.FieldEnd("Rite");

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

        this.FieldStart("Lite");
        this.ExecuteOperate(signMulOperate.Lite);
        this.FieldEnd("Lite");
        this.FieldStart("Rite");
        this.ExecuteOperate(signMulOperate.Rite);
        this.FieldEnd("Rite");

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

        this.FieldStart("Lite");
        this.ExecuteOperate(signDivOperate.Lite);
        this.FieldEnd("Lite");
        this.FieldStart("Rite");
        this.ExecuteOperate(signDivOperate.Rite);
        this.FieldEnd("Rite");

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

        this.FieldStart("Lite");
        this.ExecuteOperate(signLessOperate.Lite);
        this.FieldEnd("Lite");
        this.FieldStart("Rite");
        this.ExecuteOperate(signLessOperate.Rite);
        this.FieldEnd("Rite");

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

        this.FieldStart("Lite");
        this.ExecuteOperate(bitAndOperate.Lite);
        this.FieldEnd("Lite");
        this.FieldStart("Rite");
        this.ExecuteOperate(bitAndOperate.Rite);
        this.FieldEnd("Rite");

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

        this.FieldStart("Lite");
        this.ExecuteOperate(bitOrnOperate.Lite);
        this.FieldEnd("Lite");
        this.FieldStart("Rite");
        this.ExecuteOperate(bitOrnOperate.Rite);
        this.FieldEnd("Rite");

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

        this.FieldStart("Value");
        this.ExecuteOperate(bitNotOperate.Value);
        this.FieldEnd("Value");

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

        this.FieldStart("Value");
        this.ExecuteOperate(bitLiteOperate.Value);
        this.FieldEnd("Value");
        this.FieldStart("Count");
        this.ExecuteOperate(bitLiteOperate.Count);
        this.FieldEnd("Count");

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

        this.FieldStart("Value");
        this.ExecuteOperate(bitRiteOperate.Value);
        this.FieldEnd("Value");
        this.FieldStart("Count");
        this.ExecuteOperate(bitRiteOperate.Count);
        this.FieldEnd("Count");

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

        this.FieldStart("Value");
        this.ExecuteOperate(bitSignRiteOperate.Value);
        this.FieldEnd("Value");
        this.FieldStart("Count");
        this.ExecuteOperate(bitSignRiteOperate.Count);
        this.FieldEnd("Count");

        this.End();
        return true;
    }

}