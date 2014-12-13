

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
    



    static float fullMidiScale[];
    
    [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10., 11., // 0
     12., 13., 14., 15., 16., 17., 18., 19., 20., 21., 22., 23., // 1
     24., 25., 26., 27., 28., 29., 30., 31., 32., 33., 34., 35., // 2
     36., 37., 38., 39., 40., 41., 42., 43., 44., 45., 46., 47., // 3
     48., 49., 50., 51., 52., 53., 54., 55., 56., 57., 58., 59., // 4 
     60., 61., 62., 63., 64., 65., 66., 67., 68., 69., 70., 71., // 5
     72., 73., 74., 75., 76., 77., 78., 79., 80., 81., 82., 83., // 6 
     84., 85., 86., 87., 88., 89., 90., 91., 92., 93., 94., 95., // 7 
     96., 97., 98., 99., 100., 101., 102., 103., 104., 105., 106., 107., // 8 
     108., 109., 110., 111., 112., 113., 114., 115., 116., 117., 118., 119., // 9
     120., 121., 122., 123., 124., 125., 126., 127.  // 10
    ] @=> fullMidiScale;


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



static float MN[];

fun void initMN()
{
    [1.] @=> TN.MN;
     0.0 => MN["C0"];
     1.0 => MN["C#0"];
     1.0 => MN["Db0"];
     2.0 => MN["D0"];
     3.0 => MN["D#0"];
     3.0 => MN["Eb0"];
     4.0 => MN["E0"];
     5.0 => MN["F0"];
     6.0 => MN["F#0"];
     6.0 => MN["Gb0"];
     7.0 => MN["G0"];
     8.0 => MN["G#0"];
     8.0 => MN["Ab0"];
     9.0 => MN["A0"];
     10. => MN["A#0"];
     10. => MN["Bb0"];
     11. => MN["B0"];
     // 0

     12. => MN["C1"];
     13. => MN["C#1"];
     13. => MN["Db1"];
     14. => MN["D1"];
     15. => MN["D#1"];
     15. => MN["Eb1"];
     16. => MN["E1"];
     17. => MN["F1"];
     18. => MN["F#1"];
     18. => MN["Gb1"];
     19. => MN["G1"];
     20. => MN["G#1"];
     20. => MN["Ab1"];
     21. => MN["A1"];
     22. => MN["A#1"];
     22. => MN["Bb1"];
     23. => MN["B1"];
     // 1

     24. => MN["C2"];
     25. => MN["C#2"];
     25. => MN["Db2"];
     26. => MN["D2"];
     27. => MN["D#2"];
     27. => MN["Eb2"];
     28. => MN["E2"];
     29. => MN["F2"];
     30. => MN["F#2"];
     30. => MN["Gb2"];
     31. => MN["G2"];
     32. => MN["G#2"];
     32. => MN["Ab2"];
     33. => MN["A2"];
     34. => MN["A#2"];
     34. => MN["Bb2"];
     35. => MN["B2"];
     // 2

     36. => MN["C3"];
     37. => MN["C#3"];
     37. => MN["Db3"];
     38. => MN["D3"];
     39. => MN["D#3"];
     39. => MN["Eb3"];
     40. => MN["E3"];
     41. => MN["F3"];
     42. => MN["F#3"];
     42. => MN["Gb3"];
     43. => MN["G3"];
     44. => MN["G#3"];
     44. => MN["Ab3"];
     45. => MN["A3"];
     46. => MN["A#3"];
     46. => MN["Bb3"];
     47. => MN["B3"];
     // 3

     48. => MN["C4"];
     49. => MN["C#4"];
     49. => MN["Db4"];
     50. => MN["D4"];
     51. => MN["D#4"];
     51. => MN["Eb4"];
     52. => MN["E4"];
     53. => MN["F4"];
     54. => MN["F#4"];
     54. => MN["Gb4"];
     55. => MN["G4"];
     56. => MN["G#4"];
     56. => MN["Ab4"];
     57. => MN["A4"];
     58. => MN["A#4"];
     58. => MN["Bb4"];
     59. => MN["B4"];
     // 4 

     60. => MN["C5"];
     61. => MN["C#5"];
     61. => MN["Db5"];
     62. => MN["D5"];
     63. => MN["D#5"];
     63. => MN["Eb5"];
     64. => MN["E5"];
     65. => MN["F5"];
     66. => MN["F#5"];
     66. => MN["Gb5"];
     67. => MN["G5"];
     68. => MN["G#5"];
     68. => MN["Ab5"];
     69. => MN["A5"];
     70. => MN["A#5"];
     70. => MN["Bb5"];
     71. => MN["B5"];
     // 5

     72. => MN["C6"];
     73. => MN["C#6"];
     73. => MN["Db6"];
     74. => MN["D6"];
     75. => MN["D#6"];
     75. => MN["Eb6"];
     76. => MN["E6"];
     77. => MN["F6"];
     78. => MN["F#6"];
     78. => MN["Gb6"];
     79. => MN["G6"];
     80. => MN["G#6"];
     80. => MN["Ab6"];
     81. => MN["A6"];
     82. => MN["A#6"];
     82. => MN["Bb6"];
     83. => MN["B6"];
     // 6 

     84. => MN["C7"];
     85. => MN["C#7"];
     85. => MN["Db7"];
     86. => MN["D7"];
     87. => MN["D#7"];
     87. => MN["Eb7"];
     88. => MN["E7"];
     89. => MN["F7"];
     90. => MN["F#7"];
     90. => MN["Gb7"];
     91. => MN["G7"];
     92. => MN["G#7"];
     92. => MN["Ab7"];
     93. => MN["A7"];
     94. => MN["A#7"];
     94. => MN["Bb7"];
     95. => MN["B7"];
     // 7 

     96. => MN["C8"];
     97. => MN["C#8"];
     97. => MN["Db8"];
     98. => MN["D8"];
     99. => MN["D#8"];
     99. => MN["Eb8"];
     100. => MN["E8"];
     101. => MN["F8"];
     102. => MN["F#8"];
     102. => MN["Gb8"];
     103. => MN["G8"];
     104. => MN["G#8"];
     104. => MN["Ab8"];
     105. => MN["A8"];
     106. => MN["A#8"];
     106. => MN["Bb8"];
     107. => MN["B8"];
     // 8 

     108. => MN["C9"];
     109. => MN["C#9"];
     109. => MN["Db9"];
     110. => MN["D9"];
     111. => MN["D#9"];
     111. => MN["Eb9"];
     112. => MN["E9"];
     113. => MN["F9"];
     114. => MN["F#9"];
     114. => MN["Gb9"];
     115. => MN["G9"];
     116. => MN["G#9"];
     116. => MN["Ab9"];
     117. => MN["A9"];
     118. => MN["A#9"];
     118. => MN["Bb9"];
     119. => MN["B9"];
     // 9

     120. => MN["C10"];
     121. => MN["C#10"];
     121. => MN["Db10"];
     122. => MN["D10"];
     123. => MN["D#10"];
     123. => MN["Eb10"];
     124. => MN["E10"];
     125. => MN["F10"];
     126. => MN["F#10"];
     126. => MN["Gb10"];
     127. => MN["G10"];
     // 10

}



// text in sharps of midi note number
static string TSMN[];

[
 "C0", "C#0", "D0", "D#0", "E0", "F0", "F#0", "G0", "G#0", "A0", "A#0", "B0",
 "C1", "C#1", "D1", "D#1", "E1", "F1", "F#1", "G1", "G#1", "A1", "A#1", "B1",
 "C2", "C#2", "D2", "D#2", "E2", "F2", "F#2", "G2", "G#2", "A2", "A#2", "B2",
 "C3", "C#3", "D3", "D#3", "E3", "F3", "F#3", "G3", "G#3", "A3", "A#3", "B3",
 "C4", "C#4", "D4", "D#4", "E4", "F4", "F#4", "G4", "G#4", "A4", "A#4", "B4",
 "C5", "C#5", "D5", "D#5", "E5", "F5", "F#5", "G5", "G#5", "A5", "A#5", "B5",
 "C6", "C#6", "D6", "D#6", "E6", "F6", "F#6", "G6", "G#6", "A6", "A#6", "B6",
 "C7", "C#7", "D7", "D#7", "E7", "F7", "F#7", "G7", "G#7", "A7", "A#7", "B7",
 "C8", "C#8", "D8", "D#8", "E8", "F8", "F#8", "G8", "G#8", "A8", "A#8", "B8", 
 "C9", "C#9", "D9", "D#9", "E9", "F9", "F#9", "G9", "G#9", "A9", "A#9", "B9",
 "C10", "C#10", "D10", "D#10", "E10", "F10", "F#10", "G10"
] @=> TSMN;


// text in flats of midi note number
static string TFMN[];

[
 "C0", "Db0", "D0", "Eb0", "E0", "F0", "Gb0", "G0", "Ab0", "A0", "Bb0", "B0",
 "C1", "Db1", "D1", "Eb1", "E1", "F1", "Gb1", "G1", "Ab1", "A1", "Bb1", "B1",
 "C2", "Db2", "D2", "Eb2", "E2", "F2", "Gb2", "G2", "Ab2", "A2", "Bb2", "B2",
 "C3", "Db3", "D3", "Eb3", "E3", "F3", "Gb3", "G3", "Ab3", "A3", "Bb3", "B3",
 "C4", "Db4", "D4", "Eb4", "E4", "F4", "Gb4", "G4", "Ab4", "A4", "Bb4", "B4",
 "C5", "Db5", "D5", "Eb5", "E5", "F5", "Gb5", "G5", "Ab5", "A5", "Bb5", "B5",
 "C6", "Db6", "D6", "Eb6", "E6", "F6", "Gb6", "G6", "Ab6", "A6", "Bb6", "B6",
 "C7", "Db7", "D7", "Eb7", "E7", "F7", "Gb7", "G7", "Ab7", "A7", "Bb7", "B7",
 "C8", "Db8", "D8", "Eb8", "E8", "F8", "Gb8", "G8", "Ab8", "A8", "Bb8", "B8",
 "C9", "Db9", "D9", "Eb9", "E9", "F9", "Gb9", "G9", "Ab9", "A9", "Bb9", "B9",
 "C10", "Db10", "D10", "Eb10", "E10", "F10", "Gb10", "G10"
] @=> TFMN;

fun string FindToken (string test, string theToken)
{
    test.find(theToken) => int loc;
   if(loc >=0)
   {
        loc + theToken.length() => int theStart;
        test.find(" ", theStart) => int theEnd;
        theEnd - theStart => int theLength;
        return (test.substring(theStart,theLength));
   }
   else {return ("");}
}

 



} // end class TN

