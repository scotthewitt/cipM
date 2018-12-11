# cipM
ChucK Instrument Processing Mixer

## About

cipM is the Mixer built into CIP as a stand alone application. (CIP still uses another code base but they will one day be united.)

### cipM is

  * Configurable Mixer
  * Optional GUI
  * Mono

### Requires

cipM requires a current install ChucK.

Available free <a href="http://chuck.cs.princeton.edu/" target="_blank">here</a>.

cipM has been tested on OS X 10.6 upwards...

cipM GUI only works on OS X.

## Manual

### Quick Start OSX with GUI Interface

 - Add load-cipm.ck
 - Add user-interface/cipm-gui.ck

### Quick Start without GUI Interface

 - Add load-cipm.ck
 - Add example/no-gui-example.ck
 
### Use

 - Create cipM preset (see preset folder for examples)
 
 - setup number of channels (src/cip.ck)
 
  <pre>4 => int maxchannels;</pre>

 - Add selected preset to (load-cipm.ck)
 
 - Add load-cipm.ck

#### Mixer Controller Behaviors

 - Create Mixer Controller

<pre>CipMixerInterface cm;</pre>

 - Connect UGen to bus (Ugen, bus)
<pre>.connect(Ugen, int)</pre>

 - Change gain on bus (bus, value)
<pre>.gainchange(int,float)</pre>

 - Disconnect UGen to bus (Ugen, bus)
<pre>.disconnect(Ugen,int)</pre>

## Online

<http://ablelemon.co.uk/chuck/cipm/>
