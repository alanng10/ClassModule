namespace Saber.Port;

public class Import : Any
{
    public virtual ModuleRef Module { get; set; }

    public virtual Array Class { get; set; }
}