// Super-simple wah-wah pedal class
// by Perry R. Cook, October 2013
//     this one uses Chuggraph extension
// Based on Julius O. Smith's experiments
// with his own CryBaby.  See:
// https://ccrma.stanford.edu/realsimple/faust_strings/faust_strings.pdf


class CryBaby extends Chubgraph  {
    inlet => ResonZ wah => outlet;
    3.0 => wah.Q;
    1000.0 => wah.freq;
    
    [460.0,840,2250] @=> float freqs[]; // JOS data
    [9.4,4.0,2.0] @=> float Qs[];      // from his pedal
    
    // here we just linearly interpolate JOS data
    // zero is full closed, 1.0 is full "open"
    fun void setWah(float zero2One) {
        if (zero2One < 0.5) {
            2.0 * zero2One => float temp;
            freqs[0] + 
                ((freqs[1]-freqs[0])*temp) 
                => wah.freq;
            Qs[0] + 
                ((Qs[1]-Qs[0])*temp) 
                => wah.Q;
        }
        else  {
            2.0 * (zero2One-0.5) => float temp;
            freqs[1] + 
            ((freqs[2]-freqs[1])*temp) 
            => wah.freq;
            Qs[1] + 
            ((Qs[2]-Qs[1])*temp) 
            => wah.Q;
        }            
//        <<< wah.freq(), wah.Q() >>>;
    }
}

// OK, now let's test this baby!!
SndBuf s => CryBaby myWah => dac;
"shuffle.wav" => s.read; // test guitar riff, put whatever you like here
1 => s.loop;

SinOsc autoWah => blackhole; // we use this to automatically
0.3 => autoWah.freq;         // open/close our wah-wah filter

while (1)  {  // just hang here and update
    0.5*(1.0+autoWah.last()) => myWah.setWah;
    0.01 :: second => now;
}