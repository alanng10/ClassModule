namespace Saber.Node;

public class Create : ClassCreate
{
    public override bool Init()
    {
        base.Init();
        this.InfraInfra = InfraInfra.This;
        this.ListInfra = ListInfra.This;
        this.ClassInfra = ClassInfra.This;
        this.Index = IndexList.This;
        this.Limit = LimitList.This;
        this.ErrorKind = ErrorKindList.This;
        this.NodeKind = NodeKindList.This;

        this.CountOperate = this.CreateCountOperate();
        this.KindOperate = this.CreateKindOperate();
        this.SetOperate = this.CreateSetOperate();
        this.SetArg = this.CreateSetArg();
        this.NameValid = this.CreateNameValid();
        this.ClassIntParse = this.CreateClassIntParse();
        this.StringWrite = this.CreateStringWrite();
        this.RangeA = this.CreateClassRange();
        this.RangeB = this.CreateClassRange();
        this.RangeC = this.CreateClassRange();
        this.RangeD = this.CreateClassRange();
        this.TokenA = this.CreateToken();
        this.TokenB = this.CreateToken();
        this.TokenC = this.CreateToken();
        this.TokenD = this.CreateToken();
        this.TokenE = this.CreateToken();
        this.TokenF = this.CreateToken();
        this.TokenG = this.CreateToken();
        this.TokenH = this.CreateToken();
        this.TokenI = this.CreateToken();

        this.InitListItemState();
        this.InitNodeState();
        return true;
    }

    protected virtual CreateCountOperate CreateCountOperate()
    {
        CreateCountOperate a;
        a = new CreateCountOperate();
        a.Create = this;
        a.Init();
        return a;
    }

    protected virtual CreateKindOperate CreateKindOperate()
    {
        CreateKindOperate a;
        a = new CreateKindOperate();
        a.Create = this;
        a.Init();
        return a;
    }

    protected virtual CreateSetOperate CreateSetOperate()
    {
        CreateSetOperate a;
        a = new CreateSetOperate();
        a.Create = this;
        a.Init();
        return a;
    }

    protected virtual CreateSetArg CreateSetArg()
    {
        CreateSetArg a;
        a = new CreateSetArg();
        a.Init();
        a.Range = new Range();
        a.Range.Init();
        return a;
    }

    protected virtual NameValid CreateNameValid()
    {
        NameValid a;
        a = new NameValid();
        a.Init();
        return a;
    }

    protected virtual IntParse CreateClassIntParse()
    {
        IntParse a;
        a = new IntParse();
        a.Init();
        return a;
    }

    protected virtual StringWrite CreateStringWrite()
    {
        StringWrite a;
        a = new StringWrite();
        a.Init();
        a.Arg = new StringWriteArg();
        a.Arg.Init();
        return a;
    }

    protected virtual Range CreateClassRange()
    {
        Range a;
        a = new Range();
        a.Init();
        return a;
    }

    protected virtual Token CreateToken()
    {
        Token a;
        a = new Token();
        a.Init();
        a.Range = new Range();
        a.Range.Init();
        return a;
    }

    public virtual Array Source { get; set; }
    public virtual Array Code { get; set; }
    public virtual String Task { get; set; }
    public virtual Result Result { get; set; }
    public virtual long SourceIndex { get; set; }
    public virtual CreateArg Arg { get; set; }
    public virtual CreateOperate Operate { get; set; }
    public virtual CreateCountOperate CountOperate { get; set; }
    public virtual CreateKindOperate KindOperate { get; set; }
    public virtual CreateSetOperate SetOperate { get; set; }
    public virtual CreateSetArg SetArg { get; set; }
    protected virtual InfraInfra InfraInfra { get; set; }
    protected virtual ListInfra ListInfra { get; set; }
    protected virtual ClassInfra ClassInfra { get; set; }
    protected virtual IndexList Index { get; set; }
    protected virtual LimitList Limit { get; set; }
    protected virtual ErrorKindList ErrorKind { get; set; }
    protected virtual NodeKindList NodeKind { get; set; }
    protected virtual Table NodeStateTable { get; set; }
    protected virtual NodeState NodeState { get; set; }
    protected virtual RangeState PartItemRangeState { get; set; }
    protected virtual RangeState StateItemRangeState { get; set; }
    protected virtual RangeState ParamItemRangeState { get; set; }
    protected virtual RangeState ArgueItemRangeState { get; set; }
    protected virtual NodeState PartItemNodeState { get; set; }
    protected virtual NodeState StateItemNodeState { get; set; }
    protected virtual NodeState ParamItemNodeState { get; set; }
    protected virtual NodeState ArgueItemNodeState { get; set; }
    protected virtual NameValid NameValid { get; set; }
    protected virtual IntParse ClassIntParse { get; set; }
    protected virtual StringWrite StringWrite { get; set; }
    protected virtual Range RangeA { get; set; }
    protected virtual Range RangeB { get; set; }
    protected virtual Range RangeC { get; set; }
    protected virtual Range RangeD { get; set; }
    protected virtual Token TokenA { get; set; }
    protected virtual Token TokenB { get; set; }
    protected virtual Token TokenC { get; set; }
    protected virtual Token TokenD { get; set; }
    protected virtual Token TokenE { get; set; }
    protected virtual Token TokenF { get; set; }
    protected virtual Token TokenG { get; set; }
    protected virtual Token TokenH { get; set; }
    protected virtual Token TokenI { get; set; }

    protected virtual bool InitListItemState()
    {
        this.PartItemRangeState = this.RangeStateSet(new PartItemRangeState());
        this.StateItemRangeState = this.RangeStateSet(new StateItemRangeState());
        this.ParamItemRangeState = this.RangeStateSet(new ParamItemRangeState());
        this.ArgueItemRangeState = this.RangeStateSet(new ArgueItemRangeState());

        this.PartItemNodeState = this.NodeStateSet(new PartItemNodeState());
        this.StateItemNodeState = this.NodeStateSet(new StateItemNodeState());
        this.ParamItemNodeState = this.NodeStateSet(new ParamItemNodeState());
        this.ArgueItemNodeState = this.NodeStateSet(new ArgueItemNodeState());
        return true;
    }

    private RangeState RangeStateSet(RangeState state)
    {
        state.Init();
        state.Create = this;
        state.Arg = new RangeStateArg();
        state.Arg.Init();
        return state;
    }

    private NodeState NodeStateSet(NodeState state)
    {
        state.Init();
        state.Create = this;
        return state;
    }

    protected virtual bool InitNodeState()
    {
        this.NodeStateTable = this.ClassInfra.TableCreateStringLess();

        long count;
        count = this.NodeKind.Count;
        int i;
        i = 0;
        while (i < count)
        {
            NodeKind kind;
            kind = this.NodeKind.Get(i);
            this.AddNodeState(kind);
            i = i + 1;
        }
        return true;
    }

    protected virtual bool AddNodeState(NodeKind kind)
    {
        kind.NodeState.Create = this;

        this.ListInfra.TableAdd(this.NodeStateTable, kind.Name, kind.NodeState);
        return true;
    }

    public override bool Execute()
    {
        this.Result = new Result();
        this.Result.Init();

        Array rootArray;
        rootArray = this.ListInfra.ArrayCreate(this.Code.Count);
        this.Result.Root = rootArray;

        this.NodeState = this.NodeStateTable.Get(this.Task) as NodeState;
        if (this.NodeState == null)
        {
            Array ka;
            ka = this.ListInfra.ArrayCreate(0);
            this.Result.Error = ka;
            return true;
        }

        this.Arg = new CreateArg();
        this.Arg.Init();

        CreateArg arg;
        arg = this.Arg;

        this.Operate = this.CountOperate;

        this.ResetStage();
        this.ExecuteStage();

        arg.NodeData = this.DataCreate(arg.NodeIndex);
        arg.ListData = this.DataCreate(arg.ListIndex * sizeof(ulong));
        arg.NameValueCountData = this.DataCreate(arg.NameValueIndex * sizeof(ulong));
        arg.NameValueTextData = this.DataCreate(arg.NameValueTextIndex * sizeof(uint));
        arg.StringValueCountData = this.DataCreate(arg.StringValueIndex * sizeof(ulong));
        arg.StringValueTextData = this.DataCreate(arg.StringValueTextIndex * sizeof(uint));
        
        this.Operate = this.KindOperate;

        this.ResetStage();
        this.ExecuteStage();

        arg.NodeArray = this.ListInfra.ArrayCreate(arg.NodeIndex);
        arg.ListArray = this.ListInfra.ArrayCreate(arg.ListIndex);
        arg.NameValueArray = this.ListInfra.ArrayCreate(arg.NameValueIndex);
        arg.StringValueArray = this.ListInfra.ArrayCreate(arg.StringValueIndex);
        arg.ErrorArray = this.ListInfra.ArrayCreate(arg.ErrorIndex);

        this.ExecuteCreateNode();
        this.ExecuteCreateList();
        this.ExecuteCreateNameValue();
        this.ExecuteCreateStringValue();
        this.ExecuteCreateError();

        this.Operate = this.SetOperate;

        this.ResetStage();
        this.ExecuteStage();

        this.Result.Error = arg.ErrorArray;

        this.Operate = null;
        this.Arg = null;
        return true;
    }
    
    public virtual bool ResetStage()
    {
        CreateArg arg;
        arg = this.Arg;

        arg.NodeIndex = 0;
        arg.ListIndex = 0;
        arg.NameValueIndex = 0;
        arg.NameValueTextIndex = 0;
        arg.StringValueIndex = 0;
        arg.StringValueTextIndex = 0;
        arg.ErrorIndex = 0;
        return true;
    }

    protected virtual bool SetArgClear()
    {
        CreateSetArg a;
        a = this.SetArg;
        a.Kind = null;
        a.Field00 = null;
        a.Field01 = null;
        a.Field02 = null;
        a.Field03 = null;
        a.Field04 = null;
        a.FieldBool = false;
        a.FieldInt = 0;
        a.Range.Start = 0;
        a.Range.End = 0;
        return true;
    }

    public virtual long StringValueCount(Text text)
    {
        StringWrite write;
        write = this.StringWrite;

        write.Text = text;

        write.Operate = write.CountOperate;
        write.ResetStage();
        write.ExecuteStage();

        long a;
        a = write.Arg.Index;

        write.Operate = null;
        write.Text = null;
        return a;
    }

    public virtual bool StringValueSet(Text text)
    {
        StringWrite write;
        write = this.StringWrite;

        write.Text = text;

        write.Operate = write.SetOperate;

        write.Arg.Index = this.Arg.StringValueTextIndex;
        write.Arg.Data = this.Arg.StringValueTextData;

        write.ExecuteStage();

        write.Arg.Data = null;
        write.Arg.Index = 0;
        write.Operate = null;
        write.Text = null;
        return true;
    }

    protected virtual Data DataCreate(long count)
    {
        Data a;
        a = new Data();
        a.Count = count;
        a.Init();
        return a;
    }

    protected virtual bool ExecuteCreateNode()
    {
        CreateArg arg;
        arg = this.Arg;

        Array array;
        array = arg.NodeArray;

        Data data;
        data = arg.NodeData;

        long count;
        count = array.Count;
        long i;
        i = 0;
        while (i < count)
        {
            long ka;
            ka = data.Get(i);
            NodeKind kind;
            kind = this.NodeKind.Get(ka);

            InfraState newState;
            newState = kind.NewState;
            newState.Execute();

            object k;
            k = newState.Result;
            newState.Result = null;

            Node a;
            a = k as Node;
            a.Init();
            a.Range = this.CreateClassRange();

            array.SetAt(i, a);

            i = i + 1;
        }
        return true;
    }

    protected virtual bool ExecuteCreateList()
    {
        CreateArg arg;
        arg = this.Arg;

        Array array;
        array = arg.ListArray;

        Data data;
        data = arg.ListData;

        long count;
        count = array.Count;
        long i;
        i = 0;
        while (i < count)
        {
            long ka;
            ka = i;
            ka = ka * sizeof(ulong);

            long k;
            k = this.InfraInfra.DataIntGet(data, ka);

            Array a;
            a = this.ListInfra.ArrayCreate(k);

            array.SetAt(i, a);

            i = i + 1;
        }
        return true;
    }

    protected virtual bool ExecuteCreateError()
    {
        Array array;
        array = this.Arg.ErrorArray;

        long count;
        count = array.Count;
        long i;
        i = 0;
        while (i < count)
        {
            Error a;
            a = new Error();
            a.Init();
            a.Range = this.CreateClassRange();

            array.SetAt(i, a);

            i = i + 1;
        }
        return true;
    }

    protected virtual bool ExecuteCreateNameValue()
    {
        CreateArg arg;
        arg = this.Arg;

        Array array;
        array = arg.NameValueArray;

        Data countData;
        countData = arg.NameValueCountData;

        Data textData;
        textData = arg.NameValueTextData;

        this.PrivateExecuteCreateString(array, countData, textData);
        return true;
    }

    protected virtual bool ExecuteCreateStringValue()
    {
        CreateArg arg;
        arg = this.Arg;

        Array array;
        array = arg.StringValueArray;

        Data countData;
        countData = arg.StringValueCountData;

        Data textData;
        textData = arg.StringValueTextData;

        this.PrivateExecuteCreateString(array, countData, textData);
        return true;
    }

    private bool PrivateExecuteCreateString(Array array, Data countData, Data textData)
    {
        Text text;
        text = this.TextA;

        long total;
        total = 0;

        long count;
        count = array.Count;
        long i;
        i = 0;
        while (i < count)
        {
            long ka;
            ka = i;
            ka = ka * sizeof(ulong);

            long kk;
            kk = this.InfraInfra.DataIntGet(countData, ka);

            text.Data = textData;
            text.Range.Index = total;
            text.Range.Count = kk;

            String a;
            a = this.StringCreate(text);

            this.ClearText(text);

            array.SetAt(i, a);

            total = total + kk;

            i = i + 1;
        }
        return true;
    }

    public virtual bool ExecuteStage()
    {
        long count;
        count = this.Code.Count;
        long i;
        i = 0;
        while (i < count)
        {
            Node root;
            root = this.ExecuteRoot(i);

            this.Result.Root.SetAt(i, root);

            i = i + 1;
        }

        this.SetArgClear();
        this.ClearData();
        return true;
    }

    protected virtual Node ExecuteRoot(long sourceIndex)
    {
        this.SourceIndex = sourceIndex;

        Code code;
        code = this.Code.GetAt(this.SourceIndex) as Code;

        long rangeStart;
        long rangeEnd;
        rangeStart = 0;
        rangeEnd = code.Token.Count;

        this.Range(this.RangeA, rangeStart, rangeEnd);

        this.NodeState.Arg = this.RangeA;
        this.NodeState.Execute();

        Node node;
        node = this.NodeState.Result as Node;

        this.NodeState.Result = null;
        this.NodeState.Arg = null;

        if (node == null)
        {
            this.Error(this.ErrorKind.Unvalid, rangeStart, rangeEnd);
        }

        Node a;
        a = node;
        return a;
    }

    public virtual Node ExecuteClass(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (start == end)
        {
            return null;
        }

        Token classToken;
        classToken = this.Token(this.TokenA, this.Index.Class.Text, this.IndexRange(this.RangeA, start));
        if (classToken == null)
        {
            return null;
        }

        Token colon;
        colon = this.TokenFront(this.TokenB, this.Limit.Are.Text, this.Range(this.RangeA, classToken.Range.End, end));
        if (colon == null)
        {
            return null;
        }

        Token braceCurveLite;
        braceCurveLite = this.TokenFront(this.TokenC, this.Limit.BraceCurveLite.Text, this.Range(this.RangeA, colon.Range.End, end));
        if (braceCurveLite == null)
        {
            return null;
        }

        Token braceCurveRite;
        braceCurveRite = this.TokenBraceCurveRite(this.TokenD, this.Range(this.RangeA, braceCurveLite.Range.End, end));
        if (braceCurveRite == null)
        {
            return null;
        }

        if (!(braceCurveRite.Range.End == end))
        {
            return null;
        }

        long nameStart;
        long nameEnd;
        nameStart = classToken.Range.End;
        nameEnd = colon.Range.Start;
        long baseStart;
        long baseEnd;
        baseStart = colon.Range.End;
        baseEnd = braceCurveLite.Range.Start;
        long partStart;
        long partEnd;
        partStart = braceCurveLite.Range.End;
        partEnd = braceCurveRite.Range.Start;

        Node name;
        name = this.ExecuteName(this.NodeKind.ClassName, this.Range(this.RangeA, nameStart, nameEnd));
        if (name == null)
        {
            this.Error(this.ErrorKind.NameUnvalid, nameStart, nameEnd);
        }

        Node varBase;
        varBase = this.ExecuteName(this.NodeKind.ClassName, this.Range(this.RangeA, baseStart, baseEnd));
        if (varBase == null)
        {
            this.Error(this.ErrorKind.BaseUnvalid, baseStart, baseEnd);
        }

        Node part;
        part = this.ExecutePart(this.Range(this.RangeA, partStart, partEnd));
        if (part == null)
        {
            this.Error(this.ErrorKind.PartUnvalid, partStart, partEnd);
        }

        this.SetArg.Kind = this.NodeKind.Class;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = name;
        this.SetArg.Field01 = varBase;
        this.SetArg.Field02 = part;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    public virtual Node ExecuteField(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (start == end)
        {
            return null;
        }

        Token fieldToken;
        fieldToken = this.Token(this.TokenA, this.Index.Field.Text, this.IndexRange(this.RangeA, start));
        if (fieldToken == null)
        {
            return null;
        }

        Token braceCurveLite;
        braceCurveLite = this.TokenFront(this.TokenB, this.Limit.BraceCurveLite.Text, this.Range(this.RangeA, fieldToken.Range.End, end));
        if (braceCurveLite == null)
        {
            return null;
        }

        Token braceCurveRite;
        braceCurveRite = this.TokenBraceCurveRite(this.TokenC, this.Range(this.RangeA, braceCurveLite.Range.End, end));
        if (braceCurveRite == null)
        {
            return null;
        }

        if (!(braceCurveRite.Range.End == end))
        {
            return null;
        }

        long countStart;
        long countEnd;
        countStart = fieldToken.Range.End;
        countEnd = countStart + 1;

        long ke;
        ke = braceCurveLite.Range.Start;

        if (ke < countEnd)
        {
            countEnd = ke;
        }

        long classStart;
        long classEnd;
        classStart = countEnd;
        classEnd = classStart + 1;

        if (ke < classEnd)
        {
            classEnd = ke;
        }

        long nameStart;
        long nameEnd;
        nameStart = classEnd;
        nameEnd = ke;

        long braceStart;
        long braceEnd;
        braceStart = braceCurveLite.Range.End;
        braceEnd = braceCurveRite.Range.Start;

        Node count;
        count = this.ExecuteCount(this.Range(this.RangeA, countStart, countEnd));
        if (count == null)
        {
            this.Error(this.ErrorKind.CountUnvalid, countStart, countEnd);
        }

        Node varClass;
        varClass = this.ExecuteName(this.NodeKind.ClassName, this.Range(this.RangeA, classStart, classEnd));
        if (varClass == null)
        {
            this.Error(this.ErrorKind.ClassUnvalid, classStart, classEnd);
        }

        Node name;
        name = this.ExecuteName(this.NodeKind.FieldName, this.Range(this.RangeA, nameStart, nameEnd));
        if (name == null)
        {
            this.Error(this.ErrorKind.NameUnvalid, nameStart, nameEnd);
        }

        bool b;
        b = false;

        if (!b)
        {
            if (braceStart == braceEnd)
            {
                b = true;
            }
        }

        Token getToken;
        getToken = null;
        if (!b)
        {
            getToken = this.Token(this.TokenD, this.Index.ItemGet.Text, this.IndexRange(this.RangeA, braceStart));
            if (getToken == null)
            {
                b = true;
            }
        }

        if (!b)
        {
            if (getToken.Range.End == braceEnd)
            {
                b = true;
            }
        }

        Token getBraceLite;
        getBraceLite = null;
        if (!b)
        {
            getBraceLite = this.Token(this.TokenE, this.Limit.BraceCurveLite.Text, this.IndexRange(this.RangeA, getToken.Range.End));
            if (getBraceLite == null)
            {
                b = true;
            }
        }

        Token getBraceRite;
        getBraceRite = null;
        if (!b)
        {
            getBraceRite = this.TokenBraceCurveRite(this.TokenF, this.Range(this.RangeA, getBraceLite.Range.End, braceEnd));
            if (getBraceRite == null)
            {
                b = true;
            }
        }

        if (!b)
        {
            if (getBraceRite.Range.End == braceEnd)
            {
                b = true;
            }
        }

        Token setToken;
        setToken = null;
        if (!b)
        {
            setToken = this.Token(this.TokenG, this.Index.Set.Text, this.IndexRange(this.RangeA, getBraceRite.Range.End));
            if (setToken == null)
            {
                b = true;
            }
        }

        if (!b)
        {
            if (setToken.Range.End == braceEnd)
            {
                b = true;
            }
        }

        Token setBraceLite;
        setBraceLite = null;
        if (!b)
        {
            setBraceLite = this.Token(this.TokenH, this.Limit.BraceCurveLite.Text, this.IndexRange(this.RangeA, setToken.Range.End));
            if (setBraceLite == null)
            {
                b = true;
            }
        }

        Token setBraceRite;
        setBraceRite = null;
        if (!b)
        {
            setBraceRite = this.TokenBraceCurveRite(this.TokenI, this.Range(this.RangeA, setBraceLite.Range.End, braceEnd));
            if (setBraceRite == null)
            {
                b = true;
            }
        }

        if (!b)
        {
            if (!(setBraceRite.Range.End == braceEnd))
            {
                b = true;
            }
        }

        Node varGet;
        varGet = null;

        Node varSet;
        varSet = null;

        if (!b)
        {
            long getStart;
            long getEnd;
            getStart = getBraceLite.Range.End;
            getEnd = getBraceRite.Range.Start;
            long setStart;
            long setEnd;
            setStart = setBraceLite.Range.End;
            setEnd = setBraceRite.Range.Start;
            
            varGet = this.ExecuteState(this.Range(this.RangeA, getStart, getEnd));

            varSet = this.ExecuteState(this.Range(this.RangeA, setStart, setEnd));
        }

        if (varGet == null)
        {
            this.Error(this.ErrorKind.GetUnvalid, braceStart, braceEnd);
        }

        if (varSet == null)
        {
            this.Error(this.ErrorKind.SetUnvalid, braceStart, braceEnd);
        }

        this.SetArg.Kind = this.NodeKind.Field;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = varClass;
        this.SetArg.Field01 = name;
        this.SetArg.Field02 = count;
        this.SetArg.Field03 = varGet;
        this.SetArg.Field04 = varSet;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    public virtual Node ExecuteMaide(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (start == end)
        {
            return null;
        }

        Token maideToken;
        maideToken = this.Token(this.TokenA, this.Index.Maide.Text, this.IndexRange(this.RangeA, start));
        if (maideToken == null)
        {
            return null;
        }

        Token braceRoundLite;
        braceRoundLite = this.TokenFront(this.TokenB, this.Limit.BraceRoundLite.Text, this.Range(this.RangeA, maideToken.Range.End, end));
        if (braceRoundLite == null)
        {
            return null;
        }

        Token braceRoundRite;
        braceRoundRite = this.TokenBraceRoundRite(this.TokenC, this.Range(this.RangeA, braceRoundLite.Range.End, end));
        if (braceRoundRite == null)
        {
            return null;
        }

        if (braceRoundRite.Range.End == end)
        {
            return null;
        }

        Token braceCurveLite;
        braceCurveLite = this.Token(this.TokenD, this.Limit.BraceCurveLite.Text, this.IndexRange(this.RangeA, braceRoundRite.Range.End));
        if (braceCurveLite == null)
        {
            return null;
        }

        Token braceCurveRite;
        braceCurveRite = this.TokenBraceCurveRite(this.TokenE, this.Range(this.RangeA, braceCurveLite.Range.End, end));
        if (braceCurveRite == null)
        {
            return null;
        }

        if (!(braceCurveRite.Range.End == end))
        {
            return null;
        }

        long countStart;
        long countEnd;
        countStart = maideToken.Range.End;
        countEnd = countStart + 1;

        long ke;
        ke = braceRoundLite.Range.Start;

        if (ke < countEnd)
        {
            countEnd = ke;
        }

        long classStart;
        long classEnd;
        classStart = countEnd;
        classEnd = classStart + 1;

        if (ke < classEnd)
        {
            classEnd = ke;
        }

        long nameStart;
        long nameEnd;
        nameStart = classEnd;
        nameEnd = ke;
        
        long paramStart;
        long paramEnd;
        paramStart = braceRoundLite.Range.End;
        paramEnd = braceRoundRite.Range.Start;
        long callStart;
        long callEnd;
        callStart = braceCurveLite.Range.End;
        callEnd = braceCurveRite.Range.Start;

        Node count;
        count = this.ExecuteCount(this.Range(this.RangeA, countStart, countEnd));
        if (count == null)
        {
            this.Error(this.ErrorKind.CountUnvalid, countStart, countEnd);
        }

        Node varClass;
        varClass = this.ExecuteName(this.NodeKind.ClassName, this.Range(this.RangeA, classStart, classEnd));
        if (varClass == null)
        {
            this.Error(this.ErrorKind.ClassUnvalid, classStart, classEnd);
        }

        Node name;
        name = this.ExecuteName(this.NodeKind.MaideName, this.Range(this.RangeA, nameStart, nameEnd));
        if (name == null)
        {
            this.Error(this.ErrorKind.NameUnvalid, nameStart, nameEnd);
        }

        Node param;
        param = this.ExecuteParam(this.Range(this.RangeA, paramStart, paramEnd));
        if (param == null)
        {
            this.Error(this.ErrorKind.ParamUnvalid, paramStart, paramEnd);
        }

        Node call;
        call = this.ExecuteState(this.Range(this.RangeA, callStart, callEnd));
        if (call == null)
        {
            this.Error(this.ErrorKind.CallUnvalid, callStart, callEnd);
        }

        this.SetArg.Kind = this.NodeKind.Maide;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = varClass;
        this.SetArg.Field01 = name;
        this.SetArg.Field02 = count;
        this.SetArg.Field03 = param;
        this.SetArg.Field04 = call;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    public virtual Node ExecuteVar(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        long count;
        count = this.Count(start, end);

        if (count < 1 | 3 < count)
        {
            return null;
        }

        Token varToken;
        varToken = this.Token(this.TokenA, this.Index.Var.Text, this.IndexRange(this.RangeA, start));
        if (varToken == null)
        {
            return null;
        }

        long classStart;
        long classEnd;
        classStart = varToken.Range.End;
        classEnd = classStart + 1;

        if (end < classEnd)
        {
            classEnd = end;
        }
        
        long nameStart;
        long nameEnd;
        nameStart = classEnd;
        nameEnd = end;

        Node varClass;
        varClass = this.ExecuteName(this.NodeKind.ClassName, this.Range(this.RangeA, classStart, classEnd));
        if (varClass == null)
        {
            this.Error(this.ErrorKind.ClassUnvalid, classStart, classEnd);
        }

        Node name;
        name = this.ExecuteName(this.NodeKind.VarName, this.Range(this.RangeA, nameStart, nameEnd));
        if (name == null)
        {
            this.Error(this.ErrorKind.NameUnvalid, nameStart, nameEnd);
        }

        this.SetArg.Kind = this.NodeKind.Var;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = varClass;
        this.SetArg.Field01 = name;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    public virtual Node ExecuteClassName(Range range)
    {
        return this.ExecuteName(this.NodeKind.ClassName, range);
    }

    public virtual Node ExecuteFieldName(Range range)
    {
        return this.ExecuteName(this.NodeKind.FieldName, range);
    }

    public virtual Node ExecuteMaideName(Range range)
    {
        return this.ExecuteName(this.NodeKind.MaideName, range);
    }

    public virtual Node ExecuteVarName(Range range)
    {
        return this.ExecuteName(this.NodeKind.VarName, range);
    }

    public virtual Node ExecutePart(Range range)
    {
        return this.ExecuteList(this.NodeKind.Part, this.PartItemRangeState, this.PartItemNodeState, range);
    }

    public virtual Node ExecuteState(Range range)
    {
        return this.ExecuteList(this.NodeKind.State, this.StateItemRangeState, this.StateItemNodeState, range);
    }

    public virtual Node ExecuteParam(Range range)
    {
        return this.ExecuteListComma(this.NodeKind.Param, this.ParamItemRangeState, this.ParamItemNodeState, range);
    }

    public virtual Node ExecuteArgue(Range range)
    {
        return this.ExecuteListComma(this.NodeKind.Argue, this.ArgueItemRangeState, this.ArgueItemNodeState, range);
    }

    public virtual Node ExecuteComp(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        Node a;
        a = null;
        if (a == null)
        {
            a = this.ExecuteField(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteMaide(this.Range(this.RangeA, start, end));
        }
       return a;
    }

    public virtual Node ExecuteMark(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        Node a;
        a = null;
        if (a == null)
        {
            a = this.ExecuteVarMark(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteSetMark(this.Range(this.RangeA, start, end));
        }
        return a;
    }

    public virtual Node ExecuteVarMark(Range range)
    {
        return this.ExecuteVarNameResult(this.NodeKind.VarMark, range);
    }

    public virtual Node ExecuteSetMark(Range range)
    {
        return this.ExecuteDotField(this.NodeKind.SetMark, range);
    }

    public virtual Node ExecuteValue(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        Node a;
        a = null;
        if (a == null)
        {
            a = this.ExecuteBoolValue(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteIntHexSignValue(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteIntHexValue(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteIntSignValue(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteIntValue(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteStringValue(this.Range(this.RangeA, start, end));
        }
        return a;
    }

    public virtual Node ExecuteBoolValue(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (!(this.Count(start, end) == 1))
        {
            return null;
        }

        TokenToken token;
        token = this.TokenToken(start);

        Text text;
        text = this.TextToken(this.TextA, token);

        bool value;
        value = false;

        bool b;
        b = false;
        if (!b)
        {
            if (this.TextSame(text, this.TB(this.Index.True.Text)))
            {
                value = true;
                b = true;
            }
        }
        if (!b)
        {
            if (this.TextSame(text, this.TB(this.Index.False.Text)))
            {
                value = false;
                b = true;
            }
        }

        if (!b)
        {
            return null;
        }

        this.SetArg.Kind = this.NodeKind.BoolValue;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.FieldBool = value;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    public virtual Node ExecuteIntHexSignValue(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (!(this.Count(start, end) == 1))
        {
            return null;
        }

        TokenToken token;
        token = this.TokenToken(start);

        Text text;
        text = this.TextToken(this.TextA, token);

        long value;
        value = this.ClassIntParse.HexSignValue(text);

        if (value == -1)
        {
            return null;
        }

        this.SetArg.Kind = this.NodeKind.IntHexSignValue;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.FieldInt = value;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    public virtual Node ExecuteIntHexValue(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (!(this.Count(start, end) == 1))
        {
            return null;
        }

        TokenToken token;
        token = this.TokenToken(start);

        Text text;
        text = this.TextToken(this.TextA, token);

        long value;
        value = this.ClassIntParse.HexValue(text);

        if (value == -1)
        {
            return null;
        }

        this.SetArg.Kind = this.NodeKind.IntHexValue;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.FieldInt = value;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    public virtual Node ExecuteIntSignValue(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (!(this.Count(start, end) == 1))
        {
            return null;
        }

        TokenToken token;
        token = this.TokenToken(start);

        Text text;
        text = this.TextToken(this.TextA, token);

        long value;
        value = this.ClassIntParse.SignValue(text);

        if (value == -1)
        {
            return null;
        }

        this.SetArg.Kind = this.NodeKind.IntSignValue;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.FieldInt = value;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    public virtual Node ExecuteIntValue(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (!(this.Count(start, end) == 1))
        {
            return null;
        }

        TokenToken token;
        token = this.TokenToken(start);

        Text text;
        text = this.TextToken(this.TextA, token);

        long value;
        value = this.ClassIntParse.Value(text);

        if (value == -1)
        {
            return null;
        }

        this.SetArg.Kind = this.NodeKind.IntValue;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.FieldInt = value;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    public virtual Node ExecuteStringValue(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (!(this.Count(start, end) == 1))
        {
            return null;
        }

        TokenToken token;
        token = this.TokenToken(start);

        Text text;
        text = this.TextToken(this.TextA, token);

        bool b;
        b = this.StringWrite.ValidValue(text);
        if (!b)
        {
            return null;
        }

        String value;
        value = this.Operate.ExecuteStringValue(text);

        this.SetArg.Kind = this.NodeKind.StringValue;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = value;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    public virtual Node ExecuteCount(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        Node a;
        a = null;
        if (a == null)
        {
            a = this.ExecutePrusateCount(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecutePrecateCount(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecutePronateCount(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecutePrivateCount(this.Range(this.RangeA, start, end));
        }
        return a;
    }

    public virtual Node ExecutePrusateCount(Range range)
    {
        return this.ExecuteWord(this.NodeKind.PrusateCount, this.Index.Prusate, range);
    }

    public virtual Node ExecutePrecateCount(Range range)
    {
        return this.ExecuteWord(this.NodeKind.PrecateCount, this.Index.Precate, range);
    }

    public virtual Node ExecutePronateCount(Range range)
    {
        return this.ExecuteWord(this.NodeKind.PronateCount, this.Index.Pronate, range);
    }

    public virtual Node ExecutePrivateCount(Range range)
    {
        return this.ExecuteWord(this.NodeKind.PrivateCount, this.Index.Private, range);
    }

    public virtual Node ExecuteExecute(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        Node a;
        a = null;
        if (a == null)
        {
            a = this.ExecuteReturnExecute(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteInfExecute(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteWhileExecute(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteReferExecute(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteAreExecute(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteOperateExecute(this.Range(this.RangeA, start, end));
        }
        return a;
    }

    public virtual Node ExecuteInfExecute(Range range)
    {
        return this.ExecuteWordBraceBody(this.NodeKind.InfExecute, this.Index.Inf, range);
    }

    public virtual Node ExecuteWhileExecute(Range range)
    {
        return this.ExecuteWordBraceBody(this.NodeKind.WhileExecute, this.Index.While, range);
    }

    public virtual Node ExecuteReturnExecute(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (start == end)
        {
            return null;
        }

        Token returnToken;
        returnToken = this.Token(this.TokenA, this.Index.Return.Text, this.IndexRange(this.RangeA, start));
        if (returnToken == null)
        {
            return null;
        }

        if (returnToken.Range.End == end)
        {
            return null;
        }

        long lastIndex;
        lastIndex = end - 1;

        Token signExecute;
        signExecute = this.Token(this.TokenB, this.Limit.Execute.Text, this.IndexRange(this.RangeA, lastIndex));
        if (signExecute == null)
        {
            return null;
        }

        long resultStart;
        long resultEnd;
        resultStart = returnToken.Range.End;
        resultEnd = signExecute.Range.Start;

        Node result;
        result = this.ExecuteOperate(this.Range(this.RangeA, resultStart, resultEnd));
        if (result == null)
        {
            this.Error(this.ErrorKind.ResultUnvalid, resultStart, resultEnd);
        }

        this.SetArg.Kind = this.NodeKind.ReturnExecute;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = result;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    public virtual Node ExecuteReferExecute(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (start == end)
        {
            return null;
        }

        Token varToken;
        varToken = this.Token(this.TokenA, this.Index.Var.Text, this.IndexRange(this.RangeA, start));
        if (varToken == null)
        {
            return null;
        }

        if (varToken.Range.End == end)
        {
            return null;
        }

        long lastIndex;
        lastIndex = end - 1;

        Token signExecute;
        signExecute = this.Token(this.TokenB, this.Limit.Execute.Text, this.IndexRange(this.RangeA, lastIndex));
        if (signExecute == null)
        {
            return null;
        }

        long varStart;
        long varEnd;
        varStart = start;
        varEnd = signExecute.Range.Start;

        Node varVar;
        varVar = this.ExecuteVar(this.Range(this.RangeA, varStart, varEnd));
        if (varVar == null)
        {
            this.Error(this.ErrorKind.VarUnvalid, varStart, varEnd);
        }

        this.SetArg.Kind = this.NodeKind.ReferExecute;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = varVar;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    public virtual Node ExecuteAreExecute(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (start == end)
        {
            return null;
        }

        long lastIndex;
        lastIndex = end - 1;

        Token signExecute;
        signExecute = this.Token(this.TokenA, this.Limit.Execute.Text, this.IndexRange(this.RangeA, lastIndex));
        if (signExecute == null)
        {
            return null;
        }

        Token signAre;
        signAre = this.TokenFrontSkip(this.TokenB, this.Limit.Are.Text, this.Range(this.RangeA, start, signExecute.Range.Start));
        if (signAre == null)
        {
            return null;
        }

        long markStart;
        long markEnd;
        markStart = start;
        markEnd = signAre.Range.Start;
        long valueStart;
        long valueEnd;
        valueStart = signAre.Range.End;
        valueEnd = signExecute.Range.Start;

        Node mark;
        mark = this.ExecuteMark(this.Range(this.RangeA, markStart, markEnd));
        if (mark == null)
        {
            this.Error(this.ErrorKind.MarkUnvalid, markStart, markEnd);
        }

        Node value;
        value = this.ExecuteOperate(this.Range(this.RangeA, valueStart, valueEnd));
        if (value == null)
        {
            this.Error(this.ErrorKind.ValueUnvalid, valueStart, valueEnd);
        }

        this.SetArg.Kind = this.NodeKind.AreExecute;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = mark;
        this.SetArg.Field01 = value;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    public virtual Node ExecuteOperateExecute(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (start == end)
        {
            return null;
        }

        long lastIndex;
        lastIndex = end - 1;

        Token signExecute;
        signExecute = this.Token(this.TokenA, this.Limit.Execute.Text, this.IndexRange(this.RangeA, lastIndex));
        if (signExecute == null)
        {
            return null;
        }

        long anyStart;
        long anyEnd;
        anyStart = start;
        anyEnd = signExecute.Range.Start;

        Node any;
        any = this.ExecuteOperate(this.Range(this.RangeA, anyStart, anyEnd));
        if (any == null)
        {
            this.Error(this.ErrorKind.AnyUnvalid, anyStart, anyEnd);
        }

        this.SetArg.Kind = this.NodeKind.OperateExecute;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = any;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    public virtual Node ExecuteOperate(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        Node a;
        a = null;
        if (a == null)
        {
            a = this.ExecuteThisOperate(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteBaseOperate(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteNullOperate(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteNewOperate(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteShareOperate(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteCastOperate(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            if (!(start == end))
            {
                Token wordTokenA;
                wordTokenA = this.Token(this.TokenA, this.Index.Sign.Text, this.IndexRange(this.RangeA, start));
                if (!(wordTokenA == null))
                {
                    if (a == null)
                    {
                        a = this.ExecuteSignLessOperate(this.Range(this.RangeA, start, end));
                    }
                    if (a == null)
                    {
                        a = this.ExecuteSignMulOperate(this.Range(this.RangeA, start, end));
                    }
                    if (a == null)
                    {
                        a = this.ExecuteSignDivOperate(this.Range(this.RangeA, start, end));
                    }
                }
            }
        }
        if (a == null)
        {
            if (!(start == end))
            {
                Token wordTokenB;
                wordTokenB = this.Token(this.TokenA, this.Index.Bit.Text, this.IndexRange(this.RangeA, start));
                if (!(wordTokenB == null))
                {
                    if (a == null)
                    {
                        a = this.ExecuteBitAndOperate(this.Range(this.RangeA, start, end));
                    }
                    if (a == null)
                    {
                        a = this.ExecuteBitOrnOperate(this.Range(this.RangeA, start, end));
                    }
                    if (a == null)
                    {
                        a = this.ExecuteBitNotOperate(this.Range(this.RangeA, start, end));
                    }
                    if (a == null)
                    {
                        a = this.ExecuteBitLiteOperate(this.Range(this.RangeA, start, end));
                    }
                    if (a == null)
                    {
                        a = this.ExecuteBitRiteOperate(this.Range(this.RangeA, start, end));
                    }
                    if (a == null)
                    {
                        a = this.ExecuteBitSignRiteOperate(this.Range(this.RangeA, start, end));
                    }
                }
            }
        }
        if (a == null)
        {
            a = this.ExecuteBraceOperate(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteVarOperate(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteValueOperate(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteAndOperate(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteOrnOperate(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteNotOperate(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteSameOperate(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteLessOperate(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteAddOperate(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteSubOperate(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteMulOperate(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteDivOperate(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteCallOperate(this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteGetOperate(this.Range(this.RangeA, start, end));
        }
        return a;
    }

    public virtual Node ExecuteGetOperate(Range range)
    {
        return this.ExecuteDotField(this.NodeKind.GetOperate, range);
    }

    public virtual Node ExecuteCallOperate(Range range)
    {
        return this.ExecuteDotMaideCall(this.NodeKind.CallOperate, range);
    }

    public virtual Node ExecuteThisOperate(Range range)
    {
        return this.ExecuteWord(this.NodeKind.ThisOperate, this.Index.ItemThis, range);
    }

    public virtual Node ExecuteBaseOperate(Range range)
    {
        return this.ExecuteWord(this.NodeKind.BaseOperate, this.Index.Base, range);
    }

    public virtual Node ExecuteNullOperate(Range range)
    {
        return this.ExecuteWord(this.NodeKind.NullOperate, this.Index.Null, range);
    }

    public virtual Node ExecuteNewOperate(Range range)
    {
        return this.ExecuteWordClass(this.NodeKind.NewOperate, this.Index.New, range);
    }

    public virtual Node ExecuteShareOperate(Range range)
    {
        return this.ExecuteWordClass(this.NodeKind.ShareOperate, this.Index.Share, range);
    }

    public virtual Node ExecuteCastOperate(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (start == end)
        {
            return null;
        }

        Token castToken;
        castToken = this.Token(this.TokenA, this.Index.Cast.Text, this.IndexRange(this.RangeA, start));
        if (castToken == null)
        {
            return null;
        }

        Token braceRoundLite;
        braceRoundLite = this.TokenFront(this.TokenB, this.Limit.BraceRoundLite.Text, this.Range(this.RangeA, castToken.Range.End, end));
        if (braceRoundLite == null)
        {
            return null;
        }

        Token braceRoundRite;
        braceRoundRite = this.TokenBraceRoundRite(this.TokenC, this.Range(this.RangeA, braceRoundLite.Range.End, end));
        if (braceRoundRite == null)
        {
            return null;
        }

        if (!(braceRoundRite.Range.End == end))
        {
            return null;
        }

        long classStart;
        long classEnd;
        classStart = castToken.Range.End;
        classEnd = braceRoundLite.Range.Start;
        long anyStart;
        long anyEnd;
        anyStart = braceRoundLite.Range.End;
        anyEnd = braceRoundRite.Range.Start;

        Node varClass;
        varClass = this.ExecuteName(this.NodeKind.ClassName, this.Range(this.RangeA, classStart, classEnd));
        if (varClass == null)
        {
            this.Error(this.ErrorKind.ClassUnvalid, classStart, classEnd);
        }

        Node any;
        any = this.ExecuteOperate(this.Range(this.RangeA, anyStart, anyEnd));
        if (any == null)
        {
            this.Error(this.ErrorKind.AnyUnvalid, anyStart, anyEnd);
        }

        this.SetArg.Kind = this.NodeKind.CastOperate;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = varClass;
        this.SetArg.Field01 = any;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    public virtual Node ExecuteBraceOperate(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (start == end)
        {
            return null;
        }

        Token braceRoundLite;
        braceRoundLite = this.Token(this.TokenA, this.Limit.BraceRoundLite.Text, this.IndexRange(this.RangeA, start));
        if (braceRoundLite == null)
        {
            return null;
        }

        Token braceRoundRite;
        braceRoundRite = this.TokenBraceRoundRite(this.TokenB, this.Range(this.RangeA, braceRoundLite.Range.End, end));
        if (braceRoundRite == null)
        {
            return null;
        }

        if (!(braceRoundRite.Range.End == end))
        {
            return null;
        }

        long anyStart;
        long anyEnd;
        anyStart = braceRoundLite.Range.End;
        anyEnd = braceRoundRite.Range.Start;

        Node any;
        any = this.ExecuteOperate(this.Range(this.RangeA, anyStart, anyEnd));
        if (any == null)
        {
            this.Error(this.ErrorKind.AnyUnvalid, anyStart, anyEnd);
        }

        this.SetArg.Kind = this.NodeKind.BraceOperate;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = any;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    public virtual Node ExecuteVarOperate(Range range)
    {
        return this.ExecuteVarNameResult(this.NodeKind.VarOperate, range);
    }

    public virtual Node ExecuteValueOperate(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        Node value;
        value = this.ExecuteValue(this.Range(this.RangeA, start, end));
        if (value == null)
        {
            return null;
        }

        this.SetArg.Kind = this.NodeKind.ValueOperate;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = value;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    public virtual Node ExecuteAndOperate(Range range)
    {
        return this.ExecuteLimitTwoOperand(this.NodeKind.AndOperate, this.Limit.And, range);
    }

    public virtual Node ExecuteOrnOperate(Range range)
    {
        return this.ExecuteLimitTwoOperand(this.NodeKind.OrnOperate, this.Limit.Orn, range);
    }

    public virtual Node ExecuteNotOperate(Range range)
    {
        return this.ExecuteLimitOneOperand(this.NodeKind.NotOperate, this.Limit.Not, range);
    }

    public virtual Node ExecuteSameOperate(Range range)
    {
        return this.ExecuteLimitTwoOperand(this.NodeKind.SameOperate, this.Limit.Same, range);
    }

    public virtual Node ExecuteLessOperate(Range range)
    {
        return this.ExecuteLimitTwoOperand(this.NodeKind.LessOperate, this.Limit.Less, range);
    }

    public virtual Node ExecuteAddOperate(Range range)
    {
        return this.ExecuteLimitTwoOperand(this.NodeKind.AddOperate, this.Limit.Add, range);
    }

    public virtual Node ExecuteSubOperate(Range range)
    {
        return this.ExecuteLimitTwoOperand(this.NodeKind.SubOperate, this.Limit.Sub, range);
    }

    public virtual Node ExecuteMulOperate(Range range)
    {
        return this.ExecuteLimitTwoOperand(this.NodeKind.MulOperate, this.Limit.Mul, range);
    }

    public virtual Node ExecuteDivOperate(Range range)
    {
        return this.ExecuteLimitTwoOperand(this.NodeKind.DivOperate, this.Limit.Div, range);
    }

    public virtual Node ExecuteSignLessOperate(Range range)
    {
        return this.ExecuteWordLimitTwoOperand(this.NodeKind.SignLessOperate, this.Index.Sign, this.Limit.Less, range);
    }

    public virtual Node ExecuteSignMulOperate(Range range)
    {
        return this.ExecuteWordLimitTwoOperand(this.NodeKind.SignMulOperate, this.Index.Sign, this.Limit.Mul, range);
    }

    public virtual Node ExecuteSignDivOperate(Range range)
    {
        return this.ExecuteWordLimitTwoOperand(this.NodeKind.SignDivOperate, this.Index.Sign, this.Limit.Div, range);
    }

    public virtual Node ExecuteBitAndOperate(Range range)
    {
        return this.ExecuteWordLimitTwoOperand(this.NodeKind.BitAndOperate, this.Index.Bit, this.Limit.And, range);
    }

    public virtual Node ExecuteBitOrnOperate(Range range)
    {
        return this.ExecuteWordLimitTwoOperand(this.NodeKind.BitOrnOperate, this.Index.Bit, this.Limit.Orn, range);
    }

    public virtual Node ExecuteBitNotOperate(Range range)
    {
        return this.ExecuteWordLimitOneOperand(this.NodeKind.BitNotOperate, this.Index.Bit, this.Limit.Not, range);
    }

    public virtual Node ExecuteBitLiteOperate(Range range)
    {
        return this.ExecuteWordLimitTwoOperand(this.NodeKind.BitLiteOperate, this.Index.Bit, this.Limit.Less, range);
    }

    public virtual Node ExecuteBitRiteOperate(Range range)
    {
        return this.ExecuteWordLimitTwoOperand(this.NodeKind.BitRiteOperate, this.Index.Bit, this.Limit.More, range);
    }

    public virtual Node ExecuteBitSignRiteOperate(Range range)
    {
        return this.ExecuteWordTwoLimitTwoOperand(this.NodeKind.BitSignRiteOperate, this.Index.Bit, this.Limit.More, this.Limit.More, range);
    }

    protected virtual Node ExecuteWordBraceBody(NodeKind kind, Index index, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (start == end)
        {
            return null;
        }

        Token indexToken;
        indexToken = this.Token(this.TokenA, index.Text, this.IndexRange(this.RangeA, start));
        if (indexToken == null)
        {
            return null;
        }

        if (indexToken.Range.End == end)
        {
            return null;
        }

        Token braceRoundLite;
        braceRoundLite = this.Token(this.TokenB, this.Limit.BraceRoundLite.Text, this.IndexRange(this.RangeA, indexToken.Range.End));
        if (braceRoundLite == null)
        {
            return null;
        }

        Token braceRoundRite;
        braceRoundRite = this.TokenBraceRoundRite(this.TokenC, this.Range(this.RangeA, braceRoundLite.Range.End, end));
        if (braceRoundRite == null)
        {
            return null;
        }

        if (braceRoundRite.Range.End == end)
        {
            return null;
        }

        Token braceCurveLite;
        braceCurveLite = this.Token(this.TokenD, this.Limit.BraceCurveLite.Text, this.IndexRange(this.RangeA, braceRoundRite.Range.End));
        if (braceCurveLite == null)
        {
            return null;
        }

        Token braceCurveRite;
        braceCurveRite = this.TokenBraceCurveRite(this.TokenA, this.Range(this.RangeA, braceCurveLite.Range.End, end));
        if (braceCurveRite == null)
        {
            return null;
        }

        if (!(braceCurveRite.Range.End == end))
        {
            return null;
        }

        long condStart;
        long condEnd;
        condStart = braceRoundLite.Range.End;
        condEnd = braceRoundRite.Range.Start;
        long bodyStart;
        long bodyEnd;
        bodyStart = braceCurveLite.Range.End;
        bodyEnd = braceCurveRite.Range.Start;

        Node cond;
        cond = this.ExecuteOperate(this.Range(this.RangeA, condStart, condEnd));
        if (cond == null)
        {
            this.Error(this.ErrorKind.CondUnvalid, condStart, condEnd);
        }

        Node body;
        body = this.ExecuteState(this.Range(this.RangeA, bodyStart, bodyEnd));
        if (body == null)
        {
            this.Error(this.ErrorKind.BodyUnvalid, bodyStart, bodyEnd);
        }

        this.SetArg.Kind = kind;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = cond;
        this.SetArg.Field01 = body;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    protected virtual Node ExecuteWord(NodeKind kind, Index index, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        Token wordToken;
        wordToken = this.Token(this.TokenA, index.Text, this.Range(this.RangeA, start, end));
        if (wordToken == null)
        {
            return null;
        }

        this.SetArg.Kind = kind;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    protected virtual Node ExecuteWordClass(NodeKind kind, Index index, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        long count;
        count = this.Count(start, end);

        if (count < 1 | 2 < count)
        {
            return null;
        }

        Token wordToken;
        wordToken = this.Token(this.TokenA, index.Text, this.IndexRange(this.RangeA, start));
        if (wordToken == null)
        {
            return null;
        }

        long classStart;
        long classEnd;
        classStart = wordToken.Range.End;
        classEnd = end;

        Node varClass;
        varClass = this.ExecuteName(this.NodeKind.ClassName, this.Range(this.RangeA, classStart, classEnd));
        if (varClass == null)
        {
            this.Error(this.ErrorKind.ClassUnvalid, classStart, classEnd);
        }
        
        this.SetArg.Kind = kind;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = varClass;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    protected virtual Node ExecuteDotField(NodeKind kind, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        Token dot;
        dot = this.TokenBack(this.TokenA, this.Limit.Stop.Text, this.Range(this.RangeA, start, end));
        if (dot == null)
        {
            return null;
        }

        long thisStart;
        long thisEnd;
        thisStart = start;
        thisEnd = dot.Range.Start;
        long fieldStart;
        long fieldEnd;
        fieldStart = dot.Range.End;
        fieldEnd = end;

        Node varThis;
        varThis = this.ExecuteOperate(this.Range(this.RangeA, thisStart, thisEnd));
        if (varThis == null)
        {
            this.Error(this.ErrorKind.ThisUnvalid, thisStart, thisEnd);
        }

        Node field;
        field = this.ExecuteName(this.NodeKind.FieldName, this.Range(this.RangeA, fieldStart, fieldEnd));
        if (field == null)
        {
            this.Error(this.ErrorKind.FieldUnvalid, fieldStart, fieldEnd);
        }

        this.SetArg.Kind = kind;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = varThis;
        this.SetArg.Field01 = field;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    protected virtual Node ExecuteDotMaideCall(NodeKind kind, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (start == end)
        {
            return null;
        }
        long lastIndex;
        lastIndex = end - 1;
        Token braceRoundRite;
        braceRoundRite = this.Token(this.TokenA, this.Limit.BraceRoundRite.Text, this.IndexRange(this.RangeA, lastIndex));
        if (braceRoundRite == null)
        {
            return null;
        }

        Token braceRoundLite;
        braceRoundLite = this.TokenBraceRoundLite(this.TokenB, this.Range(this.RangeA, start, braceRoundRite.Range.Start));
        if (braceRoundLite == null)
        {
            return null;
        }

        Token dot;
        dot = this.TokenBack(this.TokenC, this.Limit.Stop.Text, this.Range(this.RangeA, start, braceRoundLite.Range.Start));
        if (dot == null)
        {
            return null;
        }

        long thisStart;
        long thisEnd;
        thisStart = start;
        thisEnd = dot.Range.Start;

        long maideStart;
        long maideEnd;
        maideStart = dot.Range.End;
        maideEnd = braceRoundLite.Range.Start;

        long argueStart;
        long argueEnd;
        argueStart = braceRoundLite.Range.End;
        argueEnd = braceRoundRite.Range.Start;

        Node varThis;
        varThis = this.ExecuteOperate(this.Range(this.RangeA, thisStart, thisEnd));
        if (varThis == null)
        {
            this.Error(this.ErrorKind.ThisUnvalid, thisStart, thisEnd);
        }

        Node maide;
        maide = this.ExecuteName(this.NodeKind.MaideName, this.Range(this.RangeA, maideStart, maideEnd));
        if (maide == null)
        {
            this.Error(this.ErrorKind.MaideUnvalid, maideStart, maideEnd);
        }

        Node argue;
        argue = this.ExecuteArgue(this.Range(this.RangeA, argueStart, argueEnd));
        if (argue == null)
        {
            this.Error(this.ErrorKind.ArgueUnvalid, argueStart, argueEnd);
        }

        this.SetArg.Kind = kind;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = varThis;
        this.SetArg.Field01 = maide;
        this.SetArg.Field02 = argue;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    protected virtual Node ExecuteVarNameResult(NodeKind kind, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        Node varVar;
        varVar = this.ExecuteName(this.NodeKind.VarName, this.Range(this.RangeA, start, end));
        if (varVar == null)
        {
            return null;
        }

        this.SetArg.Kind = kind;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = varVar;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    protected virtual Node ExecuteName(NodeKind kind, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        Node node;
        node = null;
        bool b;
        b = false;
        Range aRange;
        aRange = this.ExecuteNameRange(this.RangeB, this.Range(this.RangeA, start, end));
        if (aRange == null)
        {
            b = true;
        }
        if (!b)
        {
            if (!(aRange.End == end))
            {
                b = true;
            }
        }
        if (!b)
        {
            node = this.ExecuteNameNode(kind, this.Range(this.RangeA, start, end));
        }

        return node;
    }

    protected virtual Node ExecuteNameNode(NodeKind kind, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        String value;
        value = this.ExecuteNameValue(this.Range(this.RangeA, start, end));
        if (value == null)
        {
            return null;
        }

        this.SetArg.Kind = kind;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = value;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    protected virtual Node ExecuteLimitTwoOperand(NodeKind kind, Limit limit, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        Token op;
        op = this.TokenFrontSkip(this.TokenA, limit.Text, this.Range(this.RangeA, start, end));
        if (op == null)
        {
            return null;
        }

        long leftStart;
        long leftEnd;
        leftStart = start;
        leftEnd = op.Range.Start;
        long rightStart;
        long rightEnd;
        rightStart = op.Range.End;
        rightEnd = end;

        Node left;
        left = this.ExecuteOperate(this.Range(this.RangeA, leftStart, leftEnd));
        if (left == null)
        {
            this.Error(this.ErrorKind.OperandUnvalid, leftStart, leftEnd);
        }

        Node right;
        right = this.ExecuteOperate(this.Range(this.RangeA, rightStart, rightEnd));
        if (right == null)
        {
            this.Error(this.ErrorKind.OperandUnvalid, rightStart, rightEnd);
        }

        this.SetArg.Kind = kind;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = left;
        this.SetArg.Field01 = right;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    protected virtual Node ExecuteLimitOneOperand(NodeKind kind, Limit limit, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (start == end)
        {
            return null;
        }
        Token op;
        op = this.Token(this.TokenA, limit.Text, this.IndexRange(this.RangeA, start));
        if (op == null)
        {
            return null;
        }

        long valueStart;
        long valueEnd;
        valueStart = op.Range.End;
        valueEnd = end;

        Node value;
        value = this.ExecuteOperate(this.Range(this.RangeA, valueStart, valueEnd));
        if (value == null)
        {
            this.Error(this.ErrorKind.OperandUnvalid, valueStart, valueEnd);
        }

        this.SetArg.Kind = kind;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = value;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    protected virtual Node ExecuteWordLimitTwoOperand(NodeKind kind, Index word, Limit limit, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (start == end)
        {
            return null;
        }
        Token wordToken;
        wordToken = this.Token(this.TokenA, word.Text, this.IndexRange(this.RangeA, start));
        if (wordToken == null)
        {
            return null;
        }

        if (wordToken.Range.End == end)
        {
            return null;
        }
        Token op;
        op = this.Token(this.TokenB, limit.Text, this.IndexRange(this.RangeA, wordToken.Range.End));
        if (op == null)
        {
            return null;
        }

        if (op.Range.End == end)
        {
            return null;
        }
        Token braceRoundLite;
        braceRoundLite = this.Token(this.TokenC, this.Limit.BraceRoundLite.Text, this.IndexRange(this.RangeA, op.Range.End));
        if (braceRoundLite == null)
        {
            return null;
        }

        Token braceRoundRite;
        braceRoundRite = this.TokenBraceRoundRite(this.TokenD, this.Range(this.RangeA, braceRoundLite.Range.End, end));
        if (braceRoundRite == null)
        {
            return null;
        }

        Token comma;
        comma = this.TokenFrontSkip(this.TokenA, this.Limit.Pause.Text, this.Range(this.RangeA, braceRoundLite.Range.End, braceRoundRite.Range.Start));
        if (comma == null)
        {
            return null;
        }

        if (!(braceRoundRite.Range.End == end))
        {
            return null;
        }

        long liteStart;
        long liteEnd;
        liteStart = braceRoundLite.Range.End;
        liteEnd = comma.Range.Start;
        long riteStart;
        long riteEnd;
        riteStart = comma.Range.End;
        riteEnd = braceRoundRite.Range.Start;

        Node lite;
        lite = this.ExecuteOperate(this.Range(this.RangeA, liteStart, liteEnd));
        if (lite == null)
        {
            this.Error(this.ErrorKind.OperandUnvalid, liteStart, liteEnd);
        }

        Node rite;
        rite = this.ExecuteOperate(this.Range(this.RangeA, riteStart, riteEnd));
        if (rite == null)
        {
            this.Error(this.ErrorKind.OperandUnvalid, riteStart, riteEnd);
        }

        this.SetArg.Kind = kind;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = lite;
        this.SetArg.Field01 = rite;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    protected virtual Node ExecuteWordLimitOneOperand(NodeKind kind, Index word, Limit limit, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (start == end)
        {
            return null;
        }
        Token wordToken;
        wordToken = this.Token(this.TokenA, word.Text, this.IndexRange(this.RangeA, start));
        if (wordToken == null)
        {
            return null;
        }

        if (wordToken.Range.End == end)
        {
            return null;
        }
        Token op;
        op = this.Token(this.TokenB, limit.Text, this.IndexRange(this.RangeA, wordToken.Range.End));
        if (op == null)
        {
            return null;
        }

        if (op.Range.End == end)
        {
            return null;
        }
        Token braceRoundLite;
        braceRoundLite = this.Token(this.TokenC, this.Limit.BraceRoundLite.Text, this.IndexRange(this.RangeA, op.Range.End));
        if (braceRoundLite == null)
        {
            return null;
        }

        Token braceRoundRite;
        braceRoundRite = this.TokenBraceRoundRite(this.TokenD, this.Range(this.RangeA, braceRoundLite.Range.End, end));
        if (braceRoundRite == null)
        {
            return null;
        }

        if (!(braceRoundRite.Range.End == end))
        {
            return null;
        }

        long valueStart;
        long valueEnd;
        valueStart = braceRoundLite.Range.End;
        valueEnd = braceRoundRite.Range.Start;

        Node value;
        value = this.ExecuteOperate(this.Range(this.RangeA, valueStart, valueEnd));
        if (value == null)
        {
            this.Error(this.ErrorKind.OperandUnvalid, valueStart, valueEnd);
        }

        this.SetArg.Kind = kind;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = value;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    protected virtual Node ExecuteWordTwoLimitTwoOperand(NodeKind kind, Index word, Limit limitA, Limit limitB, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (start == end)
        {
            return null;
        }
        Token wordToken;
        wordToken = this.Token(this.TokenA, word.Text, this.IndexRange(this.RangeA, start));
        if (wordToken == null)
        {
            return null;
        }

        if (wordToken.Range.End == end)
        {
            return null;
        }
        Token opA;
        opA = this.Token(this.TokenB, limitA.Text, this.IndexRange(this.RangeA, wordToken.Range.End));
        if (opA == null)
        {
            return null;
        }

        if (opA.Range.End == end)
        {
            return null;
        }
        Token opB;
        opB = this.Token(this.TokenC, limitB.Text, this.IndexRange(this.RangeA, opA.Range.End));
        if (opB == null)
        {
            return null;
        }

        if (opB.Range.End == end)
        {
            return null;
        }
        Token braceRoundLite;
        braceRoundLite = this.Token(this.TokenA, this.Limit.BraceRoundLite.Text, this.IndexRange(this.RangeA, opB.Range.End));
        if (braceRoundLite == null)
        {
            return null;
        }

        Token braceRoundRite;
        braceRoundRite = this.TokenBraceRoundRite(this.TokenB, this.Range(this.RangeA, braceRoundLite.Range.End, end));
        if (braceRoundRite == null)
        {
            return null;
        }

        Token comma;
        comma = this.TokenFrontSkip(this.TokenC, this.Limit.Pause.Text, this.Range(this.RangeA, braceRoundLite.Range.End, braceRoundRite.Range.Start));
        if (comma == null)
        {
            return null;
        }

        if (!(braceRoundRite.Range.End == end))
        {
            return null;
        }

        long leftStart;
        long leftEnd;
        leftStart = braceRoundLite.Range.End;
        leftEnd = comma.Range.Start;
        long rightStart;
        long rightEnd;
        rightStart = comma.Range.End;
        rightEnd = braceRoundRite.Range.Start;

        Node left;
        left = this.ExecuteOperate(this.Range(this.RangeA, leftStart, leftEnd));
        if (left == null)
        {
            this.Error(this.ErrorKind.OperandUnvalid, leftStart, leftEnd);
        }

        Node right;
        right = this.ExecuteOperate(this.Range(this.RangeA, rightStart, rightEnd));
        if (right == null)
        {
            this.Error(this.ErrorKind.OperandUnvalid, rightStart, rightEnd);
        }

        this.SetArg.Kind = kind;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = left;
        this.SetArg.Field01 = right;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    protected virtual Node ExecuteList(NodeKind kind, RangeState rangeState, NodeState nodeState, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        Array value;
        value = this.ExecuteListValue(rangeState, nodeState, this.Range(this.RangeA, start, end));
        if (value == null)
        {
            return null;
        }

        this.SetArg.Kind = kind;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = value;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    protected virtual Node ExecuteListComma(NodeKind kind, RangeState rangeState, NodeState nodeState, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        Array value;
        value = this.ExecuteListValueComma(rangeState, nodeState, this.Range(this.RangeA, start, end));
        if (value == null)
        {
            return null;
        }

        this.SetArg.Kind = kind;
        this.SetArg.Range.Start = start;
        this.SetArg.Range.End = end;
        this.SetArg.Field00 = value;
        Node ret;
        ret = this.Operate.Execute();
        return ret;
    }

    protected virtual Array ExecuteListValue(RangeState rangeState, NodeState nodeState, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        long listIndex;
        listIndex = this.Operate.ExecuteListNew();

        long count;
        count = 0;
        long index;
        index = start;
        while (index < end)
        {
            RangeStateArg arg;
            arg = (RangeStateArg)rangeState.Arg;

            arg.Result = this.RangeB;
            arg.Range = this.Range(this.RangeA, index, end);
            rangeState.Execute();

            Range itemRange;
            itemRange = (Range)rangeState.Result;
            
            rangeState.Result = null;
            arg.Result = null;
            arg.Range = null;

            bool b;
            b = (itemRange == null);
            if (b)
            {
                long aStart;
                long aEnd;
                aStart = index;
                aEnd = end;
                this.Error(this.ErrorKind.ItemUnvalid, aStart, aEnd);

                this.Operate.ExecuteListSetItem(listIndex, count, null);
                count = count + 1;

                index = end;
            }

            if (!b)
            {
                long itemStart;
                long itemEnd;
                itemStart = itemRange.Start;
                itemEnd = itemRange.End;

                index = itemEnd;

                nodeState.Arg = this.Range(this.RangeA, itemStart, itemEnd);
                nodeState.Execute();

                Node item;
                item = (Node)nodeState.Result;

                nodeState.Arg = null;
                nodeState.Result = null;

                bool ba;
                ba = (item == null);
                if (ba)
                {
                    this.Error(this.ErrorKind.ItemUnvalid, itemStart, itemEnd);
                }

                this.Operate.ExecuteListSetItem(listIndex, count, item);

                count = count + 1;
            }
        }

        this.Operate.ExecuteListCount(listIndex, count);

        Array array;
        array = this.Operate.ExecuteListGet(listIndex);
        return array;
    }

    protected virtual Array ExecuteListValueComma(RangeState rangeState, NodeState nodeState, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        long listIndex;
        listIndex = this.Operate.ExecuteListNew();

        long count;
        count = 0;

        bool hasNextItem;
        hasNextItem = false;

        long index;
        index = start;
        while (index < end)
        {
            RangeStateArg arg;
            arg = (RangeStateArg)rangeState.Arg;

            arg.Result = this.RangeB;
            arg.Range = this.Range(this.RangeA, index, end);

            rangeState.Execute();

            Range itemRange;
            itemRange = (Range)rangeState.Result;

            rangeState.Result = null;
            arg.Result = null;
            arg.Range = null;

            long aStart;
            long aEnd;
            aStart = 0;
            aEnd = 0;

            bool b;
            b = (itemRange == null);
            if (b)
            {
                aStart = index;
                aEnd = end;

                index = aEnd;

                hasNextItem = false;
            }

            if (!b)
            {
                aStart = itemRange.Start;
                aEnd = itemRange.End;

                index = aEnd + 1;

                hasNextItem = true;
            }

            nodeState.Arg = this.Range(this.RangeA, aStart, aEnd);

            nodeState.Execute();

            Node item;
            item = (Node)nodeState.Result;

            nodeState.Arg = null;
            nodeState.Result = null;

            bool ba;
            ba = (item == null);

            if (ba)
            {
                this.Error(this.ErrorKind.ItemUnvalid, aStart, aEnd);
            }

            this.Operate.ExecuteListSetItem(listIndex, count, item);


            count = count + 1;
        }

        if (hasNextItem)
        {
            this.Error(this.ErrorKind.ItemUnvalid, index, index);

            this.Operate.ExecuteListSetItem(listIndex, count, null);

            count = count + 1;
        }

        this.Operate.ExecuteListCount(listIndex, count);

        Array array;
        array = this.Operate.ExecuteListGet(listIndex);
        return array;
    }

    protected virtual Range ExecuteNameRange(Range result, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (start == end)
        {
            return null;
        }

        if (!this.IsName(this.TokenToken(start)))
        {
            return null;
        }
        return this.IndexRange(result, start);
    }

    public virtual Range ExecuteExecuteRange(Range result, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        Range a;
        a = null;
        if (a == null)
        {
            a = this.ExecuteReturnExecuteRange(result, this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteInfExecuteRange(result, this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteWhileExecuteRange(result, this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteReferExecuteRange(result, this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteAreExecuteRange(result, this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteOperateExecuteRange(result, this.Range(this.RangeA, start, end));
        }
        return a;
    }

    protected virtual Range ExecuteReturnExecuteRange(Range result, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (start == end)
        {
            return null;
        }
        Token returnToken;
        returnToken = this.Token(this.TokenA, this.Index.Return.Text, this.IndexRange(this.RangeA, start));
        if (returnToken == null)
        {
            return null;
        }

        Token semicolon;
        semicolon = this.TokenFrontSkip(this.TokenB, this.Limit.Execute.Text, this.Range(this.RangeA, returnToken.Range.End, end));
        if (semicolon == null)
        {
            return null;
        }

        this.Range(result, start, semicolon.Range.End);
        return result;
    }

    protected virtual Range ExecuteInfExecuteRange(Range result, Range range)
    {
        return this.ExecuteWordBracketRange(result, this.Index.Inf, range);
    }

    protected virtual Range ExecuteWhileExecuteRange(Range result, Range range)
    {
        return this.ExecuteWordBracketRange(result, this.Index.While, range);
    }

    protected virtual Range ExecuteWordBracketRange(Range result, Index word, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (start == end)
        {
            return null;
        }
        Token wordToken;
        wordToken = this.Token(this.TokenA, word.Text, this.IndexRange(this.RangeA, start));
        if (wordToken == null)
        {
            return null;
        }

        if (wordToken.Range.End == end)
        {
            return null;
        }
        Token braceRoundLite;
        braceRoundLite = this.Token(this.TokenB, this.Limit.BraceRoundLite.Text, this.IndexRange(this.RangeA, wordToken.Range.End));
        if (braceRoundLite == null)
        {
            return null;
        }

        Token braceRoundRite;
        braceRoundRite = this.TokenBraceRoundRite(this.TokenC, this.Range(this.RangeA, braceRoundLite.Range.End, end));
        if (braceRoundRite == null)
        {
            return null;
        }

        if (braceRoundRite.Range.End == end)
        {
            return null;
        }
        Token braceCurveLite;
        braceCurveLite = this.Token(this.TokenD, this.Limit.BraceCurveLite.Text, this.IndexRange(this.RangeA, braceRoundRite.Range.End));
        if (braceCurveLite == null)
        {
            return null;
        }

        Token braceCurveRite;
        braceCurveRite = this.TokenBraceCurveRite(this.TokenA, this.Range(this.RangeA, braceCurveLite.Range.End, end));
        if (braceCurveRite == null)
        {
            return null;
        }

        this.Range(result, start, braceCurveRite.Range.End);
        return result;
    }

    protected virtual Range ExecuteReferExecuteRange(Range result, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (start == end)
        {
            return null;
        }

        Token varToken;
        varToken = this.Token(this.TokenA, this.Index.Var.Text, this.IndexRange(this.RangeA, start));
        if (varToken == null)
        {
            return null;
        }

        Token semicolon;
        semicolon = this.TokenFrontSkip(this.TokenB, this.Limit.Execute.Text, this.Range(this.RangeA, varToken.Range.End, end));
        if (semicolon == null)
        {
            return null;
        }

        this.Range(result, start, semicolon.Range.End);
        return result;
    }

    protected virtual Range ExecuteAreExecuteRange(Range result, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (start == end)
        {
            return null;
        }

        Token semicolon;
        semicolon = this.TokenFrontSkip(this.TokenA, this.Limit.Execute.Text, this.Range(this.RangeA, start, end));
        if (semicolon == null)
        {
            return null;
        }

        Token colon;
        colon = this.TokenFrontSkip(this.TokenB, this.Limit.Are.Text, this.Range(this.RangeA, start, semicolon.Range.Start));
        if (colon == null)
        {
            return null;
        }

        this.Range(result, start, semicolon.Range.End);
        return result;
    }

    protected virtual Range ExecuteOperateExecuteRange(Range result, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        Token semicolon;
        semicolon = this.TokenFrontSkip(this.TokenA, this.Limit.Execute.Text, this.Range(this.RangeA, start, end));
        if (semicolon == null)
        {
            return null;
        }

        this.Range(result, start, semicolon.Range.End);
        return result;
    }

    public virtual Range ExecuteParamItemRange(Range result, Range range)
    {
        return this.ExecuteEndAtCommaRange(result, range);
    }

    public virtual Range ExecuteArgueItemRange(Range result, Range range)
    {
        return this.ExecuteEndAtCommaRange(result, range);
    }

    protected virtual Range ExecuteEndAtCommaRange(Range result, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        Token comma;
        comma = this.TokenFrontSkip(this.TokenA, this.Limit.Pause.Text, this.Range(this.RangeA, start, end));
        if (comma == null)
        {
            return null;
        }
        this.Range(result, start, comma.Range.Start);
        return result;
    }

    public virtual Range ExecuteCompRange(Range result, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        Range a;
        a = null;
        if (a == null)
        {
            a = this.ExecuteFieldRange(result, this.Range(this.RangeA, start, end));
        }
        if (a == null)
        {
            a = this.ExecuteMaideRange(result, this.Range(this.RangeA, start, end));
        }
        return a;
    }

    protected virtual Range ExecuteFieldRange(Range result, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (start == end)
        {
            return null;
        }

        Token fieldToken;
        fieldToken = this.Token(this.TokenA, this.Index.Field.Text, this.IndexRange(this.RangeA, start));
        if (fieldToken == null)
        {
            return null;
        }

        Token braceCurveLite;
        braceCurveLite = this.TokenFront(this.TokenB, this.Limit.BraceCurveLite.Text, this.Range(this.RangeA, fieldToken.Range.End, end));
        if (braceCurveLite == null)
        {
            return null;
        }

        Token braceCurveRite;
        braceCurveRite = this.TokenBraceCurveRite(this.TokenC, this.Range(this.RangeA, braceCurveLite.Range.End, end));
        if (braceCurveRite == null)
        {
            return null;
        }

        this.Range(result, start, braceCurveRite.Range.End);
        return result;
    }

    protected virtual Range ExecuteMaideRange(Range result, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (start == end)
        {
            return null;
        }

        Token maideToken;
        maideToken = this.Token(this.TokenA, this.Index.Maide.Text, this.IndexRange(this.RangeA, start));
        if (maideToken == null)
        {
            return null;
        }

        Token braceRoundLite;
        braceRoundLite = this.TokenFront(this.TokenB, this.Limit.BraceRoundLite.Text, this.Range(this.RangeA, maideToken.Range.End, end));
        if (braceRoundLite == null)
        {
            return null;
        }

        Token braceRoundRite;
        braceRoundRite = this.TokenBraceRoundRite(this.TokenC, this.Range(this.RangeA, braceRoundLite.Range.End, end));
        if (braceRoundRite == null)
        {
            return null;
        }

        if (braceRoundRite.Range.End == end)
        {
            return null;
        }
        Token braceCurveLite;
        braceCurveLite = this.Token(this.TokenD, this.Limit.BraceCurveLite.Text, this.IndexRange(this.RangeA, braceRoundRite.Range.End));
        if (braceCurveLite == null)
        {
            return null;
        }

        Token braceCurveRite;
        braceCurveRite = this.TokenBraceCurveRite(this.TokenE, this.Range(this.RangeA, braceCurveLite.Range.End, end));
        if (braceCurveRite == null)
        {
            return null;
        }

        this.Range(result, start, braceCurveRite.Range.End);
        return result;
    }

    protected virtual String ExecuteNameValue(Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (!((start + 1) == end))
        {
            return null;
        }

        TokenToken token;
        token = this.TokenToken(start);

        Text text;
        text = this.TAToken(token);

        String a;
        a = this.Operate.ExecuteNameValue(text);
        return a;
    }

    protected virtual TokenToken TokenToken(long index)
    {
        Code code;
        code = this.Code.GetAt(this.SourceIndex) as Code;

        TokenToken token;
        token = code.Token.GetAt(index) as TokenToken;
        return token;
    }

    protected virtual long Count(long start, long end)
    {
        return this.ClassInfra.Count(start, end);
    }

    protected virtual Text TextToken(Text text, TokenToken token)
    {
        Text line;
        line = this.Line(token.Row);

        text.Data = line.Data;
        text.Range.Index = line.Range.Index + token.Range.Index;
        text.Range.Count = token.Range.Count;
        return text;
    }

    protected virtual Line(long row)
    {
        Source source;
        source = this.SourceItem();

        Text a;
        a = source.Text.GetAt(row) as Text;
        return a;
    }

    protected virtual Source SourceItem()
    {
        Source a;
        a = this.Source.GetAt(this.SourceIndex) as Source;
        return a;
    }

    protected virtual bool IsName(TokenToken token)
    {
        return this.NameValid.Name(this.TAToken(token));
    }

    public virtual bool NodeInfo(Node node, long start, long end)
    {
        this.Range(node.Range, start, end);
        return true;
    }

    protected virtual bool IsText(String value, long index)
    {
        TokenToken token;
        token = this.TokenToken(index);

        bool b;
        b = this.TextSame(this.TAToken(token), this.TB(value));
        bool a;
        a = b;
        return a;
    }

    protected virtual Range Range(Range range, long start, long end)
    {
        range.Start = start;
        range.End = end;
        return range;
    }

    protected virtual Range IndexRange(Range range, long index)
    {
        this.ClassInfra.IndexRange(range, index);
        return range;
    }

    protected virtual bool Error(ErrorKind kind, long start, long end)
    {
        this.Operate.ExecuteError(kind, start, end);
        return true;
    }

    protected virtual Token Token(Token result, String value, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        if (!(start + 1 == end))
        {
            return null;
        }

        if (!this.IsText(value, start))
        {
            return null;
        }

        this.Range(result.Range, start, end);
        return result;
    }

    protected virtual Token TokenFront(Token result, String value, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;
        String braceRoundLite;
        String braceRoundRite;
        braceRoundLite = this.Limit.BraceRoundLite.Text;
        braceRoundRite = this.Limit.BraceRoundRite.Text;
        String braceCurveLite;
        String braceCurveRite;
        braceCurveLite = this.Limit.BraceCurveLite.Text;
        braceCurveRite = this.Limit.BraceCurveRite.Text;
        long i;
        i = start;
        long index;
        index = -1;
        bool varContinue;
        varContinue = (i < end);
        while (varContinue)
        {
            bool b;
            b = this.IsText(value, i);
            if (b)
            {
                index = i;
                varContinue = false;
            }
            if (!b)
            {
                bool ba;
                ba = (this.IsText(braceRoundLite, i) | this.IsText(braceRoundRite, i) | this.IsText(braceCurveLite, i) | this.IsText(braceCurveRite, i));
                if (ba)
                {
                    varContinue = false;
                }
                if (!ba)
                {
                    i = i + 1;
                }
            }
            if (!(i < end))
            {
                varContinue = false;
            }
        }
        if (index == -1)
        {
            return null;
        }

        this.IndexRange(result.Range, index);
        return result;
    }

    protected virtual Token TokenBack(Token result, String value, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;
        String braceRoundLite;
        String braceRoundRite;
        braceRoundLite = this.Limit.BraceRoundLite.Text;
        braceRoundRite = this.Limit.BraceRoundRite.Text;
        String braceCurveLite;
        String braceCurveRite;
        braceCurveLite = this.Limit.BraceCurveLite.Text;
        braceCurveRite = this.Limit.BraceCurveRite.Text;
        long i;
        i = end;
        long index;
        index = -1;
        bool varContinue;
        varContinue = (start < i);
        while (varContinue)
        {
            long j;
            j = i - 1;
            bool b;
            b = this.IsText(value, j);
            if (b)
            {
                index = j;
                varContinue = false;
            }
            if (!b)
            {
                bool ba;
                ba = (this.IsText(braceRoundLite, j) | this.IsText(braceRoundRite, j) | this.IsText(braceCurveLite, j) | this.IsText(braceCurveRite, j));
                if (ba)
                {
                    varContinue = false;
                }
                if (!ba)
                {
                    i = i - 1;
                }
            }
            if (!(start < i))
            {
                varContinue = false;
            }
        }
        if (index == -1)
        {
            return null;
        }

        this.IndexRange(result.Range, index);
        return result;
    }

    protected virtual Token TokenFrontSkip(Token result, String value, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        long i;
        i = start;
        long index;
        index = -1;
        bool varContinue;
        varContinue = (i < end);
        while (varContinue)
        {
            bool b;
            b = this.IsText(value, i);
            if (b)
            {
                index = i;
                varContinue = false;
            }
            if (!b)
            {
                long skipBracketIndex;
                skipBracketIndex = this.FrontSkipBrace(i, end);
                bool ba;
                ba = (skipBracketIndex == -1);
                if (!ba)
                {
                    i = skipBracketIndex;
                }
                if (ba)
                {
                    i = i + 1;
                }
            }
            if (!(i < end))
            {
                varContinue = false;
            }
        }
        if (index == -1)
        {
            return null;
        }

        this.IndexRange(result.Range, index);
        return result;
    }

    protected virtual Token TokenBackSkip(Token result, String value, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        long i;
        i = end;
        long index;
        index = -1;
        bool varContinue;
        varContinue = (start < i);
        while (varContinue)
        {
            long j;
            j = i - 1;
            bool b;
            b = this.IsText(value, j);
            if (b)
            {
                index = j;
                varContinue = false;
            }
            if (!b)
            {
                long skipBracketIndex;
                skipBracketIndex = this.BackSkipBrace(i, start);
                bool ba;
                ba = (skipBracketIndex == -1);
                if (!ba)
                {
                    i = skipBracketIndex;
                }
                if (ba)
                {
                    i = i - 1;
                }
            }
            if (!(start < i))
            {
                varContinue = false;
            }
        }
        if (index == -1)
        {
            return null;
        }

        this.IndexRange(result.Range, index);
        return result;
    }

    protected virtual long FrontSkipBrace(long index, long end)
    {
        long ret;
        ret = -1;

        TokenToken token;
        token = this.TokenToken(index);

        if (this.TextSame(this.TAToken(token), this.TB(this.Limit.BraceRoundLite.Text)))
        {
            Token braceRoundRite;
            braceRoundRite = this.TokenBraceRoundRite(this.TokenA, this.Range(this.RangeA, index + 1, end));
            if (!(braceRoundRite == null))
            {
                ret = braceRoundRite.Range.End;
            }
        }

        if (this.TextSame(this.TAToken(token), this.TB(this.Limit.BraceCurveLite.Text)))
        {
            Token braceCurveRite;
            braceCurveRite = this.TokenBraceCurveRite(this.TokenA, this.Range(this.RangeA, index + 1, end));
            if (!(braceCurveRite == null))
            {
                ret = braceCurveRite.Range.End;
            }
        }
        return ret;
    }

    protected virtual long BackSkipBrace(long index, long start)
    {
        long ret;
        ret = -1;
        long t;
        t = index - 1;

        TokenToken token;
        token = this.TokenToken(t);

        if (this.TextSame(this.TAToken(token), this.TB(this.Limit.BraceRoundRite.Text)))
        {
            Token braceRoundLite;
            braceRoundLite = this.TokenBraceRoundLite(this.TokenA, this.Range(this.RangeA, start, t));
            if (!(braceRoundLite == null))
            {
                ret = braceRoundLite.Range.Start;
            }
        }

        if (this.TextSame(this.TAToken(token), this.TB(this.Limit.BraceCurveRite.Text)))
        {
            Token braceCurveLite;
            braceCurveLite = this.TokenBraceCurveLite(this.TokenA, this.Range(this.RangeA, start, t));
            if (!(braceCurveLite == null))
            {
                ret = braceCurveLite.Range.Start;
            }
        }
        return ret;
    }

    protected virtual Token TokenBraceCurveRite(Token result, Range range)
    {
        return this.TokenRiteToken(result, this.Limit.BraceCurveLite.Text, this.Limit.BraceCurveRite.Text, range);
    }

    protected virtual Token TokenBraceCurveLite(Token result, Range range)
    {
        return this.TokenLiteToken(result, this.Limit.BraceCurveLite.Text, this.Limit.BraceCurveRite.Text, range);
    }

    protected virtual Token TokenBraceRoundRite(Token result, Range range)
    {
        return this.TokenRiteToken(result, this.Limit.BraceRoundLite.Text, this.Limit.BraceRoundRite.Text, range);
    }

    protected virtual Token TokenBraceRoundLite(Token result, Range range)
    {
        return this.TokenLiteToken(result, this.Limit.BraceRoundLite.Text, this.Limit.BraceRoundRite.Text, range);
    }

    protected virtual Token TokenRiteToken(Token result, String liteToken, String riteToken, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        long openCount;
        openCount = 1;
        long index;
        index = -1;
        long i;
        i = start;
        bool varContinue;
        varContinue = (i < end);
        while (varContinue)
        {
            TokenToken token;
            token = this.TokenToken(i);

            Text ka;
            ka = this.TAToken(token);
            
            if (this.TextSame(ka, this.TB(riteToken)))
            {
                openCount = openCount - 1;
                if (openCount == 0)
                {
                    index = i;
                    varContinue = false;
                }
            }

            if (this.TextSame(ka, this.TB(liteToken)))
            {
                openCount = openCount + 1;
            }

            if (index == -1)
            {
                i = i + 1;
                if (!(i < end))
                {
                    varContinue = false;
                }
            }
        }
        if (index == -1)
        {
            return null;
        }

        this.IndexRange(result.Range, index);
        return result;
    }

    protected virtual Token TokenLiteToken(Token result, String liteToken, String riteToken, Range range)
    {
        long start;
        long end;
        start = range.Start;
        end = range.End;

        long openCount;
        openCount = 1;
        long index;
        index = -1;
        long i;
        i = end;
        bool varContinue;
        varContinue = (i > start);
        while (varContinue)
        {
            long t;
            t = i - 1;
            TokenToken token;
            token = this.TokenToken(t);

            Text ka;
            ka = this.TAToken(token);

            if (this.TextSame(ka, this.TB(liteToken)))
            {
                openCount = openCount - 1;
                if (openCount == 0)
                {
                    index = t;
                    varContinue = false;
                }
            }

            if (this.TextSame(ka, this.TB(riteToken)))
            {
                openCount = openCount + 1;
            }
            
            if (index == -1)
            {
                i = i - 1;
                if (!(i > start))
                {
                    varContinue = false;
                }
            }
        }
        if (index == -1)
        {
            return null;
        }

        this.IndexRange(result.Range, index);
        return result;
    }
}