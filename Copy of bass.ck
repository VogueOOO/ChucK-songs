// bass.ck
// Insert the title of your piece here


TN bt;
int bass_note_offset [];
int bass_note_run [];

Mandolin elec_bass => NRev r => dac;
.45 => r.gain;
.12 => r.mix;

    .1333 => elec_bass.bodySize;
    0.333 => elec_bass.pluckPos;
    0.6 => elec_bass.stringDamping;


0.8 => elec_bass.gain;


    int some_note; // an index into the bass_scale{}
 
  now => time startTime; // used for timing computations

 0=> int bass_rep;  // counter for a modulus operation
 float bass_t1, bass_t2; //

// begin to make sound

    while(!ShredControl.StopForFinale){ // let Machine.add terminate without warning, oh well...
    bass_rep++;  // number of time a phrase was played
    if ((bass_rep-1) %4 ==0)
    {   // play a three note run on the footpedal
        1.0 => elec_bass.gain;
        Std.mtof( TN.bassScale[1]) => elec_bass.freq; 
        0.45 => elec_bass.noteOn; 
        3.0*BPM.T3 => now;

        0.5 => elec_bass.noteOff;
        2.0*BPM.T3 => now;
        
        Std.mtof( TN.bassScale[0]) => elec_bass.freq; 
        0.45 => elec_bass.noteOn; 
        2.0*BPM.T3 => now;

        0.5 => elec_bass.noteOff;
        2.0*BPM.T3 => now;
        
        Std.mtof( TN.bassScale[1] ) => elec_bass.freq; 
        0.45 => elec_bass.noteOn; 
        2.0*BPM.T3 => now;

        0.5 => elec_bass.noteOff;
        2.0*BPM.T3 => now;        
    }
    else 
    {
        // that's it for the other one,
        0.8 => elec_bass.gain;
        Std.mtof( TN.bassScale[0]) => elec_bass.freq;  
        0.45 => elec_bass.noteOn; 
        3.0*BPM.T3 => now;
        
        0.5 => elec_bass.noteOff;
        BPM.T3 => now;
        
        Std.mtof( TN.bassScale[1]) => elec_bass.freq; 
        0.45 => elec_bass.noteOn; 
        3.0*BPM.T3 => now;

        0.5 => elec_bass.noteOff;
        BPM.T3 => now;       
    }
    // The phrase continues... 
    if (bass_rep%3 ==0)
        { 
            // this is where the bass player tries to bow some parts of the comp. 'tries' haha
            0.7 => elec_bass.gain;
            
            bt.TreeTopDown (TN.BassOffsetTree1,1) @=> bass_note_offset;
            
            
            TN.bassScale[1+bass_note_offset[0]] => some_note;
            Std.mtof(some_note) => elec_bass.freq;  

            0.40 => elec_bass.noteOn;  
         
            BPM.T3 => now;
            0.15 => elec_bass.noteOff;   
            BPM.T6 => now;

            TN.bassScale[1+bass_note_offset[1]] => some_note;
            Std.mtof(some_note) => elec_bass.freq;  
            0.40 => elec_bass.noteOn;
            BPM.T3 => now;

            0.1 => elec_bass.noteOff; 
            BPM.T6 => now;  
            
            TN.bassScale[1+bass_note_offset[2]] => some_note;
            Std.mtof(some_note) => elec_bass.freq;  
            0.40 => elec_bass.noteOn;
            BPM.T3 => now;

            0.1 => elec_bass.noteOff; 
            BPM.T6 => now;  

    } else {BPM.T6 => now;BPM.T3 => now;BPM.T6 => now;BPM.T3 => now; }

}