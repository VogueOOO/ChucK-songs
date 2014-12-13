



// spork two shreds that concurrently control the frequency of one osc
public class DualTri01 extends Chubgraph
{
    // sound chain
    SawOsc tri01 => outlet;
    0.15 => tri01.gain;  // default sawtooth gain
    

    
    fun void Play01(float Note01, dur thePace)
    {
        for(0=> int k; k < Math.random2(4,8);k++) 
        {
            Note01  => tri01.freq;
            thePace => now;
        }
        me.exit();
    } 

    fun void Play02(float Note01, dur thePace)
    {
        for(0=> int k; k < Math.random2(0,4);k++) 
        {
            Note01  => tri01.freq;
            thePace => now;
        }
        me.exit();
    } 


    fun void PlayNote0102 (float TheNote, dur baseTimeBase, float differentialTime)
    {
        spork ~ Play01(TheNote, baseTimeBase);
        spork ~ Play02(TheNote, baseTimeBase * differentialTime);
        0.55::second => now;
    }
    
    fun void PlayNote0201 (float TheNote, dur baseTimeBase, float differentialTime)
    {
        spork ~ Play02(TheNote, baseTimeBase);
        spork ~ Play01(TheNote, baseTimeBase * differentialTime);
        0.55::second => now;
    }
    
      
}
    
    DualTri01 it;

    it => Chorus foo => NRev verb => dac;
    0.888 => foo.mix;
    0.011 => foo.modDepth;
    1.0 => foo.modFreq ;
    0.1 => verb.mix;


SawOsc drone01 => Chorus foo01 =>  dac;
SawOsc drone02 => Chorus foo02 =>  dac;
SawOsc drone03 => Chorus foo03 =>  dac;

0.03 => drone01.gain => drone02.gain => drone03.gain;
220.  => drone01.freq => drone02.freq;
110. => drone03.freq;

    0.4 => foo01.mix;  0.011 => foo01.modDepth;    1.2 => foo01.modFreq ;
    0.4 => foo02.mix;  0.011 => foo02.modDepth;    1.3 => foo02.modFreq ;
    0.4 => foo03.mix;  0.011 => foo03.modDepth;    0.7 => foo03.modFreq ;
    
//     [48, 50, 52, 53, 55, 57, 59, 60] @=> int basicScale[] ;
//    G     A       B      C#     D               E       F#       G       A
    [385.,  440.,   495.,  550.,   586.6666667,    660.,   715.,   770.0,    880.0 ] @=> float basicScale[] ;
    basicScale.cap() - 1 => int basicScaleRandCap;
    fun float basicScaleRand(){return  basicScale[ Math.random2(0,basicScaleRandCap)];}

while(1)
{
 //   (basicScaleRand(), 0.5::second, 2.) => it.PlayNote0102;
    
    Math.random2f(0.025, 0.035) => drone01.gain;
    Math.random2f(0.025, 0.035) => drone02.gain;
    Math.random2f(0.020, 0.04) => drone03.gain;
    (basicScaleRand(), 0.4::second, 2.) => it.PlayNote0201;

}
