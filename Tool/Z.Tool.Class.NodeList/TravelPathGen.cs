namespace Z.Tool.Class.NodeList;

public class TravelPathGen : ClassTravelPathGen
{
    public override bool Init()
    {
        base.Init();

        this.PathOutput = this.S("../../Module/Class.Console/PathTravel.cl");

        this.PathSource = this.GetPathName(this.S("PathSource.cl"));
        return true;
    }
}