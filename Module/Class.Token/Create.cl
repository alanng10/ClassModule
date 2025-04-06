class Create : ClassCreate
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        this.ListInfra : share ListInfra;
        this.ClassInfra : share ClassInfra;

        this.CountOperate : this.CreateCountOperate();
        this.SetOperate : this.CreateSetOperate();
        return true;
    }

    maide precate CountCreateOperate CreateCountOperate()
    {
        var CountCreateOperate a;
        a : new CountCreateOperate;
        a.Create : this;
        a.Init();
        return a;
    }

    maide precate SetCreateOperate CreateSetOperate()
    {
        var SetCreateOperate a;
        a : new SetCreateOperate;
        a.Create : this;
        a.Init();
        return a;
    }

    field prusate Array Source { get { return data; } set { data : value; } }
    field prusate Result Result { get { return data; } set { data : value; } }
    field prusate CreateArg Arg { get { return data; } set { data : value; } }
    field precate CountCreateOperate CountOperate { get { return data; } set { data : value; } }
    field precate SetCreateOperate SetOperate { get { return data; } set { data : value; } }
    field precate CreateOperate Operate { get { return data; } set { data : value; } }
    field precate Array Code { get { return data; } set { data : value; } }
    field precate Source SourceItem { get { return data; } set { data : value; } }
    field precate Int Row { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        this.Result : new Result;
        this.Result.Init();

        this.Code : this.CreateCodeArray();

        this.Result.Code : this.Code;
        this.Result.Error : this.ListInfra.ArrayCreate(0);

        this.Arg : new CreateArg;
        this.Arg.Init();

        var CreateArg arg;
        arg : this.Arg;

        arg.CodeCountData : new Data;
        arg.CodeCountData.Count : this.Code.Count * 8 * 2;
        arg.CodeCountData.Init();

        this.Operate : this.CountOperate;

        this.ResetStage();
        this.ExecuteStage();

        arg.TokenArray : this.ListInfra.ArrayCreate(arg.TokenIndex);
        arg.CommentArray : this.ListInfra.ArrayCreate(arg.CommentIndex);

        this.ExecuteCreateToken();
        this.ExecuteCreateComment();
        this.ExecuteCodeArraySet();

        this.Operate : this.SetOperate;

        this.ResetStage();
        this.ExecuteStage();

        this.Arg : null;
        this.Operate : null;
        return true;
    }

    maide prusate Bool ResetStage()
    {
        this.Arg.TokenIndex : 0;
        this.Arg.CommentIndex : 0;
        return true;
    }

    maide precate Array CreateCodeArray()
    {
        var Array array;
        array : this.ListInfra.ArrayCreate(this.Source.Count);

        var Int Count;
        count : array.Count;

        var Int i;
        i : 0;
        while (i < count)
        {
            var Code a;
            a : new Code;
            a.Init();

            array.Set(i, a);

            i : i + 1;
        }

        return array;
    }

    maide precate Bool ExecuteCreateToken()
    {
        var Array array;
        array : this.Arg.TokenArray;

        var Int count;
        count : array.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Token a;
            a : new Token;
            a.Init();
            a.Range : new Range;
            a.Range.Init();

            array.Set(i, a);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteCreateComment()
    {
        var Array array;
        array : this.Arg.CommentArray;

        var Int count;
        count : array.Count;
        var Int i;
        i : 0;
        while (i < count)
        {
            var Comment a;
            a : new Comment;
            a.Init();
            a.Range : new Range;
            a.Range.Init();

            array.Set(i, a);

            i : i + 1;
        }
        return true;
    }

    maide precate Bool ExecuteCodeArraySet()
    {
        var InfraInfra infraInfra;
        infraInfra : this.InfraInfra;
        var ListInfra listInfra;
        listInfra : this.ListInfra;

        var Array codeArray;
        codeArray : this.Code;
        var Data data;
        data : this.Arg.CodeCountData;

        var Array tokenArray;
        var Array commentArray;
        tokenArray : this.Arg.TokenArray;
        commentArray : this.Arg.CommentArray;
    }
}