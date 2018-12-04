public class CipMixer
{
    bus.chan.cap() => int maxchannum;
        
    function int maxchannels()
    {
        <<< bus.chan.cap() >>>;
        bus.chan.cap() => maxchannum;
        return maxchannum;
    }
    
    function void parallelfade(UGen u, Envelope tempenv)
    {
        0::ms => dur counter;
        
        while(counter < tempenv.duration())
        {
            counter + 1::samp => counter;
            tempenv.value() => u.gain;
            1::samp => now;          
        } 
    }
    
    function void disconnect(UGen u, int i)
    {
        Envelope temp => blackhole;
        6::ms => temp.duration;
        u.gain() => float tempf;
        tempf => temp.value;
        temp.keyOff();
        
        parallelfade(u, temp);
        
        u =< bus.chan[i];
    } 
    
    
    function void connect(UGen u, int i)
    {
        Envelope temp => blackhole;
        6::ms => temp.duration;
        u.gain() => float tempf;
        tempf => temp.value;
        temp.keyOff();
        
        parallelfade(u, temp);
        //connect when at 0
        u => bus.chan[i];
        tempf => temp.target;
        <<< "tempf " + tempf + "ugain " + u.gain() >>>;
        //temp.keyOn();
        
        parallelfade(u, temp);
    }
}

//Example of use SinOSC to demo passing ref
//CipMixer cm;
//SinOsc s;
//cm.connect(s,3);
//3000::ms => now;
//cm.disconnect(s,3);
//1000::ms => now;