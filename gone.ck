
Mandolin elec_bass => NRev r => dac;
.45 => r.gain;
.12 => r.mix;

    .1333 => elec_bass.bodySize;
    0.333 => elec_bass.pluckPos;
    0.6 => elec_bass.stringDamping;


0.8 => elec_bass.gain;


            
            Std.mtof(TN.bassScale[1]) => elec_bass.freq;  

            0.50 => elec_bass.noteOn;  
            BPM.R4 => now;
            0.50 => elec_bass.noteOff;  
            BPM.R8 => now;