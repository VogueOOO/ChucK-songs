// score.ck
// name : 
/*



*/

dur temp, overall_length;

53::second => overall_length;


BPM tempo;         // instantiate BPM static variables
tempo.tempo(96.0);

TN tonality;       // instantiate tonality

ShredControl CTRL; // instantiate shred control


// begin to make sound
  now => time startTime; // Used to measure the length of the composition

CTRL.shreds_to_kill << Machine.add(me.dir()+"/organ.ck");
// CTRL.shreds_to_kill << Machine.add(me.dir()+"/solo_instruments.ck");
CTRL.shreds_to_kill << Machine.add(me.dir()+"/drums_triple.ck");


overall_length => now;
1 => ShredControl.StopSolo;
2::second => now;
1 => ShredControl.StopForFinale;
5::second => now;

CTRL.RemoveShreds (); // remove every file added with MachineAdd

<<< "Composition length: ", (now - startTime) / second >>>;