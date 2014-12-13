// drums.ck
// Insert the title of your piece here


float drum_run [16] [12]; // 

0 => int note_counter;


fun void add_drum_run (float  drum_run[][], int row_number , float new_run[])
{
    for( 0 => int i; i<new_run.cap();i++) new_run[i] => drum_run[row_number][i];
}

// this is one measure of 4/4


add_drum_run(drum_run, 0,   [0.00, 0.00, 0.00, 0.00, 10.1, 0.00, 10.2, 0.00, 10.1, 0.00, 0.00, 0.00]  );  
add_drum_run(drum_run, 1,   [10.2, 0.00, 10.2, 0.15, 10.2, 0.00, 10.2, 0.00, 0.05, 0.00, 10.1, 0.00]  );  
add_drum_run(drum_run, 2,   [0.00, 0.12, 0.00, 0.16, 0.00, 0.18, 0.00, 0.20, 0.00, 0.00, 0.00, 0.00]  );  
add_drum_run(drum_run, 3,   [0.00, 10.2, 0.05, 0.00, 10.2, 0.00, 10.2, 0.00, 10.2, 0.00, 0.00, 10.1]  );  
add_drum_run(drum_run, 4,   [0.05, 0.00, 0.05, 0.00, 0.05, 0.00, 0.00, 0.00, 0.00, 0.05, 0.00, 0.00]  );  
add_drum_run(drum_run, 5,   [0.10, 0.00, 0.14, 0.00, 0.10, 0.00, 10.2, 0.00, 0.00, 0.00, 0.00, 0.00]  );  
add_drum_run(drum_run, 6,   [0.25, 0.00, 0.00, 0.00, 0.00, 10.6, 0.00, 0.00, 0.25, 0.00, 0.00, 0.00]  );  
add_drum_run(drum_run, 7,   [0.00, 10.2, 0.00, 10.2, 0.00, 10.2, 0.00, 0.00, 0.00, 10.2, 0.00, 0.00]  );  
add_drum_run(drum_run, 8,   [10.1, 0.00, 10.1, 0.00, 10.1, 0.00, 10.1, 0.00, 10.1, 0.00, 10.1, 0.00]  );  
add_drum_run(drum_run, 9,   [0.00, 0.00, 10.2, 0.00, 0.00, 10.2, 0.00, 0.00, 10.2, 0.00, 0.00, 10.2]  );  
add_drum_run(drum_run, 10,  [0.20, 0.00, 0.20, 0.15, 0.10, 0.00, 0.05, 0.00, 0.00, 0.00, 0.00, 0.00]  );  
add_drum_run(drum_run, 11,  [10.2, 0.00, 0.00, 10.2, 0.00, 0.00, 10.2, 0.00, 10.2, 0.05, 0.00, 0.00]  );  
add_drum_run(drum_run, 12,  [0.00, 0.00, 0.30, 0.00, 0.00, 0.25, 0.00, 0.00, 0.20, 0.00, 10.1, 0.00]  );  
add_drum_run(drum_run, 13,  [0.20, 0.00, 0.00, 0.00, 0.20, 0.00, 0.00, 0.00, 0.20, 0.00, 0.00, 0.00]  );  
add_drum_run(drum_run, 14,  [0.00, 10.2, 0.00, 10.2, 0.00, 10.2, 0.00, 10.2, 0.00, 0.00, 0.00, 0.00]  );  
add_drum_run(drum_run, 15,  [0.00, 0.00, 10.2, 0.00, 0.00, 10.2, 0.00, 0.00, 0.00, 0.00, 10.1, 0.00]  );//
/* */



   
// Part of your composition goes here
 // directory above this file
me.dir(-1) => string path;
string filename, filename1;   

//////////
SndBuf hihat_01 => NRev hihat_01_verb => Pan2 pan_hihat_01 => dac;
"/audio/hihat_01.wav" => filename;
path + filename => filename1;
filename1 => hihat_01.read;
0.15 => hihat_01.gain;
hihat_01.samples()=> hihat_01.pos;
-0.2 => pan_hihat_01.pan;
0.1 => hihat_01_verb.mix;


//////////
SndBuf snare_01 => NRev snare_01_verb => Pan2 pan_snare_01 => dac;
"/audio/snare_01.wav" => filename;
path + filename => filename1;
filename1 => snare_01.read;
0.0 => snare_01.gain;
snare_01.samples()=> snare_01.pos;
0.2 => pan_snare_01.pan;

0.04 => snare_01_verb.mix;


//////////
SndBuf snare_02 => NRev snare_02_verb => Pan2 pan_snare_02 => dac;
"/audio/snare_02.wav" => filename;
path + filename => filename1;
filename1 => snare_02.read;
0.0 => snare_02.gain;
snare_02.samples()=> snare_02.pos;
0.2 => pan_snare_02.pan;

0.04 => snare_02_verb.mix;


//////////
SndBuf kick_03 => Pan2 pan_kick_03 => dac;
"/audio/kick_03.wav" => filename;
path + filename => filename1;
filename1 => kick_03.read;
0.0 => kick_03.gain;


/* ------------------------------------------------ */
ModalBar xphone[2];
Gain xphone_gain;
Pan2 xphone_pan;
Dyno dy;

// all voices use the xylophone preset
for(0=>int i;i<xphone.cap();i++) 1 => xphone[i].preset;
    

xphone[0] => xphone_gain => dy => xphone_pan => dac;
xphone[1] => DelayL d1 => xphone_gain => dy => xphone_pan => dac;


0.333 => xphone[0].strikePosition;
0.666 => xphone[1].strikePosition;

0.2::second => d1.max;
0.001::second => d1.delay;

0.35 => xphone_gain.gain;


dy.limit();      // turn on limiter for the xylophone
0.3 => dy.gain;


//play xphone in the high register
fun void x_effect1(int times)
{
    float base_note;
    Math.random2f(0.005, 0.05)::second => d1.delay;  
    
    for(0=>int i;i<times;i++){
    Std.mtof(TN.CchordScale[Math.random2(0, TN.CchordScale.cap()-1)]) => base_note;
    
    base_note =>xphone[0].freq;
    base_note*3. =>xphone[1].freq;
    

    Math.random2f(0.1,0.20) => xphone[0].noteOn;
    Math.random2f(0.1,0.20) => xphone[1].noteOn;
    Math.random2f(-0.2,0.20) => xphone_pan.pan;
    BPM.T8 => now;  
    }
    me.exit();
}


/* ------------------------------------------------ */

0 => int  incidence_of_snare;


fun void play_tuned_drum(float td_amplitude, float pan_pos, int note_number) 
{
    td_amplitude => snare_02.gain;
    pan_pos => pan_snare_02.pan;
    TN.rr[note_number] => snare_02.rate;
    0=> snare_02.pos;
}


fun void play_snare_01(float drum_run[][], int row_number, int snare_mod)
{
    float drum_token;
    0 => int snare_count;
    while ( snare_count < 8)
    {
        drum_run[row_number][snare_count] => drum_token;
        
        if(( drum_token > 0.00) && ( drum_token < 1.00) && (incidence_of_snare%snare_mod == 0)) 
        {
            drum_token => snare_01.gain;
            0 => snare_01.pos;
        }
        else if (( drum_token >= 4.00) && ( drum_token < 5.00)) { play_tuned_drum(drum_token-4.,-0.2,18); }
        else if (( drum_token >= 5.00) && ( drum_token < 6.00)) { play_tuned_drum(drum_token-5.,-0.1,13); }
        else if (( drum_token >= 6.00) && ( drum_token < 7.00)) { play_tuned_drum(drum_token-6.,-0.0,8); }
        else if (( drum_token >= 7.00) && ( drum_token < 8.00)) { play_tuned_drum(drum_token-7.,-0.1,5); }
        else if (( drum_token >= 8.00) && ( drum_token < 9.00)) { play_tuned_drum(drum_token-8.,-0.2,0); }
        else if (( drum_token >= 10.0) && ( drum_token < 11.0)) { spork ~  x_effect1(((drum_token -10) * 10) $ int);}
        else     {snare_01.samples()=> snare_01.pos;}
        snare_count++;
        BPM.T3 => now;    
    }
 
}

22 => int first_drum_change;
26 => int add_bass;
30 => int second_drum_change;


fun void play_hihat_01()
{
    0 => int hihat_01_count;
    0.2 => hihat_01.gain;    
    while ( !ShredControl.StopForFinale )
    {
        if ( hihat_01_count % 2 == 0)
        {
            0 => hihat_01.pos;
            BPM.R4 => now;
        }    
        else if(note_counter < first_drum_change)
        {
            // 0 => hihat_01.pos;
            BPM.T8 => now;
            0 => hihat_01.pos;BPM.T8 => now;
            // 0 => hihat_01.pos;
            BPM.T8 => now;            
        }        
         else
        {
            0 => hihat_01.pos;
            BPM.T8 => now; BPM.T8 => now;
            0 => hihat_01.pos;
            BPM.T8 => now;            
        }
        hihat_01_count++;
    }
}

fun void play_kick_03()
{
    0 => int kick_01_count;
    0.2 => kick_03.gain;
    while ( !ShredControl.StopForFinale )
    {
        if ( kick_01_count % 2 == 0) 0 => kick_03.pos;
        kick_01_count++;
        BPM.R8 => now;
    }
}


int snare_density;  // inverse density, the number is just modulus of how often to 
//play the drum run, so 4 is every fourth beat and 1 is every beat

3=>snare_density;

// begin to make sound.

  now => time startTime;

  6.0*BPM.R4 => now;  //pause at the start

  play_snare_01(drum_run,11,1);
  BPM.T8 => now;  

  // spork the hihat shred and save a reference to it
  spork ~ play_hihat_01() @=> Shred HiHatShred;  
  BPM.T8 => now;  


  spork ~ play_kick_03();
  BPM.R4 => now;





// key off the end of the organ bit
while(!ShredControl.OrganDone){
  
  spork ~ play_snare_01(drum_run,  Math.random2(0,15), snare_density);
  incidence_of_snare++;
    
  BPM.R4 => now;
  note_counter++; 
}

// change out some of the precussion

      <<<"first drum change">>>;
      add_drum_run(drum_run, 0,   [0.00, 8.30, 0.00, 0.00, 7.25, 0.00, 0.00, 6.20, 0.00, 0.00, 0.00, 0.00]  );  
      add_drum_run(drum_run, 1,   [0.25, 0.22, 0.15, 8.30, 0.00, 0.00, 8.30, 0.00, 0.00, 8.30, 0.00, 0.00]  ); 
      add_drum_run(drum_run, 8,   [0.00, 0.00, 0.25, 0.00, 0.00, 0.28, 0.00, 0.00, 0.30, 0.00, 0.25, 0.00]  );  
      add_drum_run(drum_run, 11,  [0.20, 0.18, 0.16, 0.14, 0.12, 0.10, 0.00, 0.10, 0.00, 0.10, 0.00, 0.10]  ); 
      add_drum_run(drum_run, 12,  [0.00, 0.00, 0.30, 0.00, 0.25, 0.30, 0.00, 0.25, 0.30, 0.00, 0.25, 0.30]  ); 
      2=>snare_density;

   ShredControl.shreds_to_kill << Machine.add(me.dir()+"/bass.ck");


    8.0 * BPM.T8 => now;

    // kill the hihat shred
    HiHatShred.exit();
    ShredControl.shreds_to_kill << Machine.add(me.dir()+"/solo_instruments.ck");

while(!ShredControl.StopForFinale){
  
  spork ~ play_snare_01(drum_run,  Math.random2(0,15), snare_density);
  incidence_of_snare++;
    
  BPM.R4 => now;
  note_counter++; 

    

      
  if (note_counter == second_drum_change)
  {
      <<<"second drum change">>>;
    add_drum_run(drum_run, 0,   [8.30, 0.00, 0.00, 7.25, 0.00, 0.00, 6.20, 0.00, 0.00, 0.00, 0.00, 0.00]  );   
    add_drum_run(drum_run, 1,   [4.25, 0.00, 0.00, 5.22, 0.00, 0.00, 6.15, 0.00, 0.00, 7.30, 0.00, 0.00]  );  
    add_drum_run(drum_run, 2,   [8.10, 0.00, 0.00, 8.16, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00]  );  
    add_drum_run(drum_run, 3,   [0.00, 0.00, 5.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5.50, 0.00, 0.00]  );  
    add_drum_run(drum_run, 4,   [0.15, 0.00, 0.20, 0.00, 0.25, 0.00, 0.00, 0.00, 0.35, 0.00, 0.00, 0.00]  );  
    add_drum_run(drum_run, 5,   [0.10, 0.00, 0.14, 0.00, 0.00, 0.00, 0.20, 0.00, 0.00, 0.00, 0.00, 0.00]  );  
    add_drum_run(drum_run, 6,   [0.25, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.05, 0.00, 0.05]  );  
    add_drum_run(drum_run, 7,   [0.00, 0.00, 0.00, 0.00, 0.12, 0.00, 0.10, 0.00, 0.05, 0.05, 0.00, 0.05]  );  
    add_drum_run(drum_run, 8,   [0.20, 0.00, 4.20, 0.00, 4.25, 0.00, 4.20, 0.00, 7.50, 0.00, 7.40, 0.00]  );  
    add_drum_run(drum_run, 9,   [0.00, 0.00, 2.00, 0.00, 0.00, 2.00, 0.00, 0.00, 2.00, 0.00, 0.00, 2.00]  );  
    add_drum_run(drum_run, 10,  [0.20, 0.00, 0.00, 0.15, 0.00, 0.00, 0.05, 0.00, 0.00, 0.00, 0.00, 0.00]  );  
    add_drum_run(drum_run, 11,  [2.40, 0.00, 0.00, 2.30, 0.00, 0.00, 2.20, 0.00, 2.10, 0.00, 0.00, 0.00]  );  
    add_drum_run(drum_run, 12,  [0.00, 0.00, 0.30, 0.00, 0.25, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00]  );  
    add_drum_run(drum_run, 13,  [0.20, 0.00, 0.00, 0.00, 0.20, 0.00, 0.00, 0.00, 0.20, 0.00, 0.00, 0.00]  );  
    add_drum_run(drum_run, 14,  [0.00, 0.00, 0.00, 7.25, 0.00, 0.00, 6.20, 0.00, 0.00, 0.00, 0.00, 0.00]  );  
    add_drum_run(drum_run, 15,  [0.16, 0.00, 0.00, 0.14, 0.00, 0.00, 0.12, 0.00, 0.00, 0.00, 0.00, 0.00]  );//
      3=>snare_density;
  }      
    
}

  BPM.T3 => now;

play_snare_01(drum_run,8,1);
play_snare_01(drum_run,8,1);
  BPM.T8 => now;

play_snare_01(drum_run,8,1);
play_snare_01(drum_run,8,1);
  BPM.R4 => now;


ShredControl.shreds_to_kill << Machine.add(me.dir()+"/gone.ck");

