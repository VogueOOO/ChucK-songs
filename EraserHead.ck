
public class EraserHead extends Chubgraph
{    
    SinOsc F0, F1, F2;
    F0 => F1 => F2 => outlet;

    2 => F1.sync => F2.sync; 
    700. => F0.gain => F1.gain;
    
    float twoFactor;
    float fourFactor;

    1.0 => twoFactor => fourFactor;

 
//     2 => F0.sync => F1.sync => F2.sync; 

    fun void freq( float value)
    {
      value => F2.freq; 
      value * 1.0 * twoFactor => F1.freq;
      value * 1.00 * fourFactor => F0.freq ;        
    }

    
    fun float mod2(float modNumber)
    {
        modNumber => twoFactor;
        return (modNumber);
    }

    fun float gain2(float gainNumber)
    {
        gainNumber => F1.gain;
        return (gainNumber);
    }
    
    fun float gain4(float gainNumber)
    {
        gainNumber => F0.gain;
        return (gainNumber);
    }
    
    fun float mod4(float modNumber)
    {
        modNumber => fourFactor;
        return (modNumber);
    }
    
      
}  // class EraserHead

/*

EraserHead EH => ADSR EH_ev => dac;
  (100.::ms, 25.::ms, 0.05, 16.::ms ) => EH_ev.set;


  while (true )
  {
      Math.random2f(850., 880.) => EH.freq;
      Math.random2( 1, 6) => EH.mod2;

      Math.random2(1, 6) => EH.mod4;
      Math.random2f(800., 1020.) => EH.gain4;
       Math.random2f(800., 900.) => EH.gain2;     
      
      EH_ev.keyOn();
      100.::ms => now;
      EH_ev.keyOff();
      50.::ms => now;
  }

*/
    