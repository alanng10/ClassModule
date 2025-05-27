class CompTravel : Travel
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.ClassInfra : share ClassInfra;
        return true;
    }

    field prusate Class ThisClass { get { return data; } set { data : value; } }
    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate ClassInfra ClassInfra { get { return data; } set { data : value; } }
    field precate Table ParamVar { get { return data; } set { data : value; } }

    maide prusate Bool ExecuteClass(var NodeClass nodeClass)
    {
        inf (nodeClass = null)
        {
            return true;
        }

        this.ThisClass : this.Info(nodeClass).Class;

        base.ExecuteClass(nodeClass);

        this.ThisClass : null;

        return true;
    }

    maide prusate Bool ExecuteField(var NodeField nodeField)
    {
        inf (nodeField = null)
        {
            return true;
        }

        var FieldName name;
        name : nodeField.Name;
        var ClassName nodeClass;
        nodeClass : nodeField.Class;
        var NodeCount nodeCount;
        nodeCount : nodeField.Count;
        var State nodeGet;
        nodeGet : nodeField.Get;
        var State nodeSet;
        nodeSet : nodeField.Set;

        var String fieldName;
        inf (~(name = null))
        {
            fieldName : name.Value;
        }

        var String className;
        inf (~(nodeClass = null))
        {
            className : nodeClass.Value;
        }

        inf (~(fieldName = null))
        {
            inf (~(this.ClassInfra.CompDefine(this.ThisClass, fieldName) = null))
            {
                this.Error(this.ErrorKind.NameUnavail, nodeField);
                return true;
            }
        }

        var Class varClass;

        inf (~(className = null))
        {
            varClass : this.Class(className);
            inf (varClass = null)
            {
                this.Error(this.ErrorKind.ClassUndefine, nodeField);
                return true;
            }
        }

        var Count count;
        count : this.CountGet(nodeCount);

        var Table varGet;
        varGet : this.ClassInfra.TableCreateStringLess();

        var Table varSet;
        varSet : this.ClassInfra.TableCreateStringLess();

        var Field a;
        a : new Field;
        a.Init();
        a.Name : fieldName;
        a.Class : varClass;
        a.Count : count;
        a.Get : varGet;
        a.Set : varSet;
        a.Parent : this.ThisClass;
        a.Any : nodeField;

        this.ListInfra.TableAdd(this.ThisClass.Field, a.Name, a);
        return true;
    }

    maide prusate Bool ExecuteMaide(var NodeMaide nodeMaide)
    {
        inf (nodeMaide = null)
        {
            return true;
        }

        var MaideName name;
        name : nodeMaide.Name;
        var ClassName nodeClass;
        nodeClass : nodeMaide.Class;
        var NodeCount nodeCount;
        nodeCount : nodeMaide.Count;
        var Param param;
        param : nodeMaide.Param;
        var State call;
        call : nodeMaide.Call;

        var String maideName;
        inf (~(name = null))
        {
            maideName : name.Value;
        }

        var String className;
        inf (~(nodeClass = null))
        {
            className : nodeClass.Value;
        }

        inf (~(maideName = null))
        {
            inf (~(this.ClassInfra.CompDefine(this.ThisClass, maideName) = null))
            {
                this.Error(this.ErrorKind.NameUnavail, nodeMaide);
                return true;
            }
        }

        var Class varClass;

        inf (~(className = null))
        {
            varClass : this.Class(className);
            inf (varClass = null)
            {
                this.Error(this.ErrorKind.ClassUndefine, nodeMaide);
                return true;
            }
        }

        var Count count;
        count : this.CountGet(nodeCount);

        this.ParamVar : this.ClassInfra.TableCreateStringLess();

        var Table callVar;
        callVar : this.ClassInfra.TableCreateStringLess();

        this.ExecuteParam(param);

        var Maide a;
        a : new Maide;
        a.Init();
        a.Name : maideName;
        a.Class : varClass;
        a.Count : count;
        a.Param : this.ParamVar;
        a.Call : callVar;
        a.Parent : this.ThisClass;
        a.Any : nodeMaide;

        this.ParamVar : null;

        this.ListInfra.TableAdd(this.ThisClass.Maide, a.Name, a);
        return true;
    }

    maide prusate Bool ExecuteVar(var NodeVar nodeVar)
    {
        inf (nodeVar = null)
        {
            return true;
        }

        var VarName name;
        name : nodeVar.Name;
        var ClassName nodeClass;
        nodeClass : nodeVar.Class;

        var String varName;
        inf (~(name = null))
        {
            varName : name.Value;
        }

        var String className;
        inf (~(nodeClass = null))
        {
            className : nodeClass.Value;
        }

        inf (~(varName = null))
        {
            inf (this.ParamVar.Valid(varName))
            {
                this.Error(this.ErrorKind.NameUnavail, nodeVar);
                return true;
            }
        }

        var Class varClass;

        inf (~(className = null))
        {
            varClass : this.Class(className);
            inf (varClass = null)
            {
                this.Error(this.ErrorKind.ClassUndefine, nodeVar);
                return true;
            }
        }
    }
}