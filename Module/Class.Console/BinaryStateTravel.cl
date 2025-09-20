class BinaryStateTravel : Travel
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Kind : share BinaryOperateKindList;

        this.Operate : this.CreateOperate();
        return true;
    }

    maide precate BinaryOperate CreateOperate()
    {
        var BinaryOperate a;
        a : new BinaryOperate;
        a.Init();
        return a;
    }

    field prusate BinaryState State { get { return data; } set { data : value; } }
    field precate BinaryOperateKindList Kind { get { return data; } set { data : value; } }
    field precate BinaryOperate Operate { get { return data; } set { data : value; } }

    maide prusate Bool ExecuteOperateExecute(var OperateExecute operateExecute)
    {
        base.ExecuteOperateExecute(operateExecute);

        this.Op(this.Kind.End, null, null);
        return true;
    }

    maide prusate Bool ExecuteReturnExecute(var ReturnExecute returnExecute)
    {
        base.ExecuteReturnExecute(returnExecute);

        this.Op(this.Kind.Ret, null, null);
        return true;
    }

    maide prusate Bool ExecuteReferExecute(var ReferExecute referExecute)
    {
        var NodeVar nodeVar;
        nodeVar : referExecute.Var;

        var Var varVar;
        varVar : this.Info(nodeVar).Var;

        this.Op(this.Kind.Refer, varVar.Index, null);
        return true;
    }

    maide prusate Bool ExecuteNewOperate(var NewOperate newOperate)
    {
        var Class ka;
        ka : this.Info(newOperate).OperateClass;

        var Int k;
        k : this.State.ClassIndex(ka);

        this.Op(this.Kind.New, k, null);
        return true;
    }

    maide prusate Bool ExecuteShareOperate(var ShareOperate shareOperate)
    {
        var Class ka;
        ka : this.Info(shareOperate).OperateClass;

        var Int k;
        k : this.State.ClassIndex(ka);

        this.Op(this.Kind.Share, k, null);
        return true;
    }

    maide prusate Bool ExecuteThisOperate(var ThisOperate thisOperate)
    {
        this.Op(this.Kind.This, null, null);
        return true;
    }

    maide prusate Bool ExecuteBaseOperate(var BaseOperate baseOperate)
    {
        this.Op(this.Kind.Base, null, null);
        return true;
    }

    maide prusate Bool ExecuteNullOperate(var NullOperate nullOperate)
    {
        this.Op(this.Kind.Null, null, null);
        return true;
    }

    maide prusate Bool ExecuteSameOperate(var SameOperate sameOperate)
    {
        base.ExecuteSameOperate(sameOperate);

        this.Op(this.Kind.Same, null, null);
        return true;
    }

    maide prusate Bool ExecuteLessOperate(var LessOperate lessOperate)
    {
        base.ExecuteLessOperate(lessOperate);

        this.Op(this.Kind.Less, null, null);
        return true;
    }

    maide prusate Bool ExecuteAndOperate(var AndOperate andOperate)
    {
        base.ExecuteAndOperate(andOperate);

        this.Op(this.Kind.And, null, null);
        return true;
    }

    maide prusate Bool ExecuteOrnOperate(var OrnOperate ornOperate)
    {
        base.ExecuteOrnOperate(ornOperate);

        this.Op(this.Kind.Orn, null, null);
        return true;
    }

    maide prusate Bool ExecuteNotOperate(var NotOperate notOperate)
    {
        base.ExecuteNotOperate(notOperate);

        this.Op(this.Kind.Not, null, null);
        return true;
    }

    maide prusate Bool ExecuteAddOperate(var AddOperate addOperate)
    {
        base.ExecuteAddOperate(addOperate);

        this.Op(this.Kind.Add, null, null);
        return true;
    }

    maide prusate Bool ExecuteSubOperate(var SubOperate subOperate)
    {
        base.ExecuteSubOperate(subOperate);

        this.Op(this.Kind.Sub, null, null);
        return true;
    }

    maide prusate Bool ExecuteMulOperate(var MulOperate mulOperate)
    {
        base.ExecuteMulOperate(mulOperate);

        this.Op(this.Kind.Mul, null, null);
        return true;
    }

    maide prusate Bool ExecuteDivOperate(var DivOperate divOperate)
    {
        base.ExecuteDivOperate(divOperate);

        this.Op(this.Kind.Div, null, null);
        return true;
    }

    maide prusate Bool ExecuteSignLessOperate(var SignLessOperate signLessOperate)
    {
        base.ExecuteSignLessOperate(signLessOperate);

        this.Op(this.Kind.SignLess, null, null);
        return true;
    }

    maide prusate Bool ExecuteSignMulOperate(var SignMulOperate signMulOperate)
    {
        base.ExecuteSignMulOperate(signMulOperate);

        this.Op(this.Kind.SignMul, null, null);
        return true;
    }

    maide prusate Bool ExecuteSignDivOperate(var SignDivOperate signDivOperate)
    {
        base.ExecuteSignDivOperate(signDivOperate);

        this.Op(this.Kind.SignDiv, null, null);
        return true;
    }

    maide prusate Bool ExecuteBitAndOperate(var BitAndOperate bitAndOperate)
    {
        base.ExecuteBitAndOperate(bitAndOperate);

        this.Op(this.Kind.BitAnd, null, null);
        return true;
    }

    maide prusate Bool ExecuteBitOrnOperate(var BitOrnOperate bitOrnOperate)
    {
        base.ExecuteBitOrnOperate(bitOrnOperate);

        this.Op(this.Kind.BitOrn, null, null);
        return true;
    }

    maide prusate Bool ExecuteBitNotOperate(var BitNotOperate bitNotOperate)
    {
        base.ExecuteBitNotOperate(bitNotOperate);

        this.Op(this.Kind.BitNot, null, null);
        return true;
    }

    maide prusate Bool ExecuteBoolValue(var BoolValue boolValue)
    {
        this.Op(this.Kind.BoolValue, boolValue.Value, null);
        return true;
    }

    maide prusate Bool ExecuteIntHexValue(var IntHexValue intHexValue)
    {
        this.IntValueOp(intHexValue.Value);
        return true;
    }

    maide prusate Bool ExecuteStringValue(var StringValue stringValue)
    {
        this.Op(this.Kind.StringValue, stringValue.Value, null);
        return true;
    }

    maide precate Bool IntValueOp(var Int value)
    {
        this.Op(this.Kind.IntValue, value, null);
        return true;
    }

    maide precate Bool Op(var BinaryOperateKind kind, var Any argA, var Any argB)
    {
        this.Operate.Kind : kind.Index;
        this.Operate.ArgA : argA;
        this.Operate.ArgB : argB;

        this.State.ExecuteOperate(this.Operate);
        return true;
    }

    maide precate ModuleInfo Info(var Node node)
    {
        return cast ModuleInfo(node.NodeAny);
    }
}