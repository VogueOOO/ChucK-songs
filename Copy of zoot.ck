
TapeRecorder TR;
int i;
time ofTheNote;

// sound chain

    TriOsc tr01 =>  ADSR ev => NRev verb => dac;
    0.0 => tr01.gain; 0.1 =>  verb.mix; 0.7 => verb.gain;
    (12.::ms, 12.::ms, 0.15, 12.::ms ) => ev.set;
  
    [48., 50., 52., 53., 55., 57., 59., 60.] @=> float BasicScale []; // C major
    
    
    int NoteSymbol[0]; 
    0 => NoteSymbol["C4"];
    1 => NoteSymbol["D4"];
    2 => NoteSymbol["E4"];
    3 => NoteSymbol["F4"];
    4 => NoteSymbol["G4"];
    5 => NoteSymbol["A4"];
    6 => NoteSymbol["B4"];
    7 => NoteSymbol["C5"];



    dur R4, T8, T6, T3, R8, R6, R3;

    106. => float beat;
        
        60.0/(beat) => float SPB; // seconds per beat
        SPB::second  =>  R4;    // rate of pulse in seconds (1/4 note)
        R4*0.3333 =>  T8;     
        T8*0.5 =>  T6;
        T6*0.5 =>  T3;    
        R4*0.5 =>  R8;      // 1/8
        R8*0.5 =>  R6;      // 1/16
        R6*0.5 =>  R3;      // 1/32 

    ["C4", "G4", "F4", "A4", "B4", "A4", "E4", "E4", "A4", "A4", "B4", "G4", "E4", "D4"] @=> string Melody01Note [];
    [ R4  , R4 ,  R8 ,  R8 ,  R8 ,  R8 ,  R8 ,  R4  , R8 ,  R4 ,  R8 ,  R8 ,  R8 ,  R8 ] @=> dur Melody01Dur [];

    Melody01Note.cap() - 1 => int Melody01NoteCap;


    // this is where the sound is made.
    fun int Play(string Note01, dur thePace, int override)
    {
        int returnValue;
        if ((now - ofTheNote) >= R8 || override)
        {
            0.4 => float partition;
            partition * thePace => dur theStart;
            (1. - partition) * thePace => dur theStop;
            
            Std.mtof(BasicScale[NoteSymbol[Note01]] )  => tr01.freq;
            Math.random2f(0.75,0.85) => tr01.gain;
            now => ofTheNote;
            ev.keyOn(); theStart => now;
            ev.keyOff(); theStop => now;
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
    
    fun int PlayRec(string Note01, dur thePace, int override)
    {
        return (Play(TR.Rec(Note01),thePace, override));
    }
    
    // stagger is a zero based offset into the linear note memory 
    // that is when to spork the second  shread
    fun void ZZ1 (int stagger)
    {
        0 => int j;
 
        while (1)
        { 
           PlayRec(Melody01Note[j % Melody01NoteCap], Melody01Dur[j % Melody01NoteCap],1);
           if (j == stagger) {spork ~ ZZ2(3.5);}  
           j++;
        }

    }
    
    // This plays the second shread
    // durFactor is a number greater than one which is how much slower this shread will play the notes form the note memory
    // if it's less than one then the VM will crash
    fun void ZZ2 (float durFactor)
    {
        0 => int j;
        int k;
        dur theDur;
        
        
        while (1)
        { 
            (TR.A[j+1] - TR.A[j]) * durFactor => theDur;
            if (theDur < 0.0::second) -1. *=> theDur;  // fixup, some durations are out of order seeminly when two shread start to control the instrument.  
            if( PlayRec(TR.S[j], theDur,0)) j++;

        }
    }
    
    // begin to make sound
    
    TR.Init();   
    now => ofTheNote;
    R4 => now;
    
    spork ~ ZZ1(13);
    
    R4*16. => now;
    
    spork ~ ZZ1(13);
    
    while(1){1.::second => now;}
    