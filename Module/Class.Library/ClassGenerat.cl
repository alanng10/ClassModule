class ClassGenerat : TextAdd
{
    maide prusate Bool OperateThis(var Operate operate)
    {
        var String varA;
        varA : this.VarA;

        var Int k;
        k : gen.ParamCount;

        this.EvalFrameValueGet(0 - (k + 1), varA);

        this.EvalValueSet(0, varA);

        this.EvalIndexPosSet(1);
        return true;
    }
}