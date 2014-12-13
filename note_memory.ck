// note memory class, remember the notes played for a certain amount of notes
/*
Each note that is played is logged into a moving average of note incidences.

At times in the composition the aggegate note incidences are computed and then sorted
to produce an array of most commonly played to least common. 

The sorted array of indices into the mode scale array are printed out on the console
when the are recomputed using the debug print. 

Segments of this array are used to provide the indices into the midi note array for
tonal effects such as chord building.


The number of columns is arranged to match the number of midi notes in a scale array.
For example this scale array has five notes [48,50,52,54,56]


At initialization the contents of the note memory look like this

0 0 0 0 0 // row 0
0 0 0 0 0 
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0 // row 9

The index of each column matches the index of the scale array.
There are ten rows where andy given row describes which note was play by having a '1' at the correct index.
So if the first note play was 52 then the note memory would look like the following


0 0 1 0 0 // row 0
0 0 0 0 0 
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0 // row 9

And if the second was 48 then


0 0 1 0 0 // row 0
1 0 0 0 0 
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0 // row 9

Eventually it fills up and the writing of '1's wraps around to row zero, so it is a moving average.

0 0 1 0 0 // row 0
1 0 0 0 0 
0 0 0 1 0
0 0 0 1 0
0 0 0 0 0
0 0 0 0 1
0 0 0 0 0
0 0 0 1 0
0 0 1 0 0
0 0 0 0 1 // row 9

When it comes time to compute the prevalent of note incidence each column is summed up.

[1,0,2,3,2]


A reference array is created where the value is the same as the index.

[0,1,2,3,4]

The two arrays are sorted simultaneously to produce the reference array with the index number of the most commonly
played note in the left-most position.

sums -> [1,0,2,3,2] sort -> [3,2,2,1,0]
refs -> [0,1,2,3,4] sort -> [3,2,4,0,1] -> dereference to midi note -> [54,52,56,48,50]

There is now a data structure (array) that shows incidence of notes in decreasing order from left to right.


*/


public class NoteMemory
{
    // assuming row, column storage so the sum of all the 0 and 1 in a given column
    // is the number of times that a given scale index was played. A running average
    int NoteMemory1 [][]; // the note memory
    int DepthOfMemory;    // how many rows, or how many notes to remember
    int DepthCount;       // this is a modulus counter which points to the current row
  
    /* ---------------------------------- */
    // Given an instance of the class
    // NoteMemory Sponge;

    // Given an array of midi note numbers 
    // [48,50,52,54,56] %=> int Scale []

    // Use this method to initialize the instance of the note memory
    // Sponge.init_mem(16,Scale.cap());
    
    // initialize the memory to the number of pitches in the scale and how many note incidences to remember
    fun void init_mem(int history_length, int scale_length)
    {
        int new_memory [history_length][scale_length] @=>  NoteMemory1;
        history_length => DepthOfMemory;
    }    
    
    /* ---------------------------------- */    
    // Given an instance of the class
    // NoteMemory Sponge;

    // Given an array of midi note numbers 
    // [48,50,52,54,56] %=> int Scale []

    // Given an integer whose value is the index of the note to play 
    // int PlayNoteAtIndex

    // Use this method to input into the note memory
    // Std.mtof( Scale [ Sponge.SlurpClean ( PlayNoteAtIndex ) ] ) => e.freq
    
    // This method erases the current row before writing the '1' so the sorted sum shows the most commonly played note.
    // Understand that the input value is the same as the output value.
    fun int SlurpClean (int NoteIndex)
    {
        int j;
        int capacity;
        NoteMemory1[0].cap() => capacity;
        
        for (0 => j; j< capacity; j++) 0 => NoteMemory1 [DepthCount % DepthOfMemory] [j]; // clear to all 0's before chucking the 1 into place
        1=> NoteMemory1 [DepthCount % DepthOfMemory][NoteIndex]; // chuck 1 signifying that the note was played
        DepthCount++; // increment the row of the memory
        return (NoteIndex);
    } 
    
    
    /* ---------------------------------- */
    // Given an instance of the class
    // NoteMemory Sponge;

    // Given an array of midi note numbers 
    // [48,50,52,54,56] %=> int Scale []

    // Given an integer whose value is the index of the note to play 
    // int PlayNoteAtIndex

    // Use this method to input into the note memory
    // Std.mtof( Scale [ Sponge.SlurpSticky ( PlayNoteAtIndex ) ] ) => e.freq
        
    // This method does not erase the current row before writing the '1' so eventually it will fill up with '1'.
    // The sorted sum shows the least commonly played notes. 
    // Understand that the input value is the same as the output value.
    fun int SlurpSticky (int NoteIndex)
    {
        1=> NoteMemory1 [DepthCount % DepthOfMemory][NoteIndex]; // chuck 1 signifying that the note was played
        DepthCount++; // increment the row of the memory
        return (NoteIndex);    
    }
    
    /* ---------------------------------- */    
    // This function adds up column wise and returns an array with the sums
    // So the index corresponds to the index into the scale array and the value
    // is the number of times the note was played (# note incidence).
    fun int [] AddColumn (int NoteMemory [][])
    {
        int IndexSums [NoteMemory[0].size()];
        int i, j;
        
        for (0 => i; i < IndexSums.size();i++)
            for(0=>j;j<NoteMemory.size();j++) 
                NoteMemory[j][i] +=> IndexSums[i];
        return IndexSums;
    }

    /* ---------------------------------- */
    // This function implements a dual bubble sort. The array of note incidence
    // is sorted using bubble sort and the criteria for the sort are the values of
    // the array. The sort operations (switching) are also carried out on an array
    // in which the values are the same as the indices. The result an array of 
    // indices into the scale array where the most common occurance is at index 0. 

    fun int [] DualBubbleSort (int ScaleIncidence [])
    {
        int ScaleIndices [ScaleIncidence.size()];
        int i;
        int flag; // =1: a sorting shift was made, =0: possibly done sorting
        int temp1; // hold the value during a shift
        
        for(0=>i;i<ScaleIndices.size();i++)
            i=>ScaleIndices[i];
        
        do{
            0=> flag;
            for(0=>i;i<ScaleIncidence.size()-1;i++)
            {
                if(ScaleIncidence[i+1] > ScaleIncidence[i] )
                {               
                    ScaleIncidence[i] => temp1;
                    ScaleIncidence[i+1] => ScaleIncidence[i];
                    temp1 => ScaleIncidence[i+1];

                    ScaleIndices[i] => temp1;
                    ScaleIndices[i+1] => ScaleIndices[i];
                    temp1 => ScaleIndices[i+1];
                     
                    1 => flag;
                }
            }
        } while(flag);
        
        return ScaleIndices;
    }
   
   
 
    /* ---------------------------------- */    
    // Given an instance of the class
    // NoteMemory Sponge;
   
    // Use this method to return the statistics of the note memory
    // Sponge.Squeeze() @=> int HistoryData [];
    
    // this returns the history sorted by frequency of incidence
    fun int [] Squeeze()
    {
      return (DualBubbleSort(AddColumn(NoteMemory1)));  
    }
    

    
} // end of note memory class


