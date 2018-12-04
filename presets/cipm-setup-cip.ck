//CIP v2

<<< "cipM v2 : Chuck Instrument Processing Mixer ">>>;
<<< "@scotthewitt part of cip.ablelemon.co.uk">>>;
<<< "CIP default setup" >>>;

bus.chan.cap() - 1 => int lastchannel;

//basic audio routing now dynamic build
adc => bus.chan[0] => blackhole;

for( 1 => int counter; counter < lastchannel; counter++ )
{
    bus.chan[counter] => blackhole;
}

bus.chan[lastchannel] => dac;

<<< "adc => bus.chan[0] and bus.chan["+lastchannel+"] => dac" >>>;

//live forever
while(true) {
    1::hour => now;
}
