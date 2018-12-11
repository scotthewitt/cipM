//cipM Example
//requires default mixer preset

SinOsc s;

//create mixer controller
CipMixerInterface cm;

//connect UGen to audio buss
cm.connect(s,2);

//change gain
cm.gainchange(3,0.9);

1000::ms => now;
//change gain
cm.gainchange(3,0.1);

1000::ms => now;

cm.gainchange(3,0.9);

1000::ms => now;

//connect UGen from audio buss
cm.disconnect(s,3);

1000::ms => now;