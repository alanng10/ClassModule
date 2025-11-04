class Entry : EntryEntry
{
    maide precate Int ExecuteMain()
    {
        Console console;
        console : new Console();
        console.Init();

        var Bool b;
        b : console.Load();

        if (!b)
        {
            return 600;
        }

        if (b)
        {
            var Bool ba;
            ba : console.ArgSet(this.Arg);
            if (ba)
            {
                console.Execute();
            }
        }

        var Int a;
        a : console.Status;
        return a;
    }
}