// BPM.ck
// global BPM conductor Class
public class BPM
{
    // global variables

    static dur R1, R2, R4, T8, T6, T3, R8, R6, R3;
    static dur DS [];
    
    fun void tempo(float beat)  {
        // beat is BPM, example 120 beats per minute
        
        60.0/(beat) => float SPB; // seconds per beat
        SPB::second  =>  R4;    // rate of pulse in seconds (1/4 note)
        R4*0.3333 =>  T8;     
        T8*0.5 =>  T6;
        T6*0.5 =>  T3;    
        R4*0.5 =>  R8;      // 1/8
        R8*0.5 =>  R6;      // 1/16
        R6*0.5 =>  R3;      // 1/32 
        R4*2.0 =>  R2;
        R2*2.0 =>  R1;
    }
    
    /* --------------------------- */
    // add up and array of duration and return the sum
    fun dur AddUp( dur input [])
    {
        dur result;
        for(0 => int i;i<input.cap();i++) input[i] +=> result;
        return (result);
    } 
    
 
    fun void initDS()
    {
        [1.::second] @=> DS;
        R4 => DS ["R4"];
        T8 => DS ["T8"];
        T6 => DS ["T6"];
        T3 => DS ["T3"];
        R8 => DS ["R8"];
        R6 => DS ["R6"];
        R3 => DS ["R3"];  
        R2 => DS ["R2"];
        R1 => DS ["R1"];
    }

 
    
    
}

