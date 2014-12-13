

// tonality.ck



public class TN
{
    
    static int basicScale[];
    static int theScale [];
    static float rr [];
    static int bassScale [];
    static int soloScale [];
    static int XS [];
    
    static int MT0D5A [];
    static int MT0D5B [];
    static int MT0D4 [];
    static int MT0D3 [];
    static int offsetTree1 [];    
    static int offsetTree2 [];
   
    static int BassOffsetTree1 [];
    static int CchordScale[];
    
    /* The begining part and the bass line are in C major */
    // C Ionian mode
   //C    D   E   F   G  A   B   C
    [48, 50, 52, 53, 55, 57, 59, 60] @=> basicScale;
    
    //E   G   B    C   D   G
     [28, 31, 35, 36, 38 , 43] @=> bassScale;       
    
    /* the rest of it is in G major */
    // G   A   B   C   D   E   F# 
      [43, 45, 47, 48, 50, 52, 54] @=> soloScale; 
    
    
    /* ------------------------------------------ */
    // this function will take a midi note number scale and expand it by adding octaves
    fun int [] expandScale (int  someScale [])
    {
       int newScale [someScale.cap() * 2 ];
       int i;
        
        for(0=>i;i<someScale.cap();i++){someScale[i]=>newScale[i];} // copy the original scale
        for(0=>i;i<someScale.cap();i++){someScale[i]+12=>newScale[i+someScale.cap()];} // add an octave above

        return(newScale);
    }    

    
    /* ------------------------------------------ */
    // this function will return an array of rates for sampled sounds
    // the rate values are the ratios of the input scale
    fun float [] rateScale (int someScale [])
    {
       float newScale [someScale.cap() * 3 ];
       int i; 
     
       Std.mtof(someScale[0]-12) => float setPoint;
       for(0=>i;i<someScale.cap();i++){setPoint*2.0/Std.mtof(someScale[i])=>newScale[i];} 
       for(0=>i;i<someScale.cap();i++){setPoint*1.0/Std.mtof(someScale[i])=>newScale[i+someScale.cap()];} 
       for(0=>i;i<someScale.cap();i++){setPoint*0.5/Std.mtof(someScale[i])=>newScale[i+someScale.cap()*2];} 
       return(newScale);
        
    }
    
    /* ------------------------------------------ */
    // This function takes an array of midi note numbers. 
    // The function will output an array which is the difference between consecutive numbers.
    // Just assume that the midi note numbers are integers. These are just note number differences, not music theory like 3rds, 5ths, etc
    // someScale : [10, 12, 14, 15, 17, 19]
    // result :    [ 0,  2,  2,  1,  2,  2]
    fun int [] computeScaleIntervals  (int  someScale [])
    {
        int result [0];
        for (1=> int i; i<someScale.cap();i++) result <<  Std.abs(someScale[i] - someScale[i-1]);
        return (result);    
    }
    
    
    /* ------------------------------------------ */    
    // find the note number distance between any to indexes of the scale
    
    
    expandScale( expandScale ([48,52,55])) @=> CchordScale;  
    
    expandScale(basicScale) @=> theScale; // this array should have 16 notes    

    rateScale (theScale) @=> rr;
    
    expandScale(expandScale( expandScale (soloScale))) @=> XS;  XS << 79;// expanded solo scale
    <<<"XS size ", XS.cap()>>>;

/*  various binary trees for notes */    

// Store a binary tree into an array, just use whitespace for the formatting 
// Don't use index 0, start the tree at index 1
    
 /* -------------------------------------------------------------------------------- */
    
       [ 0,                    00,                             // 2^0
                12,                          03,                // 2^1 
        05,             04,           04,            15,        // 2^2
   09,     04,     07,     14,     10,     11,     03,     02,     // 2^3
 01, 08, 09, 11, 05, 08, 13, 15, 13, 08, 06, 08, 15, 08, 05, 08]  @=> MT0D5A;
 
 /* -------------------------------------------------------------------------------- */
    
       [ 0,                    04,                             // 2^0
                10,                          05,                // 2^1 
        05,             04,           04,            06,        // 2^2
   09,     04,     07,     14,     10,     13,     03,     07,     // 2^3
 20, 08, 20, 11, 05, 08, 20, 15, 13, 08, 20, 08, 15, 20, 06, 08]  @=> MT0D5B; 
 
 /* -------------------------------------------------------------------------------- */
    
       [ 0,                    00,                             // 2^0
                12,                          03,                // 2^1 
        05,             04,           04,            15,        // 2^2
   09,     04,     07,     14,     10,     11,     03,     02]  @=> MT0D4;
 
 /* -------------------------------------------------------------------------------- */
    
       [ 0,                    00,                             // 2^0
                12,                          03,                // 2^1 
        05,             04,           04,            15]  @=> MT0D3;

 /* -------------------------------------------------------------------------------- */
   
       [ 0,                    03,                             // 2^0
                04,                          02,                // 2^1 
        05,             06,           07,            05]   @=> offsetTree1;

 /* -------------------------------------------------------------------------------- */
   
       [ 0,                    00,                             // 2^0
                08,                          04,                // 2^1 
        00,             02,           09,            05         ]   @=> offsetTree2;
   
 /* -------------------------------------------------------------------------------- */  

       [ 0,                    00,                             // 2^0
                -1,                          02,                // 2^1 
        01,             03,           03,            04         ]   @=> BassOffsetTree1;
   
 /* -------------------------------------------------------------------------------- */  



/* ------------------------------------------ */ 
// This is a recursive function that crawls down the note tree taking 
// random left or right branch. The walk is from the leaf to the root
// starting at index 1.
fun int [] RBT_array (int NoteTree [], int TreeIndex)
{
    if(TreeIndex >= NoteTree.cap()) return ([0]); // Called off the end of the tree, so just return
    else return ( RBT_array ( NoteTree, TreeIndex * 2 + Math.random2(0,1) ) <<  NoteTree[ TreeIndex ] );
}

/* ------------------------------------------ */ 
// This fixes up the array returned by RBT_array by removing
// index 0 and then reversing the array, so the walk is from
// the root to the leaf.
fun int [] TreeTopDown (int NoteTree [], int TreeIndex)
{
    RBT_array(NoteTree, TreeIndex) @=> int NewTree[];
    int BinaryWalk [NewTree.cap()-1];
    for(0=>int i; i<BinaryWalk.cap();i++) NewTree[NewTree.cap()-i-1] => BinaryWalk [i];
    return (BinaryWalk );    
}


/* ------------------------------------------ */ 
// append one array onto the end of another array
fun int [] AppendArray (int dest [], int src [])
{
    src.cap() + dest.cap() => int item;
    int i,j;
    int MyNewArray [item];
    for (0 => i; i<dest.cap();i++)  dest [i] => MyNewArray[i];
    for (0=>j;j<src.cap();j++) src [j] => MyNewArray[i+j];
    return (MyNewArray);
}

/* ------------------------------------------ */ 
// append one array onto the end of another array
fun dur [] AppendArray1 (dur dest [], dur src [])
{
    src.cap() + dest.cap() => int item;
    int i,j;
    dur MyNewArray [item];
    for (0 => i; i<dest.cap();i++)  dest [i] => MyNewArray[i];
    for (0=>j;j<src.cap();j++) src [j] => MyNewArray[i+j];
    return (MyNewArray);
}



fun float [] MakeAScale (float BaseFreq, float TheIntervals [])
{
    int i;
    float f_result [TheIntervals.cap()];
    for (0 => i; i< TheIntervals.cap();i++) {BaseFreq * TheIntervals[i] => f_result[i];}
    return (f_result);
}




} // end class TN

