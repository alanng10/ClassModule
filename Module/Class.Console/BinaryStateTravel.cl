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

        this.Ope(this.Kind.End, null, null);
        return true;
    }

    maide prusate Bool ExecuteReturnExecute(var ReturnExecute returnExecute)
    {
        base.ExecuteReturnExecute(returnExecute);

        this.Ope(this.Kind.Ret, null, null);
        return true;
    }

    maide prusate Bool ExecuteReferExecute(var ReferExecute referExecute)
    {
        var NodeVar nodeVar;
        nodeVar : referExecute.Var;

        var Var varVar;
        varVar : this.Info(nodeVar).Var;

        this.Ope(this.Kind.Refer, varVar.Index, null);
        return true;
    }

    maide prusate Bool ExecuteNewOperate(var NewOperate newOperate)
    {
        var Class ka;
        ka : this.Info(newOperate).OperateClass;

        var Int k;
        k : this.State.ClassIndex(ka);

        this.Ope(this.Kind.New, k, null);
        return true;
    }

    maide prusate Bool ExecuteShareOperate(var ShareOperate shareOperate)
    {
        var Class ka;
        ka : this.Info(shareOperate).OperateClass;

        var Int k;
        k : this.State.ClassIndex(ka);

        this.Ope(this.Kind.Share, k, null);
        return true;
    }

    maide prusate Bool ExecuteThisOperate(var ThisOperate thisOperate)
    {
        this.Ope(this.Kind.This, null, null);
        return true;
    }

    maide prusate Bool ExecuteBaseOperate(var BaseOperate baseOperate)
    {
        this.Ope(this.Kind.Base, null, null);
        return true;
    }

    maide prusate Bool ExecuteNullOperate(var NullOperate nullOperate)
    {
        this.Ope(this.Kind.Null, null, null);
        return true;
    }

    maide prusate Bool ExecuteSameOperate(var SameOperate sameOperate)
    {
        base.ExecuteSameOperate(sameOperate);

        this.Ope(this.Kind.Same, null, null);
        return true;
    }

    maide prusate Bool ExecuteLessOperate(var LessOperate lessOperate)
    {
        base.ExecuteLessOperate(lessOperate);

        this.Ope(this.Kind.Less, null, null);
        return true;
    }

    maide prusate Bool ExecuteAndOperate(var AndOperate andOperate)
    {
        base.ExecuteAndOperate(andOperate);

        this.Ope(this.Kind.And, null, null);
        return true;
    }

    maide prusate Bool ExecuteOrnOperate(var OrnOperate ornOperate)
    {
        base.ExecuteOrnOperate(ornOperate);

        this.Ope(this.Kind.Orn, null, null);
        return true;
    }

    maide prusate Bool ExecuteNotOperate(var NotOperate notOperate)
    {
        base.ExecuteNotOperate(notOperate);

        this.Ope(this.Kind.Not, null, null);
        return true;
    }

    maide prusate Bool ExecuteAddOperate(var AddOperate addOperate)
    {
        base.ExecuteAddOperate(addOperate);

        this.Ope(this.Kind.Add, null, null);
        return true;
    }

    maide prusate Bool ExecuteSubOperate(var SubOperate subOperate)
    {
        base.ExecuteSubOperate(subOperate);

        this.Ope(this.Kind.Sub, null, null);
        return true;
    }

    maide prusate Bool ExecuteMulOperate(var MulOperate mulOperate)
    {
        base.ExecuteMulOperate(mulOperate);

        this.Ope(this.Kind.Mul, null, null);
        return true;
    }

    maide prusate Bool ExecuteDivOperate(var DivOperate divOperate)
    {
        base.ExecuteDivOperate(divOperate);

        this.Ope(this.Kind.Div, null, null);
        return true;
    }

    maide prusate Bool ExecuteSignLessOperate(var SignLessOperate signLessOperate)
    {
        base.ExecuteSignLessOperate(signLessOperate);

        this.Ope(this.Kind.SignLess, null, null);
        return true;
    }

    maide prusate Bool ExecuteSignMulOperate(var SignMulOperate signMulOperate)
    {
        base.ExecuteSignMulOperate(signMulOperate);

        this.Ope(this.Kind.SignMul, null, null);
        return true;
    }

    maide prusate Bool ExecuteSignDivOperate(var SignDivOperate signDivOperate)
    {
        base.ExecuteSignDivOperate(signDivOperate);

        this.Ope(this.Kind.SignDiv, null, null);
        return true;
    }

    maide prusate Bool ExecuteBitAndOperate(var BitAndOperate bitAndOperate)
    {
        base.ExecuteBitAndOperate(bitAndOperate);

        this.Ope(this.Kind.BitAnd, null, null);
        return true;
    }

    maide prusate Bool ExecuteBitOrnOperate(var BitOrnOperate bitOrnOperate)
    {
        base.ExecuteBitOrnOperate(bitOrnOperate);

        this.Ope(this.Kind.BitOrn, null, null);
        return true;
    }

    maide prusate Bool ExecuteBitNotOperate(var BitNotOperate bitNotOperate)
    {
        base.ExecuteBitNotOperate(bitNotOperate);

        this.Ope(this.Kind.BitNot, null, null);
        return true;
    }

    maide prusate Bool ExecuteBitLiteOperate(var BitLiteOperate bitLiteOperate)
    {
        base.ExecuteBitLiteOperate(bitLiteOperate);

        this.Ope(this.Kind.BitLite, null, null);
        return true;
    }

    maide prusate Bool ExecuteBitRiteOperate(var BitRiteOperate bitRiteOperate)
    {
        base.ExecuteBitRiteOperate(bitRiteOperate);

        this.Ope(this.Kind.BitRite, null, null);
        return true;
    }

    maide prusate Bool ExecuteBitSignRiteOperate(var BitSignRiteOperate bitSignRiteOperate)
    {
        base.ExecuteBitSignRiteOperate(bitSignRiteOperate);

        this.Ope(this.Kind.BitSignRite, null, null);
        return true;
    }

    maide prusate Bool ExecuteBoolValue(var BoolValue boolValue)
    {
        this.Ope(this.Kind.BoolValue, boolValue.Value, null);
        return true;
    }

    maide prusate Bool ExecuteIntValue(var IntValue intValue)
    {
        this.IntValueOpe(intValue.Value);
        return true;
    }

    maide prusate Bool ExecuteIntSignValue(var IntSignValue intSignValue)
    {
        this.IntValueOpe(intSignValue.Value);
        return true;
    }

    maide prusate Bool ExecuteIntHexValue(var IntHexValue intHexValue)
    {
        this.IntValueOpe(intHexValue.Value);
        return true;
    }

    maide prusate Bool ExecuteIntHexSignValue(var IntHexSignValue intHexSignValue)
    {
        this.IntValueOpe(intHexSignValue.Value);
        return true;
    }

    maide prusate Bool ExecuteStringValue(var StringValue stringValue)
    {
        this.Ope(this.Kind.StringValue, stringValue.Value, null);
        return true;
    }

    maide precate Bool IntValueOpe(var Int value)
    {
        this.Ope(this.Kind.IntValue, value, null);
        return true;
    }

    maide precate Bool Ope(var BinaryOperateKind kind, var Any argA, var Any argB)
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