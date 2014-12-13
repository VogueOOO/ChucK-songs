

// organ.ck
// name : 
/*
Since we are playing the white keys at the start it seems appropriate that a lot of 
finger nail glissandos are in order. Start out with organ[0] as having a few types, such as
up, down, etc. Then organ[0], organ[1] can have some in phase glissandos and out of phase 
glissandos... Finally, allocate more voices in case some cool organ riffs are needed. 
*/


int note_counter;


6 => int n_keys;  // number of organ voices

BeeThree organ [n_keys];
Pan2 pan[n_keys];
NRev the_reverb;
Gain g;

int i;

for(0 => i ; i < organ.cap(); i++ )
{
    organ[i] => g => the_reverb => pan[i] => dac;
    0.1 => organ[i].gain;
}

-0.3 => pan[2].pan;   
-0.1 => pan[1].pan; 
  0. => pan[0].pan; 
  0. => pan[5].pan; 
 0.1 => pan[3].pan; 
 0.3 => pan[4].pan; 

0.3 => the_reverb.mix;
0.2 => g.gain;


//  organ riffs


fun void sweep_up_effect(int first_note, int note_count)
{
    int i;

    for(0=>i;i < note_count;i++)
    {
        Std.mtof(TN.theScale[first_note+i])/1. => organ[0].freq;
        0.4 => organ[0].noteOn;
        0.05::second => now;
    }
    0.5 => organ[0].noteOff;

}

fun void sweep_up_multi(int times) { for(0=>int i;i<times;i++) sweep_up_effect(Math.random2(0,3),12); me.exit(); }



fun void sweep_down_effect(int first_note)
{
    int i;

    for(first_note => i;i >= 0 ;i--)
    {
        Std.mtof(TN.theScale[i])/1. => organ[0].freq;
        0.4 => organ[0].noteOn;
        0.020::second => now;
    }
    0.5 => organ[0].noteOff;

}

fun void sweep_down_multi(int times) { for(0=> int i;i<times;i++) sweep_down_effect(Math.random2(8,TN.theScale.cap()-1 )); me.exit(); }


fun void organ_notes_on () { for(0=> int i;i<organ.cap();i++) Math.random2f(0.2,0.4) => organ[i].noteOn; }

fun void organ_notes_off () { for(0=>int i;i<organ.cap();i++) Math.random2f(0.2,0.4) => organ[i].noteOff;}


fun void C_chord()
{
    int i;
    
    Std.mtof(TN.theScale[0]) => organ[1].freq;
    Std.mtof(TN.theScale[2]) => organ[2].freq;
    Std.mtof(TN.theScale[4]) => organ[3].freq;
    Std.mtof(TN.theScale[8]) => organ[4].freq;  
    Std.mtof(TN.theScale[10]) => organ[5].freq;    
 
    organ_notes_on();    BPM.R4 => now;
    organ_notes_off();   BPM.R8 => now;

    organ_notes_on();    BPM.T6 => now;   
    organ_notes_off();   BPM.T6 => now; 

    organ_notes_on();    BPM.T6 => now;   
    organ_notes_off();   BPM.T6 => now; 

    organ_notes_on();    BPM.T6 => now;   
    organ_notes_off();   BPM.T6 => now;
    
    me.exit(); 
}




fun void F_chord()
{
    int i;
    
    Std.mtof(TN.theScale[3]) => organ[1].freq;
    Std.mtof(TN.theScale[5]) => organ[2].freq;
    Std.mtof(TN.theScale[7]) => organ[3].freq;
    Std.mtof(TN.theScale[12]) => organ[4].freq;
    Std.mtof(TN.theScale[15]) => organ[5].freq;    
       
    organ_notes_on();    BPM.R8 => now;
    organ_notes_off();   BPM.R8 => now; 

    organ_notes_on();    BPM.R8 => now;
    organ_notes_off();   BPM.R8 => now; 

    organ_notes_on();    BPM.R8 => now;   
    organ_notes_off();   BPM.R8 => now;
    
    me.exit(); 
}

// begin to make sound

while (note_counter < 34)  {
    
   if(note_counter%14 == 0) {spork ~ sweep_up_multi(Math.random2(8,12));}
   else if(note_counter%12 == 0) {spork ~ C_chord();}
   else if(note_counter%10 == 0) {spork ~ C_chord();}
   else if(note_counter%7 == 0) {spork ~ sweep_up_multi(Math.random2(5,8));}
   else if(note_counter%5 == 0) {spork ~ F_chord();}
   else if(note_counter%4 == 0) {spork ~ sweep_down_multi(Math.random2(5,8));}    
   
   BPM.R4 => now; 
   note_counter++;

   
}  

   2.0 * BPM.R4 => now;  // let the reverb ring a little

   1 => ShredControl.OrganDone;  // indicate through global that part is finished.
