



// spork two shreds that concurrently control the frequency of one osc
public class DualTri01 extends Chubgraph
{
    // sound chain
    SawOsc tri01 => outlet;
    0.15 => tri01.gain;  // default sawtooth gain
    
    // freqeuncy ratios from Wikipedia, equal tempered scale
    1.000000 => float nU; 
    1.059463 => float nm2;
    1.122462 => float nM2;
    1.189207 => float nm3;
    1.259921 => float nM3;
    1.334840 => float n4;
    1.414214 => float na4;
    1.498307 => float n5;
    1.587401 => float nm6;
    1.681793 => float nM6;
    1.781797 => float nm7;
    1.887749 => float nM7;

    
    
    [nU, nM3, n5] @=> float factors01 []; 
    factors01.cap() - 1 => int factors01RandCap;
    fun float factors01Rand() {return factors01[Math.random2(0,factors01RandCap)];}
    
    [nU, na4, nM6] @=> float factors02 []; 
    factors02.cap() - 1 => int factors02RandCap;
    fun float factors02Rand() {return factors02[Math.random2(0,factors02RandCap)];}
    
    [1.0, 2.0] @=> float Rocktave []; 
    Rocktave.cap() - 1 => int  RocktaveRandCap;
    fun float RocktaveRand() {return Rocktave[Math.random2(0,RocktaveRandCap)];}
    
    fun void Play01(float Note01, dur thePace)
    {
        for(0=> int k; k < Math.random2(4,8);k++) 
        {
            RocktaveRand() * Std.mtof(Note01) * factors01Rand() => tri01.freq;
            thePace => now;
        }
        me.exit();
    } 

    fun void Play02(float Note01, dur thePace)
    {
        for(0=> int k; k < Math.random2(0,4);k++) 
        {
            RocktaveRand() * Std.mtof(Note01) * factors02Rand() => tri01.freq;
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

//     [48, 50, 52, 53, 55, 57, 59, 60] @=> int basicScale[] ;
    [48., 53., 57., 60., 48., 48., 48.] @=> float basicScale[] ;
    basicScale.cap() - 1 => int basicScaleRandCap;
    fun float basicScaleRand(){return  basicScale[ Math.random2(0,basicScaleRandCap)];}

while(1)
{
 //   (basicScaleRand(), 0.5::second, 2.) => it.PlayNote0102;
    (basicScaleRand(), 0.4::second, 2.) => it.PlayNote0201;

}
