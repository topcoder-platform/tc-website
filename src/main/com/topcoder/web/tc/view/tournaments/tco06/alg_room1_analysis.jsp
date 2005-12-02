<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="summary"/>
<jsp:param name="tabLev3" value="room1"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">
            
<div class="leadPhoto">
<p align="center"><span class="bodyText" align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco06&d3=photos">See more photos!</a></span></p>
<img src="/i/tournament/tco06/onsite_photos/shot_room1.jpg" alt="" class="photoFrameBig" /><br>
</div>

<p>
<span class="bigTitle">ploh wins Room 1</span>
<br><br>
<img src="/i/m/FogleBird_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/>
<tc-webtag:forumLink forumID="505776" message="Discuss this match" /><br>
Thursday, October 13, 2006<br>
Introduction by <tc-webtag:handle coderId="160049" context="algorithm"/>
<br><br><br>
The Room 1 results are finally in at 9PM PST here at the 2006 TopCoder Open finals.  The backup problem set used proved to be rather difficult, as only five of the twelve 250-point submissions ended up passing system tests.  The coders struggled with timeout issues and the fastest submission scored a relatively low 171.24.  Fortunately for some, the 500-point problem proved slightly easier, as seven of the finalists submitted solutions that eventually passed the system tests.  Petr was the only competitor to submit a solution to the 1000-point problem, just before the coding phase ended.  The challenge phase included a good amount of action and four submissions were brought down.  In the end, ploh and Petr came out on top with scores of 400.43 and 390.96, respectively.  Congratulations to them for making it to the final championship round!  HilbertRaum, marek.cygan, lars, and HiltonLange will get a second chance in tomorrow's wildcard round at 8AM PST.
</p>

<h1>WordGrid</h1>
by <tc-webtag:handle coderId="310430" context="algorithm"/>
<br><br>
Since we have only up to 3 unknown letters, one may be tempted to
try all 26<sup>3</sup> combinations, and brute force each of them,
until a solution is found. But brute forcing the word search problem
may be slow in a 50 x 50 grid with up to 50 words, so we have to do
do the actual word search before trying the letter combinations.

<p>
For each word in the given word list we try to locate this in the
given grid (without using any periods '.') - this can be done
simply by brute force checking all possible starting positions
and directions. If it is found, we can remove this word from the
list, since it does not affect the result (whatever letters we place
at the positions of the periods, we can always find this word in the
grid). If a word is not found, we repeat the word search procedure
(checking all possible starting positions and directions), but now
regarding the periods as wildcards. We make a list of all possible
period-letter combinations found that allow the word to be found in
the grid. For this, it is convenient to enumerate the periods in
the grid, and to store a three-letter string for every placement
we found (e.g. in the form <code>"X.Y"</code>, which would mean that if we
replace the first period with 'X' and the third with 'Y', we
can find the word in the grid independent of how we replace the
second period). It is convenient to create in such a way a <code>Set</code>
of strings for each word in the given word list, so that we avoid
duplicates.
</p>
<p>
After this preprocessing we have several options for solving the problem.
Let's say we have an array <code>Set[] letters</code> with

<code>letters[i]</code> containing three-letter combinations as described
above (including '.' for wildcards), that allow the word <code>words[i]</code>
from the given word list to be found in the grid.
</p>
<p>
A simple solution is to iterate over all 26<sup>3</sup> three-letter
combinations and check for each of them if all <code>letters[i]</code>
contains at least one string that is consistent with the current
three-letter-string we are checking. In Java (with some pseudo-code)
this would look like:
</p>
<pre>

Iterate String test from "AAA" to "ZZZ" {
    boolean solution = true;
    for (int i = 0; i < letters.length; i++) {
        boolean found = false;
        for (int j = 0; j < letters[i].size(); j++) {
            if (test.matches(letters[i].get(j)) {
                found = true;
                break;
            }
        }
        if (found == false) {
            solution = false;
            break;
        }
    }
    if (solution == true) {
        // test represents the solution
        Replace first period in grid with test.charAt(0);
        Replace second period in grid with test.charAt(1);
        Replace third period in grid with test.charAt(2);
        return grid;
    }
}
</pre>
<p>
Alternatively we can use backtracking, starting with iterating over
the strings of <code>letters[0]</code>. For each such string, try
to find strings in <code>letters[1]</code> that are consistent with
the current string, iterate over them extending the string accordingly,
and continue similarly with <code>letters[2]</code> etc. until a solution
is found or for some <code>letters[i]</code> there is no consistent
string included, in which case we backtrack to the next string of the previous
step:

</p>
<pre>
String backtrack(String test, int position) {
    if (position == letters.length) {
        return test;
    }
    for (int i = 0; i < letters[i].size(); i++) {
        if (consistent(test, letters[i])) {
            backtrack(combine(test, letters[i]), position + 1);
        }
    }
}
</pre>
<p>
In the above, <code>consistent(s1, s2)</code> checks if two strings
with periods used as wildcards are consistent - i.e., at each position
the two strings either have the same letter or at least one of the strings
has a wildcard ('.'). <code>combine(s1, s2)</code> returns a string
that is a combination of the two given strings - i.e., the return value
is the string s1, with all wildcards ('.') replaced by the character at
the corresponding position of s2.
</p>
<p>
Of course, if we have less than 3 periods in the original grid, we can
also use smaller strings in the above procedures.
</p>

<p>
After we have found the period-letter mappings (e.g. the return
value in the above backtracking implementation - after an initial
call <code>backtrack("...", 0)</code>), we simply have to replace
the periods in the grid with the letters in the corresponding positions
of the returned string, and return the updated grid.
</p>

<h1>BinaryBoard</h1>
by <tc-webtag:handle coderId="310430" context="algorithm"/>
<br><br>
It is clear that we can not brute force this problem trying
all possible 2<sup>36</sup> boards. We have to use backtracking,
by filling the positions in the board in some clever order.
<p>
Let's start by filling in only the first row and first column.
With this we have at least the first bit of all 12 numbers.
We can now check this bit, if it is consistent with the given
ordering (for this we must have
firstBit(order[0]) <= firstBit(order[1]) <= firstBit(order[2])
<= ... <= firstBit(order[11])). This allows for up to
13 combinations for the first row and first column in the
worst case (instead of 2<sup>11</sup>). For each combination
that is consistent with the given ordering, we go on with the
second bit of all rows/columns, and check that
firstTwoBits(order[0]) <= firstTwoBits(order[1]) <= ...
<= firstTwoBits(order[11]). In the worst case, 5 of the
first bits in rows/columns H2-H6, V2-V6 are 0 and the other
5 are 1, which allow for the second bits up to 6 * 6 = 36
combinations (instead of 2<sup>9</sup>). We continue with
the rest of the bits using the same procedure, until we
reach the last bit, where we finally check if the board
we have built up is a solution to the problem. If yes,
we return this (since the constraints guarantee that there
is only one solution), otherwise we continue with the
backtracking.

</p>
<p>
In pseudocode:
</p>
<pre>
backtracking(int bitnumber) {
    if (bitnumber == 7) {
        // we have set all bits 1-6 of all numbers, check that they conform to the ordering
        if (number(order[0]) < number(order[1]) < number(order[2]) < ... < number(order[11])) {
            Return the solution found, abort the backtracking.
        }
        return; // no solution found yet, jump to the previous backtracking step
    }
    Iterate over all values for the bitnumber-th bit of the 12 numbers H1-H6, V1-V6 {
        // (ignore in the iteration bits that have already been assigned a value,
        //  e.g. when we set the first bit of V2 when calling backtracking(1), this
        //  is also the second bit of H1, so we don't need to reset it during the
        //  call to backtracking(2)).

        if (first-bitnumber-bits(order[0]) <= first-bitnumber-bits(order[1]) <= ... <= first-bitnumber-bits(order[11])) {
            backtracking(bitnumber + 1);
        }
    }
}
</pre>
<p>
Here, <code>first-bitnumber-bits(order[i])</code> is the number represented
by the first <code>bitnumber</code> bits of the row/column
specified by <code>order[i]</code>,

<code>number(order[i])</code> is the number represented by all bits of the
row/column specified by <code>order[i]</code>.
</p>

<h1>SackJourney</h1>
by <tc-webtag:handle coderId="251317" context="algorithm"/>
<br><br>
The infinite sack described in this problem is really an infinite stack.  Translated into the
language of automata theory, this problem asks which states are reachable in a PDA (pushdown
automaton).  To solve the problem, we incrementally build a reachability graph.  A directed edge
from p to q in this graph indicates the ability to travel from p to q without changing the stack
configuration.  Edges of the form "__" can immediately be added to this graph, since they do not
involve the stack.  Furthermore, if you can get from location x to location s while adding A to your
sack, and you can get from location t to location y by removing A from your sack, then a
reachability edge from s to t implies a reachability edge from x to y.  Lastly, the reachability
graph should be transitive.  In other words, an edge from p to q and an edge from q to r yields an
edge from p to r.  Repeating these steps until no more changes can be made, we can determine which
locations are reachable from 0 without changing the stack.  <br>
<br>
To check if a specific location k is
reachable, add a new location k' to the graph.  In addition, add an edge of the form "__" from k to
k'.  Lastly, add loops to k' permitting the removal of all types of elements from the sack.  The
previously described algorithm will determine whether there is a path from 0 to k' resulting in an empty sack.
This is equivalent to being able to reach k.

        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
