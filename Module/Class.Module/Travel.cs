namespace Saber.Module;

public class Travel : NodeTravel
{
    public override bool Init()
    {
        base.Init();
        this.Count = this.Create.Count;
        this.ErrorKind = this.Create.ErrorKind;
        this.Module = this.Create.Module;
        return true;
    }

    public virtual Create Create { get; set; }
    public virtual Source Source { get; set; }
    protected virtual CountList Count { get; set; }
    protected virtual ErrorKindList ErrorKind { get; set; }
    protected virtual ClassModule Module { get; set; }

    protected virtual Info Info(NodeNode node)
    {
        return this.Create.Info(node);
    }

    protected virtual ClassClass Class(String name)
    {
        ClassClass a;
        a = this.Create.Class(name);
        return a;
    }

    protected virtual bool UniqueError(ErrorKind kind, NodeNode node, bool hasAdded)
    {
        if (!hasAdded)
        {
            this.Error(kind, node);
            hasAdded = true;
        }
        return hasAdded;
    }

    protected virtual bool Error(ErrorKind kind, NodeNode node)
    {
        this.Create.Error(kind, node, this.Source);
        return true;
    }
}