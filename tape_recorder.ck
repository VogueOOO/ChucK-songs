


public class TapeRecorder
{
    time   A [0];
    string S [0];

    
    fun void Init ()
    {
        A.clear();
        S.clear();
    }
    
    fun string Rec (string sym)
    {
        A << now;
        S << sym;
        return (sym);
    }
    
    fun void Stop ()
    {
        A << now;
        S << "";        
    }
    
    fun int Size ()
    {
        return (A.cap());
    }
    
}