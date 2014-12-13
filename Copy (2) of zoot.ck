

TN NT;

TapeRecorder TR;
int i;
time ofTheNote;


NT.initMN();

// sound chain
    ADSR ev;
    ev => NRev verb => dac;

    TriOsc tr01 => ev;
    TriOsc tr02 => ev;

    0.0 => tr01.gain => tr02.gain; 0.1 =>  verb.mix; 0.7 => verb.gain;
    (12.::ms, 12.::ms, 0.15, 12.::ms ) => ev.set;
    0.55 => float trVarGainMin;  0.65 => float trVarGainMax;

    Mandolin elec_bass => NRev r => dac;
    .35 => r.gain;
    .12 => r.mix;

    .1333 => elec_bass.bodySize;
    0.333 => elec_bass.pluckPos;
    0.6 => elec_bass.stringDamping;


    0.4 => elec_bass.gain;


    
/*   
  
    [48., 50., 52., 53., 55., 57., 59., 60.] @=> float BasicScale []; // C majo


    int NoteSymbol[0]; 
    0 => NoteSymbol["C4"];
    1 => NoteSymbol["D4"];
    2 => NoteSymbol["E4"];
    3 => NoteSymbol["F4"];
    4 => NoteSymbol["G4"];
    5 => NoteSymbol["A4"];
    6 => NoteSymbol["B4"];
    7 => NoteSymbol["C5"];
    
    [36., 38., 40., 41., 43., 45., 47., 48.] @=> float BassScale []; // C major

    int BassNoteSymbol[0]; 
    0 => BassNoteSymbol["C3"];
    1 => BassNoteSymbol["D3"];
    2 => BassNoteSymbol["E3"];
    3 => BassNoteSymbol["F3"];
    4 => BassNoteSymbol["G3"];
    5 => BassNoteSymbol["A3"];
    6 => BassNoteSymbol["B3"];
    7 => BassNoteSymbol["C4"];
*/
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

    dur DurSymbol [0];
        R4 => DurSymbol ["R4"];
        T8 => DurSymbol ["T8"];
        T6 => DurSymbol ["T6"];
        T3 => DurSymbol ["T3"];
        R8 => DurSymbol ["R8"];
        R6 => DurSymbol ["R6"];
        R3 => DurSymbol ["R3"];  



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
    
    
    
    
fun string FindToken (string test, string theToken)
{
    test.find(theToken) => int loc;
   if(loc >=0)
   {
        loc + theToken.length() => int theStart;
        test.find(" ", theStart) => int theEnd;
        theEnd - theStart => int theLength;
        return (test.substring(theStart,theLength));
   }
   else {return ("");}
}

    // this is where the sound is made.
    fun void PlayBass(string Note01, dur thePace)
    {

            Std.atof(FindToken(Note01, "T=")) => float partition;
            partition * thePace => dur theStart;
            (1. - partition) * thePace => dur theStop;
            
            Std.mtof(BassScale[ BassNoteSymbol[FindToken (Note01, "N=")]] )  => elec_bass.freq;

            // Math.random2f(trVarGainMin,trVarGainMax) => elec_bass.gain;
                     
            0.35 => elec_bass.noteOn; theStart => now;
            0.35 => elec_bass.noteOff; theStop => now;

    }
    
    
    fun void BB1 ()
    {
        0 => int j;
 
        while (1)
        { 
           PlayBass(Bass01Note[j % Bass01NoteCap], DurSymbol [FindToken (Bass01Note[j % Bass01NoteCap], "D=")]);
           j++;
        }

    }

    // this is where the sound is made.
    fun int Play(string Note01, dur thePace, int override)
    {
        int returnValue;
        string note2;
        if ((now - ofTheNote) >= R8 || override)
        {
            0.4 => float partition;
            partition * thePace => dur theStart;
            (1. - partition) * thePace => dur theStop;
            
            Std.mtof(BasicScale[NoteSymbol[FindToken (Note01, "N=")]] )  => tr01.freq;
            Math.random2f(trVarGainMin,trVarGainMax) => tr01.gain;
            
            FindToken (Note01, "S=") => note2;
            if(note2 != "")
            {
                Std.mtof(BasicScale[NoteSymbol[note2]] )  => tr02.freq;
                Math.random2f(trVarGainMin,trVarGainMax) => tr02.gain;
            }
            else {0. => tr02.gain;}
            
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
           PlayRec(Melody01Note[j % Melody01NoteCap], DurSymbol [FindToken (Melody01Note[j % Melody01NoteCap], "D=")],1);
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
    
    time StartTime;
   
    TR.Init();   
    now => ofTheNote => StartTime;
    R4 => now;
    
    spork ~ ZZ1(13);
    
    R4*16. => now;
    
    spork ~ ZZ1(13);
    R8*19. => now;

    spork ~ BB1();     
    while(1)
    {

        R8 => now;
        <<<(now - StartTime)/R8>>>;
    }