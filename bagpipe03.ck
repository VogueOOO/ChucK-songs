
// tonality
TN NT;
TapeRecorder TR;

// spork two shreds that concurrently control the frequency of one osc
public class Chanter01 extends Chubgraph
{
    0 => static int ShredCounter;
    static float S[]; // scale intervals
    static int N[];   // associative array of symbol into index of a scale interval
    // sound chain
    ADSR ev => outlet;
    BlitSaw chanter01 => BPF fil => ev;
    SawOsc  chanter02 => ev;
    
    (8.0::ms,6.0::ms,0.7,8.0::ms )=> ev.set;
    0.4 => chanter01.gain;  // default sawtooth gain
    0.03 => chanter02.gain;
    8 => chanter01.harmonics;
    

    
    fun void Init (float rootNote, float filterQ, float scaleIntervals [], int noteNames [])
    {
        rootNote * 3. => fil.freq;
        filterQ => fil.Q;
        ( rootNote, scaleIntervals ) => NT.MakeAScale @=> S;  
        noteNames @=> N;   
    }
    
     fun void Play(string Note01, dur thePace)
    {
        S[N[Note01]]  => chanter01.freq => chanter02.freq;
        Math.random2f(0.025,0.035) => chanter02.gain;
        ev.keyOn();
        thePace => now;
    }
    
    fun void PlayRec(string Note01, dur thePace)
    {
        Play(TR.Rec(Note01),thePace);
    }
    
    fun void Play01(string Note01, dur thePace)
    {
        ShredCounter++;
        for(0=> int k; k < Math.random2(4,8);k++) {PlayRec(Note01, thePace);}
        ShredCounter--;
        me.exit();
    } 

    fun void Play02(string Note01, dur thePace)
    {
        ShredCounter++;
        for(0=> int k; k < Math.random2(0,4);k++) {PlayRec(Note01, thePace);}
        ShredCounter--;
        me.exit();
    } 


    fun void PlayNote0102 (string TheNote, dur advanceTimeBase, dur baseTimeBase, float differentialTime)
    {
        spork ~ Play01(TheNote, baseTimeBase);
        spork ~ Play02(TheNote, baseTimeBase * differentialTime);
        advanceTimeBase => now;
    }
    
    fun void PlayNote0201 (string TheNote, dur advanceTimeBase, dur baseTimeBase, float differentialTime)
    {
        spork ~ Play02(TheNote, baseTimeBase);
        spork ~ Play01(TheNote, baseTimeBase * differentialTime);
        advanceTimeBase => now;
    }
    
      
}

    476. => float rootNote;  // Frequency in Hz of the low 'A' note

    Chanter01 it;    // bagpipe chanter

    // sound chain
    it => Chorus foo => NRev verb => dac;

/* ---------------- initialize the bagpipe notes -------------------- */
 //    G     A    B      C#     D      E       F#     G2   A2 
    [7./8., 1., 9./8., 5./4., 4./3., 3./2., 13./8., 7./4., 2.] @=> float chanterIntervals [];

    int chanterNoteSymbol[0]; 
    0 => chanterNoteSymbol["G"];
    1 => chanterNoteSymbol["A"];
    2 => chanterNoteSymbol["B"];
    3 => chanterNoteSymbol["C#"];
    4 => chanterNoteSymbol["D"];
    5 => chanterNoteSymbol["E"];
    6 => chanterNoteSymbol["F#"];
    7 => chanterNoteSymbol["G2"];
    8 => chanterNoteSymbol["A2"];
    // 
    (rootNote , 5.6, chanterIntervals, chanterNoteSymbol) => it.Init;

/* ----------------------------------------------------------  */

    0.5 => foo.mix;
    0.011 => foo.modDepth;
    0.75 => foo.modFreq ;
    0.1 => verb.mix;

    BlitSaw drone01 => BPF fil01 => Chorus foo01 =>  dac;
    BlitSaw drone02 => BPF fil02 => Chorus foo02 =>  dac;
    BlitSaw drone03 => BPF fil03 => Chorus foo03 =>  dac;


    0.4 => foo01.mix;  0.011 => foo01.modDepth;    1.2 => foo01.modFreq ;
    0.4 => foo02.mix;  0.011 => foo02.modDepth;    1.3 => foo02.modFreq ;
    0.4 => foo03.mix;  0.011 => foo03.modDepth;    0.7 => foo03.modFreq ;
    10 => drone01.harmonics => drone02.harmonics;
    16 => drone03.harmonics;
    
   



    [ "A", "C#", "E", "G2", "A2" ] @=> string basicScale1[] ;    
    basicScale1.cap() - 1 => int basicScale1RandCap;
    fun string basicScale1Rand(){return  basicScale1[ Math.random2(0,basicScale1RandCap)];}


    [ "B", "D", "G2", "A2" ]  @=> string basicScale2[] ;    
    basicScale2.cap() - 1 => int basicScale2RandCap;
    fun string basicScale2Rand(){return  basicScale2[ Math.random2(0,basicScale2RandCap)];}    
    
0.0 => drone01.gain => drone02.gain;
    
0.15 => drone03.gain; 
rootNote /4. * 1.001 => float drone03Freq; 
drone03Freq => drone03.freq;  3. / 2. * drone03Freq * 4. => fil03.freq;  1.6 => fil03.Q;  

0.75::second => dur Rate01;
0.65::second => dur Rate02;


    
 Rate02 => now;    
    
    
0.065 => drone01.gain;
rootNote /2. * 1.002  => float drone01Freq; 
drone01Freq => drone01.freq; 3. * drone01Freq => fil01.freq;  1.3 => fil01.Q;

0.055 => drone02.gain;    
rootNote /2. * 0.998    => float drone02Freq; 
drone02Freq => drone02.freq;  3. * drone02Freq => fil02.freq;  1.4 => fil02.Q;
    
2. * Rate02  => now;

  
it.Play("A",Rate01);

int noteCounter;
TR.Init();

<<<"section 1">>>;
<<<"Number of notes: ", TR.Size()>>>;

4 => noteCounter;   
while(noteCounter > 0)
{

    Math.random2f(0.025, 0.035) => drone01.gain;
    Math.random2f(0.025, 0.035) => drone02.gain;
    Math.random2f(0.020, 0.04) => drone03.gain;
    (basicScale1Rand(), Rate01, Rate02, 2.) => it.PlayNote0201;
     noteCounter--;
}

<<<"section 2">>>;
<<<"Number of notes: ", TR.Size()>>>;
4 => noteCounter;   
while(noteCounter > 0)
{

    Math.random2f(0.025, 0.035) => drone01.gain;
    Math.random2f(0.025, 0.035) => drone02.gain;
    Math.random2f(0.020, 0.04) => drone03.gain;
    (basicScale2Rand(), Rate01, Rate02, 2.) => it.PlayNote0102;
     noteCounter--;
}

<<<"section 3">>>;
<<<"Number of notes: ", TR.Size()>>>;
4 => noteCounter; 
while(noteCounter > 0)
{

    Math.random2f(0.025, 0.035) => drone01.gain;
    Math.random2f(0.025, 0.035) => drone02.gain;
    Math.random2f(0.020, 0.04) => drone03.gain;
    (basicScale1Rand(), Rate01, Rate02, 2.) => it.PlayNote0201;
     noteCounter--;
}

Rate01 * 2. => now;

<<<"section 4">>>;
<<<"Number of notes: ", TR.Size()>>>;
12 => noteCounter;    
while(noteCounter > 0)
{ 
    Math.random2f(0.025, 0.035) => drone01.gain;
    Math.random2f(0.025, 0.035) => drone02.gain;
    Math.random2f(0.020, 0.04) => drone03.gain;
    (basicScale2Rand(), Rate01, Rate02, 2.) => it.PlayNote0102;
     noteCounter--;
}

Rate01 * 2. => now;

<<<"section 5">>>;
<<<"Number of notes: ", TR.Size()>>>;
8 => noteCounter; 
while(noteCounter > 0)
{
    Math.random2f(0.025, 0.035) => drone01.gain;
    Math.random2f(0.025, 0.035) => drone02.gain;
    Math.random2f(0.020, 0.04) => drone03.gain;
    (basicScale2Rand(), Rate01, Rate02, 2.) => it.PlayNote0201;
     noteCounter--;
}

<<<"section 6">>>;
<<<"Number of notes: ", TR.Size()>>>;
4 => noteCounter;   
while(noteCounter > 0)
{

    Math.random2f(0.025, 0.035) => drone01.gain;
    Math.random2f(0.025, 0.035) => drone02.gain;
    Math.random2f(0.020, 0.04) => drone03.gain;
    (basicScale2Rand(), Rate01, Rate02, 2.) => it.PlayNote0102;
     noteCounter--;
}

<<<"section 7">>>;
<<<"Number of notes: ", TR.Size()>>>;
8 => noteCounter;   
while(noteCounter > 0)
{

    Math.random2f(0.025, 0.035) => drone01.gain;
    Math.random2f(0.025, 0.035) => drone02.gain;
    Math.random2f(0.020, 0.04) => drone03.gain;
    (basicScale1Rand(), Rate01, Rate02, 2.) => it.PlayNote0201;
     noteCounter--;
}


while (Chanter01.ShredCounter != 0){100.::ms => now;}
it.Play("A",Rate01 * 4.);
TR.Stop();






