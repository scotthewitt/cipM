//CIPm v2

<<< "cipM v2 : Chuck Instrument Processing Mixer ">>>;
<<< "@scotthewitt part of cip.ablelemon.co.uk">>>;
<<< "Mixer default setup" >>>;

bus.chan.cap() - 1 => int lastchannel;

//basic audio routing now dynamic build

for( 0 => int counter; counter < lastchannel; counter++ )
{
    bus.chan[counter] => bus.chan[lastchannel];
    <<< "bus.chan[" + counter + "] => bus.chan[" + lastchannel +"]" >>>;
}

bus.chan[lastchannel] => dac;

<<< "bus.chan["+lastchannel+"] => dac" >>>;

//live forever
while(true) {
    1::hour => now;
}
