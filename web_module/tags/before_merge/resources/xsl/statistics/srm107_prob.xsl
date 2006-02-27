<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Statistics</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>

<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
  <TR>
    <!-- Left Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->        
        <xsl:call-template name="global_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#FFFFFF" valign="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">statisticsw</xsl:with-param>
  <xsl:with-param name="title">&#160;Match Editorials</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<!--body contextual links-->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="100%">
    <TR>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
   <TR><TD COLSPAN="2" BGCOLOR="#43515E" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
   <TR>
      <TD VALIGN="top" BGCOLOR="#43515E" CLASS="moduleTitle">&#160; &#160;</TD>
      <TD BGCOLOR="#43515E" VALIGN="top" CLASS="moduleTitle">MATCH EDITORIAL LINKS:</TD>
   </TR>                    
   <TR>
       <TD COLSPAN="2" VALIGN="top" BGCOLOR="#43515E">
      <TABLE BORDER="0" WIDTH="100%" CELLSPACING="1" CELLPADDING="" BGCOLOR="#FFFFFF">
      <TR>
         <!-- <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC" HEIGHT="15"><A HREF="/?t=statistics&amp;c=srm104_prob" CLASS="bodyGeneric">&#160;Problem&#160;Set&#160;</A></TD>
         <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="/?t=statistics&amp;c=srm103_rookie" CLASS="bodyGeneric">&#160;Rookie&#160;Review&#160;</A></TD> -->
         <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" CLASS="bodyGeneric">&#160;Archive&#160;</A></TD>
          <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">&#160;Comments/Ideas/Want&#160;to&#160;Write?&#160;</A></TD>
      </TR>          
      </TABLE>
      </TD>
   </TR>               
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<B>Single Round Match 107</B><BR/>
Wednesday, August 7, 2002
<P><B>Problem Set Analysis &amp; Opinion</B></P>

<P>
<B>Division-II, Level 1:</B> (250pt)<BR/>
Submission rate - 92% (158/172) <BR/>
Success rate - 79% (124/158)<BR/>
High score: <B>n0vice</B>, 243.79 points<BR/>
</P>

<P>
This problem's hardest aspect was confusing wording. In essence, it's
telling you to find a string that's optimum in some way and put it at the
beginning of all the others - then write the others in series. So the
solution is pretty easy. Start at the first item in the array and see how
"good" it is. We can use a "quality" value without much trouble. For each
item, start quality at 0. Add 1000 if it's even-length (thus ensuring that
even-length strings will always be better than odd-length strings.) Now
subtract the length of the strings (giving shorter strings the advantage).
And now, if it's equal to or larger than your current "best", make it your
best.
</P>

<P>
Note that the "equal to" part is important - since we're doing this in
order, and it wants the one that appears latest, we have to replace our best
if it gets matched.
</P>

<P>
From there, it's easy. Start an empty string and add your "best" component
to it. Now iterate through the array again - if you're currently on the
"best", don't add it to your final string (since you've already got it), but
otherwise add it.
</P>

<P>
Now return that.
</P>

<P>
And that's all.
</P>


<P>
<B>Division-II, Level 2:</B> (450pt)<BR/>
Submission rate - 91% (156/172)<BR/>
Success rate - 58% (91/156)<BR/>
High score: <B>n0vice</B>, 447.23 points<BR/>
</P>

<P>
I have to be impressed by <B>derelikt</B>'s score on this one, which is quite
probably the highest percentage of possible points I've ever seen from
someone who isn't cheating. Five lines of code. This particular problem is
much easier in Java than C++, since you can use StringTokenizer to divide it
into blocks of A, and just add all those lengths into a HashSet, and return
its size.
</P>

<P>
On the other hand, it's not really hard in C++ either. Keep a counter - "how
many A's you've seen in a row" - start it at 0. Iterate through the string.
If it's D, add the current value to a set&lt; int &gt; and reset it to 0. If it's
A, increment the counter. Remember to add its current value at the end, and
then remove 0 from the set&lt; int &gt; (you might not have one, so you can't just
subtract one from its size, but myset.erase( 0 ); isn't hard to write) and
return the size.
</P>

<P>
I honestly don't know which of these would work better in C#, but if C#
doesn't have a Java stringtokenizer clone, the C++ technique will work with
whatever C#'s equivalent of set is.
</P>


<P>
<B>Division-II, Level 3:</B> (1000pt) &amp; <B>Division-I, Level 1:</B> (300pt)
</P>

<P>
<B>Div-II</B><BR/> 
Submission rate - 42% (73/172)<BR/>
Success rate - 41% (30/73)<BR/>
High score: <B>biomass</B>, 823.56<BR/>
</P>

<P>
<B>Div-I</B><BR/> 
Submission rate - 76% (80/105)<BR/>
Success rate - 78% (62/80)<BR/>
High score: <B>kv</B>, 284.83<BR/>
</P>


<P>
There are really two major cases you have to look at - the one where the
axis of symmetry goes straight through one column, and the one where the
axis of symmetry goes between two columns. Neither of them are really hard,
though.
</P>

<P>
In the end, the algorithm comes down to "scan the entire logo, and its
mirror image, and add one for every time the squares on both sides aren't
identical". Do that for each vertical axis - remembering both possible
kinds - and return the smallest value you can achieve.
</P>

<P>
The actual implementation could be done in quite a few ways. Some people
used arrays to write the data to, translated along some axis, so that the
"mirror point" was always, say, location 50. In this case you could just
write it in verbatim for the "axis goes through a column", and shift
everything on the left side of the mirror point one more space to the left
for "axis goes between columns".
</P>

<P>
radeye set his up to do the reading directly from the input data, with some
logic to avoid running out of bounds.
</P>

<P>
I, personally, used a map&lt; int, map&lt; int, bool &gt; &gt;, which is nice because it
mimics an infinitely-sized 2d array, defaulting to false. So I'd write the
data in, then just scan 0,0 to 50,50, along with the reflection, then clear
it for the next one.
</P>


<P>
<B>Division-I, Level 2:</B> 550pt<BR/>
Submission rate - 37% (39/105)<BR/>
Success rate - 77% (30/39)<BR/>
High score: <B>ZorbaTHut</B>, 452.58 points<BR/>
</P>

<P>
I honestly don't know of anyone who did this the clever way - I ended up
talking with an admin afterwards, and he explained the Good solution. So
here's the good solution.
</P>

<P>
Instead of thinking of it as a series of resistors, just think of the nodes.
Right now our task isn't to figure out which resistors are redundant, it's
to figure out which nodes are redundant. It's pretty easy to see that if a
node is redundant any resistors linking to it are likewise redundant.
</P>

<P>
First build your handy adjacency matrix. Now you've got a big loop for each
point.
</P>

<P>
First, remove given point from the adjacency matrix. Then run Floyd's on the
whole thing. Now for each point remaining, check to see if there's a path
from it to A or B. If there isn't, then it's not part of a simple path.
</P>

<P>
Repeat for the next point, accumulating the simple paths.
</P>

<P>
In the end it's O(n^4), and you have a bunch of nodes that aren't part of
simple paths. Run through your original string and if either side of a
resistor isn't part of a simple path, add it to your list. Sort and return.
</P>

<P>
Now here's a somewhat hacked kludgy way that does, in fact, work :)
</P>

<P>
The way I ended up figuring out is (of course) a recursive algorithm. Keep
an array of which nodes are in a simple path from A to B (start them all at
"false", of course) and an array of which nodes you've been through. Now
just do a depth-first search. If you find a path to B, you can set A, B, and
all the nodes in your path to "true". If you run into a path that's already
set to "true" from a different direction you can set all the nodes in the
current path to "true" also. However, if you run into a piece of the same
path you're already on, you can't take a node more than once, so don't set
anything to true.
</P>

<P>
It's a bit hard to explain - you may wish to look at my source. gd[] is the
"which nodes are in a simple path" array ("good"), and tk[] is the "which
nodes are in the path you're currently exploring" array ("taken").
</P>

<P>
A lot of people did clever things to try to embed the actual number of
connections inside the adjacency matrix. I didn't bother. I built an
adjacency matrix like normal, then just went through the connections
(snagging them out of the input string a second time) and tested them all.
Sort them as you go, then sort the final array and return it.
</P>


<P>
<B>Division-I, Level 3:</B> 800pt<BR/>
Submission rate - 10% (10/105)<BR/>
Success rate - 40% (4/10)<BR/>
High score: <B>Yarin</B>, 491.65 points<BR/>
</P>

<P>
Oddly enough, this problem was actually brute-forcable today, and I believe
brute-force may be its only solution. In general, what you wanted to do was
generate every combinations of rules, then make a really enormous array with
the start pattern in the middle and run every combination of rules on it,
seeing which gives you the best result.
</P>

<P>
The actual implementation was a little trickier. It's easy to calculate
"lightspeed", the fastest speed at which anything in the middle can effect
anything on the edges. It's one cell per iteration, since each cell only
pays attention to the cells on either side. That means that, after 300
iterations, with a 50-cell starting pattern, your pattern will be, at most,
650 cells wide.
</P>

<P>
Of course, it's not *quite* that simple. Since you can have rules that
generate life where there is no life - say, for example, DDD - some
algorithms might start generating fringe effects on the side. My
implementation kept both cells on the very edges "dead", meaning that
invalid data could start creeping in from the sides at lightspeed also. So I
would need another 300 cells on each side to prevent that. In the end, to
keep from getting tripped up by an inevitable stupid off-by-one error, I
made my entire array 2000 cells wide and started the "initial pattern" at
location 1000. This meant that locations 0-300 were garbage, 700-1350 were
important, and 1700-2000 were garbage.
</P>

<P>
The next thing that tripped me up was another problem, this time hinging on
"infinite life" on either side. However, with the way I'd set it up,
locations 500 and 1500 would be in this "infinite" area, if there was one.
No problem! I made a loop to start at 500 and find the first dead cell, and
another loop to start at 1500 and go backwards to find the first dead cell,
and then my main "diversity finder" just went from one side to the other.
</P>

<P>
Finding diversity wasn't really hard. Keep a counter of "how many alive
cells have you found in a row". Start from the first side and go to the end.
If the cell you're on is alive, increment the counter. If the cell you're on
is dead, add the current value of the counter to a list, then set the
counter to 0. Once you've iterated all the way through just scan the list
for duplicates (and zeros) and eliminate them all, then return the size of
the list. Note that C++ STL's set class does the job quite nicely, though
you have to remove 0 manually (not hard - myset.erase( 0 ); ).
</P>

<P>
The only remaining part is "run every combination of rules". Generating
every combination of rules isn't hard either. You can think of it as an
array of the possible eight rules, with a flag for whether that condition
brings life or death - in fact, that's exactly how I implemented it. Then
it's just a matter of trying every combination of those rules one after
another - 256 tests, overall.
</P>

<P>
Of course, you need very efficient code for all of this, or it will time
out. My solution runs even the worst cases in under two seconds - look at it
if you want hints.
</P>


<IMG SRC="/i/m/ZorbaTHut_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;ZorbaTHut<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=152347" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
          <P><BR/></P>
               </TD>
               <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            </TR>
            <TR>
               <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
            </TR>      
            <TR>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>   
            <TR>
               <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>
         </TABLE>
      </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

   <!-- Gutter -->
      <TD WIDTH="4" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
   <!-- Right Column Begins -->
      <TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><br/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->        
        </TD>
   <!-- Right Column Ends -->
   <!-- Gutter -->
      <TD WIDTH="10" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
   </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>


