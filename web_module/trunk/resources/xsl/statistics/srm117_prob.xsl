<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/stats/public_stats_left.xsl"/> 
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
        <xsl:call-template name="public_stats_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">statisticsw</xsl:with-param>
  <xsl:with-param name="title">&#160;Last Match Editorials</xsl:with-param>
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
			<TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyGeneric">&#160;Archive&#160;</A></TD>
		    <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">&#160;Comments/Ideas?&#160;</A></TD>
		</TR>    		
		</TABLE>
		</TD>
	</TR>               
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<B>Single Round Match 117</B><BR/>
Tuesday, October 22, 2002
<P><B>Problem Set Analysis &amp; Opinion</B></P>

<P> The point values in Division I made little sense, as two trivial problems
    were worth 350 and 650 points (extremely high based on historical values for Level 1
   and Level 2 problems), while the Level 3 problem was worth only 850 points (extremely
   low based on the same sort of historical values).  The Level 3 problem required
   some degree of aptitude when it comes to dynamic programming, while the other two
   problems were just a matter of typing speed and correctness, so it seems that the
   points in this match were skewed in favor of the latter attributes.</P>

<FONT SIZE="+2"><B>DrinkMix</B></FONT><BR/>

    Used as: Division-II, Level 1:
    <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD STYLE="background: #eee;">250</TD>
      </TR>
      <TR>
        <TD STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD STYLE="background: #eee;">133/196 (67.86%)
        </TD>
      </TR>
      <TR>
        <TD STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD STYLE="background: #eee;">85/133 (63.91%)
        </TD>
      </TR>
      <TR>
        <TD STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD STYLE="background: #eee;">
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

<FONT SIZE="+2"> <B>BinTree</B></FONT><BR/>
    Used as: Division-II, Level 3:
    <BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD STYLE="background: #eee;">1000</TD>
      </TR>
      <TR>
        <TD STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD STYLE="background: #eee;">21/196 (10.71%)
</TD>
      </TR>
      <TR>
        <TD STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD STYLE="background: #eee;">4/ 21 (19.05%)
</TD>
      </TR>
      <TR>
        <TD STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD STYLE="background: #eee;">
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
<FONT SIZE="+2">
  <B>Piano</B>
</FONT>
<BR/>

    Used as: Division-II, Level 2
            :<BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD STYLE="background: #eee;">550</TD>
      </TR>
      <TR>
        <TD STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD STYLE="background: #eee;">81/196 (41.33%)
</TD>
      </TR>
      <TR>
        <TD STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD STYLE="background: #eee;">46/81  (56.79%)
        </TD>
      </TR>
      <TR>
        <TD STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD STYLE="background: #eee;">
          <B>rschutt</B> for
                    495.06 points
                </TD>
      </TR>
    </TABLE>
  </BLOCKQUOTE>

    Used as: Division-I, Level 1
            :<BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD STYLE="background: #eee;">300</TD>
      </TR>
      <TR>
        <TD STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD STYLE="background: #eee;">125
    /
    136
    (91.91%)
</TD>
      </TR>
      <TR>
        <TD STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD STYLE="background: #eee;">100
    /
    125
    (80%)
</TD>
      </TR>
      <TR>
        <TD STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD STYLE="background: #eee;">
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
    <TD>1</TD>
    <TD>C</TD>
    <TD>B#</TD>
  </TR>
<TR>
    <TD>2</TD>
    <TD>C#</TD>
    <TD>Db</TD>
  </TR>
<TR>
    <TD>3</TD>
    <TD>D</TD>
    <TD>-</TD>
  </TR>
<TR>
    <TD>4</TD>
    <TD>D#</TD>
    <TD>Eb</TD>
  </TR>
<TR>
    <TD>5</TD>
    <TD>E</TD>
    <TD>Fb</TD>
  </TR>
<TR>
    <TD>6</TD>
    <TD>F</TD>
    <TD>E#</TD>
  </TR>
<TR>
    <TD>7</TD>
    <TD>F#</TD>
    <TD>Gb</TD>
  </TR>
<TR>
    <TD>8</TD>
    <TD>G</TD>
    <TD>-</TD>
  </TR>
<TR>
    <TD>9</TD>
    <TD>G#</TD>
    <TD>Ab</TD>
  </TR>
<TR>
    <TD>10</TD>
    <TD>A</TD>
    <TD>-</TD>
  </TR>
<TR>
    <TD>11</TD>
    <TD>A#</TD>
    <TD>Bb</TD>
  </TR>
<TR>
    <TD>12</TD>
    <TD>B</TD>
    <TD>Cb</TD>
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
<A NAME="Tiling"></A>
<FONT SIZE="+2">
  <B>Tiling</B>
</FONT>
<BR/>

    Used as: Division-I, Level 2
            :<BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD STYLE="background: #eee;">650</TD>
      </TR>
      <TR>
        <TD STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD STYLE="background: #eee;">38
    /
    136
    (27.94%)
</TD>
      </TR>
      <TR>
        <TD STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD STYLE="background: #eee;">22
    /
    38
    (57.89%)
</TD>
      </TR>
      <TR>
        <TD STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD STYLE="background: #eee;">
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
<A NAME="RadioTower"></A>
<FONT SIZE="+2">
  <B>RadioTower</B>
</FONT>
<BR/>

    Used as: Division-I, Level 3
            :<BLOCKQUOTE>
    <TABLE CELLSPACING="2">
      <TR>
        <TD STYLE="background: #eee;">
          <B>Value</B>
        </TD>
        <TD STYLE="background: #eee;">850</TD>
      </TR>
      <TR>
        <TD STYLE="background: #eee;">
          <B>Submission Rate</B>
        </TD>
        <TD STYLE="background: #eee;">32
    /
    136
    (23.53%)
</TD>
      </TR>
      <TR>
        <TD STYLE="background: #eee;">
          <B>Success Rate</B>
        </TD>
        <TD STYLE="background: #eee;">18
    /
    32
    (56.25%)
</TD>
      </TR>
      <TR>
        <TD STYLE="background: #eee;">
          <B>High Score</B>
        </TD>
        <TD STYLE="background: #eee;">
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
              
<IMG SRC="/i/m/Logan_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;Logan<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/stat?c=member_profile&amp;cr=112902" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
          <P><BR/></P>
					</TD>
					<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
				</TR>   	
				<TR>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>
			</TABLE>
		</TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

  <!-- Gutter -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- <A HREF="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm98"><IMG SRC="/i/motorola_sidebar1.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
<A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=srm91_room1','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A><BR/>
<A HREF="/index?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/></A> -->
<!-- Right Column Include Begins -->        
        <xsl:call-template name="public_right_col"/>        
<!-- Right Column Include Ends -->        
        </TD>
  <!-- Right Column Ends -->
  <!-- Gutter -->
    <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
