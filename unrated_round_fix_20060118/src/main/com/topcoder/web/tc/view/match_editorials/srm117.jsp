<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505537" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 117</span><br>Tuesday, October 22, 2002
<br><br>

<H1> 
The Problems 
</H1> 

<FONT SIZE="+2"><B>DrinkMix</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505537" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-II, Level 1:
    <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">250</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">133/196 (67.86%)
        </TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">85/133 (63.91%)
        </TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>androm</B> for 244.74 points
        </TD>
      </TR>
    </TABLE>
  </BLOCKQUOTE>
  <P><FONT SIZE="-1">Reference implementation:  <B>fvolny4</B></FONT></P>
<P>For this problem, one only has to work with the amount of rum in the two bowls the punch can be ignored).  That is, one should have two variables, rumAand rumB, representing the number of units of rum in bowls A and B, respectively.  Initially, rumA = 360000 and rumB = 0.</P>

<P>Now, for each time the bowls are mixed, 120000 units of the liquid in bowl A are poured into bowl B.  There will always be 360000 units of liquid in bowl A at the beginning of each mix.  Thus one third of the units of rum in bowl A will be transferred to bowl B.  That is, rumB += rumA / 3, and rumA -= rumA / 3.  This brings the total volume of liquid in bowl B to480000 units.</P>

<P>Then 120000 units of liquid are poured back into bowl A.  In this case, one fourth of the units of liquid in bowl B are poured into bowl A.  Thus, rumA += rumB / 4 and rumB -= rumB / 4.</P>
<P>We simply repeat this simple process (which is just four lines of code) mixes times and return the final value of rumB.</P>
<BR/>

<FONT SIZE="+2"> <B>BinTree</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505537" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-II, Level 3:
    <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">1000</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">21/196 (10.71%)
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">4/ 21 (19.05%)
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>smai</B> for 514.86 points
                </TD>
      </TR>
    </TABLE>
  </BLOCKQUOTE>
<P><FONT SIZE="-1">Reference implementation: <B>smai</B></FONT></P>
<BR/>
<P>The easiest way to conceptualize this problem is to transform the input string array into a single array that can be indexed using the method described in the problem statement. To do this, initialize an empty array to represent the tree.  If one needs to allocate storage initially (e.g., if using a java array), it helps to know that the exact size needed will be (1 &lt;&lt; levels.length) - 1.  Iterate through each string in the input array, and for each token in this string add a value to the tree array.  To represent entries of *, use a value that is not between -100 and 100 inclusive.</P>

<P>Next, iterate through each element of the tree array (skipping the first), verifying that the element does not violate any of the rules for a binary search tree.  To do this we check the value against each of its ancestors.  It helps to know the following information that can be determined from a value's index in the tree array (note that all indices are counting from 1 in the following): </P>
    <UL>    
        <LI>The parent of the element at index i is at index i / 2 </LI>
        <LI>If i is even, then it is the left child of its parent; if i is odd, it is the right child of its parent</LI>
    </UL>
<P>So, for each element we check it against its ancestors, noting whether it is in the left or
                right subtree of each ancestor.  If i is the 1-based index of the current element,
                initialize j = i.  While j &gt; 1, we compare the value at i to the
                value at j / 2.  We do the division after the comparison so that we can determine
                which subtree of j / 2 that i is in (this information is lost after we
                do the integral division).  If j % 2 == 0 and the value at i (which would
                be i - 1 using 0-based indexing) is greater than the value at j / 2
                (which would be j / 2 - 1 using 0-based indexing), then a rule has been violated.
                Similarly, if j % 2 == 1 and the value at i is less than the value at
                j / 2, a rule has been violated.  Also note that if the value of i's
                immediate ancestor is *, a rule has been violated.  If you check this rule
                properly, there's no need to check it for all ancestor's of i.  To continue
                to the next ancestor of i, divide j by 2.
            </P>
<P>
                If one can iterate through the elements from 2 to (1 &lt;&lt; levels.length) - 1
                inclusive using 1-based indexing without finding a rule violation, then the tree is valid.  Otherwise,
                return the 1-based index of the first element found that violates a rule.  The only trick
                is to keep the 0-based and 1-based indexing straight.  The sample cases are sufficient for
                working this out.
            </P>
<FONT SIZE="+2"><B>Piano</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505537" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-II, Level 2:
  <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">550</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">81/196 (41.33%)
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">46/81  (56.79%)
        </TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>rschutt</B> for
                    495.06 points
                </TD>
      </TR>
    </TABLE>
  </BLOCKQUOTE>

    Used as: Division-I, Level 1:
  <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">300</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">125
    /
    136
    (91.91%)
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">100
    /
    125
    (80%)
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Saxophonist</B> for
                    281.77 points
                </TD>
      </TR>
    </TABLE>
  </BLOCKQUOTE>

<FONT SIZE="-1">Reference implementation:
    <B>Saxophonist</B>
</FONT>
<BR/>
<FONT SIZE="-1">Reference implementation:
    <B>NDBronson</B>
</FONT>
<BR/>

<P>
                There are two basic methods for solving this problem.  The first is to simply
                hard code a mapping of keys to scales for all the possible inputs.  The mapping
                is as follows:
            </P>

 C -&gt; C D E F G A B C<BR/>
B# -&gt; ERROR<BR/>
C# -&gt; C# D# E# F# G# A# B# C#<BR/>
Db -&gt; Db Eb F Gb Ab Bb C Db<BR/>
 D -&gt; D E F# G A B C# D<BR/>
D# -&gt; ERROR<BR/>
Eb -&gt; Eb F G Ab Bb C D Eb<BR/>
 E -&gt; E F# G# A B C# D# E<BR/>
Fb -&gt; ERROR<BR/>
 F -&gt; F G A Bb C D E F<BR/>
E# -&gt; ERROR<BR/>
F# -&gt; F# G# A# B C# D# E# F#<BR/>
Gb -&gt; Gb Ab Bb Cb Db Eb F Gb<BR/>
 G -&gt; G A B C D E F# G<BR/>
G# -&gt; ERROR<BR/>
Ab -&gt; Ab Bb C Db Eb F G Ab<BR/>
 A -&gt; A B C# D E F# G# A<BR/>
A# -&gt; ERROR<BR/>
Bb -&gt; Bb C D Eb F G A Bb<BR/>
 B -&gt; B C# D# E F# G# A# B<BR/>
Cb -&gt; Cb Db Eb Fb Gb Ab Bb Cb
            
<P>
                This is simple enough, particularly if one has this mapping already available.
                However, for those that did not, the second method must be used.
                This method uses the table given in the problem specification:
            </P>
<TABLE>
<TR>
    <TD CLASS="bodyText" >1</TD>
    <TD CLASS="bodyText" >C</TD>
    <TD CLASS="bodyText" >B#</TD>
  </TR>
<TR>
    <TD CLASS="bodyText" >2</TD>
    <TD CLASS="bodyText" >C#</TD>
    <TD CLASS="bodyText" >Db</TD>
  </TR>
<TR>
    <TD CLASS="bodyText" >3</TD>
    <TD CLASS="bodyText" >D</TD>
    <TD CLASS="bodyText" >-</TD>
  </TR>
<TR>
    <TD CLASS="bodyText" >4</TD>
    <TD CLASS="bodyText" >D#</TD>
    <TD CLASS="bodyText" >Eb</TD>
  </TR>
<TR>
    <TD CLASS="bodyText" >5</TD>
    <TD CLASS="bodyText" >E</TD>
    <TD CLASS="bodyText" >Fb</TD>
  </TR>
<TR>
    <TD CLASS="bodyText" >6</TD>
    <TD CLASS="bodyText" >F</TD>
    <TD CLASS="bodyText" >E#</TD>
  </TR>
<TR>
    <TD CLASS="bodyText" >7</TD>
    <TD CLASS="bodyText" >F#</TD>
    <TD CLASS="bodyText" >Gb</TD>
  </TR>
<TR>
    <TD CLASS="bodyText" >8</TD>
    <TD CLASS="bodyText" >G</TD>
    <TD CLASS="bodyText" >-</TD>
  </TR>
<TR>
    <TD CLASS="bodyText" >9</TD>
    <TD CLASS="bodyText" >G#</TD>
    <TD CLASS="bodyText" >Ab</TD>
  </TR>
<TR>
    <TD CLASS="bodyText" >10</TD>
    <TD CLASS="bodyText" >A</TD>
    <TD CLASS="bodyText" >-</TD>
  </TR>
<TR>
    <TD CLASS="bodyText" >11</TD>
    <TD CLASS="bodyText" >A#</TD>
    <TD CLASS="bodyText" >Bb</TD>
  </TR>
<TR>
    <TD CLASS="bodyText" >12</TD>
    <TD CLASS="bodyText" >B</TD>
    <TD CLASS="bodyText" >Cb</TD>
  </TR>
</TABLE>
<P>
                It helps to note that each row represents a particular pitch, while the values
                in that row represent valid representations for that pitch.
            </P>
<P>
                The first note of a scale will begin with the note specifying its key,
                and we will start at the row containing the key.
                To find the next note of the scale, skip ahead the appropriate number of
                rows to find the row representing the next pitch of the scale.  The
                amount of rows to skip are: 2, 2, 1, 2, 2, 2, and then 1.  Note that
                this sums up to 12, and there are twelve rows in the table, so we will
                always end up where we started.
            </P>
<P>
                For each note in the scale, we have to pick the appropriate representation.
                If the previous note was A#, we need to pick a representation with
                a B at the beginning of it.  If the previous note was a G,
                we need to pick a representation with a A at the beginning of it.
                We simply check the available representations at the current row to see if
                any begin with the appropriate note.  If none do, then we return ERROR.
                Otherwise we append that note to our string.
            </P>
<P>
                This is simple enough to implement once the table has been initialized properly
                in the code.  The rest is just handling the spaces between notes so that there
                is no trailing space.
            </P>
<A NAME="Tiling"></A><FONT SIZE="+2"><B>Tiling</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505537" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-I, Level 2:
  <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">650</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">38
    /
    136
    (27.94%)
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">22
    /
    38
    (57.89%)
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>NDBronson</B> for
                    540.33 points
                </TD>
      </TR>
    </TABLE>
  </BLOCKQUOTE>

<FONT SIZE="-1">Reference implementation:
    <B>jms137</B>
</FONT>
<BR/>
<P>
                To solve this problem we iteratively tile over portions of the floor (following
                the rules given) until the entire floor is tiled.  We then return how many
                iterations it took.  Thus the problem reduces to locating the rectangle that
                should be tiled next.
            </P>
<P>
                A na&#149;ve implementation would have six nested for loops: one for the top row
                of a rectangle; one for the bottom row; one for the left-most column; and
                for the right-most column; and then two more for loops to iterate through
                all the tiles within these bounds.  However, the na&#149;ve solution will never finish
                in time on a 50 x 50 input, as 50 ^ 6 is greater than 15 billion
                iterations.
            </P>
<P>
                However, a more efficient implementation that is equivalent to the na&#149;ve solution
                is possible.  Let h be the number of rows in the floor, and w
                be the number of columns.
                We iterate through each row and column (r, c) of the floor.
                Initialize a variable rwidth to w.
                If (r, c) is already tiled, skip it.  Otherwise, we iterate through each
                r &lt;= r' &lt; h such that (r', c) has not yet been tiled and
                requires the same type of tile as (r, c).  For each r' we find
                the smallest c' &lt; c such that (r', c') cannot be part of a
                rectangle of the same type of tiles.  If c' - c &lt; rwidth, we update
                rwidth with the value of c' - c.  At this point we know the
                dimensions of the largest possible rectangle with a top-left corner of (r, c)
                and bottom row of r'.  We can then compare it against the best rectangle
                found so far, and update that if appropriate.  The area is (r' - r + 1) * rwidth.
            </P>
<P>
                After a rectangle is chosen for tiling, we &quot;tile&quot; it by modifying the array in which
                we store the floor information (e.g., marking with 'T' as in the examples
                given in the problem statement).
            </P>
<FONT SIZE="+2"><B>RadioTower</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505537" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-I, Level 3:
  <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">850</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">32
    /
    136
    (23.53%)
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">18
    /
    32
    (56.25%)
</TD>
      </TR>
      <TR>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD CLASS="bodyText" STYLE="background: #eee;">
          <B>John Dethridge</B> for
                    724.82 points
                </TD>
      </TR>
    </TABLE>
  </BLOCKQUOTE>
  <FONT SIZE="-1">Reference implementation:
    <B>DjinnKahn</B></FONT>

<BR/>
<P>
                Like many Level 3 problems, the solution to this problem embodies dynamic programming.
                That is, one can determine an appropriate algorithm via induction.
            </P>
<P>
                Suppose we sort the customers from left to right.  Then suppose we already know the
                minimum cost for reaching just the first customer, and the minimum cost for reaching
                the first two customers, and so on up to the first n customers.  Let these
                costs be stored in an array cost such that cost[i] is the minimum
                cost of reaching the left-most i customers (and cost[0] = 0 is the
                base case).  Can we use this information to add a customer from the right?
            </P>
<P>
                In an optimal configuration, any tower that we build should always have a customer
                located at either extreme end of its range (for towers of height one it's the
                same customer on both ends).  There's no sense in having the extent of the range
                terminate somewhere in the no-man's land between two customers.  This means that
                if we add any customer to the right of a set of other customers, then there must
                exist a tower that just reaches this right-most customer.  The left-most extent
                of this tower's arrange must be the location of either the new customer or one
                of the customers preceding it on the left.
            </P>
<P>
                We iterate through each of the customers that are to the left of the customer being
                added.  For each one, we compute the cost of erecting a tower that can reach that customer
                and the new customer simultaneously (if the required height of such a tower exceeds the
                maximum height, its cost is infinity).  This gives a cost (not necessarily the minimum)
                for covering all the previous customers as well as the new one.  If we add a tower that
                covers both customer i and customer n + 1, then the resulting configuration
                costs cost[i - 1] plus the cost of that tower.  If we consider all these possible
                configurations, as well as the configuration resulting from adding a tower of height 1
                at the location of the new customer, we will encounter the one of minimum cost.  We take the
                minimum and store it in cost[n + 1].
            </P>
<P>
                Once the problem and its solution are understood, it is trivial to implement.  Other dynamic
                programming solutions are possible (I managed to come up with a very different O(n^2)
                one during the match), but this is the simplest one I've seen.  One mistake
                that several people made (such as myself) was to implement their solution in such a way that an input
                of no customers caused a runtime error.  This shows how important it is to read carefully over the
                notes and input constraints and consider their ramifications.
            </P>

<p>
<img src="/i/m/Logan_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="112902" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
