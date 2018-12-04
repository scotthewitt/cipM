//CIP Mixer 2018 CIPm
//@scotthewitt

//setup number of channels
4 => int maxchannels;
maxchannels - 1 => int lastchannel;

public class bus
{
    static Gain @ chan[maxchannels];
}
new Gain[maxchannels] @=> bus.chan;

<<< "CIPm loaded you might want to load a preset!" >>>;