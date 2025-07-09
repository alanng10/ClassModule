class ClassGenerat : TextAdd
{
    maide prusate Bool ExecuteOperateEnd(var Operate operate)
    {
        this.EvalIndexPosSet(0sn1);
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
}