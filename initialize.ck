// initialize.ck
// name : 
// SOMETHING HERE NEXT WEEK!
// Add all classes here!

// our conductor/beat-timer class
Machine.add(me.dir()+"/BPM.ck");

// The NoteMemory class is used to backup the solo instrument
<<<"Add note memory">>>;
Machine.add(me.dir()+"/note_memory.ck");

// various modes and scales are defined here
<<<"Add tonality">>>;
Machine.add(me.dir()+"/tonality.ck");

// MachineAdd is used in other files so this collects the shred ID numbers
<<<"Add shred control">>>;
Machine.add(me.dir()+"/ShredControl.ck");

// a solo instrument
Machine.add(me.dir()+"/Saw01.ck");

// The score
Machine.add(me.dir()+"/score.ck");


