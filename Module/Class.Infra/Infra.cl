class Infra : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.InfraInfra : share InfraInfra;
        this.TextInfra : share TextInfra;
        this.CountList : share CountList;

        this.TextQuote : "\"";
        this.TextNext : "\\";
        this.TextNewLine : "\n";
        this.TextDot : ".";
        this.TextHyphen : "-";
        this.TextSpace : " ";
        this.IntSignNegateMax : bit <(1, 59);
        this.IntSignPositeMax : this.IntSignNegateMax - 1;
        return true;
    }
}