


// FreqLogger



public class FreqLogger
{
    static dur AllNoteDurArray[];
    static float AllNoteFreqArray[];
    
    dur   NoteDurArray[0];
    float NoteFreqArray[0];
    
    float prevNote;
    time  NoteTime;
    
    fun void init()
    {
        now => NoteTime;
        
        new dur[0]   @=>  AllNoteDurArray; // AllNoteDurArray.clear;
        new float[0] @=>  AllNoteFreqArray; // NoteFreqArray.clear;
        
        
    }
    
    
    fun void LogFreqDur(float frequi)
    {
         dur SomeDur;
        
         (now - NoteTime) => SomeDur; if(SomeDur < 0.0::second) -1. *=> SomeDur; 
         NoteFreqArray << frequi; AllNoteFreqArray << frequi;
         NoteDurArray  << SomeDur; AllNoteDurArray << SomeDur;
         now => NoteTime;
    }
    
    
    
    
}