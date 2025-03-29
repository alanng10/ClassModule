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

    field prusate String TextQuote { get { return data; } set { data : value; } }
    field prusate String TextNext { get { return data; } set { data : value; } }
    field prusate String TextNewLine { get { return data; } set { data : value; } }
    field prusate String TextDot { get { return data; } set { data : value; } }
    field prusate String TextHyphen { get { return data; } set { data : value; } }
    field prusate String TextSpace { get { return data; } set { data : value; } }
    field prusate Int IntSignPositeMax { get { return data; } set { data : value; } }
    field prusate Int IntSignNegateMax { get { return data; } set { data : value; } }
    field precate InfraInfra InfraInfra { get { return data; } set { data : value; } }
    field precate TextInfra TextInfra { get { return data; } set { data : value; } }
    field precate CountList CountList { get { return data; } set { data : value; } }
}