<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
 <xsl:import href="../top.xsl"/>
 <xsl:import href="../script.xsl"/>
 <xsl:import href="../includes/body_top.xsl"/>
 <xsl:import href="../foot.xsl"/>
 <xsl:import href="../includes/modules/srm_results.xsl"/>
 <xsl:import href="../includes/modules/white_last_srm.xsl"/>
 <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
 <xsl:import href="../includes/modules/coder_week2.xsl"/>
 <xsl:import href="../includes/modules/practice_room.xsl"/>
 <xsl:import href="../includes/modules/calendar.xsl"/>
 <xsl:import href="../includes/modules/top_room_wins.xsl"/>
 <xsl:import href="../includes/global_left.xsl"/>
 <xsl:import href="../includes/public_right_col.xsl"/>
 <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
 <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>

<title>Single Round Match 198 Statistics at TopCoder</title>

<xsl:call-template name="CSS"/>

<script>
function openWin(url, name, w, h) {
 win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
 win.location.href = url;
 win.focus();
}
</script>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">

<!-- Left Column Begins -->
     <td width="170" bgcolor="#FFFFFF">
         <xsl:call-template name="global_left"/>
     </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
     <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
     <td class="bodyText" width="100%">
         <xsl:call-template name="BodyTop">
             <xsl:with-param name="image1">white</xsl:with-param>
             <xsl:with-param name="image">statisticsw</xsl:with-param>
             <xsl:with-param name="title">Last Match Editorials</xsl:with-param>
         </xsl:call-template>

         <table border="0" cellspacing="10" cellpadding="0" width="100%">
         <tr valign="top">
                 <td class="bodyText" width="100%">

<!--body contextual links-->
                     <table width="100%" border="0" cellspacing="0" cellpadding="3">
                         <tr valign="middle">
                             <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 198</font></td>
                             <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                         </tr>

                         <tr valign="middle">
                             <td class="bodyText">Saturday, June 12, 2004</td>
                             <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                         </tr>
                     </table>
<!--end contextual links-->

<h2>Match summary</h2>
<p>
Well, SRM198 was an easy one for Division-II and a hard one for Division-I.
The first two problems in Division-I went quickly, with 13 coders submitting
both only 30 minutes into the match. But with all that time left, no one was 
able to come up with a working solution to the 1200, although pparys and Yarin were "only one bug away". nicka81 and Yarin had very similar performances with nearly identical scores on each problem and two successful challenges each, but nicka81 just slipped by Yarin by less than 4 points to win the match. jshute came in third less than 20 points behind Yarin. nicka81 and Yarin (the only targeteer in this match) were both somewhat back in the pack at the end of the coding phase. This would have meant a serious rating loss for Yarin if those scores held. But nicka81 and Yarin jumped ahead of the tightly packed field in the challenge phase, by picking up 100 points each. Going into the system tests they were second and third, and they moved into first and second when pparys's 1200 pointer (the only submission for that problem) failed the systest. The final score was: nicka81 705.13, Yarin 701.72 and jshute 681.98.
</p>
<p>
In division-II, PE makes his first appearance at TopCoder and promptly runs 
away with the victory and an impressive initial rating of 1805. 
PE finished all three problems in less than 35 minutes, including the fastest solution to the 1000 point problem, and then capped it off with a successful 
challenge giving 1495.42 points. MPhk followed very closely, also finishing 
all three problems in less than 35 minutes getting 1432.06 points. 
Inoncom took less than 41 minutes to finish all three, and adding a 
successful challenge finished in third with 1395.82 points. These three, 
and fourteen other coders from this round, have moved up and will be 
testing their skills 
in division-I on their next SRMs.
</p>

<p>
<H1>
The Problems
</H1>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2314&amp;rd=5073">Reppity</a></b>
</font>
<A href="Javascript:openProblemRating(2314)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
Used as: Division Two - Level One: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      250
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      130 / 151 (86.09%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      74 / 130 (56.92%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ibonaci</b> for 247.47 points (2 mins 52 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      184.44 (for 74 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
Looking at the success rate on this problem in comparison with the success rate on the Div-II medium, RedSquare, it appears that Reppity was the harder problem and the two should have been switched.
</p>
<p>
Finding the longest non-overlapping identical substrings, when limited to small input strings (50 characters here) is a good candidate for a number of possible loop-and-test'm algorithms.  Something like this in Java works and runs in O(n<sup>4</sup>). Although O(n<sup>2</sup>) solutions are possible, it is usually a mistake to try to take the time to do an elegant solution on a low point value problem like this one.
<pre>
n = input.len ;
m = n / 2 ;
for (len=m;len>0;len--)
   for(pos=0;pos&lt;=n-len;startpos++)
     if (input.substring(pos+len,n+1)
         .indexOf(input.substring
                   (pos,pos+len))>-1)
           return len ;
return 0;
</pre>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2891&amp;rd=5073">RedSquare</a></b>
</font>
<A href="Javascript:openProblemRating(2891)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      500
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      121 / 151 (80.13%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      106 / 121 (87.60%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>dhyanesh</b> for 469.06 points (7 mins 23 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      344.03 (for 106 correct submissions)
    </td>
  </tr>
</table></blockquote>

Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      250
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      119 / 120 (99.17%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      117 / 119 (98.32%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>LunaticFringe</b> for 246.44 points (3 mins 25 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      218.51 (for 117 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem had a nearly perfect success rate in both divisions, and many
very fast solutions. The following "one-liner" does the job.
<pre>
for(c=k=0;k&lt;rank.length();k++) 
   if((rank[k]+file[k])%2==maxFile%2 ) 
      c++ ;
return (maxRank*maxFile)/2-c ;
</pre>
Forcing one of the corner squares to be black, guarantees that the number of red     squares is (maxRank*maxFile)/2 rounded down in the usual way. Since you know square (1,maxFile) is black, the "parity" of black squares in this coordinate
system is (1+maxFile)%2 and any square with (rank+file)%2 == (1+maxFile)%2 is therefore black. But we are interested in the red squares, so we must modify this test to be true for red squares rather than black. Rather than just stick a bang, "!", before the whole expression, subtracting one from 1+maxFile also
does the trick.
</p>
<p>
You could create an array, write alternating "red" and "black" labels into all the elements, loop through the pieces marking their squares as "used", then go back and count all the array elements marked "red", but that is kind of the long way around, and would not have worked if the problem limits were higher (like 1000000 by 1000000 squares checkerboards). But for this problem, with the 50 by 50 limit, if you didn't immediately see the solution above, it was probably smart to jump right in and do the array based solution, as anything else would probably take longer.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2439&amp;rd=5073">ComplexIntegers</a></b>
</font>
<A href="Javascript:openProblemRating(2439)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      1000
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      61 / 151 (40.40%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      29 / 61 (47.54%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>PE</b> for 793.43 points (15 mins 21 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      574.64 (for 29 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem was a bit wordy, but the entire algorithm you needed to implement was completely spelled out, except for how to test for "prime numbers" (the ordinary, positive integer type prime numbers).
The important thing here is if you did this:
<pre>
boolean is_prime ( int n )
{ 
for (int f=2;f&lt;n;f++) 
   if ( n%f==0 ) return false 
return true ; 
} 
</pre>
you will time out. You only need to test up to the square root of n, not n-1. 
So the more correct (and optimized to use a step size of 2) primeness test goes:
<pre>
boolean is_prime ( int n )
{
if ( n%2==0 ) return false ;
for (int f=3;f*f&lt;=n;f+=2) 
   if ( n%f==0 ) return false ; 
return true ;
} 
</pre>
So the entire algorithm looks like this:
<pre>
String[]answer=new String[realPart.length];
for(int k=0;&lt;realPart.length;k++)
   { int a,b,norm;
   a=realPart[k] ; b=imaginaryPart[k] ; 
   norm = a*a+b*b ;
   if ( norm == 0 ) 
      answer[k] = "zero" ;
   else if ( norm == 1 ) 
      answer [k] = "unit" ;
   else if ( a*b == 0 )
      if ( Math.abs(a+b)%4==3 &amp;&amp; 
           is_prime(Math.abs(a+b)))
         answer [k] = "prime" ;
      else
         answer [k] = "composite" ;
   else
      if ( is_prime ( norm ) ) 
         answer[k] = "prime" ;
      else 
         answer[k] = "composite"
   }
return answer ;
</pre>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2449&amp;rd=5073">DungeonEscape</a></b>
</font>
<A href="Javascript:openProblemRating(2449)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
Used as: Division One - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      500
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      86 / 120 (71.67%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      52 / 86 (60.47%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>LunaticFringe</b> for 420.38 points (12 mins 52 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      271.37 (for 52 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This was a shortest-path in a directed graph problem, with one wrinkle.
That wrinkle is that some nodes become unavailable at particular points
in time. The dungeon can be thought of as a graph with a maximum of 2501
nodes (with the "surface" as extra node). It is probably not a good idea
to represent this graph with a 2501 x 2501 adjacency matrix and try to do
repeated matrix multiplications!
</p>
<p>
To make things simple, I created all the arrays 
with a buffer row or column on each of the four sides, so no boundary testing is needed. 
This increases the size of the arrays by 2 in each dimension, and introduces an offset of 1 in each dimension .
An array, rm, holds, for each room,
what is earliest possible time that this room could be visited. 
All rm elements are initially set to "infinity" 
(I use Integer.MAX_VALUE/2 for infinity).
Also int arrays UP, DN, EA and WE are created which contain the parsed
time for the passageways leaving the room, in the buffered coordinate system.
"x"s are replaced by "infinity".
</p>
<p>
The room represented by [startLevel, startEasting] ( now rm[startLevel+1][startEasting+1] because of the buffers) is set to zero. And you begin iterating.
I loop through each room, checking to see if a move to an adjacent room
yields a better earliest possible time for the adjacent room (and that the 
adjacent room is not filled with water). If so, you record that you made a change, set the time in the adjacent room, and keep going.
After doing all rooms, except the buffer rooms, if there were any changes, you
do it again. This is basically the Bellman-Ford single source shortest paths algorithm. It is O(n<sup>3</sup>), which is not optimal, but it is usually fast enough and it is quick to implement in an SRM, which makes it an algorithm I frequently choose in combat.
</p>
<pre>
int floodTime(int lev)//in rm coords
{ if (lev==0) return infinity;
return (rm.length-lev)*n; }

main() 
...
n=up[0].length();
int maxlev = up.length;
...
boolean change=true;
while(change)
   { change = false ;
    for (int lev=1,lev&lt;=maxlev;lev++)
    for(int e=1,e&lt;=n;e++)
       {
       if ( rm[lev-1][e] &gt; 
              rm[lev][e]+UP[lev][e] &amp;&amp;
          floodTime(lev-1) &gt; 
             rm[lev][e]+UP[lev][e] )
          { 
          rm[lev-1][e]=
             rm[lev][e]+UP[lev][e]; 
          change=true;
          }
       if ( rm[lev+1][e] &gt; 
              rm[lev][e]+DN[lev][e] &amp;&amp;
          floodTime(lev+1) &gt; 
              rm[lev][e]+UP[lev][e] )
          { 
          rm[lev+1][e]=
             rm[lev][e]+DH[lev][e]; 
          change=true;
          }
       if ( rm[lev][e+1] &gt; 
              rm[lev][e]+EA[lev][e] &amp;&amp;
          floodTime(lev) &gt; 
              rm[lev][e]+UP[lev][e] )
          { 
          rm[lev][e+1]=
             rm[lev][e]+EA[lev][e]; 
          change=true;
          }
       if ( rm[lev][e-1] &gt; 
              rm[lev][e]+WE[lev][e] &amp;&amp;
          floodTime(lev) &gt; 
              rm[lev][e]+UP[lev][e] )
          {
          rm[lev][e-1]=
             rm[lev][e]+WE[lev][e]; 
          change=true;
          }
       }
   }
</pre>
<p>
Then just go through the elements of room[0] and pick the minimum answer.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2824&amp;rd=5073">Soma</a></b>
</font>
<A href="Javascript:openProblemRating(2824)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      1200
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      1 / 120 (0.83%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      0 / 1 (0.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>(NONE)</b>?
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      No correct submissions
    </td>
  </tr>
</table></blockquote>
<p>
This problem was inspired by the fun I had with this puzzle in the early 1970's and by the cover story on the October 1965 issue of CACM. Remember that one?
(young TopCoders everywhere look at each other, shake their heads, and mutter "wow, he really *IS* old isn't he?"). My grad school teacher of algorithms 
analysis, and later colleague, Dr. John G. Fletcher, wrote that cover article,
"a program to solve the pentomino problem by the recursive use of macros".
Therein lies much wisdom.
</p>
<p>
You need to do a lot of preprocessing to do this problem efficiently. Imagine you are back in 1965, the fastest computer you can get time on is probably about 0.001 MHz, efficiency is the key, even for the 2d version of our problem.
</p>
<p>
First you pick a spatial ordering of cubes, say lexicographically by x dimension then y and lastly z. Now for a particular set of cubes, such as a piece,
in a particular orientation you can order the cubes in the set. 
Let the first cube in this ordering be at relative coordinate (0, 0, 0) 
and all other cubes in the set are referenced by their 
offsets from this cube. Store this orientation of this set of cubes as a list 
of coordinate triples, with the triples in lexicographical order (0,0,0) is
first.
</p>
<p>
Repeat this procedure for every Soma "piece" in every possible orientation. 
Discard duplicates resulting from symmetries. You now have something like
int[piece][orientation][cube][d]pieces, where 
piece is 0 to 6, orientation 0..8, 0..12, or 1..24 depending on the symmetry of the piece, cube is 0..2 or 0..3 depending on the number cubes within the piece,
and d is 0 for x, 1 for y and 2 for z. The int values in this
array are the offsets from lexicographically first cube in this piece.
</p> 
<p>
You sort the pattern lexicographically by cubes, and store the sorted list of cubes. You will also need a 3d array of the pattern cubes, marked as to which ones are empty, filled, or illegal. Keeping a two cube wide "buffer zone" of cubes labeled "illegal" on all sides of the pattern, will allow you to avoid many boundary checks as you try to place pieces in the pattern.
The coordinate shifts caused by the buffer zone are pre-processed into data structures and are invisible in the search code.
</p>
<p>
Now we can state an important theorem. Given a pattern to fill, there is a 
cube in the pattern which is the first empty cube in the lexicographical 
ordering. If there is any piece (in a particular orientation) that can 
fill the first empty cube and 
also fit into the remainder of the pattern, 
then that piece (in that orientation) must have its first cube 
(in lexicographical order) placed on the first empty cube. Otherwise
the piece would have a cube at a lesser position,
lexicographically, than the first
empty cube, which is a contradiction. This allows us to test each  
orientation only once, against a given first empty cube in a pattern, and
to do so in a very efficient manner.
</p>
<p>
Now here is the algorithm, simple brute-force search with backtracking.
Initially all cubes in the pattern are "empty" and cubes in the 3d array but not in the pattern are
"illegal". As the algorithm progresses
some "empty" cubes will be "filled" by pieces. Start at the first empty cube in the pattern (lexicographically) and use the set of all seven pieces.
</p>
<p>
Examine each orientation of each piece (which I will refer to as a piece/orientation) in the current set (which are all pre-calculated). Conceptually, place the "first" cube (coordinates (0,0,0) pre-calculated) in the current piece/orientation on the "first" open cube of the pattern (this actually involves no computation). Using the pre-calculated relative coordinates, determine if all the cubes in the piece/orientation under consideration 
fall on empty cubes in the pattern. This is only two or three simple comparisons now. If it fits and this is the last piece in the set, we increment the count of solutions and return, If it fits and there are more pieces in the set, we place the piece, marking the pattern cubes as filled, removing the piece from the current set, and recurse, passing in the new set and the index of the first empty cube in the now more filled pattern.
When we return from the recursion, we put the piece back into the current set, mark the pattern cubes for that piece/orientation empty and continue with other piece/orientations to consider at this level of recursion.
</p>
<p>
That's it. With all the pre-processing done, the whole algorithm is one
fairly simple depth-first recursive search. There is no geometry involved
in the actual search.
</p>
<pre>
main ()
{
preprocess() ;
putIt(new boolean [6] , 0 , 0 ) ;
return solutions ;
}

void putIt ( boolean [] used , 
             int free , int usedCount )
{
while(pat3d[patternSorted[free].x]
           [patternSorted[free].y]
           [patternSorted[free].z]
                       !=  empty )
    free ++ ;
fx=patternSorted[free].x ;
fy=patternSorted[free].y ;
fz=patternSorted[free].z ;

for(p=0;p&lt;7;p++) if (!used[p]) 
   for(or=0;or&lt;24;or++)
      {
      if(piece[p][or][0][0]
              == invalid_flag)
          break ;
      bad = false ;
      for(c=1;c&lt;4;c++)
        if (piece[p][or][c][X]
                     != invalid_flag &amp;&amp;
            pat3d[piece[p][or][c][X]+fx]
                 [piece[p][or][c][Y]+fy]
                 [piece[p][or][c][Z]+fz]
                              != empty )
           bad = true ;
      if (!bad &amp;&amp; usedCount == 6)  
         { solutions ++ ; return ; }
      if (!bad)
         {
         for(c=0;c&lt;4;c++)
            pat3d[piece[p][or][c][X]+fx]
                 [piece[p][or][c][Y]+fy]
                 [piece[p][or][c][Z]+fz] 
                              = filled ;
         used[p] = true ;
         putIt(used,free+1,usedCount+1);
         for(c=0;c&lt;4;c++)
            pat3d[piece[p][or][c][X]+fx]
                 [piece[p][or][c][Y]+fy]
                 [piece[p][or][c][Z]+fz] 
                               = empty ;
         used[p] = false ;
         }
      }
}
</pre>
 
                     <p>
                     <img src="/i/m/Rustyoldman_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                     By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=282718"><strong>Rustyoldman</strong></a><br />
                     <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
                     </p>
                 </td>
             </tr>
         </table>

         <p><br /></p>

     </td>
<!-- Center Column Ends -->

<!-- Gutter -->
     <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
     <td width="170">
         <img src="/i/clear.gif" width="170" height="1" border="0"/><br />
         <xsl:call-template name="public_right_col"/>
     </td>
<!-- Right Column Ends -->

<!-- Gutter -->
     <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

 </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

 </xsl:template>
</xsl:stylesheet>
