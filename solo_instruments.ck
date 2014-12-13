// solo instruments
int it_thing;

int i, j;

NoteMemory CQ;  // use note memory to score harmony in the second part

TN NT;  // get some tonality


int MM [];  // contains melody
int OO [];  // contains trill
dur RR [];  // contains rhythm


CQ.init_mem(24,TN.XS.cap());

BPM tempo;         // instantiate BPM static variables

/* 
Structure of the second part.

The notes played by the solo instrument are computed in bunches up-front of 'now' using the note memory.
The harmony for the solo is then computed and the whole thing is played out as a sequencer, so while there
are random aspects to the melody the occurances of 'random' happen at the program statement evaluation rate
and not at the 'now' rate.

*/

Saw01  sw;

sw => NRev verb => Pan2 pan_sw01 => dac;

    0.100111 => verb.mix;


//
Mandolin mand[4];

mand[0]  => Chorus chr_tr01 => Pan2 pan_tri01 => dac;
mand[1]  => Chorus chr_tr02 => Pan2 pan_tri02 => dac;
mand[2]  => Chorus chr_tr03 => Pan2 pan_tri03 => dac;
mand[3]  => Chorus chr_tr04 => Pan2 pan_tri04 => dac;

-0.2 => pan_tri01.pan;
-0.75 => pan_tri02.pan;
0.75 => pan_tri03.pan;
0.2 => pan_tri04.pan;

0.5 => chr_tr01.modFreq;
0.7 => chr_tr02.modFreq;
1.1 => chr_tr03.modFreq;
1.3 => chr_tr04.modFreq;

0.05 => chr_tr01.modDepth;
0.05 => chr_tr02.modDepth;
0.05 => chr_tr03.modDepth;
0.05 => chr_tr04.modDepth;

0.25 => chr_tr01.mix;
0.25 => chr_tr02.mix;
0.25 => chr_tr03.mix;
0.25 => chr_tr04.mix;

/* ---------------------------- */
fun void mandGain (float g_value)
{
    for ( 0=>int k; k< mand.cap();k++ ) g_value => mand[k].gain;
}

mandGain(0.0);

/* ---------------------------- */
fun void mandBodySize (float b_value)
{
    for ( 0=>int k; k< mand.cap();k++ ) b_value => mand[k].bodySize;
}

mandBodySize (0.555);

/* ---------------------------- */
fun void mandStringDamping (float d_value)
{
    for ( 0=>int k; k< mand.cap();k++ ) d_value => mand[k].stringDamping;
}

mandStringDamping(0.2);


/* ---------------------------- */
fun void mandFreq (float f_value [])
{
    for ( 0=>int k; k< mand.cap();k++ ) f_value[k] => mand[k].freq;
}


/* ---------------------------- */
fun void mandRandomPluckPos ()
{
    for ( 0=>int k; k< mand.cap();k++ ) Math.random2f(0.1,0.5) => mand[k].pluckPos;
}


/* ---------------------------- */
fun void mandRandomPluck (float p_value)
{
    for ( 0 => int k; k< mand.cap();k++ ) Math.random2f(p_value - 0.1,p_value + 0.1) => mand[k].pluck;
}


fun void PlayMand(int chordIDX [], dur OverallInterval)
{
    float freqs [chordIDX.cap()];
    int   AllIntervals [chordIDX.cap()];
    float f_group1[4];
    float f_group2[4];
    
    dur StrumTime;
    int j;
    
    int StrumCount;
    
    13 => StrumCount;
    
    OverallInterval / StrumCount => StrumTime;
    mandRandomPluckPos();
    
    // try to spread into octaves if notes are bunched together
    NT.computeScaleIntervals(chordIDX) @=> AllIntervals;
    for (1=>j; j<AllIntervals.cap()-1; j++ )
    {
        if(AllIntervals[j] < 4) 
        {
            8 +=> chordIDX[j];
            j++;
        }
    }
    
    // convert the note incidence array into frequencies
    for (0=> j; j < chordIDX.cap();j++) Std.mtof(TN.XS[chordIDX[j]]) => freqs[j];
    
    // make two possible chords to play
    for (0=> j; j < f_group1.cap();j++) freqs[j] => f_group1[j];
    for (0=> j; j < f_group2.cap();j++) freqs[j+5] => f_group2[j];
    

    
    for (0=> j; j< StrumCount;j++ )
    {
        if(j % 3 == 0) mandFreq(f_group2);
        else  mandFreq(f_group1);
        
        Math.random2f(0.2,0.4) => mandGain;
        mandRandomPluck (0.4);
        if(j % 3 == 0) BPM.T8 =>now;
        else  BPM.T6 =>now;
    }
}

// Play out of the tree but don't spork the mandolin
fun void PlayTreeXA ()
{
    NT.TreeTopDown(TN.MT0D5A,1) @=> MM; 
    [BPM.T6,BPM.T6,BPM.T8,BPM.T8,BPM.T8] @=> RR;
    

    NT.AppendArray (MM, NT.TreeTopDown(TN.MT0D5A,1))@=> MM;
    NT.AppendArray1 (RR, [BPM.T6,BPM.T6,BPM.T8,BPM.T8,BPM.T8])@=> RR;

    NT.TreeTopDown(TN.offsetTree2,1) @=> OO;
     
    for(0=> int i; i<OO.cap();i++) MM[MM.cap()-1] +=> OO[i];   
    NT.AppendArray (MM, OO)@=> MM;
    NT.AppendArray1 (RR, [BPM.T3,BPM.T3,BPM.T3])@=> RR;

    // add all of the notes of the melody into the note memory 
    for(0=>i;i < MM.cap();i++) CQ.SlurpClean(MM[i]);
    <<<"There were ", i-1, "notes in the melody.">>>;

    // play out the sawtooth melody
    for(0=>i;i <RR.cap();i++) 
    {
        Math.random2f(-0.5,0.5) => pan_sw01.pan;
        sw.Play( TN.XS [ MM [ i ] ] );
        RR[i] => now;
    }
    BPM.T3 => now; 3.0*BPM.T8 => now;
}

// crawl through tree B then tree A then trill with offset tree 2
fun void PlayTreeA ()
{
    NT.TreeTopDown(TN.MT0D5B,1) @=> MM; 
    [BPM.T6,BPM.T6,BPM.T8,BPM.T8,BPM.T8] @=> RR;
    

    NT.AppendArray (MM, NT.TreeTopDown(TN.MT0D5A,1))@=> MM;
    NT.AppendArray1 (RR, [BPM.T6,BPM.T6,BPM.T8,BPM.T8,BPM.T8])@=> RR;

    NT.TreeTopDown(TN.offsetTree2,1) @=> OO;
     
    for(0=> int i; i<OO.cap();i++) MM[MM.cap()-1] +=> OO[i];   
    NT.AppendArray (MM, OO)@=> MM;
    NT.AppendArray1 (RR, [BPM.T3,BPM.T3,BPM.T3])@=> RR;

    // add all of the notes of the melody into the note memory 
    for(0=>i;i < MM.cap();i++) CQ.SlurpClean(MM[i]);
    <<<"There were ", i-1, "notes in the melody.">>>;

    // play the background mandolin with a spork
    // the CQ object provides the note memory
    spork ~ PlayMand(CQ.Squeeze(),tempo.AddUp(RR));

    // play out the sawtooth melody
    for(0=>i;i <RR.cap();i++) 
    {
        Math.random2f(-0.5,0.5) => pan_sw01.pan;
        sw.Play( TN.XS [ MM [ i ] ] );
        RR[i] => now;
    }
    BPM.T3 => now; 3.0*BPM.T8 => now;
}

// crawl through tree B then tree B then trill with offset tree 1
fun void PlayTreeB ()
{
    NT.TreeTopDown(TN.MT0D5B,1) @=> MM; 
    [BPM.T6,BPM.T6,BPM.T8,BPM.T8,BPM.T8] @=> RR;
    

    NT.AppendArray (MM, NT.TreeTopDown(TN.MT0D5B,1))@=> MM;
    NT.AppendArray1 (RR, [BPM.T6,BPM.T6,BPM.T8,BPM.T8,BPM.T8])@=> RR;

    NT.TreeTopDown(TN.offsetTree1,1) @=> OO;
     
    for(0=> int i; i<OO.cap();i++) MM[MM.cap()-1] +=> OO[i];   
    NT.AppendArray (MM, OO)@=> MM;
    NT.AppendArray1 (RR, [BPM.T3,BPM.T3,BPM.T3])@=> RR;

    // add all of the notes of the melody into the note memory 
    for(0=>i;i < MM.cap();i++) CQ.SlurpClean(MM[i]);
    <<<"There were ", i-1, "notes in the melody.">>>;

    // play the background mandolin with a spork
    // the CQ object provides the note memory
    spork ~ PlayMand(CQ.Squeeze(),tempo.AddUp(RR));

    // play out the sawtooth melody
    for(0=>i;i <RR.cap();i++) 
    {
        Math.random2f(-0.5,0.5) => pan_sw01.pan;
        sw.Play( TN.XS [ MM [ i ] ] );
        RR[i] => now;
    }
        BPM.T3 => now; 3.0*BPM.T8 => now;
}


PlayTreeXA ();

while(!ShredControl.StopSolo)
     // while(1)
{

if (!ShredControl.StopSolo) PlayTreeA ();
if (!ShredControl.StopSolo) PlayTreeB ();
    

}

2.0::second => now;

