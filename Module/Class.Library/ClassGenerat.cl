class ClassGenerat : TextAdd
{
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
}