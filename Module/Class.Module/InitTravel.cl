class InitTravel : Travel
{
    maide precate Bool ExecuteNode(var Node node)
    {
        var Info info;
        info : new Info;
        info.Init();

        node.NodeAny : info;
        return true;
    }
}