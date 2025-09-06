class ClassGenaCountOperate : ClassGenaOperate
{
    field precate TextInfra TextInfra { get { return data; } set { data : value; } }
    field precate Format Format { get { return data; } set { data : value; } }
    field precate FormatArg FormatArgInt { get { return data; } set { data : value; } }

    maide prusate Bool ExecuteChar(var Int value)
    {
        var ClassGenaArg arg;
        arg : this.Gena.Arg;

        var Int index;
        index : arg.Index;
        index : index + 1;
        arg.Index : index;
        return true;
    }
}