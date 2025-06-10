class ErrorString : TextAdd
{
    maide prusate Bool Init()
    {
        base.Init();

        this.StartPos : this.CreateStartPos();
        this.EndPos : this.CreateEndPos();
        this.BordLine : this.CreateBordLine();
        return true;
    }

    maide precate Pos CreatePos()
    {
        var Pos a;
        a : new Pos;
        a.Init();
        return a;
    }

    maide precate Pos CreateStartPos()
    {
        return this.CreatePos();
    }

    maide precate Pos CreateEndPos()
    {
        return this.CreatePos();
    }

    maide precate String CreateBordLine()
    {
        return this.StringComp.CreateChar(this.Char("-"), 50);
    }
}