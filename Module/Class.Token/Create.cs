namespace Saber.Token;

public class Create : InfraCreate
{
    public override bool Init()
    {
        base.Init();
        this.InfraInfra = InfraInfra.This;
        this.ListInfra = ListInfra.This;
        this.TextInfra = TextInfra.This;
        this.ClassInfra = ClassInfra.This;

        this.CountOperate = new CountCreateOperate();
        this.CountOperate.Create = this;
        this.CountOperate.Init();
        this.SetOperate = new SetCreateOperate();
        this.SetOperate.Create = this;
        this.SetOperate.Init();

        this.CharForm = new TextForm();
        this.CharForm.Init();

        this.LineRange = new Range();
        this.LineRange.Init();
        return true;
    }

    public virtual Array Source { get; set; }
    public virtual Result Result { get; set; }
    public virtual Code Code { get; set; }
    public virtual long Row { get; set; }
    public virtual Range LineRange { get; set; }
    public virtual CreateArg Arg { get; set; }
    protected virtual CountCreateOperate CountOperate { get; set; }
    protected virtual SetCreateOperate SetOperate { get; set; }
    protected virtual CreateOperate Operate { get; set; }
    protected virtual Array CodeArray { get; set; }
    protected virtual Source SourceItem { get; set; }
    protected virtual TextForm CharForm { get; set; }

    public override bool Execute()
    {
        this.Result = new Result();
        this.Result.Init();

        this.CodeArray = this.CreateCodeArray();

        this.Result.Code = this.CodeArray;
        this.Result.Error = this.ListInfra.ArrayCreate(0);

        CreateArg arg;
        arg = new CreateArg();
        arg.Init();

        this.Arg = arg;

        arg.CodeCountData = new Data();
        arg.CodeCountData.Count = this.CodeArray.Count * 2 * sizeof(ulong);
        arg.CodeCountData.Init();

        this.Operate = this.CountOperate;

        this.ArgIndexClear();
        this.ExecuteStage();

        arg.TokenArray = this.ListInfra.ArrayCreate(arg.TokenIndex);
        arg.CommentArray = this.ListInfra.ArrayCreate(arg.CommentIndex);

        this.ExecuteCreateToken();
        this.ExecuteCreateComment();
        this.ExecuteCodeArraySet();

        this.Operate = this.SetOperate;

        this.ArgIndexClear();
        this.ExecuteStage();

        this.Arg = null;
        return true;
    }

    public virtual bool ArgIndexClear()
    {
        this.Arg.TokenIndex = 0;
        this.Arg.CommentIndex = 0;
        return true;
    }

    public virtual bool ExecuteStage()
    {
        long count;
        count = this.CodeArray.Count;

        long i;
        i = 0;
        while (i < count)
        {
            Code code;
            code = (Code)this.CodeArray.GetAt(i);

            this.SourceItem = (Source)this.Source.GetAt(i);

            this.Operate.ExecuteCodeStart(i);

            this.ExecuteCode(code);

            this.Operate.ExecuteCodeEnd(i);

            i = i + 1;
        }

        return true;
    }

    protected virtual bool ExecuteCode(Code code)
    {
        TextInfra textInfra;
        textInfra = this.TextInfra;
        ClassInfra classInfra;
        classInfra = this.ClassInfra;

        this.Code = code;

        this.Reset();

        TextForm charForm;
        charForm = this.CharForm;

        Array sourceText;
        sourceText = this.SourceItem.Text;

        Range range;
        range = this.LineRange;

        long row;
        row = 0;
        long col;
        col = 0;

        long count;
        count = sourceText.Count;
        while (row < count)
        {
            Text line;
            line = sourceText.GetAt(row) as Text;
            Data data;
            data = line.Data;

            Range ke;
            ke = line.Range;
            
            long start;
            start = ke.Index;

            long colCount;
            colCount = ke.Count;

            col = 0;

            while (col < colCount)
            {
                bool isValid;
                isValid = false;

                long c;
                c = textInfra.DataCharGet(data, start + col);

                c = charForm.Execute(c);

                if (c == '#')
                {
                    this.EndToken(col);
                    this.Row = row;
                    range.Index = col;
                    range.Count = classInfra.Count(col, colCount);
                    this.AddComment();

                    col = colCount;
                    this.Reset();

                    isValid = true;
                }

                if (c == ' ')
                {
                    this.EndToken(col);

                    col = col + 1;

                    this.Reset();

                    isValid = true;
                }

                if (c == '\"')
                {
                    this.EndToken(col);
                    this.Row = row;
                    range.Index = col;

                    long cc;
                    cc = col + 1;
                    bool b;
                    b = false;
                    while (!b & cc < colCount)
                    {
                        long oc;
                        oc = textInfra.DataCharGet(data, start + cc);

                        oc = charForm.Execute(oc);

                        bool ba;
                        ba = (oc == '\"');
                        if (ba)
                        {
                            b = true;
                        }

                        if (!b)
                        {
                            bool bb;
                            bb = (oc == '\\');
                            if (bb)
                            {
                                long uu;
                                uu = cc + 1;
                                if (uu < colCount)
                                {
                                    cc = cc + 1;
                                }
                            }
                        }
                        cc = cc + 1;
                    }
                    range.Count = classInfra.Count(col, cc);
                    this.AddToken();

                    col = cc;

                    this.Reset();

                    isValid = true;
                }

                if (textInfra.Alpha(c, false) | textInfra.Alpha(c, true) | textInfra.Digit(c) | c == '_')
                {
                    if (this.NullRange())
                    {
                        this.Row = row;
                        range.Index = col;
                    }

                    col = col + 1;

                    isValid = true;
                }

                if (!isValid)
                {
                    this.EndToken(col);

                    this.Row = row;
                    range.Index = col;
                    range.Count = 1;
                    
                    this.AddToken();

                    col = col + 1;

                    this.Reset();
                }
            }

            this.EndToken(col);

            this.Reset();

            row = row + 1;
        }
        
        return true;
    }

    protected virtual Array CreateCodeArray()
    {
        Array array;
        array = this.ListInfra.ArrayCreate(this.Source.Count);

        long count;
        count = array.Count;
        long i;
        i = 0;
        while (i < count)
        {
            Code code;
            code = new Code();
            code.Init();

            array.SetAt(i, code);

            i = i + 1;
        }

        return array;
    }

    protected virtual bool ExecuteCreateToken()
    {
        Array array;
        array = this.Arg.TokenArray;

        long count;
        count = array.Count;
        long i;
        i = 0;
        while (i < count)
        {
            Token a;
            a = new Token();
            a.Init();
            a.Range = new Range();
            a.Range.Init();
            array.SetAt(i, a);

            i = i + 1;
        }
        return true;
    }

    protected virtual bool ExecuteCreateComment()
    {
        Array array;
        array = this.Arg.CommentArray;

        long count;
        count = array.Count;
        long i;
        i = 0;
        while (i < count)
        {
            Comment a;
            a = new Comment();
            a.Init();
            a.Range = new Range();
            a.Range.Init();
            array.SetAt(i, a);

            i = i + 1;
        }
        return true;
    }

    protected virtual bool ExecuteCodeArraySet()
    {
        InfraInfra infraInfra;
        infraInfra = this.InfraInfra;
        ListInfra listInfra;
        listInfra = this.ListInfra;
        Array codeArray;
        codeArray = this.CodeArray;
        Data codeCountData;
        codeCountData = this.Arg.CodeCountData;

        Array tokenArray;
        Array commentArray;
        tokenArray = this.Arg.TokenArray;
        commentArray = this.Arg.CommentArray;

        long oa;
        oa = sizeof(ulong);

        long totalToken;
        long totalInfo;
        totalToken = 0;
        totalInfo = 0;

        long count;
        count = codeArray.Count;
        long i;
        i = 0;
        while (i < count)
        {
            Code code;
            code = (Code)codeArray.GetAt(i);

            long ob;
            ob = i;
            ob = ob * 2;
            long oe;
            oe = ob * oa;
            long of;
            of = (ob + 1) * oa;
            long tokenCount;
            long commentCount;
            tokenCount = (long)infraInfra.DataIntGet(codeCountData, oe);
            commentCount = (long)infraInfra.DataIntGet(codeCountData, of);

            code.Token = listInfra.ArrayCreate(tokenCount);
            code.Comment = listInfra.ArrayCreate(commentCount);

            listInfra.ArrayCopy(code.Token, 0, tokenArray, totalToken, tokenCount);
            listInfra.ArrayCopy(code.Comment, 0, commentArray, totalInfo, commentCount);

            totalToken = totalToken + tokenCount;
            totalInfo = totalInfo + commentCount;

            i = i + 1;
        }

        return true;
    }

    protected virtual bool AddToken()
    {
        this.Operate.ExecuteToken();
        return true;
    }

    protected virtual bool AddComment()
    {
        this.Operate.ExecuteComment();
        return true;
    }

    protected virtual bool EndToken(long col)
    {
        if (!this.NullRange())
        {
            long count;
            count = this.ClassInfra.Count(this.LineRange.Index, col);
            this.LineRange.Count = count;
            this.AddToken();
        }
        return true;
    }

    protected virtual bool NullRange()
    {
        return this.Row == -1;
    }

    protected virtual bool Reset()
    {
        this.Row = -1;
        return true;
    }
}