class ClassGena : TextAdd
{
    maide prusate Bool Init()
    {
        base.Init();
        this.OperateKindList : share OperateKindList;

        this.CountOperate : this.CreateCountOperate();
        this.SetOperate : this.CreateSetOperate();
        this.ClassIter : this.CreateClassIter();
        return true;
    }

    maide precate ClassGenaCountOperate CreateCountOperate()
    {
        var ClassGenaCountOperate a;
        a : new ClassGenaCountOperate;
        a.Gena : this;
        a.Init();
        return a;
    }

    maide precate ClassGenaSetOperate CreateSetOperate()
    {
        var ClassGenaSetOperate a;
        a : new ClassGenaSetOperate;
        a.Gena : this;
        a.Init();
        return a;
    }

    maide precate TableIter CreateClassIter()
    {
        var TableIter a;
        a : new TableIter;
        a.Init();
        return a;
    }

    field prusate ClassGenaOperate Operate { get { return data; } set { data : value; } }
    field prusate ClassGenaCountOperate CountOperate { get { return data; } set { data : value; } }
    field prusate ClassGenaSetOperate SetOperate { get { return data; } set { data : value; } }
    field prusate ClassGenaArg Arg { get { return data; } set { data : value; } }
    field prusate TableIter ClassIter { get { return data; } set { data : value; } }
    field precate OperateKindList OperateKindList { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        this.Arg : new ClassGenaArg;
        this.Arg.Init();

        this.Operate : this.CountOperate;

        this.ResetStage();
        this.ExecuteStage();

        var Int count;
        count : this.Arg.Index;
        count : count * 4;
        this.Arg.Data : new Data;
        this.Arg.Data.Count : count;
        this.Arg.Data.Init();

        this.Operate : this.CountOperate;

        this.ResetStage();
        this.ExecuteStage();

        var String k;
        k : this.StringComp.CreateData(this.Arg.Data, null);
        this.Result = k;

        this.Operate : null;
        this.Arg : null;
        return true;
    }

    maide prusate Bool ExecuteStage()
    {
        var Iter iter;
        iter : this.ClassIter;
        this.Module.Class.IterSet(iter);

        while (iter.Next())
        {
            this.Class : cast Class(iter.Value);

            this.ExecuteClass();
        }
        return true;
    }

    maide prusate Bool ExecuteClass()
    {
        var Iter iter;
        iter : this.TableIter;
        this.Class.Maide.IterSet(iter);

        while (iter.Next())
        {
            var Maide varMaide;
            varMaide : cast Maide(iter.Value);

            this.ExecuteMaide(varMaide);
        }

        return true;
    }

    maide prusate Bool ExecuteMaide(var Maide varMaide)
    {
        var Array array;
        array : cast Array(this.Binary.State.Get(this.Class.Index));

        var Int stateIndex;
        stateIndex : this.Class.Field.Count * 2 + varMaide.Index;

        var State call;
        call : cast State(array.Get(stateIndex));

        this.CompStateKind : this.StateKindCall;

        this.ParamCount : call.Param;

        this.LocalVarCount : call.Var - call.Param;

        this.CompStateStart(this.Class, varMaide, this.StateKindCall);

        this.ExecuteState(call);

        this.CompStateEnd();

        this.Text(this.NewLine);

        return true;
    }

    maide prusate Bool ExecuteState(var State state)
    {
        var Int count;
        count : state.Operate.Count;

        var Int i;
        i : 0;
        while (i < count)
        {
            var Operate operate;
            operate : cast Operate(state.Operate.Get(i));

            var OperateKind kind;
            kind : this.OperateKind.Get(operate.Kind);

            kind.Execute.Arg : operate;
            kind.Execute.Execute();
            kind.Execute.Arg : null;

            i : i + 1;
        }
        return true;
    }

    maide prusate Bool ExecuteOperateEnd(var Operate operate)
    {
        this.EvalIndexPosSet(0sn1);
        return true;
    }

    maide prusate Bool ExecuteOperateRet(var Operate operate)
    {
        var String varA;
        varA : this.VarA;

        var Int k;
        k : this.ParamCount;

        this.EvalValueGet(1, varA);

        this.EvalFrameValueSet(0 - (k + 1), varA);

        this.EvalIndexFramePosSet(0 - k);

        this.Return();
        return true;
    }

    maide prusate Bool ExecuteOperateRefer(var Operate operate)
    {
        var String varA;
        varA : this.VarA;

        this.VarSet(varA, this.Zero);

        this.EvalValueSet(0, varA);

        this.EvalIndexPosSet(1);
        return true;
    }

    maide prusate Bool ExecuteOperateInfStart(var Operate operate)
    {
        var String varA;
        varA : this.VarA;

        this.EvalValueGet(1, varA);

        this.EvalIndexPosSet(0sn1);

        this.VarMaskClear(varA, this.RefKindClearMask);

        this.InfStart(varA);

        this.BlockStart();

        this.BlockEvalIndexStart(this.BlockIndex);

        this.BlockIndex : this.BlockIndex + 1;

        return true;
    }

    maide prusate Bool ExecuteOperateInfEnd(var Operate operate)
    {
        this.BlockIndex : this.BlockIndex - 1;

        this.BlockEvalIndexEnd(this.BlockIndex);

        this.BlockEnd();

        return true;
    }

    maide prusate Bool ExecuteOperateWhileStart(var Operate operate)
    {
        this.BlockLabelLine(this.BlockIndex);

        return true;
    }

    maide prusate Bool ExecuteOperateWhile(var Operate operate)
    {
        var String varA;
        varA : this.VarA;

        this.EvalValueGet(1, varA);

        this.EvalIndexPosSet(0sn1);

        this.VarMaskClear(varA, this.RefKindClearMask);

        this.InfStart(varA);

        this.BlockStart();

        this.BlockEvalIndexStart(this.BlockIndex);

        this.BlockIndex : this.BlockIndex + 1;

        return true;
    }

    maide prusate Bool ExecuteOperateWhileEnd(var Operate operate)
    {
        this.BlockIndex : this.BlockIndex - 1;

        this.BlockEvalIndexEnd(this.BlockIndex);

        this.BlockLabelGone(this.BlockIndex);

        this.BlockEnd();

        return true;
    }

    maide prusate Bool ExecuteOperateGet(var Operate operate)
    {
        var Int fieldIndex;
        fieldIndex : cast Int(operate.ArgA);

        var Int k;
        k : 1;

        this.ExecuteVirtualCall(k, this.StateKindGet, fieldIndex);
        return true;
    }

    maide prusate Bool ExecuteOperateCall(var Operate operate)
    {
        var Int maideIndex;
        maideIndex : cast Int(operate.ArgA);

        var Int k;
        k : cast Int(operate.ArgB);
        k : k + 1;

        inf (maideIndex = 0)
        {
            this.ExecuteValueMaideCallThisCond(k);
        }

        this.ExecuteVirtualCall(k, this.StateKindCall, maideIndex);

        return true;
    }

    maide prusate Bool ExecuteOperateNew(var Operate operate)
    {
        var Int classIndex;
        classIndex : cast Int(operate.ArgA);

        var Class ka;
        ka : this.ClassGet(classIndex);

        var Bool b;
        b : (ka = this.System.Bool | ka = this.System.Int | ka = this.System.String);

        inf (b)
        {
            this.ExecuteInternValue(ka);
        }

        inf (~b)
        {
            this.ExecuteInternNew(ka);
        }

        return true;
    }

    maide prusate Bool ExecuteOperateShare(var Operate operate)
    {
        var Int classIndex;
        classIndex : cast Int(operate.ArgA);

        var Class ka;
        ka : this.ClassGet(classIndex);

        var Bool b;
        b : (ka = this.System.Bool | ka = this.System.Int | ka = this.System.String);

        inf (b)
        {
            this.ExecuteInternValue(ka);
        }

        inf (~b)
        {
            this.ExecuteInternShare(ka);
        }

        return true;
    }

    maide prusate Bool ExecuteOperateCast(var Operate operate)
    {
        var Int classIndex;
        classIndex : cast Int(operate.ArgA);

        var Class ka;
        ka : this.ClassGet(classIndex);

        var Bool b;
        b : false;

        inf (~b)
        {
            inf (ka = this.System.Any)
            {
                b : true;
            }
        }

        inf (~b)
        {
            inf (ka = this.System.Bool)
            {
                this.ExecuteCondRefKind(this.RefKindBool);

                b : true;
            }
        }

        inf (~b)
        {
            inf (ka = this.System.Int)
            {
                this.ExecuteCondRefKind(this.RefKindInt);

                b : true;
            }
        }

        inf (~b)
        {
            inf (ka = this.System.String)
            {
                this.ExecuteCondRefKindA(this.RefKindString, this.RefKindStringValue);

                b : true;
            }
        }

        inf (~b)
        {
            this.ExecuteCast(ka);
        }

        return true;
    }

    maide prusate Bool ExecuteOperateThis(var Operate operate)
    {
        var String varA;
        varA : this.VarA;

        var Int k;
        k : this.ParamCount;

        this.EvalFrameValueGet(0 - (k + 1), varA);

        this.EvalValueSet(0, varA);

        this.EvalIndexPosSet(1);
        return true;
    }

    maide prusate Bool ExecuteOperateBase(var Operate operate)
    {
        var String varA;
        varA : this.VarA;

        var Int k;
        k : this.ParamCount;

        var Int kk;
        kk : this.ClassBaseMask(this.Class.BaseCount);

        this.EvalFrameValueGet(0 - (k + 1), varA);

        this.VarMaskClear(varA, this.BaseClearMask);

        this.VarMaskSetInt(varA, kk);

        this.EvalValueSet(0, varA);

        this.EvalIndexPosSet(1);
        return true;
    }

    maide prusate Bool ExecuteOperateNull(var Operate operate)
    {
        var String varA;
        varA : this.VarA;

        this.VarSet(varA, this.Zero);

        this.EvalValueSet(0, varA);

        this.EvalIndexPosSet(1);
        return true;
    }

    maide prusate Bool ExecuteOperateSame(var Operate operate)
    {
        var String varA;
        var String varB;
        varA : this.VarA;
        varB : this.VarB;

        this.EvalValueGet(2, varA);
        this.EvalValueGet(1, varB);

        this.OperateLimitSame(varA, varA, varB);

        this.VarMaskSet(varA, this.RefKindBoolMask);

        this.EvalValueSet(2, varA);

        this.EvalIndexPosSet(0sn1);

        return true;
    }

    maide prusate Bool ExecuteOperateLess(var Operate operate)
    {
        var String varA;
        var String varB;
        varA : this.VarA;
        varB : this.VarB;

        this.EvalValueGet(2, varA);
        this.EvalValueGet(1, varB);

        this.VarMaskClear(varA, this.RefKindClearMask);
        this.VarMaskClear(varB, this.RefKindClearMask);

        this.OperateLimit(varA, varA, varB, this.LimitLess);

        this.VarMaskSet(varA, this.RefKindBoolMask);

        this.EvalValueSet(2, varA);

        this.EvalIndexPosSet(0sn1);

        return true;
    }

    maide prusate Bool ExecuteOperateAnd(var Operate operate)
    {
        this.ExecuteOperateLimitBool(this.LimitAnd);
        return true;
    }

    maide prusate Bool ExecuteOperateOrn(var Operate operate)
    {
        this.ExecuteOperateLimitBool(this.LimitOrn);
        return true;
    }

    maide prusate Bool ExecuteOperateNot(var Operate operate)
    {
        this.ExecuteOperateLimitBoolOne(this.LimitNot);
        return true;
    }

    maide prusate Bool ExecuteOperateAdd(var Operate operate)
    {
        this.ExecuteOperateLimit(this.LimitAdd);
        return true;
    }

    maide prusate Bool ExecuteOperateSub(var Operate operate)
    {
        this.ExecuteOperateLimit(this.LimitSub);
        return true;
    }

    maide prusate Bool ExecuteOperateMul(var Operate operate)
    {
        this.ExecuteOperateLimit(this.LimitMul);
        return true;
    }

    maide prusate Bool ExecuteOperateDiv(var Operate operate)
    {
        this.ExecuteOperateLimitCond(this.LimitDiv);
        return true;
    }

    maide prusate Bool ExecuteOperateSignLess(var Operate operate)
    {
        var String varA;
        var String varB;
        varA : this.VarA;
        varB : this.VarB;

        var String varSA;
        var String varSB;
        varSA : this.VarSA;
        varSB : this.VarSB;

        this.EvalValueGet(2, varA);
        this.EvalValueGet(1, varB);

        this.VarSet(varSA, varA);
        this.VarSet(varSB, varB);

        this.SignExtend(varSA);
        this.SignExtend(varSB);

        this.OperateLimit(varA, varSA, varSB, this.LimitLess);

        this.VarMaskSet(varA, this.RefKindBoolMask);

        this.EvalValueSet(2, varA);

        this.EvalIndexPosSet(0sn1);

        return true;
    }

    maide prusate Bool ExecuteOperateSignMul(var Operate operate)
    {
        this.ExecuteOperateLimitSign(this.LimitMul);
        return true;
    }

    maide prusate Bool ExecuteOperateSignDiv(var Operate operate)
    {
        this.ExecuteOperateLimitSignCond(this.LimitDiv);
        return true;
    }

    maide prusate Bool ExecuteOperateBitAnd(var Operate operate)
    {
        this.ExecuteOperateLimitA(this.LimitAnd);
        return true;
    }

    maide prusate Bool ExecuteOperateBitOrn(var Operate operate)
    {
        this.ExecuteOperateLimitA(this.LimitOrn);
        return true;
    }

    maide prusate Bool ExecuteOperateBitNot(var Operate operate)
    {
        var String varA;
        varA : this.VarA;

        this.EvalValueGet(1, varA);

        this.OperateLimitOne(varA, varA, this.LimitBitNot);

        this.VarMaskClear(varA, this.RefKindClearMask);

        this.VarMaskSet(varA, this.RefKindIntMask);

        this.EvalValueSet(1, varA);

        return true;
    }

    maide prusate Bool ExecuteOperateBitLite(var Operate operate)
    {
        this.ExecuteOperateLimitAA(this.LimitBitLite);
        return true;
    }

    maide prusate Bool ExecuteOperateBitRite(var Operate operate)
    {
        this.ExecuteOperateLimitAA(this.LimitBitRite);
        return true;
    }

    maide prusate Bool ExecuteOperateBitSignRite(var Operate operate)
    {
        this.ExecuteOperateLimitAB(this.LimitBitRite);
        return true;
    }

    maide prusate Bool BlockStart()
    {
        this.TextIndent();

        this.Text(this.LimitBraceCurveLite);

        this.Text(this.NewLine);

        this.IndentCount : this.IndentCount + 1;
        return true;
    }

    maide prusate Bool BlockEnd()
    {
        this.IndentCount : this.IndentCount - 1;

        this.TextIndent();

        this.Text(this.LimitBraceCurveRite);

        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool BlockLabel(var Int blockIndex)
    {
        this.Text(this.WordBlock);

        this.Text(this.NameCombine);

        this.ClassIndex(this.Class.Index);

        this.Text(this.NameCombine);

        this.Operate.ExecuteTextIntHex(blockIndex);
        return true;
    }

    maide prusate Bool BlockEvalIndex(var Int blockIndex)
    {
        this.BlockLabel(blockIndex);

        this.Text(this.NameCombine);

        this.Text(this.WordIndex);
        return true;
    }

    maide prusate Bool BlockLabelLine(var Int blockIndex)
    {
        this.TextIndent();

        this.BlockLabel(blockIndex);

        this.Text(this.LimitColon);

        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool BlockLabelGone(var Int blockIndex)
    {
        this.TextIndent();

        this.Text(this.IndexGoto);

        this.Text(this.Space);

        this.BlockLabel(blockIndex);

        this.Text(this.LimitSemicolon);

        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool BlockEvalIndexStart(var Int blockIndex)
    {
        this.TextIndent();
        this.Text(this.ClassInt);
        this.Text(this.Space);
        this.BlockEvalIndex(blockIndex);
        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);

        this.TextIndent();

        this.BlockEvalIndex(blockIndex);

        this.Text(this.Space);
        this.Text(this.LimitAre);
        this.Text(this.Space);

        this.EvalIndex();

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool BlockEvalIndexEnd(var Int blockIndex)
    {
        this.TextIndent();

        this.EvalIndex();

        this.Text(this.Space);
        this.Text(this.LimitAre);
        this.Text(this.Space);

        this.BlockEvalIndex(blockIndex);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool EvalFrameValueGet(var Int pos, var String arg)
    {
        this.TextIndent();

        this.Text(arg);

        this.Text(this.Space);
        this.Text(this.LimitAre);
        this.Text(this.Space);

        this.EvalFrameValue(pos);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool EvalFrameValueSet(var Int pos, var String arg)
    {
        this.TextIndent();

        this.EvalFrameValue(pos);

        this.Text(this.Space);
        this.Text(this.LimitAre);
        this.Text(this.Space);

        this.Text(arg);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool EvalFrameValue(var Int pos)
    {
        this.EvalStack();

        this.Text(this.LimitBraceRightLite);

        this.Text(this.EvalFrameVar);

        this.Text(this.Space);

        this.TextPos(pos);

        this.Text(this.LimitBraceRightRite);
        return true;
    }

    maide prusate Bool EvalIndexPosSet(var Int pos)
    {
        this.TextIndent();

        this.EvalIndex();

        this.Text(this.Space);
        this.Text(this.LimitAre);
        this.Text(this.Space);

        this.EvalIndex();

        this.Text(this.Space);

        this.TextPos(pos);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool EvalIndexFramePosSet(var Int pos)
    {
        this.TextIndent();

        this.EvalIndex();

        this.Text(this.Space);
        this.Text(this.LimitAre);
        this.Text(this.Space);

        this.Text(this.EvalFrameVar);

        this.Text(this.Space);

        this.TextPos(pos);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool EvalStack()
    {
        this.Text(this.EvalVar);
        this.Text(this.LimitDotPointer);
        this.Text(this.EvalStackVar);
        return true;
    }

    maide prusate Bool EvalIndex()
    {
        this.Text(this.EvalVar);
        this.Text(this.LimitDotPointer);
        this.Text(this.EvalIndexVar);
        return true;
    }

    maide prusate Bool ClassName(var Class varClass)
    {
        this.Text(this.NamePre);

        this.Text(this.NameCombine);

        this.ClassIndex(varClass.Index);
        return true;
    }

    maide prusate Bool ClassIndex(var Int index)
    {
        this.Operate.ExecuteTextIntHex(index);
        return true;
    }

    maide prusate Bool CompIndex(var Int index)
    {
        this.Operate.ExecuteTextIntHex(index);
        return true;
    }

    maide prusate Bool ModuleRef(var ModuleRef moduleRef)
    {
        this.Text(this.NamePre);

        this.Text(this.NameCombine);

        this.NameSymbolString(moduleRef.Name);

        this.Text(this.NameCombine);

        this.ModuleVer(moduleRef.Ver);
        return true;
    }

    maide prusate Bool ModuleVer(var Int ver)
    {
        this.Operate.ExecuteTextIntHex(ver);
        return true;
    }

    maide prusate Bool NameSymbolString(var String name)
    {
        var Int alphaStart;
        alphaStart : this.Char("a");

        var Int count;
        count : this.StringCount(name);
        var Int i;
        i : 0;
        while (i < count)
        {
            var Int kd;
            kd : this.StringChar(name, i);

            var Int k;
            k : bit &(kd, 0hff);

            var Int hex0;
            hex0 : bit &(k, 0hf);

            var Int hex1;
            hex1 : bit >(k, 4);

            var Int ka;
            var Int kb;
            ka : this.TextInfra.DigitChar(hex1, alphaStart);
            kb : this.TextInfra.DigitChar(hex0, alphaStart);

            this.ExecuteChar(ka);
            this.ExecuteChar(kb);

            i : i + 1;
        }

        return true;
    }

    maide prusate Bool BoolValueRef(var Bool value)
    {
        this.Text(this.IntValueHexPre);

        this.Text(this.RefKindBool);

        var Int k;
        k : 0;
        inf (value)
        {
            k : 1;
        }

        this.Operate.ExecuteTextIntHex(k);
        return true;
    }

    maide prusate Bool IntValueRef(var Int value)
    {
        this.Text(this.IntValueHexPre);

        this.Text(this.RefKindInt);

        this.Operate.ExecuteTextIntHex(value);
        return true;
    }

    maide prusate Bool StringValueRef(var Int index)
    {
        this.StringListName(this.Class);

        this.Text(this.LimitBraceRightLite);

        this.TextIntHex(index);

        this.Text(this.LimitBraceRightRite);
        return true;
    }

    maide prusate Bool TextPos(var Int value)
    {
        var Bool b;
        b : sign <(value, 0);

        var String ka;
        ka : this.LimitAdd;

        var Int k;
        k : value;

        inf (b)
        {
            k : 0 - k;

            ka : this.LimitSub;
        }

        this.Text(ka);
        this.Text(this.Space);
        this.TextInt(k);
        return true;
    }

    maide prusate Bool TextInt(var Int value)
    {
        this.Operate.ExecuteTextInt(value);
        return true;
    }

    maide prusate Bool TextIntHex(var Int value)
    {
        this.Text(this.IntValueHexPre);

        this.Operate.ExecuteTextIntHex(value);
        return true;
    }

    maide prusate Bool TextIndent()
    {
        var String indent;
        indent : "    ";
        var Int count;
        count : this.IndentCount;
        var Int i;
        i : 0;
        while (i < count)
        {
            this.Text(indent);
            i : i + 1;
        }
        return true;
    }

    maide prusate Bool Text(var String text)
    {
        var Int count;
        count : this.StringCount(text);
        var Int i;
        i : 0;
        while (i < count)
        {
            var Int k;
            k : this.StringChar(text, i);

            this.ExecuteChar(k);

            i : i + 1;
        }
        return true;
    }

    maide prusate Bool ExecuteChar(var Int n)
    {
        return this.Operate.ExecuteChar(n);
    }
}