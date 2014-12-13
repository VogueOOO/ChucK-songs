
BPM Beat;

TN NT;  // get tonality

TapeRecorder TR, BTR;
int i;
time ofTheNote;

/* ----------------------------------------------- */

   [
   
    " N=A4 D=R6 ",
    " N=B4 D=R6 ",
    " N=C5 D=R2 ",

    " N=A4 D=R6 ",
    " N=B4 D=R6 ",
    " N=C5 D=R4 ",

    " N=A4 D=R6 ",
    " N=B4 D=R6 ",
    " N=G5 D=R8 ",
    " N=F5 D=R8 ",
    
    " N=E5 D=R8 ", 
    " N=G5 D=R8 ",
    
    " N=E5 D=R8 ", 
    " N=G5 D=R8 ",
    " N=G5 D=R8 ",    
    
    " N=A5 D=R2 ", 
    " N=C6 D=R4 ",    
    " N=E6 D=R4 ",
   
    " N=A5 D=R2 ",    
    " N=A5 D=R2 ",       
    " N=G5 D=R2 ",    
    " N=G5 D=R2 ",      

//

    " N=A4 D=R6 ",
    " N=B4 D=R6 ",
    " N=C5 D=R2 ",

    " N=A4 D=R6 ",
    " N=B4 D=R6 ",
    " N=C5 D=R4 ",

    " N=A4 D=R6 ",
    " N=B4 D=R6 ",
    " N=G5 D=R8 ",
    " N=F5 D=R8 ",
    
    " N=E5 D=R8 ", 
    " N=G5 D=R8 ",
    
    " N=E5 D=R8 ", 
    " N=G5 D=R8 ",
    " N=G5 D=R8 ",    
    
    " N=A5 D=R2 ", 
    " N=C6 D=R4 ",    
    " N=E6 D=R4 ",
   
    " N=A5 D=R2 ",    
    " N=A5 D=R2 ",       
    " N=G5 D=R2 ",    
    " N=G5 D=R2 ",
   
    " N=G5 D=R2 P=1 ",
    " N=G5 D=R2 P=1 ",
    " N=G5 D=R4 P=1 ",
//

    " N=A4 D=R6 ",
    " N=B4 D=R6 ",
    " N=C5 D=R2 ",

    " N=A4 D=R6 ",
    " N=B4 D=R6 ",
    " N=C5 D=R4 ",

    " N=A4 D=R6 ",
    " N=B4 D=R6 ",
    " N=G5 D=R8 ",
    " N=F5 D=R8 ",
    
    " N=E5 D=R8 ", 
    " N=G5 D=R8 ",
    
    " N=E5 D=R8 ", 
    " N=G5 D=R8 ",
    " N=G5 D=R8 ",    
    
    " N=C6 D=R2 ", 
    " N=E6 D=R4 ",    
    " N=A5 D=R4 ",
    
    
    " N=G5 D=R2 ",     
    " N=G5 D=R2 ", 
    " N=A5 D=R2 ",    
    " N=A5 D=R2 ",       
  
//

    " N=A4 D=R6 ",
    " N=B4 D=R6 ",
    " N=C5 D=R2 ",

    " N=A4 D=R6 ",
    " N=B4 D=R6 ",
    " N=C5 D=R4 ",

    " N=F5 D=R8 ",
    " N=A4 D=R6 ",
    " N=B4 D=R6 ",
    " N=G5 D=R8 ",

    
    " N=E5 D=R8 ", 
    " N=G5 D=R8 ",
    
    " N=E5 D=R8 ", 
    " N=G5 D=R8 ",
    " N=G5 D=R8 ",    
    
    " N=A5 D=R2 ", 
    " N=C6 D=R4 ",    
    " N=E5 D=R4 ",
   
    " N=G5 D=R2 ",    
    " N=A5 D=R2 ",          
    " N=C5 D=R2 ",
   
    " N=G5 D=R4 P=1 "


    ] @=> string Song01Note [];
    
    Song01Note.cap() - 1 => int Song01NoteCap;   



   [" N=C4 D=R4 ", // 1
    " N=G4 D=R4 ", // 2
    " N=F4 D=R8 ", // 3
    " N=A4 D=R8 ", 
    " N=B4 D=R8 ", // 4
    " N=A4 D=R8 ", 
    " N=E4 D=R8 ",   //5
    " N=E4 D=R4 S=B4 ", 
    " N=A4 D=R8 ", 
    " N=A4 D=R4 ", // 7
    " N=B4 D=R8 S=F4 ", //8 
    " N=G4 D=R8 S=E4 ", 
    " N=E4 D=R8 S=G4 ", //9
    " N=D4 D=R8 S=A4 "] @=> string Melody01Note [];
    
    Melody01Note.cap() - 1 => int Melody01NoteCap;    
    
   [

    " N=Bb5 D=R2  ",
    " N=Ab4 D=R8  ",
    " N=G4  D=R8  ",
    " N=Bb4 D=R8  ",
    " N=D4  D=R8  ",
    " N=Eb4 D=R4 S=C6 ",
    " N=Bb4 D=R8  ",
    " N=Eb4 D=R4 S=D6 ",
    " N=D4  D=R8  ",
    " N=G5  D=R8  ",
    " N=D5  D=R8  ",
    " N=Bb5 D=R8  ",
    " N=G5  D=R8  ",
    " N=D5  D=R8  "   
    
    ] @=> string Melody02Note  []; 

    Melody02Note.cap() - 1 => int Melody02NoteCap;  


   [" N=C3 D=R8 T=0.8 ",
    " N=G3 D=R8 T=0.4 ",
    " N=G3 D=R8 T=0.4 ",
    " N=C3 D=R8 T=0.8 ",
    " N=G3 D=R8 T=0.4 ",
    " N=G3 D=R8 T=0.4 ",
    " N=F3 D=R8 T=0.8 ",
    " N=E3 D=R8 T=0.8 ",
    " N=F3 D=R8 T=0.8 ",
    " N=A3 D=R8 T=0.8 ",
    " N=C4 D=R8 T=0.4 ",
    " N=C4 D=R8 T=0.4 ",
    " N=C4 D=R8 T=0.4 ",
    " N=F3 D=R8 T=0.4 ",
    " N=D3 D=R8 T=0.4 ",
    " N=C3 D=R8 T=0.4 ",
    " N=C4 D=R8 T=0.8 ",
    " N=C4 D=R8 T=0.8 ",
    " N=C4 D=R8 T=0.4 "] @=> string Bass01Note [];    
    
    
     Bass01Note.cap() - 1 => int Bass01NoteCap;   
    
    
   [" N=G3  D=R8 T=0.8 ",
    " N=D3  D=R8 T=0.4 ",
    " N=Bb3 D=R8 T=0.4 ",
    " N=G2  D=R8 T=0.8 ",
    " N=F3  D=R8 T=0.4 ",
    " N=F3  D=R8 T=0.4 ",
    " N=Ab2 D=R8 T=0.8 ",
    " N=G2  D=R8 T=0.8 ",
    " N=Bb2 D=R8 T=0.8 ",
    " N=D2  D=R8 T=0.8 ",
    " N=Eb2 D=R8 T=0.4 ",
    " N=Eb2 D=R8 T=0.4 ",
    " N=Bb2 D=R8 T=0.8 ",
    " N=Eb2 D=R8 T=0.4 ",
    " N=Eb2 D=R8 T=0.4 ",
    " N=D2  D=R8 T=0.4 ",
    " N=G3  D=R8 T=0.8 ",
    " N=D3  D=R8 T=0.8 ",
    " N=Bb3 D=R8 T=0.4 "] @=> string Bass02Note [];    
    
    
     Bass02Note.cap() - 1 => int Bass02NoteCap;
     
     
     
    [
    " N=G4   D=R8 T=0.8 P1=15  P2=19  ",
    " N=F#4  D=R8 T=0.4 P1=17  P2=19  ",
    " N=F4   D=R8 T=0.4 P1=15  P2=19  ",
    " N=D#4  D=R8 T=0.4 P1=17  P2=19  ",  
    " N=D4   D=R8 T=0.8 P1=15  P2=19  ",
    " N=C4   D=R8 T=0.8 P1=15  P2=19  ",
    " N=B3   D=R8 T=0.8 P1=15  P2=19  ",
    " N=A3   D=R8 T=0.8 P1=15  P2=19  ",
    " N=G#3  D=R8 T=0.4 P1=13  P2=19  ",
    " N=F#3  D=R8 T=0.4 P1=13  P2=19  ",
    " N=F3   D=R8 T=0.8 P1=15  P2=19  ",
    " N=D#3  D=R8 T=0.4 P1=13  P2=19  ",
    " N=D3   D=R8 T=0.8 P1=15  P2=19  ",
    " N=C3   D=R8 T=0.8 P1=15  P2=19  ",
    " N=B2   D=R8 T=0.4 P1=15  P2=19  ",
    " N=A2   D=R8 T=0.4 P1=15  P2=19  ",
    " N=G#2  D=R8 T=0.4 P1=13  P2=19  ",
    " N=F#2  D=R8 T=0.4 P1=13  P2=19  ",
    " N=F2   D=R8 T=0.8 P1=15  P2=19  "

    ] @=> string Bass03Note [];    
    
    
     Bass03Note.cap() - 1 => int Bass03NoteCap;   
     


   [" N=C3 D=R8 T=0.8 ",
    " N=G3 D=R8 T=0.4 ",
    " N=G3 D=R8 T=0.4 ",
    " N=C3 D=R8 T=0.8 ",
    " N=G3 D=R8 T=0.4 ",
    " N=G3 D=R8 T=0.4 ",
    " N=F3 D=R8 T=0.8 ",
    " N=E3 D=R8 T=0.8 ",
    " N=F3 D=R8 T=0.8 ",
    " N=C4 D=R8 T=0.4 ",
    " N=C4 D=R8 T=0.4 ",    
    " N=C4 D=R8 T=0.4 "
    ] @=> string Bass04Note [];    
    
    
     Bass04Note.cap() - 1 => int Bass04NoteCap;   





/* ------------------------------------------------ */



Beat.tempo(106.);
Beat.initDS(); // init beat symbols

NT.initMN(); // init the midi scale

// sound chain

    TriOsc tr01 => ADSR tr01_ev => NRev tr01_verb => Pan2 tr01_pan => dac;
    TriOsc tr02 => ADSR tr02_ev => NRev tr02_verb => Pan2 tr02_pan => dac;

    0.0 => tr01.gain => tr02.gain; 
    0.05 =>  tr01_verb.mix => tr02_verb.mix; 
    0.6 => tr01_verb.gain => tr02_verb.gain;
    -0.1 => tr01_pan.pan; 0.2 => tr02_pan.pan;
    (12.::ms, 12.::ms, 0.15, 12.::ms ) => tr01_ev.set;
    (12.::ms, 12.::ms, 0.15, 12.::ms ) => tr02_ev.set;
    0.55 => float trVarGainMin;  0.65 => float trVarGainMax;
    
    

    Mandolin elec_bass;
    NRev eb_r1;
    elec_bass => eb_r1 => Pan2 eb_pan1 => dac;
    elec_bass => eb_r1 => Pan2 eb_pan2 => dac; 
    0.5 => elec_bass.gain;
    .125 => eb_r1.gain;
    .12 => eb_r1.mix;
    -0.2 => eb_pan1.pan;
    0.2 => eb_pan2.pan;
    
    0.08 => elec_bass.bodySize;
    0.924 => elec_bass.pluckPos;
    0.07 => elec_bass.stringDamping;
    
    
    Bowed bow0;
    Pan2 bow0_pan, bow1_pan;
    NRev bow0_verb;
    
    bow0 =>  bow0_verb;
    bow0_verb => bow0_pan => dac;
    bow0_verb => bow1_pan => dac; 
    
    0.4 => bow0_verb.gain;
    0.0 => bow0_verb.mix;
    -0.2 => bow0_pan.pan;
    -0.2 => bow1_pan.pan;
    
    6.679891  => float b_pressure;
    85.815119 => float b_position;
    123.863155 => float b_vibratofreq;
    5. => float b_vibratogain;
//    108.331431 => float b_volume;
    0. => float b_volume;
     
    // bow pressure
    bow0.controlChange( 2, b_pressure );
    // bow position
    bow0.controlChange( 4, b_position );
    // vibrato freq
    bow0.controlChange( 11, b_vibratofreq );
    // vibrato gain
    bow0.controlChange( 1, b_vibratogain );
    // volume
    bow0.controlChange( 128, b_volume );
    
    int mx1, mx2, mx3, mx4, bx1, bx2, ax1;
    0 => mx1 => mx2 => mx3 => mx4 => bx1 => bx2 => ax1;



   // this is where the sound is made.
    fun void PlayBass(string Note01, dur thePace)
    {

            Std.atof(NT.FindToken(Note01, "T=")) => float partition;
            partition * thePace => dur theStart;
            (1. - partition) * thePace => dur theStop;
            
            Std.mtof(TN.MN[ NT.FindToken (Note01, "N=")] )  => elec_bass.freq;
            // Math.random2f(trVarGainMin,trVarGainMax) => elec_bass.gain;
                     
           0.25 => elec_bass.noteOn; theStart => now;
           0.15 => elec_bass.noteOff; theStop => now;

    }
    

   
    
    // this is where the sound is made.
    fun void PlayAll(string Note01, dur thePace)
    {
        float rootNote, p1Note, p2Note;
        
        TN.MN[ NT.FindToken (Note01, "N=")] => rootNote;
        Std.atof(NT.FindToken(Note01, "P1=")) => p1Note;
        Std.atof(NT.FindToken(Note01, "P2=")) => p2Note;            
        
        
        Std.atof(NT.FindToken(Note01, "T=")) => float partition;
        partition * thePace => dur theStart;
        (1. - partition) * thePace => dur theStop;
            
        Std.mtof( rootNote )  => elec_bass.freq;
        Std.mtof(rootNote+p1Note)  => tr01.freq;
        Std.mtof(rootNote+p2Note)  => tr02.freq;
        Math.random2f(trVarGainMin,trVarGainMax) => tr01.gain;
        Math.random2f(trVarGainMin,trVarGainMax) => tr02.gain;

                     
        0.25 => elec_bass.noteOn; tr01_ev.keyOn(); tr02_ev.keyOn(); theStart => now;
        0.15 => elec_bass.noteOff; tr01_ev.keyOff(); tr02_ev.keyOff(); theStop => now;

    }

    // this is where the sound is made.
    fun void PlayAll1(string Note01, dur thePace)
    {
        float rootNote, p1Note, p2Note;
        
        TN.MN[ NT.FindToken (Note01, "N=")] => rootNote;
        Std.atof(NT.FindToken(Note01, "P1=")) => p1Note;
        Std.atof(NT.FindToken(Note01, "P2=")) => p2Note;            
        
        
        Std.atof(NT.FindToken(Note01, "T=")) => float partition;
        partition * thePace => dur theStart;
        (1. - partition) * thePace => dur theStop;
            
        Std.mtof( rootNote )  => elec_bass.freq;
        Std.mtof( rootNote +24 )  =>  bow0.freq;
        Std.mtof(rootNote+p1Note)  => tr01.freq;
        Std.mtof(rootNote+p2Note)  => tr02.freq;
        Math.random2f(trVarGainMin,trVarGainMax) => tr01.gain;
        Math.random2f(trVarGainMin,trVarGainMax) => tr02.gain;
            
          
        0.25 => elec_bass.noteOn; tr01_ev.keyOn(); tr02_ev.keyOn(); .4 => bow0.noteOn; theStart => now;
        0.15 => elec_bass.noteOff; tr01_ev.keyOff(); tr02_ev.keyOff(); .7 => bow0.noteOn; theStop => now;
        .3 => bow0.noteOff;
    }
    
    
    
    fun void BB1 (string Mel[], int MelCap)
    {
        0 => int j;
 
        while (1)
        { 
           PlayBass(Mel[j % MelCap], BPM.DS[NT.FindToken (Mel[j % MelCap], "D=")]);
           j++; if (bx1){1.::second => now; 0 => bx1; me.exit();}
        }

    }
    
    fun void BB2 (string Mel[], int MelCap)
    {
        0 => int j;
 
        while (1)
        { 
           PlayBass(Mel[j % MelCap], BPM.DS[NT.FindToken (Mel[j % MelCap], "D=")]);
           j++; if (bx2){1.::second => now; 0 => bx2; me.exit();}
        }

    }
    
    fun void AA1 (string Mel[], int MelCap)
    {
        0 => int j;
 
        while (j < 12)
        { 
           PlayAll(Mel[j % MelCap], BPM.DS[NT.FindToken (Mel[j % MelCap], "D=")]);
           j++;
        }

    }
  
    
    fun void AA2 (string Mel[], int MelCap)
    {
        0 => int j;
 
        while (j < 14)
        { 
           PlayAll1(Mel[j % MelCap], BPM.DS[NT.FindToken (Mel[j % MelCap], "D=")]);
           j++;
        }

    }
  
    
    
    // this is where the sound is made.
    fun int Play(string Note01, dur thePace, int override, dur guard)
    {
        int returnValue;
        string note2;
//        if ((now - ofTheNote) >= BPM.R8 || override)
//        if ((now - ofTheNote) >= BPM.T8 || override)
        if ((now - ofTheNote) >= guard || override)
        {
            0.4 => float partition;
            partition * thePace => dur theStart;
            (1. - partition) * thePace => dur theStop;
            
            Std.mtof(TN.MN[NT.FindToken (Note01, "N=")] )  => tr01.freq;
            Math.random2f(trVarGainMin,trVarGainMax) => tr01.gain;
            
            NT.FindToken (Note01, "S=") => note2;
            if(note2 != "")
            {
                Std.mtof(TN.MN[note2] )  => tr02.freq;
                Math.random2f(trVarGainMin,trVarGainMax) => tr02.gain;
            }
            else {0. => tr02.gain;}
            
            now => ofTheNote;
            tr01_ev.keyOn(); tr02_ev.keyOn(); theStart => now;
            tr01_ev.keyOff(); tr02_ev.keyOff(); theStop => now;
            1 => returnValue;
        }
        else 
        {
            now => ofTheNote;
            thePace => now;
            0 => returnValue;
        }
        return (returnValue);
    }
    
    fun int PlayRec(string Note01, dur thePace, int override, dur guard)
    {
        return (Play(TR.Rec(Note01),thePace, override, guard));
    }
    
    // stagger is a zero based offset into the linear note memory 
    // that is when to spork the second  shread
    fun void ZZ1 (int stagger, string Mel[], int MelCap, int override, dur guard)
    {
        0 => int j;
 
        while (1)
        { 
           PlayRec(Mel[j % MelCap], BPM.DS[NT.FindToken (Mel[j % MelCap], "D=")],override, guard);
           if (j == stagger) {spork ~ ZZ2(3.5, guard);}  
           j++; if (mx1){1.::second => now; 0 => mx1; me.exit();}
        }

    }
    
    // This plays the second shread
    // durFactor is a number greater than one which is how much slower this shread will play the notes form the note memory
    // if it's less than one then the VM will crash
    fun void ZZ2 (float durFactor, dur guard)
    {
        0 => int j;
        int k;
        dur theDur;
        
        
        while (1)
        { 
            (TR.A[j+1] - TR.A[j]) * durFactor => theDur;
            if (theDur < 0.0::second) -1. *=> theDur;  // fixup, some durations are out of order seeminly when two shread start to control the instrument.  
            if( PlayRec(TR.S[j], theDur,0, guard)) j++;
            if (mx2){1.::second => now; 0 => mx2; me.exit();}
        }
    }

    // stagger is a zero based offset into the linear note memory 
    // that is when to spork the second  shread
    fun void ZZ3 (int stagger, string Mel[], int MelCap, int override, dur guard)
    {
        0 => int j;
 
        while (1)
        { 
           PlayRec(Mel[j % MelCap], BPM.DS[NT.FindToken (Mel[j % MelCap], "D=")], override, guard);
           if (j == stagger) {spork ~ ZZ4(3.5, guard);}  
           j++; if (mx3){1.::second => now; 0 => mx3; me.exit();}
        }

    }
    
    // This plays the second shread
    // durFactor is a number greater than one which is how much slower this shread will play the notes form the note memory
    // if it's less than one then the VM will crash
    fun void ZZ4 (float durFactor, dur guard)
    {
        0 => int j;
        int k;
        dur theDur;
        
        
        while (1)
        { 
            (TR.A[j+1] - TR.A[j]) * durFactor => theDur;
            if (theDur < 0.0::second) -1. *=> theDur;  // fixup, some durations are out of order seeminly when two shread start to control the instrument.  
            if( PlayRec(TR.S[j], theDur,0, guard)) j++;
            if (mx4){1.::second => now; 0 => mx4; me.exit();}
        }
    }
 
fun void PlaySong ()
{
    int j;
    int pause;
    
    string unit, s_pause;
    
    dur theTime;
    0=> j;
    
    while(j <= Song01NoteCap)
    {
        Song01Note[j] => unit;
        TN.MN[ NT.FindToken (unit, "N=")] => Std.mtof => bow0.freq;
        BPM.DS[NT.FindToken (unit, "D=")] => theTime;
        NT.FindToken (unit, "P=") => s_pause;
        
        if(s_pause == "")
        {
            .4 => bow0.noteOn;
            theTime/2. => now;
            Math.random2f(0.55, .7) => bow0.noteOn;
            theTime/2. => now;
            .3 => bow0.noteOff;
        }
        else
        {
            .3 => bow0.noteOff;
            theTime => now;
        }    
        // me.yield();
        j++;
    }
}    

    
    // begin to make sound

    Shred Melody1, Melody2, Bass1;     
    time StartTime;
 
   
    TR.Init();   
    now => ofTheNote => StartTime;
    BPM.R4 => now;
    
    spork ~ ZZ1(13,Melody01Note,Melody01NoteCap, 1, BPM.T8) @=> Melody1;
    
    BPM.R4*16. => now;
    
    spork ~ ZZ1(13,Melody01Note,Melody01NoteCap, 1, BPM.T8) @=> Melody2;
    BPM.R8*19. => now;

    spork ~ BB1(Bass01Note,Bass01NoteCap) @=> Bass1;     
    
    BPM.R8  * 40. => now;     1 => mx1 => mx2 => bx1;
    TR.Init(); 
     
    spork ~ BB2(Bass02Note,Bass02NoteCap) @=> Bass1;       

    spork ~ ZZ3(7,Melody02Note,Melody02NoteCap, 1, BPM.T8) @=> Melody1;
    
    BPM.R8  * 38. => now; 
    0.09 => tr01_verb.mix => tr02_verb.mix;
    1 => mx3 => mx4 => bx2;

   
    AA1(Bass03Note,Bass03NoteCap);
    TR.Init(); now => ofTheNote;  
    0.08 => tr01_verb.mix => tr02_verb.mix;
    0.45 => tr01_verb.gain => tr02_verb.gain;
    -0.3 => tr01_pan.pan; 0.3 => tr02_pan.pan;
    
    0.15 => eb_r1.gain;
    -0.4 => eb_pan1.pan; 0.4 => eb_pan2.pan;

    spork ~ BB1(Bass04Note,Bass04NoteCap) @=> Bass1;
    me.yield();
    spork ~ ZZ1(7,Melody01Note,Melody01NoteCap, 0, BPM.R8) @=> Melody1;    

    BPM.R8*24. => now;
 //   spork ~ ZZ1(5,Melody01Note,Melody01NoteCap, 0, BPM.T8) @=> Melody2;  

    40. =>  b_volume;    bow0.controlChange( 128, b_volume );  
    PlaySong ();
    
    1 => mx1 => mx2 => bx1;
    0.4 => bow0_verb.mix;
    0.12 => tr01_verb.mix => tr02_verb.mix;
    -0.4 => bow0_pan.pan; 0.6 => bow1_pan.pan;
    
    AA2(Bass03Note,Bass03NoteCap);    
    
    3.::second => now;

    <<< (now - StartTime)/1.::second >>>;
 