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

        var Data data;
        data : arg.NameValueCountData;

        var Data textData;
        textData : arg.NameValueTextData;

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
            kk : this.InfraInfra.DataIntGet(data, ka);

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
}