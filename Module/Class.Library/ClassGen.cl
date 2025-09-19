class ClassGen : TextAdd
{
    maide prusate Bool Init()
    {
        base.Init();
        this.OperateKindList : share OperateKindList;

        this.CountOperate : this.CreateCountOperate();
        this.SetOperate : this.CreateSetOperate();
        this.ClassIter : this.CreateClassIter();

        this.StateKindGet : 1;
        this.StateKindSet : 2;
        this.StateKindCall : 3;

        this.Space : " ";
        this.NewLine : "\n";
        this.Zero : "0";
        this.One : "1";
        var String k;
        k : "v";
        this.VarA : this.InitVar(k, "A");
        this.VarB : this.InitVar(k, "B");
        this.VarC : this.InitVar(k, "C");
        this.VarD : this.InitVar(k, "D");
        this.VarSA : this.InitVar(k, "SA");
        this.VarSB : this.InitVar(k, "SB");
        this.VarSC : this.InitVar(k, "SC");
        this.EvalVar : "e";
        this.EvalStackVar : "S";
        this.EvalIndexVar : "N";
        this.EvalFrameVar : "f";
        this.IntValueHexPre : "0x";
        this.BaseBitRiteCount : "52";
        this.RefKindBitRiteCount : "60";
        this.RefBitCount : "4";
        this.RefKindAny : "1";
        this.RefKindBool : "2";
        this.RefKindInt : "3";
        this.RefKindString : "4";
        this.RefKindStringValue : "5";
        this.RefKindClearMask : "0x0fffffffffffffff";
        this.RefKindBoolMask : this.RefKindMask(this.RefKindBool);
        this.RefKindIntMask : this.RefKindMask(this.RefKindInt);
        this.BaseClearMask : "0xf00fffffffffffff";
        this.BaseMask : "0x0ff0000000000000";
        this.MemoryIndexMask : "0x000fffffffffffff";
        this.ClassInt : "Int";
        this.ClassSInt : "SInt";
        this.ClassInt32 : "Int32";
        this.ClassEval : "Eval";
        this.ClassCompState : "Intern_State";
        this.InternNewMaide : "Intern_New";
        this.InternShareMaide : "Intern_Share";
        this.InternValueRef : "Intern_Value_Ref";
        this.InternValueClass : "Intern_Value_Class";
        this.InternValueBool : "Intern_Value_Bool";
        this.InternValueInt : "Intern_Value_Int";
        this.InternValueString : "Intern_Value_String";
        this.InternClassStruct : "Intern_Class";
        this.InternModuleStruct : "Intern_Module";
        this.InternBaseSet : "Intern_Base_Set";
        this.InternModuleSet : "Intern_Module_Set";
        this.RefKindIntMacro : "RefKindInt";
        this.RefKindStringValueMacro : "RefKindStringValue";
        this.RefKindStringValueDataMacro : "RefKindStringValueData";
        this.StateGet : "G";
        this.StateSet : "S";
        this.StateCall : "C";
        this.NameCombine : "_";
        this.NamePre : "C";
        this.ClassWord : "Class";
        this.ModuleWord : "Module";
        this.ListWord : "List";
        this.BaseWord : "Base";
        this.ItemWord : "Item";
        this.AnyWord : "Any";
        this.InitWord : "Init";
        this.CountWord : "Count";
        this.VarWord : "Var";
        this.ImportWord : "Import";
        this.ExportWord : "Export";
        this.ApiWord : "Api";
        this.InternWord : "Intern";
        this.ExternWord : "Extern";
        this.StringWord : "String";
        this.DataWord : "Data";
        this.EntryWord : "Entry";
        this.VarOWord : "o";
        this.VarKWord : "k";
        this.VarMWord : "m";
        this.VarNWord : "n";
        this.CastInt : "CastInt";
        this.WhileLabelPre : "W_";
        this.DirectiveInclude : "#include";
        this.IncludeValueInfra : "<Infra/Prusate.h>";
        this.IncludeValueInfraIntern : "<InfraIntern/Prusate.h>";
        this.IncludeValueInfraInternIntern : "<InfraIntern/Prusate_Intern.h>";
        this.IncludeValueInfraInternExtern : "<InfraIntern/Prusate_Extern.h>";
        this.IndexExtern : "extern";
        this.IndexStatic : "static";
        this.IndexReturn : "return";
        this.IndexInf : "if";
        this.IndexGoto : "goto";
        this.LimitDot : ".";
        this.LimitDotPointer : "->";
        this.LimitBraceRoundLite : "(";
        this.LimitBraceRoundRite : ")";
        this.LimitBraceRightLite : "[";
        this.LimitBraceRightRite : "]";
        this.LimitBraceCurveLite : "{";
        this.LimitBraceCurveRite : "}";
        this.LimitColon : ":";
        this.LimitSemicolon : ";";
        this.LimitComma : ",";
        this.LimitAsterisk : "*";
        this.LimitAre : "=";
        this.LimitSame : "==";
        this.LimitLess : "<";
        this.LimitAnd : "&";
        this.LimitOrn : "|";
        this.LimitNot : "!";
        this.LimitAdd : "+";
        this.LimitSub : "-";
        this.LimitMul : "*";
        this.LimitDiv : "/";
        this.LimitBitNot : "~";
        this.LimitBitLite : "<<";
        this.LimitBitRite : ">>";
        return true;
    }

    maide precate ClassGenCountOperate CreateCountOperate()
    {
        var ClassGenCountOperate a;
        a : new ClassGenCountOperate;
        a.Gen : this;
        a.Init();
        return a;
    }

    maide precate ClassGenSetOperate CreateSetOperate()
    {
        var ClassGenSetOperate a;
        a : new ClassGenSetOperate;
        a.Gen : this;
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

    field prusate ClassGenArg Arg { get { return data; } set { data : value; } }
    field prusate ClassGenOperate Operate { get { return data; } set { data : value; } }
    field prusate ClassGenCountOperate CountOperate { get { return data; } set { data : value; } }
    field prusate ClassGenSetOperate SetOperate { get { return data; } set { data : value; } }
    field prusate TableIter ClassIter { get { return data; } set { data : value; } }
    field prusate OperateKindList OperateKindList { get { return data; } set { data : value; } }
    field prusate String Space { get { return data; } set { data : value; } }
    field prusate String NewLine { get { return data; } set { data : value; } }
    field prusate String Zero { get { return data; } set { data : value; } }
    field prusate String One { get { return data; } set { data : value; } }
    field prusate String VarA { get { return data; } set { data : value; } }
    field prusate String VarB { get { return data; } set { data : value; } }
    field prusate String VarC { get { return data; } set { data : value; } }
    field prusate String VarD { get { return data; } set { data : value; } }
    field prusate String VarSA { get { return data; } set { data : value; } }
    field prusate String VarSB { get { return data; } set { data : value; } }
    field prusate String VarSC { get { return data; } set { data : value; } }
    field prusate String EvalVar { get { return data; } set { data : value; } }
    field prusate String EvalStackVar { get { return data; } set { data : value; } }
    field prusate String EvalIndexVar { get { return data; } set { data : value; } }
    field prusate String EvalFrameVar { get { return data; } set { data : value; } }
    field prusate String IntValueHexPre { get { return data; } set { data : value; } }
    field prusate String BaseBitRiteCount { get { return data; } set { data : value; } }
    field prusate String RefKindBitRiteCount { get { return data; } set { data : value; } }
    field prusate String RefBitCount { get { return data; } set { data : value; } }
    field prusate String RefKindAny { get { return data; } set { data : value; } }
    field prusate String RefKindBool { get { return data; } set { data : value; } }
    field prusate String RefKindInt { get { return data; } set { data : value; } }
    field prusate String RefKindString { get { return data; } set { data : value; } }
    field prusate String RefKindStringValue { get { return data; } set { data : value; } }
    field prusate String RefKindClearMask { get { return data; } set { data : value; } }
    field prusate String RefKindBoolMask { get { return data; } set { data : value; } }
    field prusate String RefKindIntMask { get { return data; } set { data : value; } }
    field prusate String BaseClearMask { get { return data; } set { data : value; } }
    field prusate String BaseMask { get { return data; } set { data : value; } }
    field prusate String MemoryIndexMask { get { return data; } set { data : value; } }
    field prusate String ClassInt { get { return data; } set { data : value; } }
    field prusate String ClassSInt { get { return data; } set { data : value; } }
    field prusate String ClassInt32 { get { return data; } set { data : value; } }
    field prusate String ClassEval { get { return data; } set { data : value; } }
    field prusate String ClassCompState { get { return data; } set { data : value; } }
    field prusate String InternNewMaide { get { return data; } set { data : value; } }
    field prusate String InternShareMaide { get { return data; } set { data : value; } }
    field prusate String InternValueRef { get { return data; } set { data : value; } }
    field prusate String InternValueClass { get { return data; } set { data : value; } }
    field prusate String InternValueBool { get { return data; } set { data : value; } }
    field prusate String InternValueInt { get { return data; } set { data : value; } }
    field prusate String InternValueString { get { return data; } set { data : value; } }
    field prusate String InternClassStruct { get { return data; } set { data : value; } }
    field prusate String InternModuleStruct { get { return data; } set { data : value; } }
    field prusate String InternBaseSet { get { return data; } set { data : value; } }
    field prusate String InternModuleSet { get { return data; } set { data : value; } }
    field prusate String RefKindIntMacro { get { return data; } set { data : value; } }
    field prusate String RefKindStringValueMacro { get { return data; } set { data : value; } }
    field prusate String RefKindStringValueDataMacro { get { return data; } set { data : value; } }
    field prusate String StateGet { get { return data; } set { data : value; } }
    field prusate String StateSet { get { return data; } set { data : value; } }
    field prusate String StateCall { get { return data; } set { data : value; } }
    field prusate String NameCombine { get { return data; } set { data : value; } }
    field prusate String NamePre { get { return data; } set { data : value; } }
    field prusate String ClassWord { get { return data; } set { data : value; } }
    field prusate String ModuleWord { get { return data; } set { data : value; } }
    field prusate String ListWord { get { return data; } set { data : value; } }
    field prusate String BaseWord { get { return data; } set { data : value; } }
    field prusate String ItemWord { get { return data; } set { data : value; } }
    field prusate String AnyWord { get { return data; } set { data : value; } }
    field prusate String InitWord { get { return data; } set { data : value; } }
    field prusate String CountWord { get { return data; } set { data : value; } }
    field prusate String VarWord { get { return data; } set { data : value; } }
    field prusate String ImportWord { get { return data; } set { data : value; } }
    field prusate String ExportWord { get { return data; } set { data : value; } }
    field prusate String ApiWord { get { return data; } set { data : value; } }
    field prusate String InternWord { get { return data; } set { data : value; } }
    field prusate String ExternWord { get { return data; } set { data : value; } }
    field prusate String StringWord { get { return data; } set { data : value; } }
    field prusate String DataWord { get { return data; } set { data : value; } }
    field prusate String EntryWord { get { return data; } set { data : value; } }
    field prusate String VarOWord { get { return data; } set { data : value; } }
    field prusate String VarKWord { get { return data; } set { data : value; } }
    field prusate String VarMWord { get { return data; } set { data : value; } }
    field prusate String VarNWord { get { return data; } set { data : value; } }
    field prusate String CastInt { get { return data; } set { data : value; } }
    field prusate String WhileLabelPre { get { return data; } set { data : value; } }
    field prusate String DirectiveInclude { get { return data; } set { data : value; } }
    field prusate String IncludeValueInfra { get { return data; } set { data : value; } }
    field prusate String IncludeValueInfraIntern { get { return data; } set { data : value; } }
    field prusate String IncludeValueInfraInternIntern { get { return data; } set { data : value; } }
    field prusate String IncludeValueInfraInternExtern { get { return data; } set { data : value; } }
    field prusate String IndexExtern { get { return data; } set { data : value; } }
    field prusate String IndexStatic { get { return data; } set { data : value; } }
    field prusate String IndexReturn { get { return data; } set { data : value; } }
    field prusate String IndexInf { get { return data; } set { data : value; } }
    field prusate String IndexGoto { get { return data; } set { data : value; } }
    field prusate String LimitDot { get { return data; } set { data : value; } }
    field prusate String LimitDotPointer { get { return data; } set { data : value; } }
    field prusate String LimitBraceRoundLite { get { return data; } set { data : value; } }
    field prusate String LimitBraceRoundRite { get { return data; } set { data : value; } }
    field prusate String LimitBraceRightLite { get { return data; } set { data : value; } }
    field prusate String LimitBraceRightRite { get { return data; } set { data : value; } }
    field prusate String LimitBraceCurveLite { get { return data; } set { data : value; } }
    field prusate String LimitBraceCurveRite { get { return data; } set { data : value; } }
    field prusate String LimitColon { get { return data; } set { data : value; } }
    field prusate String LimitSemicolon { get { return data; } set { data : value; } }
    field prusate String LimitComma { get { return data; } set { data : value; } }
    field prusate String LimitAsterisk { get { return data; } set { data : value; } }
    field prusate String LimitAre { get { return data; } set { data : value; } }
    field prusate String LimitSame { get { return data; } set { data : value; } }
    field prusate String LimitLess { get { return data; } set { data : value; } }
    field prusate String LimitAnd { get { return data; } set { data : value; } }
    field prusate String LimitOrn { get { return data; } set { data : value; } }
    field prusate String LimitNot { get { return data; } set { data : value; } }
    field prusate String LimitAdd { get { return data; } set { data : value; } }
    field prusate String LimitSub { get { return data; } set { data : value; } }
    field prusate String LimitMul { get { return data; } set { data : value; } }
    field prusate String LimitDiv { get { return data; } set { data : value; } }
    field prusate String LimitBitNot { get { return data; } set { data : value; } }
    field prusate String LimitBitLite { get { return data; } set { data : value; } }
    field prusate String LimitBitRite { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        this.Arg : new ClassGenArg;
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
        this.Result : k;

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
            this.ExecuteVirtualCallThisCond(k);
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

    maide prusate Bool ExecuteVarGet(var Var varVar)
    {
        var String varA;
        varA : this.VarA;

        var Int stateKind;
        stateKind : this.CompStateKind;

        var Int k;
        k : this.ParamCount;

        var Int kk;
        kk : varVar.Index;

        inf (stateKind = this.StateKindGet)
        {
            var Bool ba;
            ba : kk = 0;

            inf (ba)
            {
                this.ExecuteThisFieldData();

                this.VarSetDeref(varA, varA, 0);
            }

            inf (~ba)
            {
                var Int posA;
                posA : kk - 1;

                this.EvalFrameValueGet(posA, varA);
            }
        }

        inf (stateKind = this.StateKindSet)
        {
            var Bool bb;
            bb : kk = 0;
            var Bool bc;
            bc : kk = 1;

            inf (bb)
            {
                this.ExecuteThisFieldData();

                this.VarSetDeref(varA, varA, 0);
            }

            inf (bc)
            {
                var Int posB;
                posB : 0sn1;

                this.EvalFrameValueGet(posB, varA);
            }

            inf (~(bb | bc))
            {
                var Int posC;
                posC : kk - 2;

                this.EvalFrameValueGet(posC, varA);
            }
        }

        inf (stateKind = this.StateKindCall)
        {
            var Int posD;
            posD : kk - k;

            this.EvalFrameValueGet(posD, varA);
        }

        this.EvalValueSet(0, varA);

        this.EvalIndexPosSet(1);

        return true;
    }

    maide prusate Bool ExecuteVarSet(var Var varVar)
    {
        var String varA;
        var String varB;
        varA : this.VarA;
        varB : this.VarB;

        var Int stateKind;
        stateKind : this.CompStateKind;

        var Int k;
        k : this.ParamCount;

        var Int kk;
        kk : varVar.Index;

        this.EvalValueGet(1, varB);

        inf (stateKind = this.StateKindGet)
        {
            var Bool ba;
            ba : kk = 0;

            inf (ba)
            {
                this.ExecuteThisFieldData();

                this.VarDerefSet(varA, varB);
            }

            inf (~ba)
            {
                var Int posA;
                posA : kk - 1;

                this.EvalFrameValueSet(posA, varB);
            }
        }

        inf (stateKind = this.StateKindSet)
        {
            var Bool bb;
            bb : kk = 0;
            var Bool bc;
            bc : kk = 1;

            inf (bb)
            {
                this.ExecuteThisFieldData();

                this.VarDerefSet(varA, varB);
            }

            inf (bc)
            {
                var Int posB;
                posB : 0sn1;

                this.EvalFrameValueSet(posB, varB);
            }

            inf (~(bb | bc))
            {
                var Int posC;
                posC : kk - 2;

                this.EvalFrameValueSet(posC, varB);
            }
        }

        inf (stateKind = this.StateKindCall)
        {
            var Int posD;
            posD : kk - k;

            this.EvalFrameValueSet(posD, varB);
        }

        return true;
    }

    maide prusate Bool ExecuteThisFieldData()
    {
        var String varA;
        varA : this.VarA;

        var Field varField;
        varField : this.ThisField;

        inf (~(varField.Virtual = null))
        {
            varField : varField.Virtual;
        }

        var Class varClass;
        varClass : varField.Parent;

        var Int k;
        k : this.ParamCount;

        var Int kk;
        kk : varClass.FieldStart;
        kk : kk + varField.Index;

        this.EvalFrameValueGet(0 - (k + 1), varA);

        this.ExecuteFieldData(varA, kk);

        return true;
    }

    maide prusate Bool ExecuteFieldData(var String varVar, var Int fieldIndex)
    {
        var Int kk;
        kk : fieldIndex;
        kk : kk + 1;

        var Int pos;
        pos : kk;

        this.VarMaskClear(varVar, this.MemoryIndexMask);

        this.VarSetPos(varVar, varVar, pos);
        return true;
    }

    maide prusate Bool CompStateHead(var Class varClass, var Any comp, var Int stateKind)
    {
        this.Text(this.IndexStatic);

        this.Text(this.Space);

        this.Text(this.ClassInt);

        this.Text(this.Space);

        this.CompStateName(varClass, comp, stateKind);

        this.Text(this.LimitBraceRoundLite);

        this.Text(this.ClassEval);
        this.Text(this.LimitAsterisk);
        this.Text(this.Space);
        this.Text(this.EvalVar);

        this.Text(this.LimitComma);
        this.Text(this.Space);

        this.Text(this.ClassInt);
        this.Text(this.Space);
        this.Text(this.EvalFrameVar);

        this.Text(this.LimitBraceRoundRite);
        return true;
    }

    maide prusate Bool CompStateStart(var Class varClass, var Any comp, var Int stateKind)
    {
        this.CompStateHead(varClass, comp, stateKind);

        this.Text(this.NewLine);

        this.Text(this.LimitBraceCurveLite);
        this.Text(this.NewLine);

        this.IndentCount : this.IndentCount + 1;

        this.DeclareVar(this.ClassInt, this.VarA);
        this.DeclareVar(this.ClassInt, this.VarB);
        this.DeclareVar(this.ClassInt, this.VarC);
        this.DeclareVar(this.ClassInt, this.VarD);
        this.DeclareVar(this.ClassSInt, this.VarSA);
        this.DeclareVar(this.ClassSInt, this.VarSB);
        this.DeclareVar(this.ClassSInt, this.VarSC);
        this.VarSet(this.VarA, this.Zero);
        this.VarSet(this.VarB, this.Zero);
        this.VarSet(this.VarC, this.Zero);
        this.VarSet(this.VarD, this.Zero);
        this.VarSet(this.VarSA, this.Zero);
        this.VarSet(this.VarSB, this.Zero);
        this.VarSet(this.VarSC, this.Zero);
        return true;
    }

    maide prusate Bool CompStateEnd()
    {
        var Int k;
        k : this.ParamCount;

        this.EvalFrameValueSet(0 - (k + 1), this.Zero);

        this.EvalIndexFramePosSet(0 - k);

        this.Return();

        this.IndentCount : this.IndentCount - 1;

        this.Text(this.LimitBraceCurveRite);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool CompStateName(var Class varClass, var Any comp, var Int stateKind)
    {
        var Int ka;

        var Int kk;

        var String kb;

        inf (stateKind = this.StateKindGet | stateKind = this.StateKindSet)
        {
            ka : varClass.FieldStart;

            var Field varField;
            varField : cast Field(comp);

            kk : varField.Index;

            var Bool ba;
            ba : (stateKind = this.StateKindGet);

            inf (ba)
            {
                kb : this.StateGet;
            }
            inf (~ba)
            {
                kb : this.StateSet;
            }
        }

        inf (stateKind = this.StateKindCall)
        {
            ka : varClass.MaideStart;

            var Maide varMaide;
            varMaide : cast Maide(comp);

            kk : varMaide.Index;

            kb : this.StateCall;
        }

        var Int ke;
        ke : ka + kk;

        this.ClassName(varClass);

        this.Text(this.NameCombine);

        this.CompIndex(ke);

        this.Text(this.NameCombine);

        this.Text(kb);
        return true;
    }

    maide prusate Bool ExecuteOperateLimit(var String limit)
    {
        var String varA;
        var String varB;
        varA : this.VarA;
        varB : this.VarB;

        var String ka;
        ka : this.RefKindClearMask;

        this.EvalValueGet(2, varA);
        this.EvalValueGet(1, varB);

        this.VarMaskClear(varA, ka);
        this.VarMaskClear(varB, ka);

        this.OperateLimit(varA, varA, varB, limit);

        this.VarMaskClear(varA, ka);

        this.VarMaskSet(varA, this.RefKindIntMask);

        this.EvalValueSet(2, varA);

        this.EvalIndexPosSet(0sn1);

        return true;
    }

    maide prusate Bool ExecuteOperateLimitCond(var String limit)
    {
        var String varA;
        var String varB;
        var String varC;
        varA : this.VarA;
        varB : this.VarB;
        varC : this.VarC;

        this.EvalValueGet(2, varA);
        this.EvalValueGet(1, varB);

        this.VarMaskClear(varA, this.RefKindClearMask);
        this.VarMaskClear(varB, this.RefKindClearMask);

        this.OperateLimitSame(varC, varB, this.Zero);

        this.OperateLimit(varB, varB, varC, this.LimitAdd);

        this.OperateLimit(varA, varA, varB, limit);

        this.CondSet(varA, varC, this.Zero, varA);

        this.VarMaskSet(varA, this.RefKindIntMask);

        this.EvalValueSet(2, varA);

        this.EvalIndexPosSet(0sn1);

        return true;
    }

    maide prusate Bool ExecuteOperateLimitSign(var String limit)
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

        this.OperateLimit(varSA, varSA, varSB, limit);

        this.VarSet(varA, varSA);

        this.VarMaskClear(varA, this.RefKindClearMask);

        this.VarMaskSet(varA, this.RefKindIntMask);

        this.EvalValueSet(2, varA);

        this.EvalIndexPosSet(0sn1);

        return true;
    }

    maide prusate Bool ExecuteOperateLimitSignCond(var String limit)
    {
        var String varA;
        var String varB;
        varA : this.VarA;
        varB : this.VarB;

        var String varSA;
        var String varSB;
        var String varSC;
        varSA : this.VarSA;
        varSB : this.VarSB;
        varSC : this.VarSC;

        this.EvalValueGet(2, varA);
        this.EvalValueGet(1, varB);

        this.VarSet(varSA, varA);
        this.VarSet(varSB, varB);

        this.SignExtend(varSA);
        this.SignExtend(varSB);

        this.OperateLimitSame(varSC, varSB, this.Zero);

        this.OperateLimit(varSB, varSB, varSC, this.LimitAdd);

        this.OperateLimit(varSA, varSA, varSB, limit);

        this.CondSet(varSA, varSC, this.Zero, varSA);

        this.VarSet(varA, varSA);

        this.VarMaskClear(varA, this.RefKindClearMask);

        this.VarMaskSet(varA, this.RefKindIntMask);

        this.EvalValueSet(2, varA);

        this.EvalIndexPosSet(0sn1);

        return true;
    }

    maide prusate Bool ExecuteOperateLimitA(var String limit)
    {
        var String varA;
        var String varB;
        varA : this.VarA;
        varB : this.VarB;

        this.EvalValueGet(2, varA);
        this.EvalValueGet(1, varB);

        this.OperateLimit(varA, varA, varB, limit);

        this.VarMaskClear(varA, this.RefKindClearMask);

        this.VarMaskSet(varA, this.RefKindIntMask);

        this.EvalValueSet(2, varA);

        this.EvalIndexPosSet(0sn1);

        return true;
    }

    maide prusate Bool ExecuteOperateLimitAA(var String limit)
    {
        var String varA;
        var String varB;
        varA : this.VarA;
        varB : this.VarB;

        this.EvalValueGet(2, varA);
        this.EvalValueGet(1, varB);

        this.VarMaskClear(varA, this.RefKindClearMask);
        this.VarMaskClear(varB, this.RefKindClearMask);

        this.OperateLimit(varA, varA, varB, limit);

        this.VarMaskClear(varA, this.RefKindClearMask);

        this.VarMaskSet(varA, this.RefKindIntMask);

        this.EvalValueSet(2, varA);

        this.EvalIndexPosSet(0sn1);

        return true;
    }

    maide prusate Bool ExecuteOperateLimitAB(var String limit)
    {
        var String varA;
        var String varB;
        var String varSA;
        varA : this.VarA;
        varB : this.VarB;
        varSA : this.VarSA;

        this.EvalValueGet(2, varA);
        this.EvalValueGet(1, varB);

        this.VarSet(varSA, varA);

        this.SignExtend(varSA);

        this.VarMaskClear(varB, this.RefKindClearMask);

        this.OperateLimit(varSA, varSA, varB, limit);

        this.VarSet(varA, varSA);

        this.VarMaskClear(varA, this.RefKindClearMask);

        this.VarMaskSet(varA, this.RefKindIntMask);

        this.EvalValueSet(2, varA);

        this.EvalIndexPosSet(0sn1);

        return true;
    }

    maide prusate Bool ExecuteOperateLimitBool(var String limit)
    {
        var String varA;
        var String varB;
        varA : this.VarA;
        varB : this.VarB;

        this.EvalValueGet(2, varA);
        this.EvalValueGet(1, varB);

        this.VarMaskClear(varA, this.RefKindClearMask);
        this.VarMaskClear(varB, this.RefKindClearMask);

        this.OperateLimit(varA, varA, varB, limit);

        this.VarMaskClear(varA, this.RefKindClearMask);

        this.VarMaskSet(varA, this.RefKindBoolMask);

        this.EvalValueSet(2, varA);

        this.EvalIndexPosSet(0sn1);

        return true;
    }

    maide prusate Bool ExecuteOperateLimitBoolOne(var String limit)
    {
        var String varA;
        varA : this.VarA;

        this.EvalValueGet(1, varA);

        this.VarMaskClear(varA, this.RefKindClearMask);

        this.OperateLimitOne(varA, varA, limit);

        this.VarMaskClear(varA, this.RefKindClearMask);

        this.VarMaskSet(varA, this.RefKindBoolMask);

        this.EvalValueSet(1, varA);

        return true;
    }

    maide prusate Bool InternNew(var Class varClass)
    {
        this.TextIndent();

        this.Text(this.InternNewMaide);
        this.Text(this.LimitBraceRoundLite);

        this.Text(this.One);

        this.Text(this.LimitComma);
        this.Text(this.Space);

        this.ClassVar(varClass);

        this.Text(this.LimitComma);
        this.Text(this.Space);

        this.Text(this.EvalVar);

        this.Text(this.LimitBraceRoundRite);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool InternShare(var Class varClass)
    {
        this.TextIndent();

        this.Text(this.InternShareMaide);
        this.Text(this.LimitBraceRoundLite);

        this.ClassVar(varClass);

        this.Text(this.LimitComma);
        this.Text(this.Space);

        this.Text(this.EvalVar);

        this.Text(this.LimitBraceRoundRite);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool ExecuteInternValue(var Class varClass)
    {
        var String varA;
        varA : this.VarA;

        this.InternValue(varA, varClass);

        this.EvalValueSet(0, varA);

        this.EvalIndexPosSet(1);
        return true;
    }

    maide prusate Bool InternValue(var String dest, var Class varClass)
    {
        var String k;

        inf (varClass = this.System.Bool)
        {
            k : this.InternValueBool;
        }
        inf (varClass = this.System.Int)
        {
            k : this.InternValueInt;
        }
        inf (varClass = this.System.String)
        {
            k : this.InternValueString;
        }

        this.TextIndent();
        this.Text(dest);

        this.Text(this.Space);
        this.Text(this.LimitAre);
        this.Text(this.Space);

        this.Text(k);
        this.Text(this.LimitBraceRoundLite);
        this.Text(this.LimitBraceRoundRite);
        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool ExecuteVirtualCallThisCond(var Int thisEvalIndex)
    {
        var String varA;
        var String varB;
        var String varC;
        varA : this.VarA;
        varB : this.VarB;
        varC : this.VarC;

        this.EvalValueGet(thisEvalIndex, varC);

        this.OperateLimit(varA, varC, this.RefKindBitRiteCount, this.LimitBitRite);

        this.OperateLimitSame(varB, varA, this.RefKindAny);

        this.OperateLimitSame(varA, varA, this.Zero);

        this.OperateLimit(varA, varA, varB, this.LimitOrn);

        this.CondSet(varC, varA, varC, this.InternValueRef);

        this.EvalValueSet(thisEvalIndex, varC);

        return true;
    }

    maide prusate Bool ExecuteVirtualCall(var Int thisEvalIndex, var Int stateKind, var Int stateIndex)
    {
        var String varA;
        var String varB;
        var String varC;
        var String varD;
        varA : this.VarA;
        varB : this.VarB;
        varC : this.VarC;
        varD : this.VarD;

        this.EvalValueGet(thisEvalIndex, varA);

        this.VarSet(varB, varA);

        this.VarMaskClear(varA, this.MemoryIndexMask);

        this.VarSetDeref(varA, varA, 0);

        this.VarSetDeref(varC, varA, 0);

        this.VarSet(varD, varB);

        this.VarMaskClear(varD, this.BaseMask);

        this.OperateLimit(varD, varD, this.BaseBitRiteCount, this.LimitBitRite);

        this.VarSetDerefVar(varC, varC, varD);

        this.VarSetDeref(varC, varC, stateKind);

        this.VarSetDeref(varC, varC, stateIndex);

        this.VarSetDeref(varD, varA, 1);

        this.VarMaskClear(varB, this.BaseClearMask);

        this.VarMaskSet(varB, varD);

        this.EvalValueSet(thisEvalIndex, varB);

        this.CallCompState(varC);
        return true;
    }

    maide prusate Bool CallCompState(var String compState)
    {
        var String ka;
        var String kb;
        ka : this.LimitBraceRoundLite;
        kb : this.LimitBraceRoundRite;

        this.TextIndent();

        this.Text(ka);

        this.Text(ka);
        this.Text(this.ClassCompState);
        this.Text(kb);

        this.Text(compState);

        this.Text(kb);

        this.Text(ka);
        this.Text(this.EvalVar);

        this.Text(this.LimitComma);
        this.Text(this.Space);

        this.EvalIndex();

        this.Text(kb);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool ExecuteCast(var Class varClass)
    {
        var Int baseIndex;
        baseIndex : varClass.BaseCount - 1;

        var String varA;
        var String varB;
        var String varC;
        var String varD;
        varA : this.VarA;
        varB : this.VarB;
        varC : this.VarC;
        varD : this.VarD;

        this.EvalValueGet(1, varA);

        this.VarSet(varB, varA);

        this.OperateLimit(varB, varB, this.RefKindBitRiteCount, this.LimitBitRite);

        this.OperateLimitSame(varB, varB, this.RefKindAny);

        this.CondSet(varC, varB, varA, this.InternValueRef);

        this.VarMaskClear(varC, this.MemoryIndexMask);

        this.VarSetDeref(varC, varC, 0);

        this.VarSet(varB, varC);

        this.VarSetDeref(varC, varC, 1);

        this.OperateLimit(varC, varC, this.BaseBitRiteCount, this.LimitBitRite);

        this.VarSetPre(varD);
        this.TextIntHex(baseIndex);
        this.VarSetPost();

        this.OperateLimit(varC, varC, varD, this.LimitLess);

        this.CondSet(varD, varC, this.Zero, varD);

        this.CondSet(varB, varC, this.InternValueClass, varB);

        this.VarSetDeref(varC, varB, 0);

        this.VarSetDerefVar(varC, varC, varD);

        this.VarSetDeref(varC, varC, 0);

        this.OperateLimitSameClass(varC, varC, varClass);

        this.CondSet(varA, varC, varA, this.Zero);

        this.EvalValueSet(1, varA);

        return true;
    }

    maide prusate Bool ExecuteCondRefKind(var String refKind)
    {
        var String varA;
        var String varB;
        varA : this.VarA;
        varB : this.VarB;

        this.EvalValueGet(1, varA);

        this.VarSet(varB, varA);

        this.OperateLimit(varB, varB, this.RefKindBitRiteCount, this.LimitBitRite);

        this.OperateLimitSame(varB, varB, refKind);

        this.CondSet(varA, varB, varA, this.Zero);

        this.EvalValueSet(1, varA);

        return true;
    }

    maide prusate Bool ExecuteCondRefKindA(var String refKindA, var String refKindB)
    {
        var String varA;
        var String varB;
        var String varC;
        varA : this.VarA;
        varB : this.VarB;
        varC : this.VarC;

        this.EvalValueGet(1, varA);

        this.VarSet(varB, varA);

        this.OperateLimit(varB, varB, this.RefKindBitRiteCount, this.LimitBitRite);

        this.OperateLimitSame(varC, varB, refKindA);

        this.OperateLimitSame(varB, varB, refKindB);

        this.OperateLimit(varB, varB, varC, this.LimitOrn);

        this.CondSet(varA, varB, varA, this.Zero);

        this.EvalValueSet(1, varA);

        return true;
    }

    maide prusate Bool CondSet(var String dest, var String cond, var String trueValue, var String falseValue)
    {
        this.TextIndent();

        this.Text(dest);

        this.Text(this.Space);
        this.Text(this.LimitAre);
        this.Text(this.Space);

        this.Text(this.LimitBraceRoundLite);

        this.Text(cond);

        this.Text(this.Space);
        this.Text(this.LimitMul);
        this.Text(this.Space);

        this.Text(trueValue);

        this.Text(this.LimitBraceRoundRite);

        this.Text(this.Space);
        this.Text(this.LimitAdd);
        this.Text(this.Space);

        this.Text(this.LimitBraceRoundLite);

        this.Text(this.LimitBraceRoundLite);

        this.Text(this.LimitNot);
        this.Text(cond);

        this.Text(this.LimitBraceRoundRite);

        this.Text(this.Space);
        this.Text(this.LimitMul);
        this.Text(this.Space);

        this.Text(falseValue);

        this.Text(this.LimitBraceRoundRite);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
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

    maide prusate Bool BlockVar(var Int blockIndex)
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
        this.BlockVar(blockIndex);
        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);

        this.TextIndent();

        this.BlockVar(blockIndex);

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

        this.BlockVar(blockIndex);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool Return()
    {
        this.TextIndent();

        this.Text(this.IndexReturn);

        this.Text(this.Space);

        this.Text(this.Zero);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool SignExtend(var String varVar)
    {
        this.OperateLimit(varVar, varVar, this.RefBitCount, this.LimitBitLite);

        this.OperateLimit(varVar, varVar, this.RefBitCount, this.LimitBitRite);
        return true;
    }

    maide prusate Bool OperateLimit(var String dest, var String lite, var String rite, var String limit)
    {
        this.TextIndent();

        this.Text(dest);

        this.Text(this.Space);
        this.Text(this.LimitAre);
        this.Text(this.Space);

        this.Text(lite);

        this.Text(this.Space);
        this.Text(limit);
        this.Text(this.Space);

        this.Text(rite);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool OperateLimitSame(var String dest, var String lite, var String rite)
    {
        this.TextIndent();

        this.Text(dest);

        this.Text(this.Space);
        this.Text(this.LimitAre);
        this.Text(this.Space);

        this.Text(this.LimitBraceRoundLite);
        this.Text(lite);

        this.Text(this.Space);
        this.Text(this.LimitSame);
        this.Text(this.Space);

        this.Text(rite);
        this.Text(this.LimitBraceRoundRite);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool OperateLimitSameClass(var String dest, var String lite, var Class varClass)
    {
        this.TextIndent();

        this.Text(dest);

        this.Text(this.Space);
        this.Text(this.LimitAre);
        this.Text(this.Space);

        this.Text(this.LimitBraceRoundLite);
        this.Text(lite);

        this.Text(this.Space);
        this.Text(this.LimitSame);
        this.Text(this.Space);

        this.ModuleClassVarClassName(varClass);
        this.Text(this.LimitBraceRoundRite);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool OperateLimitOne(var String dest, var String value, var String limit)
    {
        this.TextIndent();

        this.Text(dest);

        this.Text(this.Space);
        this.Text(this.LimitAre);
        this.Text(this.Space);

        this.Text(limit);
        this.Text(this.Space);

        this.Text(value);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool DeclareVar(var String varClass, var String varVar)
    {
        this.TextIndent();

        this.Text(varClass);

        this.Text(this.Space);

        this.Text(varVar);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool VarSet(var String dest, var String value)
    {
        this.TextIndent();

        this.Text(dest);

        this.Text(this.Space);
        this.Text(this.LimitAre);
        this.Text(this.Space);

        this.Text(value);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool VarSetPre(var String dest)
    {
        this.TextIndent();

        this.Text(dest);

        this.Text(this.Space);
        this.Text(this.LimitAre);
        this.Text(this.Space);
        return true;
    }

    maide prusate Bool VarSetPost()
    {
        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool VarSetPos(var String dest, var String value, var Int pos)
    {
        this.TextIndent();

        this.Text(dest);

        this.Text(this.Space);
        this.Text(this.LimitAre);
        this.Text(this.Space);

        this.Text(this.CastInt);
        this.Text(this.LimitBraceRoundLite);

        this.Text(this.LimitBraceRoundLite);

        this.Text(this.LimitBraceRoundLite);
        this.Text(this.ClassInt);
        this.Text(this.LimitAsterisk);
        this.Text(this.LimitBraceRoundRite);

        this.Text(value);

        this.Text(this.LimitBraceRoundRite);

        this.Text(this.Space);

        this.TextPos(pos);

        this.Text(this.LimitBraceRoundRite);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool VarSetDeref(var String dest, var String value, var Int pos)
    {
        var String ka;
        var String kb;
        ka : this.LimitBraceRoundLite;
        kb : this.LimitBraceRoundRite;

        this.TextIndent();

        this.Text(dest);

        this.Text(this.Space);
        this.Text(this.LimitAre);
        this.Text(this.Space);

        this.Text(this.LimitAsterisk);

        this.Text(ka);

        this.Text(ka);

        this.Text(ka);
        this.Text(this.ClassInt);
        this.Text(this.LimitAsterisk);
        this.Text(kb);

        this.Text(value);

        this.Text(kb);

        this.Text(this.Space);

        this.TextPos(pos);

        this.Text(kb);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool VarSetDerefVar(var String dest, var String value, var String varPos)
    {
        var String ka;
        var String kb;
        ka : this.LimitBraceRoundLite;
        kb : this.LimitBraceRoundRite;

        this.TextIndent();

        this.Text(dest);

        this.Text(this.Space);
        this.Text(this.LimitAre);
        this.Text(this.Space);

        this.Text(this.LimitAsterisk);

        this.Text(ka);

        this.Text(ka);

        this.Text(ka);
        this.Text(this.ClassInt);
        this.Text(this.LimitAsterisk);
        this.Text(kb);

        this.Text(value);

        this.Text(kb);

        this.Text(this.Space);
        this.Text(this.LimitAdd);
        this.Text(this.Space);

        this.Text(varPos);

        this.Text(kb);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool VarDerefSet(var String dest, var String value)
    {
        var String ka;
        var String kb;
        ka : this.LimitBraceRoundLite;
        kb : this.LimitBraceRoundRite;

        this.TextIndent();

        this.Text(this.LimitAsterisk);

        this.Text(ka);

        this.Text(ka);
        this.Text(this.ClassInt);
        this.Text(this.LimitAsterisk);
        this.Text(kb);

        this.Text(dest);

        this.Text(kb);

        this.Text(this.Space);
        this.Text(this.LimitAre);
        this.Text(this.Space);

        this.Text(value);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool VarMaskClear(var String varVar, var String mask)
    {
        this.TextIndent();

        this.Text(varVar);

        this.Text(this.Space);
        this.Text(this.LimitAre);
        this.Text(this.Space);

        this.Text(varVar);

        this.Text(this.Space);
        this.Text(this.LimitAnd);
        this.Text(this.Space);

        this.Text(mask);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool VarMaskSet(var String varVar, var String mask)
    {
        this.TextIndent();

        this.Text(varVar);

        this.Text(this.Space);
        this.Text(this.LimitAre);
        this.Text(this.Space);

        this.Text(varVar);

        this.Text(this.Space);
        this.Text(this.LimitOrn);
        this.Text(this.Space);

        this.Text(mask);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool VarMaskSetInt(var String varVar, var Int mask)
    {
        this.TextIndent();

        this.Text(varVar);

        this.Text(this.Space);
        this.Text(this.LimitAre);
        this.Text(this.Space);

        this.Text(varVar);

        this.Text(this.Space);
        this.Text(this.LimitOrn);
        this.Text(this.Space);

        this.TextIntHex(mask);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool EvalValueGet(var Int index, var String varVar)
    {
        this.TextIndent();

        this.Text(varVar);

        this.Text(this.Space);
        this.Text(this.LimitAre);
        this.Text(this.Space);

        this.EvalValue(index);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool EvalValueSet(var Int index, var String varVar)
    {
        this.TextIndent();

        this.EvalValue(index);

        this.Text(this.Space);
        this.Text(this.LimitAre);
        this.Text(this.Space);

        this.Text(varVar);

        this.Text(this.LimitSemicolon);
        this.Text(this.NewLine);
        return true;
    }

    maide prusate Bool EvalValue(var Int index)
    {
        this.EvalStack();

        this.Text(this.LimitBraceRightLite);

        this.EvalIndex();

        this.Text(this.Space);
        this.Text(this.LimitSub);
        this.Text(this.Space);

        this.TextInt(index);

        this.Text(this.LimitBraceRightRite);
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