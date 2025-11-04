class Entry : EntryEntry
{
    maide precate Int ExecuteMain()
    {
        var Console console;
        console : new Console;
        console.Init();

        var Bool b;
        b : console.Load();

        inf (~b)
        {
            return 600;
        }

        inf (b)
        {
            var Bool ba;
            ba : console.ArgSet(this.Arg);
            inf (ba)
            {
                console.Execute();
            }
        }

        var Int a;
        a : console.Status;
        return a;
    }
}