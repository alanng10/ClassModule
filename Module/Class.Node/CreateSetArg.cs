namespace Saber.Node;

public class CreateSetArg : Any
{
    public virtual NodeKind Kind { get; set; }
    public virtual object Field00 { get; set; }
    public virtual object Field01 { get; set; }
    public virtual object Field02 { get; set; }
    public virtual object Field03 { get; set; }
    public virtual object Field04 { get; set; }
    public virtual bool FieldBool { get; set; }
    public virtual long FieldInt { get; set; }
    public virtual long Start { get; set; }
    public virtual long End { get; set; }
}