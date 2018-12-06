class CipMGui extends CipMixerInterface
{
    MAUI_View mixer_gui;
    mixer_gui.name( "cipM v2" );    
    MAUI_Slider slider[bus.chan.cap()];
    MAUI_Gauge gauge[bus.chan.cap()];
    for (0 => int i; i < bus.chan.cap(); i++)
    {
        slider[i];
        slider[i].range( 0.0, 1.0 );
        //different UI for final slider
        if(i == (bus.chan.cap()-1))
        {
        slider[i].name( "Main Out Buss " + i );
        gauge[i].position( 0, (50*i+10) );
        slider[i].position( 0, (50*i+10));
        }else{
        slider[i].name( "Buss " + i );
        gauge[i].position( 0, 50*i );
        slider[i].position( 0, 50*i );            
        }        
        mixer_gui.addElement(slider[i]);
        mixer_gui.addElement(gauge[i]);
        //slider[i].display();
        spork ~ slidervalue(i);
        spork ~ lev_mon(i);
        //set slider to current value
        bus.chan[i].gain() => slider[i].value;
    }
    
    function void slidervalue(int ii)
    {
        float f;
        while(1)
        {
            slider[ii] => now;        
            slider[ii].value() => f;
            gainchange(ii,f);
            //let envelope smooth
            2::ms => now;
        }
    }
    
    function void lev_mon (int a){
        while (true){
            bus.chan[a].last() * 100.0 => gauge[a].value;
            30::ms => now;
        }
    }
    
    mixer_gui.size( 250, (50*bus.chan.cap()+50) );
    mixer_gui.display();
}

CipMGui cip;

1::day => now;