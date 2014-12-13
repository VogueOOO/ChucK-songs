
class ZCrossGain extends Chubgraph  {
    inlet => Gain g => outlet;

    static float oldGain;
    0.0 => oldGain;
    0.0 => g.gain;
    
    fun void setZCrossGain(float newGain) {
        float theRange, theDiv;
        0.001 => theRange;
        theRange * -1.0 => float minusRange;

        if (newGain != oldGain) {
            (newGain - oldGain)/16.0 => theDiv;
            for (0 => int i; i < 16; i++){
                while ((outlet.last() < minusRange ) || (outlet.last() > theRange) ) 1::samp => now;
                g.gain() + theDiv => g.gain; 1::samp => now;
            }
            g.gain() =>  oldGain; 
             <<<newGain, g.gain()>>>;
        }           
    }
}

TriOsc oscillator => ZCrossGain eee => dac;
1.0 => oscillator.gain;
300.0 => oscillator.freq;

0.05 => float timing_variable;

while(true)
{
    Math.random2f(0.1, 0.9) => eee.setZCrossGain;
    timing_variable::second => now;
} 
