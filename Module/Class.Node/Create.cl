class Create : ClassCreate
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        this.ListInfra : share ListInfra;
        this.ClassInfra : share ClassInfra;
        this.Index : share IndexList;
        this.Limit : share LimitList;
        this.ErrorKind : share ErrorKindList;
        this.NodeKind : share NodeKindList;

        this.CountOperate : this.CreateCountOperate();
        this.KindOperate : this.CreateKindOperate();
        this.SetOperate : this.CreateSetOperate();
        this.SetArg : this.CreateSetArg();
        this.NameValid : this.CreateNameValid();
        this.StringWrite : this.CreateStringWrite();
        this.RangeA : this.CreateClassRange();
        this.RangeB : this.CreateClassRange();
        this.RangeC : this.CreateClassRange();
        this.RangeD : this.CreateClassRange();
        this.TokenA : this.CreateToken();
        this.TokenB : this.CreateToken();
        this.TokenC : this.CreateToken();
        this.TokenD : this.CreateToken();
        this.TokenE : this.CreateToken();
        this.TokenF : this.CreateToken();
        this.TokenG : this.CreateToken();
        this.TokenH : this.CreateToken();
        this.TokenI : this.CreateToken();

        this.InitListItemState();
        this.InitNodeState();
        return true;
    }

    maide precate CreateCountOperate CreateCountOperate()
    {
        var CreateCountOperate a;
        a : new CreateCountOperate;
        a.Create : this;
        a.Init();
        return a;
    }

    maide precate CreateKindOperate CreateKindOperate()
    {
        var CreateKindOperate a;
        a : new CreateKindOperate;
        a.Create : this;
        a.Init();
        return a;
    }

    maide precate CreateSetOperate CreateSetOperate()
    {
        var CreateSetOperate a;
        a : new CreateSetOperate;
        a.Create : this;
        a.Init();
        return a;
    }

    maide precate CreateSetArg CreateSetArg()
    {
        var CreateSetArg a;
        a : new CreateSetArg;
        a.Init();
        a.Range : new Range;
        a.Range.Init();
        return a;
    }

    maide precate NameValid CreateNameValid()
    {
        var NameValid a;
        a : new NameValid;
        a.Init();
        return a;
    }

    maide precate StringWrite CreateStringWrite()
    {
        var StringWrite a;
        a : new StringWrite;
        a.Init();
        a.Arg : new StringWriteArg;
        a.Arg.Init();
        return a;
    }

    maide precate Range CreateClassRange()
    {
        var Range a;
        a : new Range;
        a.Init();
        return a;
    }

    maide precate Token CreateToken()
    {
        var Token a;
        a : new Token;
        a.Init();
        a.Range : new Range;
        a.Range.Init();
        return a;
    }

    field prusate Array Source { get { return data; } set { data : value; } }
    field prusate Array Code { get { return data; } set { data : value; } }
    field prusate String Task { get { return data; } set { data : value; } }
    field prusate Result Result { get { return data; } set { data : value; } }
    field prusate Int SourceIndex { get { return data; } set { data : value; } }
    field prusate CreateArg Arg { get { return data; } set { data : value; } }
    field prusate CreateOperate Operate { get { return data; } set { data : value; } }
    field prusate CreateCountOperate CountOperate { get { return data; } set { data : value; } }
    field prusate CreateKindOperate KindOperate { get { return data; } set { data : value; } }
    field prusate CreateSetOperate SetOperate { get { return data; } set { data : value; } }
    field prusate CreateSetArg SetArg { get { return data; } set { data : value; } }
    field precate InfraInfra InfraInfra { get { return data; } set { data : value; } }
    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate ClassInfra ClassInfra { get { return data; } set { data : value; } }
    field precate IndexList Index { get { return data; } set { data : value; } }
    field precate LimitList Limit { get { return data; } set { data : value; } }
    field precate ErrorKindList ErrorKind { get { return data; } set { data : value; } }
    field precate NodeKindList NodeKind { get { return data; } set { data : value; } }
    field precate Table NodeStateTable { get { return data; } set { data : value; } }
    field precate NodeState NodeState { get { return data; } set { data : value; } }
    field precate RangeState PartItemRangeState { get { return data; } set { data : value; } }
    field precate RangeState StateItemRangeState { get { return data; } set { data : value; } }
    field precate RangeState ParamItemRangeState { get { return data; } set { data : value; } }
    field precate RangeState ArgueItemRangeState { get { return data; } set { data : value; } }
    field precate NodeState PartItemNodeState { get { return data; } set { data : value; } }
    field precate NodeState StateItemNodeState { get { return data; } set { data : value; } }
    field precate NodeState ParamItemNodeState { get { return data; } set { data : value; } }
    field precate NodeState ArgueItemNodeState { get { return data; } set { data : value; } }
    field precate NameValid NameValid { get { return data; } set { data : value; } }
    field precate StringWrite StringWrite { get { return data; } set { data : value; } }
    field precate Range RangeA { get { return data; } set { data : value; } }
    field precate Range RangeB { get { return data; } set { data : value; } }
    field precate Range RangeC { get { return data; } set { data : value; } }
    field precate Range RangeD { get { return data; } set { data : value; } }
    field precate Token TokenA { get { return data; } set { data : value; } }
    field precate Token TokenB { get { return data; } set { data : value; } }
    field precate Token TokenC { get { return data; } set { data : value; } }
    field precate Token TokenD { get { return data; } set { data : value; } }
    field precate Token TokenE { get { return data; } set { data : value; } }
    field precate Token TokenF { get { return data; } set { data : value; } }
    field precate Token TokenG { get { return data; } set { data : value; } }
    field precate Token TokenH { get { return data; } set { data : value; } }
    field precate Token TokenI { get { return data; } set { data : value; } }

    maide precate Bool InitListItemState()
    {
        this.PartItemRangeState : this.RangeStateSet(new PartItemRangeState);
        this.StateItemRangeState : this.RangeStateSet(new StateItemRangeState);
        this.ParamItemRangeState : this.RangeStateSet(new ParamItemRangeState);
        this.ArgueItemRangeState : this.RangeStateSet(new ArgueItemRangeState);

        this.PartItemNodeState : this.NodeStateSet(new PartItemNodeState);
        this.StateItemNodeState : this.NodeStateSet(new StateItemNodeState);
        this.ParamItemNodeState : this.NodeStateSet(new ParamItemNodeState);
        this.ArgueItemNodeState : this.NodeStateSet(new ArgueItemNodeState);
        return true;
    }

    maide private RangeState RangeStateSet(var RangeState state)
    {
        state.Init();
        state.Create : this;
        state.Arg : new RangeStateArg;
        state.Arg.Init();
        return state;
    }

    maide private NodeState NodeStateSet(var NodeState state)
    {
        state.Init();
        state.Create : this;
        return state;
    }

    maide precate Bool InitNodeState()
    {
        this.NodeStateTable : this.ClassInfra.TableCreateStringLess();

        var Int count;
        count : this.NodeKind.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var NodeKind kind;
            kind : this.NodeKind.Get(i);
            this.AddNodeState(kind);
            i : i + 1;
        }
        return true;
    }

    maide precate Bool AddNodeState(var NodeKind kind)
    {
        kind.NodeState.Create : this;

        this.ListInfra.TableAdd(this.NodeStateTable, kind.Name, kind.NodeState);
        return true;
    }

    maide prusate Bool Execute()
    {
        this.Result : new Result;
        this.Result.Init();

        var Array rootArray;
        rootArray : this.ListInfra.ArrayCreate(this.Code.Count);
        this.Result.Root : rootArray;

        this.NodeState : cast NodeState(this.NodeStateTable.Get(this.Task));
        inf (this.NodeState = null)
        {
            var Array ka;
            ka : this.ListInfra.ArrayCreate(0);
            this.Result.Error : ka;
            return true;
        }

        this.Arg : new CreateArg;
        this.Arg.Init();

        var CreateArg arg;
        arg : this.Arg;

        this.Operate : this.CountOperate;

        this.ResetStage();
        this.ExecuteStage();

        arg.NodeData : this.DataCreate(arg.NodeIndex);
        arg.ListData : this.DataCreate(arg.ListIndex * 8);
        arg.NameValueCountData : this.DataCreate(arg.NameValueIndex * 8);
        arg.NameValueTextData : this.DataCreate(arg.NameValueTextIndex * 4);
        arg.StringValueCountData : this.DataCreate(arg.StringValueIndex * 8);
        arg.StringValueTextData : this.DataCreate(arg.StringValueTextIndex * 4);

        this.Operate : this.KindOperate;

        this.ResetStage();
        this.ExecuteStage();

        arg.NodeArray : this.ListInfra.ArrayCreate(arg.NodeIndex);
        arg.ListArray : this.ListInfra.ArrayCreate(arg.ListIndex);
        arg.NameValueArray : this.ListInfra.ArrayCreate(arg.NameValueIndex);
        arg.StringValueArray : this.ListInfra.ArrayCreate(arg.StringValueIndex);
        arg.ErrorArray : this.ListInfra.ArrayCreate(arg.ErrorIndex);

        this.ExecuteCreateNode();
        this.ExecuteCreateList();
        this.ExecuteCreateNameValue();
        this.ExecuteCreateStringValue();
        this.ExecuteCreateError();

        this.Operate : this.SetOperate;

        this.ResetStage();
        this.ExecuteStage();

        this.Result.Error : arg.ErrorArray;

        this.Operate : null;
        this.Arg : null;
        return true;
    }

    maide prusate Bool ResetStage()
    {
        var CreateArg arg;
        arg : this.Arg;

        arg.NodeIndex : 0;
        arg.ListIndex : 0;
        arg.NameValueIndex : 0;
        arg.NameValueTextIndex : 0;
        arg.StringValueIndex : 0;
        arg.StringValueTextIndex : 0;
        arg.ErrorIndex : 0;
        return true;
    }

    maide precate Bool SetArgClear()
    {
        var CreateSetArg a;
        a : this.SetArg;
        a.Kind : null;
        a.Field00 : null;
        a.Field01 : null;
        a.Field02 : null;
        a.Field03 : null;
        a.Field04 : null;
        a.Range.Start : 0;
        a.Range.End : 0;
        return true;
    }

    maide prusate Int StringValueCount(var Text text)
    {
        var StringWrite write;
        write : this.StringWrite;

        write.Text : text;

        write.Operate : write.CountOperate;
        write.ResetStage();
        write.ExecuteStage();

        var Int a;
        a : write.Arg.Index;

        write.Operate : null
        write.Text : null;
        return a;
    }

    maide prusate Bool StringValueSet(var Text text)
    {
        var StringWrite write;
        write : this.StringWrite;

        write.Text : text;

        write.Operate : write.SetOperate;

        write.Arg.Index : this.Arg.StringValueTextIndex;
        write.Arg.Data : this.Arg.StringValueTextData;

        write.ExecuteStage();

        write.Arg.Data : null;
        write.Arg.Index : 0;
        write.Operate : null
        write.Text : null;
        return true;
    }

    maide precate Data DataCreate(var Int count)
    {
        var Data a;
        a : new Data;
        a.Count : count;
        a.Init();
        return a;
    }

    maide precate Bool ExecuteCreateNode()
    {
        var CreateArg arg;
        arg : this.Arg;

        var Array array;
        array : arg.NodeArray;

        var Data data;
        data : arg.NodeData;

        var Int count;
        count : array.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Int ka;
            ka : data.Get(i);
            var NodeKind kind;
            kind : this.NodeKind.Get(ka);

            var InfraState newState;
            newState : kind.NewState;
            newState.Execute();

            var Any k;
            k : newState.Result;
            newState.Result : null;

            var Node a;
            a : cast Node(k);
            a.Init();
            a.Range : this.CreateClassRange();

            array.Set(i, a);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteCreateList()
    {
        var CreateArg arg;
        arg : this.Arg;

        var Array array;
        array : arg.ListArray;

        var Data data;
        data : arg.ListData;

        var Int count;
        conut : array.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Int ka;
            ka : i;
            ka : ka * 8;

            var Int k;
            k : this.InfraInfra.DataIntGet(data, ka);

            var Array a;
            a : this.ListInfra.ArrayCreate(k);

            array.Set(i, a);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteCreateError()
    {
        var Array array;
        array : this.Arg.ErrorArray;

        var Int count;
        count : array.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Error a;
            a : new Error;
            a.Init();
            a.Range : this.CreateClassRange();

            array.Set(i, a);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteCreateNameValue()
    {
        var CreateArg arg;
        arg : this.Arg;

        var Array array;
        array : arg.NameValueArray;

        var Data countData;
        countData : arg.NameValueCountData;

        var Data textData;
        textData : arg.NameValueTextData;

        this.PrivateExecuteCreateString(array, countData, textData);
        return true;
    }

    maide precate Bool ExecuteCreateStringValue()
    {
        var CreateArg arg;
        arg : this.Arg;

        var Array array;
        array : arg.StringValueArray;

        var Data countData;
        countData : arg.StringValueCountData;

        var Data textData;
        textData : arg.StringValueTextData;

        this.PrivateExecuteCreateString(array, countData, textData);
        return true;
    }

    maide private Bool PrivateExecuteCreateString(var Array array, var Data countData, var Data textData)
    {
        var Text text;
        text : this.TextA;

        var Int total;
        total : 0;

        var Int count;
        count : array.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Int ka;
            ka : i;
            ka : ka * 8;

            var Int kk;
            kk : this.InfraInfra.DataIntGet(countData, ka);

            text.Data : textData;
            text.Range.Index : total;
            text.Range.Count : kk;

            var String a;
            a : this.StringCreate(text);

            this.ClearText(text);

            array.Set(i, a);

            total : total + kk;

            i : i + 1;
        }
        return true;
    }

    maide prusate Bool ExecuteStage()
    {
        var Int count;
        count : this.Code.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Node root;
            root : this.ExecuteRoot(i);

            this.Result.Root.Set(i, root);

            i : i + 1;
        }

        this.SetArgClear();
        this.ClearData();
        return true;
    }

    maide precate Node ExecuteRoot(var Int sourceIndex)
    {
        this.SourceIndex : sourceIndex;

        var Code code;
        code : cast Code(this.Code.Get(this.SourceIndex));

        var Int rangeStart;
        var Int rangeEnd;
        rangeStart : 0;
        rangeEnd : code.Token.Count;

        this.Range(this.RangeA, rangeStart, rangeEnd);

        this.NodeState.Arg : this.RangeA;
        this.NodeState.Execute();

        var Node node;
        node : cast Node(this.NodeState.Result);

        this.NodeState.Result : null;
        this.NodeState.Arg : null;

        inf (node = null)
        {
            this.Error(this.ErrorKind.Unvalid, rangeStart, rangeEnd);
        }

        var Node a;
        a : node;
        return a;
    }

    maide prusate Node ExecuteClass(var Range range)
    {
        var Int start;
        var Int end;
        start : range.Start;
        end : range.End;

        inf (start = end)
        {
            return null;
        }

        var Token classToken;
        classToken : this.Token(this.TokenA, this.Index.Class.Text, this.IndexRange(this.RangeA, start));
        inf (classToken = null)
        {
            return null;
        }

        var Token colon;
        colon : this.TokenFront(this.TokenB, this.Limit.AreSign.Text, this.Range(this.RangeA, classToken.Range.End, end));
        inf (colon = null)
        {
            return null;
        }

        var Token braceCurveLite;
        braceCurveLite : this.TokenFront(this.TokenC, this.Limit.BraceCurveLite.Text, this.Range(this.RangeA, colon.Range.End, end));
        inf (braceCurveLite = null)
        {
            return null;
        }

        var Token braceCurveRite;
        braceCurveRite : this.TokenBraceCurveRite(this.TokenD, this.Range(this.RangeA, braceCurveLite.Range.End, end));
        inf (braceCurveRite = null)
        {
            return null;
        }

        inf (~(braceCurveRite.Range.End = end))
        {
            return null;
        }

        var Int nameStart;
        var Int nameEnd;
        nameStart : classToken.Range.End;
        nameEnd : colon.Range.Start;
        var Int baseStart;
        var Int baseEnd;
        baseStart : colon.Range.End;
        baseEnd : braceCurveLite.Range.Start;
        var Int partStart;
        partStart : braceCurveLite.Range.End;
        partEnd : braceCurveRite.Range.Start;

        var Node name;
        name : this.ExecuteName(this.NodeKind.ClassName, this.Range(this.RangeA, nameStart, nameEnd));
        inf (name = null)
        {
            this.Error(this.ErrorKind.NameUnvalid, nameStart, nameEnd);
        }

        var Node varBase;
        varBase : this.ExecuteName(this.NodeKind.ClassName, this.Range(this.RangeA, baseStart, baseEnd));
        inf (varBase = null)
        {
            this.Error(this.ErrorKind.BaseUnvalid, baseStart, baseEnd);
        }

        var Node part;
        part : this.ExecutePart(this.Range(this.RangeA, partStart, partEnd));
        inf (part = null)
        {
            this.Error(this.ErrorKind.PartUnvalid, partStart, partEnd);
        }

        this.SetArg.Kind : this.NodeKind.Class;
        this.SetArg.Range.Start : start;
        this.SetArg.Range.End : end;
        this.SetArg.Field00 : name;
        this.SetArg.Field01 : varBase;
        this.SetArg.Field02 : part;
        var Node ret;
        ret : this.Operate.Execute();
        return ret;
    }

    maide prusate Node ExecuteField(var Range range)
    {
        var Int start;
        var Int end;
        start : range.Start;
        end : range.End;

        inf (start = end)
        {
            return null;
        }

        var Token fieldToken;
        fieldToken : this.Token(this.TokenA, this.Index.Field.Text, this.IndexRange(this.RangeA, start));
        inf (fieldToken = null)
        {
            return null;
        }

        var Token braceCurveLite;
        braceCurveLite : this.TokenFront(this.TokenB, this.Limit.BraceCurveLite.Text, this.Range(this.RangeA, fieldToken.Range.End, end));
        inf (braceCurveLite = null)
        {
            return null;
        }

        var Token braceCurveRite;
        braceCurveRite : this.TokenBraceCurveRite(this.TokenC, this.Range(this.RangeA, braceCurveLite.Range.End, end));
        inf (braceCurveRite = null)
        {
            return null;
        }

        inf (~(braceCurveRite.Range.End = end))
        {
            return null;
        }

        var Int countStart;
        var Int countEnd;
        countStart : fieldToken.Range.End;
        countEnd : countStart + 1;

        var Int ke;
        ke : braceCurveLite.Range.Start;

        inf (ke < countEnd)
        {
            countEnd : ke;
        }

        var Int classStart;
        var Int classEnd;
        classStart : countEnd;
        classEnd : classStart + 1;

        inf (ke < classEnd)
        {
            classEnd : ke;
        }

        var Int nameStart;
        var Int nameEnd;
        nameStart : classEnd;
        nameEnd : ke;

        var Int braceStart;
        var Int braceEnd;
        braceStart : braceCurveLite.Range.End;
        braceEnd : braceCurveRite.Range.Start;

        var Node count;
        count : this.ExecuteCount(this.Range(this.RangeA, countStart, countEnd));
        inf (count = null)
        {
            this.Error(this.ErrorKind.CountUnvalid, countStart, countEnd);
        }

        var Node varClass;
        varClass : this.ExecuteName(this.NodeKind.ClassName, this.Range(this.RangeA, classStart, classEnd));
        inf (varClass = null)
        {
            this.Error(this.ErrorKind.ClassUnvalid, classStart, classEnd);
        }

        var Node name;
        name : this.ExecuteName(this.NodeKind.FieldName, this.Range(this.RangeA, nameStart, nameEnd));
        inf (name = null)
        {
            this.Error(this.ErrorKind.NameUnvalid, nameStart, nameEnd);
        }

        var Bool b;
        b : false;

        inf (~b)
        {
            inf (braceStart = braceEnd)
            {
                b : true;
            }
        }

        var Token getToken;
        inf (~b)
        {
            getToken : this.Token(this.TokenD, this.Index.ItemGet.Text, this.IndexRange(this.RangeA, braceStart));
            inf (getToken = null)
            {
                b : true;
            }
        }

        inf (~b)
        {
            inf (getToken.Range.End = braceEnd)
            {
                b : true;
            }
        }

        var Token getBraceLite;
        inf (~b)
        {
            getBraceLite : this.Token(this.TokenE, this.Limit.BraceCurveLite.Text, this.IndexRange(this.RangeA, getToken.Range.End));
            inf (getBraceLite = null)
            {
                b : true;
            }
        }

        var Token getBraceRite;
        inf (~b)
        {
            getBraceRite : this.TokenBraceCurveRite(this.TokenF, this.Range(this.RangeA, getBraceLite.Range.End, braceEnd));
            inf (getBraceRite = null)
            {
                b : true;
            }
        }

        inf (~b)
        {
            inf (getBraceRite.Range.End = braceEnd)
            {
                b : true;
            }
        }

        var Token setToken;
        inf (~b)
        {
            setToken : this.Token(this.TokenG, this.Index.Set.Text, this.IndexRange(this.RangeA, getBraceRite.Range.End));
            inf (setToken = null)
            {
                b : true;
            }
        }

        inf (~b)
        {
            inf (setToken.Range.End = braceEnd)
            {
                b : true;
            }
        }

        var Token setBraceLite;
        inf (~b)
        {
            setBraceLite : this.Token(this.TokenH, this.Limit.BraceCurveLite.Text, this.IndexRange(this.RangeA, setToken.Range.End));
            inf (setBraceLite = null)
            {
                b : true;
            }
        }

        var Token setBraceRite;
        inf (~b)
        {
            setBraceRite : this.TokenBraceCurveRite(this.TokenI, this.Range(this.RangeA, setBraceLite.Range.End, braceEnd));
            inf (setBraceRite = null)
            {
                b : true;
            }
        }

        inf (~b)
        {
            inf (~(setBraceRite.Range.End = braceEnd))
            {
                b : true;
            }
        }

        var Node varGet;

        var Node varSet;

        inf (~b)
        {
            var Int getStart;
            var Int getEnd;
            getStart : getBraceLite.Range.End;
            getEnd : getBraceRite.Range.Start;
            var Int setStart;
            var Int setEnd;
            setStart : setBraceLite.Range.End;
            setEnd : setBraceRite.Range.Start;

            varGet : this.ExecuteState(this.Range(this.RangeA, getStart, getEnd));

            varSet : this.ExecuteState(this.Range(this.RangeA, setStart, setEnd));
        }

        inf (varGet = null)
        {
            this.Error(this.ErrorKind.GetUnvalid, braceStart, braceEnd);
        }

        inf (varSet = null)
        {
            this.Error(this.ErrorKind.SetUnvalid, braceStart, braceEnd);
        }

        this.SetArg.Kind : this.NodeKind.Field;
        this.SetArg.Range.Start : start;
        this.SetArg.Range.End : end;
        this.SetArg.Field00 : varClass;
        this.SetArg.Field01 : name;
        this.SetArg.Field02 : count;
        this.SetArg.Field03 : varGet;
        this.SetArg.Field04 : varSet;
        var Node ret;
        ret : this.Operate.Execute();
        return ret;
    }

    maide prusate Node ExecuteMaide(var Range range)
    {
        var Int start;
        var Int end;
        start : range.Start;
        end : range.End;

        inf (start = end)
        {
            return null;
        }

        var Token maideToken;
        maideToken : this.Token(this.TokenA, this.Index.Maide.Text, this.IndexRange(this.RangeA, start));
        inf (maideToken = null)
        {
            return null;
        }

        var Token braceRoundLite;
        braceRoundLite : this.TokenFront(this.TokenB, this.Limit.BraceRoundLite.Text, this.Range(this.RangeA, maideToken.Range.End, end));
        inf (braceRoundLite = null)
        {
            return null;
        }

        var Token braceRoundRite;
        braceRoundRite : this.TokenBraceRoundRite(this.TokenC, this.Range(this.RangeA, braceRoundLite.Range.End, end));
        inf (braceRoundRite = null)
        {
            return null;
        }

        inf (braceRoundRite.Range.End = end)
        {
            return null;
        }

        var Token braceCurveLite;
        braceCurveLite : this.Token(this.TokenD, this.Limit.BraceCurveLite.Text, this.IndexRange(this.RangeA, braceRoundRite.Range.End));
        inf (braceCurveLite = null)
        {
            return null;
        }

        var Token braceCurveRite;
        braceCurveRite : this.TokenBraceCurveRite(this.TokenE, this.Range(this.RangeA, braceCurveLite.Range.End, end));
        inf (braceCurveRite = null)
        {
            return null;
        }

        inf (~(braceCurveRite.Range.End = end))
        {
            return null;
        }

        var Int countStart;
        var Int countEnd;
        countStart : maideToken.Range.End;
        countEnd : countStart + 1;

        var Int ke;
        ke : braceRoundLite.Range.Start;

        inf (ke < countEnd)
        {
            countEnd : ke;
        }

        var Int classStart;
        var Int classEnd;
        classStart : countEnd;
        classEnd : classStart + 1;

        inf (ke < classEnd)
        {
            classEnd : ke;
        }

        var Int nameStart;
        var Int nameEnd;
        nameStart : classEnd;
        nameEnd : ke;

        var Int paramStart;
        var Int paramEnd;
        paramStart : braceRoundLite.Range.End;
        paramEnd : braceRoundRite.Range.Start;
        var Int callStart;
        var Int callEnd;
        callStart : braceCurveLite.Range.End;
        callEnd : braceCurveRite.Range.Start;

        var Node count;
        count : this.ExecuteCount(this.Range(this.RangeA, countStart, countEnd));
        inf (count = null)
        {
            this.Error(this.ErrorKind.CountUnvalid, countStart, countEnd);
        }

        var Node varClass;
        varClass : this.ExecuteName(this.NodeKind.ClassName, this.Range(this.RangeA, classStart, classEnd));
        inf (varClass = null)
        {
            this.Error(this.ErrorKind.ClassUnvalid, classStart, classEnd);
        }

        var Node name;
        name : this.ExecuteName(this.NodeKind.MaideName, this.Range(this.RangeA, nameStart, nameEnd));
        inf (name = null)
        {
            this.Error(this.ErrorKind.NameUnvalid, nameStart, nameEnd);
        }

        var Node param;
        param : this.ExecuteParam(this.Range(this.RangeA, paramStart, paramEnd));
        inf (param = null)
        {
            this.Error(this.ErrorKind.ParamUnvalid, paramStart, paramEnd);
        }

        var Node call;
        call : this.ExecuteState(this.Range(this.RangeA, callStart, callEnd));
        inf (call = null)
        {
            this.Error(this.ErrorKind.CallUnvalid, callStart, callEnd);
        }

        this.SetArg.Kind : this.NodeKind.Maide;
        this.SetArg.Range.Start : start;
        this.SetArg.Range.End : end;
        this.SetArg.Field00 : varClass;
        this.SetArg.Field01 : name;
        this.SetArg.Field02 : count;
        this.SetArg.Field03 : param;
        this.SetArg.Field04 : call;
        var Node ret;
        ret : this.Operate.Execute();
        return ret;
    }

    maide prusate Node ExecuteVar(var Range range)
    {
        var Int start;
        var Int end;
        start : range.Start;
        end : range.End;

        var Int count;
        count : this.Count(start, end);

        inf (count < 1 | 3 < count)
        {
            return null;
        }

        var Token varToken;
        varToken : this.Token(this.TokenA, this.Index.Var.Text, this.IndexRange(this.RangeA, start));
        inf (varToken = null)
        {
            return null;
        }

        var Int classStart;
        var Int classEnd;
        classStart : varToken.Range.End;
        classEnd : classStart + 1;

        inf (end < classEnd)
        {
            classEnd : end;
        }

        var Int nameStart;
        var Int nameEnd;
        nameStart : classEnd;
        nameEnd : end;

        var Node varClass;
        varClass : this.ExecuteName(this.NodeKind.ClassName, this.Range(this.RangeA, classStart, classEnd));
        inf (varClass = null)
        {
            this.Error(this.ErrorKind.ClassUnvalid, classStart, classEnd);
        }

        var Node name;
        name : this.ExecuteName(this.NodeKind.VarName, this.Range(this.RangeA, nameStart, nameEnd));
        inf (name = null)
        {
            this.Error(this.ErrorKind.NameUnvalid, nameStart, nameEnd);
        }

        this.SetArg.Kind : this.NodeKind.Var;
        this.SetArg.Range.Start : start;
        this.SetArg.Range.End : end;
        this.SetArg.Field00 : varClass;
        this.SetArg.Field01 : name;
        var Node ret;
        ret : this.Operate.Execute();
        return ret;
    }

    maide prusate Node ExecuteClassName(var Range range)
    {
        return this.ExecuteName(this.NodeKind.ClassName, range);
    }

    maide prusate Node ExecuteFieldName(var Range range)
    {
        return this.ExecuteName(this.NodeKind.FieldName, range);
    }

    maide prusate Node ExecuteMaideName(var Range range)
    {
        return this.ExecuteName(this.NodeKind.MaideName, range);
    }

    maide prusate Node ExecuteVarName(var Range range)
    {
        return this.ExecuteName(this.NodeKind.VarName, range);
    }

    maide prusate Node ExecutePart(var Range range)
    {
        return this.ExecuteList(this.NodeKind.Part, this.PartItemRangeState, this.PartItemNodeState, range);
    }

    maide prusate Node ExecuteState(var Range range)
    {
        return this.ExecuteList(this.NodeKind.State, this.StateItemRangeState, this.StateItemNodeState, range);
    }

    maide prusate Node ExecuteParam(var Range range)
    {
        return this.ExecuteListComma(this.NodeKind.Param, this.ParamItemRangeState, this.ParamItemNodeState, range);
    }

    maide prusate Node ExecuteArgue(var Range range)
    {
        return this.ExecuteListComma(this.NodeKind.Argue, this.ArgueItemRangeState, this.ArgueItemNodeState, range);
    }

    maide prusate Node ExecuteComp(var Range range)
    {
        var Int start;
        var Int end;
        start : range.Start;
        end : range.End;

        var Node a;
        inf (a = null)
        {
            a : this.ExecuteField(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteMaide(this.Range(this.RangeA, start, end));
        }
        return a;
    }

    maide prusate Node ExecuteMark(var Range range)
    {
        var Int start;
        var Int end;
        start : range.Start;
        end : range.End;

        var Node a;
        inf (a = null)
        {
            a : this.ExecuteVarMark(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteSetMark(this.Range(this.RangeA, start, end));
        }
        return a;
    }

    maide prusate Node ExecuteVarMark(var Range range)
    {
        return this.ExecuteVarNameResult(this.NodeKind.VarMark, range);
    }

    maide prusate Node ExecuteSetMark(var Range range)
    {
        return this.ExecuteDotField(this.NodeKind.SetMark, range);
    }

    maide prusate Node ExecuteValue(var Range range)
    {
        var Int start;
        var Int end;
        start : range.Start;
        end : range.End;

        var Node a;
        inf (a = null)
        {
            a : this.ExecuteBoolValue(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteIntHexSignValue(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteIntHexValue(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteIntSignValue(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteIntValue(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteStringValue(this.Range(this.RangeA, start, end));
        }
        return a;
    }

    maide prusate Node ExecuteBoolValue(var Range range)
    {
        var Int start;
        var Int end;
        start : range.Start;
        end : range.End;

        inf (~(this.Count(start, end) = 1))
        {
            return null;
        }

        var TokenToken token;
        token : this.TokenToken(start);

        var Text text;
        text : this.TextToken(this.TextA, token);

        var Bool value;

        var Bool b;
        b : false;
        inf (~b)
        {
            inf (this.TextSame(text, this.TB(this.Index.True.Text)))
            {
                value : true;
                b : true;
            }
        }
        inf (~b)
        {
            inf (this.TextSame(text, this.TB(this.Index.False.Text)))
            {
                value : false;
                b : true;
            }
        }

        inf (~b)
        {
            return null;
        }

        this.SetArg.Kind : this.NodeKind.BoolValue;
        this.SetArg.Range.Start : start;
        this.SetArg.Range.End : end;
        this.SetArg.Field00 : value;
        var Node ret;
        ret : this.Operate.Execute();
        return ret;
    }

    maide prusate Node ExecuteIntHexSignValue(var Range range)
    {
        var Int start;
        var Int end;
        start : range.Start;
        end : range.End;

        inf (~(this.Count(start, end) = 1))
        {
            return null;
        }

        var TokenToken token;
        token : this.TokenToken(start);

        var Text text;
        text : this.TextToken(this.TextA, token);

        var Int value;
        value : this.ClassIntParse.HexSignValue(text);

        inf (value = null)
        {
            return null;
        }

        this.SetArg.Kind : this.NodeKind.IntHexSignValue;
        this.SetArg.Range.Start : start;
        this.SetArg.Range.End : end;
        this.SetArg.Field00 : value;
        var Node ret;
        ret : this.Operate.Execute();
        return ret;
    }

    maide prusate Node ExecuteIntHexValue(var Range range)
    {
        var Int start;
        var Int end;
        start : range.Start;
        end : range.End;

        inf (~(this.Count(start, end) = 1))
        {
            return null;
        }

        var TokenToken token;
        token : this.TokenToken(start);

        var Text text;
        text : this.TextToken(this.TextA, token);

        var Int value;
        value : this.ClassIntParse.HexValue(text);

        inf (value = null)
        {
            return null;
        }

        this.SetArg.Kind : this.NodeKind.IntHexValue;
        this.SetArg.Range.Start : start;
        this.SetArg.Range.End : end;
        this.SetArg.Field00 : value;
        var Node ret;
        ret : this.Operate.Execute();
        return ret;
    }

    maide prusate Node ExecuteIntSignValue(var Range range)
    {
        var Int start;
        var Int end;
        start : range.Start;
        end : range.End;

        inf (~(this.Count(start, end) = 1))
        {
            return null;
        }

        var TokenToken token;
        token : this.TokenToken(start);

        var Text text;
        text : this.TextToken(this.TextA, token);

        var Int value;
        value : this.ClassIntParse.SignValue(text);

        inf (value = null)
        {
            return null;
        }

        this.SetArg.Kind : this.NodeKind.IntSignValue;
        this.SetArg.Range.Start : start;
        this.SetArg.Range.End : end;
        this.SetArg.Field00 : value;
        var Node ret;
        ret : this.Operate.Execute();
        return ret;
    }

    maide prusate Node ExecuteIntValue(var Range range)
    {
        var Int start;
        var Int end;
        start : range.Start;
        end : range.End;

        inf (~(this.Count(start, end) = 1))
        {
            return null;
        }

        var TokenToken token;
        token : this.TokenToken(start);

        var Text text;
        text : this.TextToken(this.TextA, token);

        var Int value;
        value : this.ClassIntParse.Value(text);

        inf (value = null)
        {
            return null;
        }

        this.SetArg.Kind : this.NodeKind.IntValue;
        this.SetArg.Range.Start : start;
        this.SetArg.Range.End : end;
        this.SetArg.Field00 : value;
        var Node ret;
        ret : this.Operate.Execute();
        return ret;
    }

    maide prusate Node ExecuteStringValue(var Range range)
    {
        var Int start;
        var Int end;
        start : range.Start;
        end : range.End;

        inf (~(this.Count(start, end) = 1))
        {
            return null;
        }

        var TokenToken token;
        token : this.TokenToken(start);

        var Text text;
        text : this.TextToken(this.TextA, token);

        var Bool b;
        b : this.StringWrite.ValidValue(text);
        inf (~b)
        {
            return null;
        }

        var String value;
        value : this.Operate.ExecuteStringValue(text);

        this.SetArg.Kind : this.NodeKind.StringValue;
        this.SetArg.Range.Start : start;
        this.SetArg.Range.End : end;
        this.SetArg.Field00 : value;
        var Node ret;
        ret : this.Operate.Execute();
        return ret;
    }

    maide prusate Node ExecuteCount(var Range range)
    {
        var Int start;
        var Int end;
        start : range.Start;
        end : range.End;

        var Node a;
        inf (a = null)
        {
            a : this.ExecutePrusateCount(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecutePrecateCount(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecutePronateCount(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecutePrivateCount(this.Range(this.RangeA, start, end));
        }
        return a;
    }

    maide prusate Node ExecutePrusateCount(var Range range)
    {
        return this.ExecuteWord(this.NodeKind.PrusateCount, this.Index.Prusate, range);
    }

    maide prusate Node ExecutePrecateCount(var Range range)
    {
        return this.ExecuteWord(this.NodeKind.PrecateCount, this.Index.Precate, range);
    }

    maide prusate Node ExecutePronateCount(var Range range)
    {
        return this.ExecuteWord(this.NodeKind.PronateCount, this.Index.Pronate, range);
    }

    maide prusate Node ExecutePrivateCount(var Range range)
    {
        return this.ExecuteWord(this.NodeKind.PrivateCount, this.Index.Private, range);
    }

    maide prusate Node ExecuteExecute(var Range range)
    {
        var Int start;
        var Int end;
        start : range.Start;
        end : range.End;

        var Node a;
        inf (a = null)
        {
            a : this.ExecuteReturnExecute(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteInfExecute(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteWhileExecute(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteReferExecute(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteAreExecute(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteOperateExecute(this.Range(this.RangeA, start, end));
        }
        return a;
    }

    maide prusate Node ExecuteInfExecute(var Range range)
    {
        return this.ExecuteWordBraceBody(this.NodeKind.InfExecute, this.Index.Inf, range);
    }

    maide prusate Node ExecuteWhileExecute(var Range range)
    {
        return this.ExecuteWordBraceBody(this.NodeKind.WhileExecute, this.Index.While, range);
    }

    maide prusate Node ExecuteReturnExecute(var Range range)
    {
        var Int start;
        var Int end;
        start : range.Start;
        end : range.End;

        inf (start = end)
        {
            return null;
        }

        var Token returnToken;
        returnToken : this.Token(this.TokenA, this.Index.Return.Text, this.IndexRange(this.RangeA, start));
        inf (returnToken = null)
        {
            return null;
        }

        inf (returnToken.Range.End = end)
        {
            return null;
        }

        var Int lastIndex;
        lastIndex : end - 1;

        var Token signExecute;
        signExecute : this.Token(this.TokenB, this.Limit.Execute.Text, this.IndexRange(this.RangeA, lastIndex));
        inf (signExecute = null)
        {
            return null;
        }

        var Int resultStart;
        var Int resultEnd;
        resultStart : returnToken.Range.End;
        resultEnd : signExecute.Range.Start;

        var Node result;
        result : this.ExecuteOperate(this.Range(this.RangeA, resultStart, resultEnd));
        inf (result = null)
        {
            this.Error(this.ErrorKind.ResultUnvalid, resultStart, resultEnd);
        }

        this.SetArg.Kind : this.NodeKind.ReturnExecute;
        this.SetArg.Range.Start : start;
        this.SetArg.Range.End : end;
        this.SetArg.Field00 : result;
        var Node ret;
        ret : this.Operate.Execute();
        return ret;
    }

    maide prusate Node ExecuteReferExecute(var Range range)
    {
        var Int start;
        var Int end;
        start : range.Start;
        end : range.End;

        inf (start = end)
        {
            return null;
        }

        var Token varToken;
        varToken : this.Token(this.TokenA, this.Index.Var.Text, this.IndexRange(this.RangeA, start));
        inf (varToken = null)
        {
            return null;
        }

        inf (varToken.Range.End = end)
        {
            return null;
        }

        var Int lastIndex;
        lastIndex : end - 1;

        var Token signExecute;
        signExecute : this.Token(this.TokenB, this.Limit.Execute.Text, this.IndexRange(this.RangeA, lastIndex));
        inf (signExecute = null)
        {
            return null;
        }

        var Int varStart;
        var Int varEnd;
        varStart : start;
        varEnd : signExecute.Range.Start;

        var Node varVar;
        varVar : this.ExecuteVar(this.Range(this.RangeA, varStart, varEnd));
        inf (varVar = null)
        {
            this.Error(this.ErrorKind.VarUnvalid, varStart, varEnd);
        }

        this.SetArg.Kind : this.NodeKind.ReferExecute;
        this.SetArg.Range.Start : start;
        this.SetArg.Range.End : end;
        this.SetArg.Field00 : varVar;
        var Node ret;
        ret : this.Operate.Execute();
        return ret;
    }

    maide prusate Node ExecuteAreExecute(var Range range)
    {
        var Int start;
        var Int end;
        start : range.Start;
        end : range.End;

        inf (start = end)
        {
            return null;
        }

        var Int lastIndex;
        lastIndex : end - 1;

        var Token signExecute;
        signExecute : this.Token(this.TokenA, this.Limit.Execute.Text, this.IndexRange(this.RangeA, lastIndex));
        inf (signExecute = null)
        {
            return null;
        }

        var Token signAre;
        signAre : this.TokenFrontSkip(this.TokenB, this.Limit.Are.Text, this.Range(this.RangeA, start, signExecute.Range.Start));
        inf (signAre = null)
        {
            return null;
        }

        var Int markStart;
        var Int markEnd;
        markStart : start;
        markEnd : signAre.Range.Start;
        var Int valueStart;
        var Int valueEnd;
        valueStart : signAre.Range.End;
        valueEnd : signExecute.Range.Start;

        var Node mark;
        mark : this.ExecuteMark(this.Range(this.RangeA, markStart, markEnd));
        inf (mark = null)
        {
            this.Error(this.ErrorKind.MarkUnvalid, markStart, markEnd);
        }

        var Node value;
        value : this.ExecuteOperate(this.Range(this.RangeA, valueStart, valueEnd));
        inf (value = null)
        {
            this.Error(this.ErrorKind.ValueUnvalid, valueStart, valueEnd);
        }

        this.SetArg.Kind : this.NodeKind.AreExecute;
        this.SetArg.Range.Start : start;
        this.SetArg.Range.End : end;
        this.SetArg.Field00 : mark;
        this.SetArg.Field01 : value;
        var Node ret;
        ret : this.Operate.Execute();
        return ret;
    }

    maide prusate Node ExecuteOperateExecute(var Range range)
    {
        var Int start;
        var Int end;
        start : range.Start;
        end : range.End;

        inf (start = end)
        {
            return null;
        }

        var Int lastIndex;
        lastIndex : end - 1;

        var Token signExecute;
        signExecute : this.Token(this.TokenA, this.Limit.Execute.Text, this.IndexRange(this.RangeA, lastIndex));
        inf (signExecute = null)
        {
            return null;
        }

        var Int anyStart;
        var Int anyEnd;
        anyStart : start;
        anyEnd : signExecute.Range.Start;

        var Node any;
        any : this.ExecuteOperate(this.Range(this.RangeA, anyStart, anyEnd));
        inf (any = null)
        {
            this.Error(this.ErrorKind.AnyUnvalid, anyStart, anyEnd);
        }

        this.SetArg.Kind : this.NodeKind.OperateExecute;
        this.SetArg.Range.Start : start;
        this.SetArg.Range.End : end;
        this.SetArg.Field00 : any;
        var Node ret;
        ret : this.Operate.Execute();
        return ret;
    }

    maide prusate Node ExecuteOperate(var Range range)
    {
        var Int start;
        var Int end;
        start : range.Start;
        end : range.End;

        var Node a;
        inf (a = null)
        {
            a : this.ExecuteThisOperate(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteBaseOperate(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteNullOperate(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteNewOperate(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteShareOperate(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteCastOperate(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            inf (~(start = end))
            {
                var Token wordTokenA;
                wordTokenA : this.Token(this.TokenA, this.Index.Sign.Text, this.IndexRange(this.RangeA, start));
                inf (~(wordTokenA = null))
                {
                    inf (a = null)
                    {
                        a : this.ExecuteSignLessOperate(this.Range(this.RangeA, start, end));
                    }
                    inf (a = null)
                    {
                        a : this.ExecuteSignMulOperate(this.Range(this.RangeA, start, end));
                    }
                    inf (a = null)
                    {
                        a : this.ExecuteSignDivOperate(this.Range(this.RangeA, start, end));
                    }
                }
            }
        }
        inf (a = null)
        {
            inf (~(start = end))
            {
                var Token wordTokenB;
                wordTokenB : this.Token(this.TokenA, this.Index.Bit.Text, this.IndexRange(this.RangeA, start));
                inf (~(wordTokenB = null))
                {
                    inf (a = null)
                    {
                        a : this.ExecuteBitAndOperate(this.Range(this.RangeA, start, end));
                    }
                    inf (a = null)
                    {
                        a : this.ExecuteBitOrnOperate(this.Range(this.RangeA, start, end));
                    }
                    inf (a = null)
                    {
                        a : this.ExecuteBitNotOperate(this.Range(this.RangeA, start, end));
                    }
                    inf (a = null)
                    {
                        a : this.ExecuteBitLiteOperate(this.Range(this.RangeA, start, end));
                    }
                    inf (a = null)
                    {
                        a : this.ExecuteBitRiteOperate(this.Range(this.RangeA, start, end));
                    }
                    inf (a = null)
                    {
                        a : this.ExecuteBitSignRiteOperate(this.Range(this.RangeA, start, end));
                    }
                }
            }
        }
        inf (a = null)
        {
            a : this.ExecuteBraceOperate(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteVarOperate(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteValueOperate(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteAndOperate(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteOrnOperate(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteNotOperate(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteSameOperate(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteLessOperate(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteAddOperate(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteSubOperate(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteMulOperate(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteDivOperate(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteCallOperate(this.Range(this.RangeA, start, end));
        }
        inf (a = null)
        {
            a : this.ExecuteGetOperate(this.Range(this.RangeA, start, end));
        }
        return a;
    }

    maide prusate Node ExecuteGetOperate(var Range range)
    {
        return this.ExecuteDotField(this.NodeKind.GetOperate, range);
    }

    maide prusate Node ExecuteCallOperate(var Range range)
    {
        return this.ExecuteDotMaideCall(this.NodeKind.CallOperate, range);
    }

    maide prusate Node ExecuteThisOperate(var Range range)
    {
        return this.ExecuteWord(this.NodeKind.ThisOperate, this.Index.This, range);
    }

    maide prusate Node ExecuteBaseOperate(var Range range)
    {
        return this.ExecuteWord(this.NodeKind.BaseOperate, this.Index.Base, range);
    }

    maide prusate Node ExecuteNullOperate(var Range range)
    {
        return this.ExecuteWord(this.NodeKind.NullOperate, this.Index.Null, range);
    }

    maide prusate Node ExecuteNewOperate(var Range range)
    {
        return this.ExecuteWordClass(this.NodeKind.NewOperate, this.Index.New, range);
    }

    maide prusate Node ExecuteShareOperate(var Range range)
    {
        return this.ExecuteWordClass(this.NodeKind.ShareOperate, this.Index.Share, range);
    }

    maide prusate Node ExecuteCastOperate(var Range range)
    {
        var Int start;
        var Int end;
        start : range.Start;
        end : range.End;

        inf (start = end)
        {
            return null;
        }

        var Token castToken;
        castToken : this.Token(this.TokenA, this.Index.Cast.Text, this.IndexRange(this.RangeA, start));
        inf (castToken = null)
        {
            return null;
        }

        var Token braceRoundLite;
        braceRoundLite : this.TokenFront(this.TokenB, this.Limit.BraceRoundLite.Text, this.Range(this.RangeA, castToken.Range.End, end));
        inf (braceRoundLite = null)
        {
            return null;
        }

        var Token braceRoundRite;
        braceRoundRite : this.TokenBraceRoundRite(this.TokenC, this.Range(this.RangeA, braceRoundLite.Range.End, end));
        inf (braceRoundRite = null)
        {
            return null;
        }

        inf (~(braceRoundRite.Range.End = end))
        {
            return null;
        }

        var Int classStart;
        var Int classEnd;
        classStart : castToken.Range.End;
        classEnd : braceRoundLite.Range.Start;
        var Int anyStart;
        var Int anyEnd;
        anyStart : braceRoundLite.Range.End;
        anyEnd : braceRoundRite.Range.Start;

        var Node varClass;
        varClass : this.ExecuteName(this.NodeKind.ClassName, this.Range(this.RangeA, classStart, classEnd));
        inf (varClass = null)
        {
            this.Error(this.ErrorKind.ClassUnvalid, classStart, classEnd);
        }

        var Node any;
        any : this.ExecuteOperate(this.Range(this.RangeA, anyStart, anyEnd));
        inf (any = null)
        {
            this.Error(this.ErrorKind.AnyUnvalid, anyStart, anyEnd);
        }

        this.SetArg.Kind : this.NodeKind.CastOperate;
        this.SetArg.Range.Start : start;
        this.SetArg.Range.End : end;
        this.SetArg.Field00 : varClass;
        this.SetArg.Field01 : any;
        var Node ret;
        ret : this.Operate.Execute();
        return ret;
    }

    maide prusate Node ExecuteVarOperate(var Range range)
    {
        return this.ExecuteVarNameResult(this.NodeKind.VarOperate, range);
    }

    maide prusate Node ExecuteValueOperate(var Range range)
    {
        var Int start;
        var Int end;
        start : range.Start;
        end : range.End;

        var Node value;
        value : this.ExecuteValue(this.Range(this.RangeA, start, end));
        inf (value = null)
        {
            return null;
        }

        this.SetArg.Kind : this.NodeKind.ValueOperate;
        this.SetArg.Range.Start : start;
        this.SetArg.Range.End : end;
        this.SetArg.Field00 : value;
        var Node ret;
        ret : this.Operate.Execute();
        return ret;
    }
}