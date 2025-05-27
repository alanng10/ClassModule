class ClassTravel : Travel
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.ClassInfra : share ClassInfra;
        return true;
    }

    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate ClassInfra ClassInfra { get { return data; } set { data : value; } }

    maide prusate Bool ExecuteClass(var NodeClass nodeClass)
    {
        inf (nodeClass = null)
        {
            return true;
        }

        var ClassName name;
        name : nodeClass.Name;

        var String className;
        inf (~(name = null))
        {
            className : name.Value;
        }

        inf (className = null)
        {
            return true;
        }

        var Class ka;
        ka : this.Class(className);
        inf (~(ka = null))
        {
            this.Error(this.ErrorKind.NameUnavail, nodeClass);
            return true;
        }

        var Class k;
        k : new Class;
        k.Init();
        k.Name : className;
        k.Base : null;
        k.Field : this.ClassInfra.TableCreateStringLess();
        k.Maide : this.ClassInfra.TableCreateStringLess();
        k.Module : this.Create.Module;
        k.Index : this.Create.SourceIndex;
        k.Any : nodeClass;

        this.ListInfra.TableAdd(this.Create.Module.Class, k.Name, k);

        this.Info(nodeClass).Class : k;
        return true;
    }
}