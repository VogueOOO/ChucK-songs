
BPM Beat;

TN NT;  // get tonality

TapeRecorder TR, BTR;
int i, falling_off;
time ofTheNote;

 0 => falling_off;

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
    
    
   [" N=G3  D=R4 T=0.8 C=[0,4,7,9] ",
    " N=D3  D=R4 T=0.4 C=[0,3,6,9] ",
    " N=Bb3 D=R4 T=0.4 C=[0,3,7,10] ",
    " N=G2  D=R4 T=0.8 C=[0,2,6,10] ",
    " N=F3  D=R4 T=0.4 C=[0,3,5,9] ",
    " N=F3  D=R4 T=0.4 C=[0,4,4,8] ",
    " N=Ab2 D=R4 T=0.8 C=[0,3,3,9] ",
    " N=G2  D=R4 T=0.8 C=[0,2,6,9] ",
    " N=Bb2 D=R4 T=0.8 C=[0,3,6,9] ",
    " N=D2  D=R4 T=0.8 C=[0,4,6,10] ",
    " N=Eb2 D=R4 T=0.4 C=[0,5,6,11] ",
    " N=Eb2 D=R8 T=0.4 C=[0,4,7,11] ",
    " N=Bb2 D=R8 T=0.8 C=[0,3,6,10] ",
    " N=Eb2 D=R8 T=0.4 C=[0,3,5,9] ",
    " N=Eb2 D=R8 T=0.4 C=[0,3,6,9] ",
    " N=D2  D=R8 T=0.4 C=[0,3,6,9] ",
    " N=G3  D=R8 T=0.8 C=[0,3,6,9] ",
    " N=D3  D=R8 T=0.8 C=[0,3,6,9] ",
    " N=Bb3 D=R8 T=0.4 C=[0,3,6,9] "
    ] @=> string Bass02Note [];    
    
    
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
     


   [" N=C5  D=R2 T=0.8 C=[0+12,3+12,6,9] ",
    " N=G5  D=R4 T=0.4 C=[0+12,3+12,6,9] ",
    " N=A#6 D=R4 T=0.4 C=[0,3,6,9] ",
    " N=B5  D=R2 T=0.8 C=[0+12,3+12,6,9] ",
    " N=G5  D=R4 T=0.4 C=[0+12,3+12,6,9] ",
    " N=F#6 D=R4 T=0.4 C=[0,3,6,9] ",
    " N=F5  D=R2 T=0.8 C=[0+12,3+12,6,9] ",
    " N=E5  D=R2 T=0.8 C=[0+12,3+12,6,9] ",
    " N=F#6 D=R2 T=0.8 C=[0,3,6,9] ",
    " N=C6  D=R8 T=0.4 C=[0+12,2+12,6,9] ",
    " N=D#6 D=R8 T=0.4 C=[0,2,6,9] ",    
    " N=C6  D=R8 T=0.4 C=[0+12,2+12,6,9] "
    ] @=> string Bass04Note [];    
    
    
     Bass04Note.cap() - 1 => int Bass04NoteCap;   


     [BPM.R4, BPM.R8, BPM.R6] @=> dur someTime [];

     [ BPM.R3, BPM.R3, BPM.R3, BPM.R3, BPM.R2, BPM.R3, BPM.R2 ] @=> dur someRy [];
     someRy.cap() - 1 => int someRyCap;
    

    
/* ------------------------------------------------ */



Beat.tempo(106.);
Beat.initDS(); // init beat symbols

NT.initMN(); // init the midi scale

  int string_switch;

// sound chain

    NRev tr01_verb => Pan2 tr01_pan => dac;
    NRev tr02_verb => Pan2 tr02_pan => dac;
    NRev tr03_verb => Pan2 tr03_pan => dac;
    NRev tr04_verb => Pan2 tr04_pan => dac;

    Bowed xphone01 => tr01_verb;
    Bowed xphone02 => tr02_verb;
    Bowed xphone03 => tr03_verb;
    Bowed xphone04 => tr04_verb;

    0.0 => xphone01.bowPressure => xphone02.bowPressure => xphone03.bowPressure => xphone04.bowPressure;
    0.3 => xphone01.gain => xphone02.gain => xphone03.gain => xphone04.gain; 
    
    Mandolin plk01 => tr01_verb;
    Mandolin plk02 => tr02_verb;
    Mandolin plk03 => tr03_verb;
    Mandolin plk04 => tr04_verb;   
    
    0.05 => plk01.bodySize => plk02.bodySize => plk03.bodySize => plk04.bodySize;
    0.05 => plk01.stringDamping => plk02.stringDamping => plk03.stringDamping => plk04.stringDamping;
    0.3 => plk01.gain => plk02.gain => plk03.gain => plk04.gain;
    
    0.4 =>  tr01_verb.mix; 0.4 => tr02_verb.mix =>  tr03_verb.mix => tr04_verb.mix; 
    0.4 => tr01_verb.gain => tr02_verb.gain => tr03_verb.gain => tr04_verb.gain;
    -0.2 => tr01_pan.pan; 0.2 => tr02_pan.pan; 0.4 => tr03_pan.pan; -0.4 => tr04_pan.pan;

    
    0.55 => float trVarGainMin;  0.85 => float trVarGainMax;
  
   EraserHead EH => ADSR EH_ev => NRev EH_verb => Pan2 EH_pan => dac;
   (50.::ms, 60.::ms, 0.15, 16.::ms ) => EH_ev.set; 
    0.11 => EH_ev.gain;
    0.2 =>  EH_verb.mix; 0.2 => EH_verb.gain;

  
    BandedWG bwg01;
    BandedWG bwg02;
    BandedWG bwg03;
    BandedWG bwg04;
 
    0.8 => bwg01.bowRate => bwg02.bowRate => bwg03.bowRate => bwg04.bowRate;
    0.75 => bwg01.bowPressure=> bwg02.bowPressure=> bwg03.bowPressure=> bwg04.bowPressure;
    0.5 => bwg01.strikePosition => bwg02.strikePosition => bwg03.strikePosition => bwg04.strikePosition;
    1    => bwg01.preset => bwg02.preset => bwg03.preset => bwg04.preset;
    0.15 => bwg01.gain => bwg02.gain => bwg03.gain => bwg04.gain;
  
 
fun int [] getIntervalArray (string strRep)
{
    int intRep [0];
    int loc;

    if(strRep.charAt(0) == 91)
    {
        strRep.erase( 0, 1 );
        strRep.find(',') => loc;
        while (loc != -1)
        {
            intRep << Std.atoi(strRep);
            strRep.erase( 0, loc + 1 );
            strRep.find(',') => loc;
        }
        intRep << Std.atoi(strRep);
    }
    return intRep;
}

    
FreqLogger LG01, LG02, LG03, LG04;


    float prevNote01;
    fun void Play01(float theNote, dur thePace)
    {
        
        if (prevNote01 != theNote)
        { 
            float posi, frequi;
            
            Std.mtof(theNote) => frequi; LG01.LogFreqDur(frequi);
            
            (800. - xphone01.freq()) / 800. => posi; if(posi < 0.) 0. => posi;
            if ( string_switch ) 
            {
                frequi => xphone01.freq;
                1. - posi => xphone01.bowPosition;
                Math.random2f(trVarGainMin,trVarGainMax) => xphone01.noteOn; 
            }
            else 
            {
                frequi => plk01.freq;
                1. - posi => plk01.pluckPos;
                Math.random2f(trVarGainMin,trVarGainMax) => plk01.noteOn; 
            }
        }
        thePace => now;
        theNote => prevNote01;
    }


    float prevNote02;
    fun void Play02(float theNote, dur thePace)
    {
        if (prevNote02 != theNote)
        {
            float posi, frequi;
            
            Std.mtof(theNote) => frequi; LG02.LogFreqDur(frequi);

            (800. - xphone02.freq()) / 800. => posi; if(posi < 0.) 0. => posi;

            if ( string_switch ) 
            {
                frequi => xphone02.freq;            
                1. - posi => xphone02.bowPosition;
                Math.random2f(trVarGainMin,trVarGainMax) => xphone02.noteOn; 
            }
            else 
            {
                frequi => plk02.freq;
                1. - posi => plk02.pluckPos;
                Math.random2f(trVarGainMin,trVarGainMax) => plk02.noteOn; 
            }

        }
        thePace => now;
        theNote => prevNote02;
    }

    float prevNote03; 
    fun void Play03(float theNote, dur thePace)
    {
        if (prevNote03 != theNote)
        {
            float posi, frequi;
            
            Std.mtof(theNote) => frequi; LG03.LogFreqDur(frequi);

            (800. - xphone03.freq()) / 800. => posi; if(posi < 0.) 0. => posi;

            if ( string_switch ) 
            {
                frequi => xphone03.freq;            
                1. - posi => xphone03.bowPosition;
                Math.random2f(trVarGainMin,trVarGainMax) => xphone03.noteOn; 
            }
            else 
            {
                frequi => plk03.freq;
                1. - posi => plk03.pluckPos;
                Math.random2f(trVarGainMin,trVarGainMax) => plk03.noteOn; 
            }

        }
        thePace => now;
        theNote => prevNote03;
    }

    float prevNote04; 
    fun void Play04(float theNote, dur thePace)
    {
        if (prevNote01 != theNote)
        { 
            float posi, frequi;
            
            Std.mtof(theNote) => frequi; LG04.LogFreqDur(frequi);

            (800. - xphone04.freq()) / 800. => posi;
            if(posi < 0.) 0. => posi;

            if ( string_switch ) 
            {
                frequi => xphone04.freq;            
                1. - posi => xphone04.bowPosition;
                Math.random2f(trVarGainMin,trVarGainMax) => xphone04.noteOn; 
            }
            else 
            {
                frequi => plk04.freq;
                1. - posi => plk04.pluckPos;
                Math.random2f(trVarGainMin,trVarGainMax) => plk04.noteOn; 
            }

        }
        thePace => now;
        theNote => prevNote04;
    }



    
    fun void PlayAll01(string Note01)
    {
        float p1Note, p2Note, p3Note, p4Note ;

        BPM.DS[NT.FindToken (Note01, "D=")] => dur thePace;
        TN.MN[ NT.FindToken (Note01, "N=")] => p1Note => p2Note => p3Note => p4Note;        
        getIntervalArray (NT.FindToken (Note01, "C=")) @=> int newInterval[];

        spork ~ Play01(p1Note+newInterval[0], thePace); 
        spork ~ Play02(p2Note+newInterval[1], thePace);
        spork ~ Play03(p3Note+newInterval[2], thePace); 
        spork ~ Play04(p4Note+newInterval[3], thePace);
        someTime [Math.random2(0,2)] => now;
        
    }    
    

    BPM.R1 => dur fluteBlocker;
    
    fun void increaseBowPressure ()
    {
        float bp;
        
        0.0 => bp;
        while (bp <= 1.0)
        {
            bp => xphone01.bowPressure => xphone02.bowPressure => xphone03.bowPressure => xphone04.bowPressure;
            bp / 20. => plk01.bodySize => plk02.bodySize => plk03.bodySize => plk04.bodySize;
            bp + 0.05 => bp;
            2.0 /=> fluteBlocker;
            2.* BPM.R1 => now;
        }
        false => string_switch;
    }
    
    
    
    fun void AA3 (string Mel[], int MelCap)
    {
        0 => int j;
 
        while (1)
        { 
           PlayAll01(Mel[j % MelCap] );
           j++;
        }
    }

 
   fun void falling_bowed ()
   {
       1.0 => float some_increment;
       xphone01.freq() => float f01;
       xphone02.freq() => float f02;
       xphone03.freq() => float f03;
       xphone04.freq() => float f04;
       tr01_verb.mix() => float mix;
       xphone01.gain() => float xgain;
       
       BPM.R1 => now;
       while (some_increment > 0.25)
       {
           f01 * some_increment => xphone01.freq;  
           f02 * some_increment => xphone02.freq; 
           f03 * some_increment => xphone03.freq;  
           f04 * some_increment => xphone04.freq; 
           mix * some_increment * 0.98  =>  tr01_verb.mix => tr02_verb.mix =>  tr03_verb.mix => tr04_verb.mix;   
           xgain * some_increment * 0.9  => xphone01.gain => xphone02.gain => xphone03.gain => xphone04.gain;         
           150.::ms  => now;

           0.015 -=> some_increment;
       }
       
       BPM.R1 => now;

       xphone01.noteOff;
       xphone02.noteOff;
       xphone03.noteOff;
       xphone04.noteOff;
       BPM.R1 => now;
       
        xphone01 =< tr01_verb;
        xphone02 =< tr02_verb;
        xphone03 =< tr03_verb;
        xphone04 =< tr04_verb;        
        1 => falling_off;
 
   } 
    
 

   
 
    0 => int point_to_current;

   true => int condensed;
   
    fun void PlayCondensed ()
    {
        int i, j, k;
        dur concurrentTime; 
        
        while(condensed)
       {    
            FreqLogger.AllNoteFreqArray.size() - point_to_current => j;

            if ( j > 32)
            { <<<"2", point_to_current, j>>>;
                for (point_to_current => i; i < j; i++ )
                {    
                    0 => k;
                    FreqLogger.AllNoteDurArray[i] /4. => concurrentTime;
                    if ( concurrentTime > fluteBlocker)
                    {    
                        FreqLogger.AllNoteFreqArray[i]  => EH.freq;
                        Math.random2f( 0.97, 1.11) => EH.mod2; 
                        Math.random2f(-0.57, 0.67) => EH_pan.pan;
                        EH_ev.keyOn();
                        concurrentTime => now;
                        1 +=> k;
                    }
                    if (!condensed) break;
                }            
                k +=> point_to_current;
            }
            else BPM.R4 => now;
        }
        
        BPM.R4 => now;
        me.exit();
    }



     fun void bowed01(float theNote, dur thePace, float split)
    {
        Std.mtof(theNote) => bwg01.freq; 
        Math.random2f( 0.75, 0.9) => bwg01.startBowing;
        split * thePace => now;


    }
    
      fun void bowed02(float theNote, dur thePace, float split)
    {

        Std.mtof(theNote) => bwg02.freq; 
        Math.random2f( 0.75, 0.9) => bwg02.startBowing;
        split * thePace => now;

    }

     fun void bowed03(float theNote, dur thePace, float split)
    {

        Std.mtof(theNote) => bwg03.freq; 
        Math.random2f( 0.75, 0.9) => bwg03.startBowing;
        split * thePace => now;

    }

     fun void bowed04(float theNote, dur thePace, float split)
    {

        Std.mtof(theNote) => bwg04.freq; 
        Math.random2f( 0.75, 0.9)=> bwg04.startBowing;
        split * thePace => now;

    }  

 
     fun void PlayAll02(string Note01)
    {
        float p1Note, p2Note, p3Note, p4Note ;
        float split;

        BPM.DS[NT.FindToken (Note01, "D=")] => dur thePace;
        TN.MN[ NT.FindToken (Note01, "N=")] => p1Note => p2Note => p3Note => p4Note;        
        getIntervalArray (NT.FindToken (Note01, "C=")) @=> int newInterval[];
        Std.atof(NT.FindToken (Note01, "T=")) => split;
         
        spork ~ BongoBass(p1Note+newInterval[0]+24, thePace, split); 
        spork ~ bowed01(p1Note+newInterval[0]+24, thePace, split); 
        spork ~ bowed02(p2Note+newInterval[1]+24, thePace, split);
        spork ~ bowed03(p3Note+newInterval[2]+24, thePace, split); 
        spork ~ bowed04(p4Note+newInterval[3]+24, thePace, split);
        thePace+100.::ms => now;
        
    }  

    
   fun void BongoBass (float theNote, dur thePace, float split)
   {
       
       (20.::ms, 60.::ms, 0.08, 16.::ms ) => EH_ev.set;       

           Std.mtof(theNote) => EH.freq;
           Math.random2f( 0.5, 0.6)  => EH_ev.gain;
          
           EH_ev.keyOn();
           split * thePace => now;
           EH_ev.keyOff();


   }     
    
   
  false => int finallyTheEnd;
   
    fun void AA2 (string Mel[], int MelCap)
    {
        0 => int j; 0 => int k;
        float gainFactor, gainFritter, someGain;
        float endStart, endFritter, endTarget, someEnd;
        
        int majorReps;
          
        0.65 => endTarget;    
        5    => majorReps;
        
        plk01.gain() => gainFactor => someGain;
        gainFactor / ((majorReps-2.) * MelCap) => gainFritter;
        

         bwg01.gain() => endStart;
        (endTarget - endStart)/ (majorReps * MelCap) => endFritter;
         endStart  => someEnd;

        
        for (0=>k; k < majorReps; k++)
        {
            <<<"j,k", j, k>>>;
            0=>j;
            Math.random2f(k*3.33 + 0.85, k*1.33 + 1.15) => EH.mod2 => EH.mod4; 
            while (j < MelCap)
            { 
               PlayAll02(Mel[j % MelCap] );
               j++;
               gainFritter -=> someGain; if(someGain < 0.0) 0.0 => someGain;
               someGain => plk01.gain => plk02.gain => plk03.gain => plk04.gain;
               endFritter +=> someEnd;
               someEnd => bwg01.gain => bwg02.gain => bwg03.gain => bwg04.gain;
            }
        }
        true => finallyTheEnd;
    }

 
    fun void FadeOut()
   {
       float startGain, newGain;
       bwg01.gain() => startGain;
       
       while (newGain >= 0.0)
       {
           (startGain/100.) -=> newGain;
           newGain => bwg01.gain => bwg02.gain => bwg03.gain => bwg04.gain;
           100.::ms => now;
       }
   }
    
   
    // begin to make sound

    Shred Melody1, Melody2, Bass1;     
    time StartTime;

      [BPM.R4, BPM.R8, BPM.R6] @=> someTime;

     [ BPM.R4, BPM.R4, BPM.R6, BPM.R8, BPM.R8, BPM.R8, BPM.R6 ] @=> someRy;  
   
    TR.Init();   
    LG01.init();LG02.init();LG03.init();LG04.init();
    BPM.R4 => now;
    true => string_switch;
    
    
    spork ~  AA3 (Bass04Note, Bass04NoteCap);
    spork ~ increaseBowPressure();
    16. * BPM.R4 => now;    <<<"Boom!">>>;
    spork ~  AA3 (Bass04Note, Bass04NoteCap);
    16. * BPM.R4 => now;    <<<"Boom!">>>;    
    spork ~ PlayCondensed();    
    while (string_switch) 200.::ms  => now;
    spork ~  falling_bowed ();
    
    while ( falling_off != 1 ) {100.::ms => now;}
    5. * BPM.R4 => now; 
    false => condensed;
    me.yield(); 
    BPM.R1; (40.::ms, 60.::ms, 0.15, 16.::ms ) => EH_ev.set;
    BPM.R1; (30.::ms, 60.::ms, 0.10, 16.::ms ) => EH_ev.set;
    BPM.R1; (20.::ms, 60.::ms, 0.08, 16.::ms ) => EH_ev.set;
    BPM.R1; (20.::ms, 50.::ms, 0.06, 16.::ms ) => EH_ev.set;
    BPM.R1; (20.::ms, 40.::ms, 0.06, 16.::ms ) => EH_ev.set;
    BPM.R1; (20.::ms, 30.::ms, 0.06, 16.::ms ) => EH_ev.set;
    BPM.R1; (20.::ms, 20.::ms, 0.06, 16.::ms ) => EH_ev.set;

   
    // spork ~  BongoBass ();   
 
    5. * BPM.R1 => now;
    
    bwg01 => tr01_verb;
    bwg02 => tr02_verb;
    bwg03 => tr03_verb;
    bwg04 => tr04_verb;

    
    spork ~  AA2 (Bass02Note, Bass02NoteCap);

    
    
   while (!finallyTheEnd) {100.::ms => now;}
   
   FadeOut();
       
   BPM.R1 => now;
    
    <<< "Done", (now - StartTime)/1.::second >>>;
 