class CreateCountOperate : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ListInfra : share ListInfra;
        this.TextInfra : share TextInfra;

        this.List : this.CreateList();
        this.String : this.CreateString();
        return true;
    }

    maide precate Array CreateList()
    {
        return this.ListInfra.ArrayCreate(0);
    }

    maide precate String CreateString()
    {
        return this.TextInfra.Zero;
    }

    field precate ListInfra ListInfra { get { return data; } set { data : value; } }
    field precate TextInfra TextInfra { get { return data; } set { data : value; } }
    field precate Array List { get { return data; } set { data : value; } }
    field precate String String { get { return data; } set { data : value; } }
}