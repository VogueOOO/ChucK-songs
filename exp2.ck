

" N=G4 D=R8 " => string test;





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


<<<test.find("S=")>>>;
<<< FindToken(test, "N=") >>>;
