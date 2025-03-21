namespace Saber.Infra;

public class Maide : Any
{
    public virtual String Name { get; set; }
    public virtual Class Class { get; set; }
    public virtual Count Count { get; set; }
    public virtual Maide Virtual { get; set; }
    public virtual Table Param { get; set; }
    public virtual Table Call { get; set; }
    public virtual Class Parent { get; set; }
    public virtual long Index { get; set; }
    public virtual object Any { get; set; }
}