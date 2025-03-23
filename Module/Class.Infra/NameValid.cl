class NameValid : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.TextInfra : share TextInfra;
        this.StringComp : share StringComp;
        this.IndexList : share IndexList;

        this.StringData : new StringData;
        this.StringData.Init();

        var Text text;
        text : new Text;
        text.Init();
        text.Range : new InfraRange;
        text.Range.Init();
        this.Text : text;

        this.DotText : this.TextInfra.TextCreateStringData(".", null);
        return true;
    }
}