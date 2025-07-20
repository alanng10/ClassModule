class ClassGenerat : TextAdd
{
    maide prusate Bool ExecuteMaide(var Maide varMaide, var State state)
    {
        this.CompStateKind : this.StateKindCall;

        this.ParamCount : state.Param;

        this.LocalVarCount : state.Var - state.Param;

        this.CompStateStart(this.Class, varMaide, this.StateKindCall, this.LocalVarCount);

        this.ExecuteState(state);

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
        this.ExecuteOperateLimitAB(this.LimitBitRite);
        return true;
    }

    maide prusate Bool ExecuteOperateBitSignRite(var Operate operate)
    {
        this.ExecuteOperateLimitAC(this.LimitBitRite);
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
}