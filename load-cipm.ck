//Load CIPm
me.sourceDir() + "src/" + "cip.ck" => string load;
Machine.add(load);
me.sourceDir() + "src/" + "sub-interface.ck" => load;
Machine.add(load);

//Load Default Mixer Routing
me.sourceDir() + "presets/" + "cipm-setup-mixer.ck" => load;
Machine.add(load);