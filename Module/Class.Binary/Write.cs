namespace Saber.Binary;

public class Write : Any
{
    public override bool Init()
    {
        base.Init();
        this.StringComp = StringComp.This;
        this.CountOperate = new CountWriteOperate();
        this.CountOperate.Write = this;
        this.CountOperate.Init();
        this.SetOperate = new SetWriteOperate();
        this.SetOperate.Write = this;
        this.SetOperate.Init();
        return true;
    }

    public virtual Binary Binary { get; set; }
    public virtual Data Data { get; set; }
    public virtual long Index { get; set; }
    protected virtual StringComp StringComp { get; set; }
    protected virtual CountWriteOperate CountOperate { get; set; }
    protected virtual SetWriteOperate SetOperate { get; set; }
    protected virtual WriteOperate Operate { get; set; }

    public virtual bool Execute()
    {
        this.Operate = this.CountOperate;
        this.Index = 0;

        this.ExecuteStage();

        long count;
        count = this.Index;
        this.Data = new Data();
        this.Data.Count = count;
        this.Data.Init();

        this.Operate = this.SetOperate;
        this.Index = 0;

        this.ExecuteStage();

        this.Operate = null;
        this.Index = 0;

        return true;
    }

    protected virtual bool ExecuteStage()
    {
        this.ExecuteBinary(this.Binary);
        return true;
    }

    protected virtual bool ExecuteBinary(Binary binary)
    {
        this.ExecuteModuleRef(binary.Ref);
        this.ExecuteClassArray(binary.Class);
        this.ExecuteImportArray(binary.Import);
        this.ExecuteExportArray(binary.Export);
        this.ExecuteBaseArray(binary.Base);
        this.ExecutePartArray(binary.Part);
        this.ExecuteEntry(binary.Entry);
        return true;
    }

    protected virtual bool ExecuteClassArray(Array array)
    {
        long count;
        count = array.Count;
        this.ExecuteCount(count);
        long i;
        i = 0;
        while (i < count)
        {
            Class varClass;
            varClass = (Class)array.GetAt(i);
            this.ExecuteClass(varClass);
            i = i + 1;
        }
        return true;
    }

    protected virtual bool ExecuteClass(Class varClass)
    {
        this.ExecuteName(varClass.Name);
        return true;
    }

    protected virtual bool ExecuteImportArray(Array array)
    {
        long count;
        count = array.Count;
        this.ExecuteCount(count);
        long i;
        i = 0;
        while (i < count)
        {
            Import import;
            import = (Import)array.GetAt(i);
            this.ExecuteImport(import);
            i = i + 1;
        }
        return true;
    }

    protected virtual bool ExecuteImport(Import import)
    {
        this.ExecuteModuleRef(import.Module);
        this.ExecuteClassIndexArray(import.Class);
        return true;
    }

    protected virtual bool ExecuteExportArray(Array array)
    {
        return this.ExecuteClassIndexArray(array);
    }

    protected virtual bool ExecuteClassIndexArray(Array array)
    {
        long count;
        count = array.Count;
        this.ExecuteCount(count);
        long i;
        i = 0;
        while (i < count)
        {
            Value classIndex;
            classIndex = (Value)array.GetAt(i);
            this.ExecuteClassIndex(classIndex);
            i = i + 1;
        }
        return true;
    }

    protected virtual bool ExecuteClassIndex(Value classIndex)
    {
        this.ExecuteIndex(classIndex.Int);
        return true;
    }

    protected virtual bool ExecuteBaseArray(Array array)
    {
        return this.ExecuteClassIndexArray(array);
    }

    protected virtual bool ExecutePartArray(Array array)
    {
        long count;
        count = array.Count;
        this.ExecuteCount(count);
        long i;
        i = 0;
        while (i < count)
        {
            Part part;
            part = (Part)array.GetAt(i);
            this.ExecutePart(part);
            i = i + 1;
        }
        return true;
    }

    protected virtual bool ExecutePart(Part part)
    {
        this.ExecuteIndex(part.FieldStart);
        this.ExecuteIndex(part.MaideStart);
        
        this.ExecuteFieldArray(part.Field);
        this.ExecuteMaideArray(part.Maide);
        return true;
    }

    protected virtual bool ExecuteFieldArray(Array array)
    {
        long count;
        count = array.Count;
        this.ExecuteCount(count);
        long i;
        i = 0;
        while (i < count)
        {
            Field field;
            field = (Field)array.GetAt(i);
            this.ExecuteField(field);
            i = i + 1;
        }
        return true;
    }

    protected virtual bool ExecuteField(Field varField)
    {
        this.ExecuteIndex(varField.Class);
        this.ExecuteByte(varField.Count);
        this.ExecuteName(varField.Name);
        return true;
    }

    protected virtual bool ExecuteMaideArray(Array array)
    {
        long count;
        count = array.Count;
        this.ExecuteCount(count);
        long i;
        i = 0;
        while (i < count)
        {
            Maide maide;
            maide = (Maide)array.GetAt(i);
            this.ExecuteMaide(maide);
            i = i + 1;
        }
        return true;
    }

    protected virtual bool ExecuteMaide(Maide varMaide)
    {
        this.ExecuteIndex(varMaide.Class);
        this.ExecuteByte(varMaide.Count);
        this.ExecuteName(varMaide.Name);
        this.ExecuteVarArray(varMaide.Param);
        return true;
    }

    protected virtual bool ExecuteVarArray(Array array)
    {
        long count;
        count = array.Count;
        this.ExecuteCount(count);
        long i;
        i = 0;
        while (i < count)
        {
            Var varVar;
            varVar = (Var)array.GetAt(i);
            this.ExecuteVar(varVar);
            i = i + 1;
        }
        return true;
    }

    protected virtual bool ExecuteVar(Var varVar)
    {
        this.ExecuteIndex(varVar.Class);
        this.ExecuteName(varVar.Name);
        return true;
    }

    protected virtual bool ExecuteEntry(long entry)
    {
        if (entry == -1)
        {
            return true;
        }

        this.ExecuteIndex(entry);
        return true;
    }

    protected virtual bool ExecuteModuleRef(ModuleRef varRef)
    {
        this.ExecuteName(varRef.Name);
        this.ExecuteInt(varRef.Ver);
        return true;
    }

    protected virtual bool ExecuteName(String name)
    {
        return this.ExecuteString(name);
    }

    protected virtual bool ExecuteString(String value)
    {
        StringComp stringComp;
        stringComp = this.StringComp;

        long count;
        count = stringComp.Count(value);
        this.ExecuteCount(count);
        int i;
        i = 0;
        while (i < count)
        {
            long oc;
            oc = stringComp.Char(value, i);

            this.ExecuteByte(oc);
            i = i + 1;
        }
        return true;
    }

    protected virtual bool ExecuteCount(long value)
    {
        return this.ExecuteInt(value);
    }

    protected virtual bool ExecuteIndex(long value)
    {
        return this.ExecuteInt(value);
    }

    protected virtual bool ExecuteInt(long value)
    {
        ulong k;
        k = (ulong)value;
        k = k << 4;
        k = k >> 4;

        long count;
        count = sizeof(ulong);
        long i;
        i = 0;
        while (i < count)
        {
            int shiftCount;
            shiftCount = (int)(i * 8);

            ulong ka;
            ka = (k >> shiftCount) & 0xff;

            byte a;
            a = (byte)ka;

            this.ExecuteByte(a);

            i = i + 1;
        }
        return true;
    }

    protected virtual bool ExecuteByte(long value)
    {
        this.Operate.ExecuteByte(value);
        return true;
    }
}