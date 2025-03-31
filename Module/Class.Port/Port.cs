namespace Saber.Port;

public class Port : Any
{
    public virtual ModuleRef Module { get; set; }

    public virtual Array Import { get; set; }

    public virtual Array Export { get; set; }

    public virtual Array Storage { get; set; }

    public virtual String Entry { get; set; }
}