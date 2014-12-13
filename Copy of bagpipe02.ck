
// tonality
TN NT;


// spork two shreds that concurrently control the frequency of one osc
public class Chanter01 extends Chubgraph
{
    // sound chain
    BlitSaw chanter01 => ADSR ev => BPF fil => outlet;
    
    (8.0::ms,6.0::ms,0.7,8.0::ms )=> ev.set;
    0.4 => chanter01.gain;  // default sawtooth gain
    8 => chanter01.harmonics;

    fun void Init (float filterPeakFreq, float filterQ)
    {
    filterPeakFreq => fil.freq;
    filterQ => fil.Q;        
    }
    
    
    fun void Play01(float Note01, dur thePace)
    {
        for(0=> int k; k < Math.random2(4,8);k++) 
        {
            Note01  => chanter01.freq;
            ev.keyOn();
            thePace => now;
        }
        me.exit();
    } 

    fun void Play02(float Note01, dur thePace)
    {
        for(0=> int k; k < Math.random2(0,4);k++) 
        {
            Note01  => chanter01.freq;
            ev.keyOn();
            thePace => now;

        }
        me.exit();
    } 


    fun void PlayNote0102 (float TheNote, dur advanceTimeBase, dur baseTimeBase, float differentialTime)
    {
        spork ~ Play01(TheNote, baseTimeBase);
        spork ~ Play02(TheNote, baseTimeBase * differentialTime);
        advanceTimeBase => now;
    }
    
    fun void PlayNote0201 (float TheNote, dur advanceTimeBase, dur baseTimeBase, float differentialTime)
    {
        spork ~ Play02(TheNote, baseTimeBase);
        spork ~ Play01(TheNote, baseTimeBase * differentialTime);
        advanceTimeBase => now;
    }
    
      
}
    479. => float rootNote;  

    Chanter01 it;

    it => Chorus foo => NRev verb => dac;

    (rootNote *3., 5.6) => it.Init;

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
    
int N[1]; 
0 => N["G"];
1 => N["A"];
2 => N["B"];
3 => N["C#"];
4 => N["D"];
5 => N["E"];
6 => N["F#"];
7 => N["G2"];
8 => N["A2"];
    
//     [48, 50, 52, 53, 55, 57, 59, 60] @=> int basicScale[] ;
//               G     A    B      C#     D      E       F#     G2   A2
    (rootNote, [7./8., 1., 9./8., 5./4., 4./3., 3./2., 13./8., 7./4., 2.]) => NT.MakeAScale @=> float S[] ;

          //     A     C#      E    G     A
    (rootNote, [ 1., 5./4., 3./2., 7./4., 2.]) => NT.MakeAScale @=> float basicScale1[] ;    
    basicScale1.cap() - 1 => int basicScale1RandCap;
    fun float basicScale1Rand(){return  basicScale1[ Math.random2(0,basicScale1RandCap)];}


              //  B     D       G    A
    (rootNote, [9./8., 4./3., 7./4., 2.]) => NT.MakeAScale @=> float basicScale2[] ;    
    basicScale2.cap() - 1 => int basicScale2RandCap;
    fun float basicScale2Rand(){return  basicScale2[ Math.random2(0,basicScale2RandCap)];}    
    
0.0 => drone01.gain => drone02.gain;
    
0.15 => drone03.gain; 
rootNote /4. * 1.001 => float drone03Freq; 
drone03Freq => drone03.freq;  3. / 2. * drone03Freq * 4. => fil03.freq;  1.6 => fil03.Q;  
    
    
0.55::second => now;    
    
    
0.065 => drone01.gain;
rootNote /2. * 1.002  => float drone01Freq; 
drone01Freq => drone01.freq; 3. * drone01Freq => fil01.freq;  1.3 => fil01.Q;

0.055 => drone02.gain;    
rootNote /2. * 0.998    => float drone02Freq; 
drone02Freq => drone02.freq;  3. * drone02Freq => fil02.freq;  1.4 => fil02.Q;
    
2* 0.55::second => now;
    
int noteCounter;
    

 0.75::second => dur Rate01;
  
  0.65::second => dur Rate02;


<<<"section 1">>>;
8 => noteCounter;   
while(noteCounter > 0)
{

    Math.random2f(0.025, 0.035) => drone01.gain;
    Math.random2f(0.025, 0.035) => drone02.gain;
    Math.random2f(0.020, 0.04) => drone03.gain;
    (basicScale1Rand(), Rate01, Rate02, 2.) => it.PlayNote0201;
     noteCounter--;
}

<<<"section 2">>>;
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
4 => noteCounter; 
while(noteCounter > 0)
{

    Math.random2f(0.025, 0.035) => drone01.gain;
    Math.random2f(0.025, 0.035) => drone02.gain;
    Math.random2f(0.020, 0.04) => drone03.gain;
    (basicScale1Rand(), Rate01, Rate02, 2.) => it.PlayNote0201;
     noteCounter--;
}

<<<"section 4">>>;
12 => noteCounter;    
while(noteCounter > 0)
{ 
    Math.random2f(0.025, 0.035) => drone01.gain;
    Math.random2f(0.025, 0.035) => drone02.gain;
    Math.random2f(0.020, 0.04) => drone03.gain;
    (basicScale2Rand(), Rate01, Rate02, 2.) => it.PlayNote0102;
     noteCounter--;
}


<<<"section 5">>>;
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
8 => noteCounter;   
while(noteCounter > 0)
{

    Math.random2f(0.025, 0.035) => drone01.gain;
    Math.random2f(0.025, 0.035) => drone02.gain;
    Math.random2f(0.020, 0.04) => drone03.gain;
    (basicScale1Rand(), Rate01, Rate02, 2.) => it.PlayNote0201;
     noteCounter--;
}









