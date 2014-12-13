
public class ShredControl
{
    static int shreds_to_kill []; 
    
    [0] @=> shreds_to_kill;
    
    fun void RemoveShreds ()
    {
        for(0=>int i; i < shreds_to_kill.cap();i++) Machine.remove(shreds_to_kill[i]);
    }

    
    static int StopForFinale;
    0 => StopForFinale;
    
    static int OrganDone; 
    0 => OrganDone; 
    
    static int StopSolo;
    0 => StopSolo;
    
}// end of ShredControl