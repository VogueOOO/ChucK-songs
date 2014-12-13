

// use Chubgraph to extend a sound chain

public class Saw01 extends Chubgraph
{

    1.0 => float AttackFactor; // how rapidly the attack changes with frequency, 1.0 no change, < 1.0 attack speeds up 
    15::ms => dur BaselineAttack; // the attack duration to use when AttackFactor is 1.0
    220.0 => float BaselineFreq;  // nominal frequency for baseline attack 
    
    // outlet is the destination
    SawOsc saw01  => ADSR vlope => Gain gt => outlet;

    0.5 => gt.gain;  // default output gain
 
    (15::ms,5::ms,0.5,50::ms) => vlope.set; // default envelope

    0.5 => saw01.gain;  // default sawtooth gain

    /* ------------------ */    
    // play using the same envelope
    fun void Play(int note)
    {
        float new_freq;
        Std.mtof(note) => new_freq;

        new_freq => saw01.freq;
        1 => vlope.keyOn;
        15.0::ms => now;
        1 => vlope.keyOff;
    }

    /* ------------------ */    
    // init the way that the attack changes
    fun void InitVarAttack (float f1, dur d1)
    {
        f1 => this.AttackFactor;
        d1 => this.BaselineAttack;
    }
    
    /* ------------------ */    
    // play using envelope in which attack varies with note frequency 
    fun void PlayVarAttack(int note)
    {
        float new_freq;
        Std.mtof(note) => new_freq;
        new_freq => saw01.freq;
        
        new_freq/this.BaselineFreq * this.AttackFactor * this.BaselineAttack => vlope.attackTime;
        
        1 => vlope.keyOn;
        15.0::ms => now;
        1 => vlope.keyOff;
    }

    /* ------------------ */
    // set all of the envelope parameters. 
    fun void SetEnvelope(dur Attack, dur Decay, float Sustain, dur Release)
    {
        (Attack,Decay,Sustain,Release) => vlope.set;
    }

    /* ------------------ */
    // set the output gain
    fun void SetGain (float theGain)
    {
        theGain => gt.gain;
    }
    
} // class Saw01