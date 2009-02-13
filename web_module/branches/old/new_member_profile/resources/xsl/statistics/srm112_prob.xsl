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
<B>Single Round Match 112</B><BR/>
Monday, September 9, 2002
<P><B>Problem Set Analysis &amp; Opinion</B></P>

<a name="GardenHose"></a>
<font size="+2">
  <b>GardenHose</b>
</font>
<BR/>

    Used as: Division-II, Level 1
            :<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">250</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">145
    /
    227
    (63.88%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">140
    /
    145
    (96.55%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>gruban</b> for
                    233.94 points
                </td>
      </tr>
    </table>
  </blockquote>
 
Reference implementation:
    <b>madking</b>
<BR/>
<h4>Implementation</h4>
<p>
                If the hose length is at least as long as the length of either dimension, then all plants can be watered.
                Otherwise, we get the number of rows and columns the hose can cover, by dividing the row and column distances respectively
                by the hose distance.
                If the hose can travel <tt>x</tt> rows and <tt>y</tt> columns, then there will be a rectangle of plants in the
                middle that cannot be reached consisting of <tt>n - 2x</tt> rows and <tt>n - 2y</tt> columns.
            </p>
<p>&#160;</p>
<a name="Top5"></a>
<font size="+2">
  <b>Top5</b>
</font>
<BR/>

    Used as: Division-II, Level 2
            :<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">450</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">135
    /
    227
    (59.47%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">114
    /
    135
    (84.44%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>Frostburn</b> for
                    418.33 points
                </td>
      </tr>
    </table>
  </blockquote>
Reference implementation:
    <b>androm</b>

<BR/>
<h4>Implementation</h4>
<p>
                The easiest way to solve this problem is to repeatedly pull the applicants from the list that have the
                maximum score.  That is, determine the maximum value in the scores array, then add all those applicants
                whose scores are this maximum value to the return array and remove them from the scores and names arrays.
                Removal can consist of simply overwriting their score with a negative value.  We continue this process
                of finding the maximum score and removing applicants with that score until we have at least five applicants
                in the return array.
            </p>
<p>&#160;</p>
<a name="SumK"></a>
<font size="+2">
  <b>SumK</b>
</font>
<BR/>

    Used as: Division-II, Level 3
            :<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">850</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">71
    /
    227
    (31.28%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">57
    /
    71
    (80.28%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>FunOrPain</b> for
                    759.70 points
                </td>
      </tr>
    </table>
  </blockquote>

    Used as: Division-I, Level 1
            :<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">250</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">92
    /
    98
    (93.88%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">76
    /
    92
    (82.61%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>PurpleBob</b> for
                    242.49 points
                </td>
      </tr>
    </table>
  </blockquote>
Reference implementation:
    <b>ZorbaTHut</b>
<BR/>
<h4>Implementation</h4>
<p>
                Every programmer should know that the sum of the integers from 1 to <tt>k</tt> inclusive is
                <tt>k*(k+1)/2</tt>.  It then follows that the sum of the integers from <tt>n</tt> to <tt>n+k</tt>
                is <tt>(n+1)*k*(k+1)/2</tt> (because <tt>n + (n+1) + ... + (n+k) = (n+1)(1 + 2 + ... + k)</tt>).
            </p>
<p>
                For integers <tt>x</tt> and <tt>k</tt>, we want to determine if there exists an integer
                <tt>y</tt> such that <tt>y + (y+1) + ... + (y+k-1) = x</tt>.  All we have to do is solve for <tt>y</tt>.
                We have
            </p>
<blockquote>
                <table>
                  <tr>
      <td class="bodyText">
        <tt>y * k + (k - 1) * k / 2</tt>
      </td>
      <td class="bodyText">
        <tt>=</tt>
      </td>
      <td class="bodyText">
        <tt>x</tt>
      </td>
    </tr>
                  <tr>
      <td align="right" class="bodyText">
        <tt>y * k</tt>
      </td>
      <td class="bodyText">
        <tt>=</tt>
      </td>
      <td class="bodyText">
        <tt>x - (k - 1) * k / 2</tt>
      </td>
    </tr>
                  <tr>
      <td align="right" class="bodyText">
        <tt>y</tt>
      </td>
      <td class="bodyText">
        <tt>=</tt>
      </td>
      <td class="bodyText">
        <tt>(x - ((k - 1) * k) / 2) / k</tt>
      </td>
    </tr>
                </table>
            </blockquote>
<p>
                So to determine if <tt>y</tt> is integral, we only need to see if <tt>k</tt> divides into <tt>x-(k-1)*k/2</tt>
                (which we can do using the modulus operator).  The only problem is that we're dealing with quantities of approximately
                <tt>k<sup>2</sup>
  </tt>, and <tt>k</tt> is permitted to be as large as 1,000,000.  Therefore the computations should
                be done using 64-bit arithmetic to avoid overflow.
            </p>
<p>&#160;</p>
<a name="Wildebeest"></a>
<font size="+2">
  <b>Wildebeest</b>
</font>
<BR/>
    Used as: Division-I, Level 2
            :<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">650</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">33
    /
    98
    (33.67%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">27
    /
    33
    (81.82%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>radeye</b> for
                    542.00 points
                </td>
      </tr>
    </table>
  </blockquote>
Reference implementation:
    <b>ZorbaTHut</b>
<BR/>
<h4>Implementation</h4>
<p>
                The solution is to iterate through all the possible placements of the fence that would contain at least one wildebeest.
                In this manner the number of iterations is reduced to a manageable level.  We choose an arbitrary corner of the fence
                and place it at all the lattice points such that the fence will contain at least one beast.  Since the beasts are really
                points of no size, we need to also place the corner at offsets of half a unit vertically or horizontally from any
                lattice point.
            </p>
<p>
                Relative to a particular beast location, there is a finite number of offsets where we can place a corner of the fence
                and contain that particular beast (using the lattice points and midpoints as described above).  In fact, these offsets
                are always the same, and can be precomputed.  We then iterate through each beast.  For each beast we iterate through all
                fence placements containing that beast.  For each fence placement we then count the beasts it contains, and save the maximum.
            </p>
<p>
                To count the number of beasts enclosed by the fence at a particular location, we need a method for determining whether or
                not a given beast is enclosed by the fence.  Let's suppose we specify the location of the fence as the coordinate of its
                bottom-most point (i.e., the point with maximum <tt>y</tt> value).  Any beast with <tt>y</tt>-coordinate greater than or
                equal to that of the bottom-most point is not enclosed.  Furthermore any beast with <tt>y</tt>-coordinate less than or
                equal to that of the bottom-most point minus the length of the diagonal is excluded.  If a location passes these two tests,
                we then take the absolute value of the difference between its <tt>x</tt>-coordinate and that of the bottom-most point of the
                fence (call this <tt>dx</tt>) and do the same for the <tt>y</tt>-coordinate (call this <tt>dy</tt>).  If <tt>dy</tt> is greater
                than the diagonal, then assign to <tt>dy</tt> the difference between the diagonal length and the former value of <tt>dy</tt>.
                If <tt>dx &lt; dy</tt>, then the beast is enclosed by the fence.
            </p>
<p>&#160;</p>
<a name="Ranker"></a>
<font size="+2">
  <b>Ranker</b>
</font>
<BR/>
    Used as: Division-I, Level 3
            :<blockquote>
    <table cellspacing="2">
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Value</b>
        </td>
        <td style="background: #eee;" class="bodyText">1050</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Submission Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">15
    /
    98
    (15.31%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>Success Rate</b>
        </td>
        <td style="background: #eee;" class="bodyText">15
    /
    15
    (100%)
</td>
      </tr>
      <tr>
        <td style="background: #eee;" class="bodyText">
          <b>High Score</b>
        </td>
        <td style="background: #eee;" class="bodyText">
          <b>ZorbaTHut</b> for
                    691.22 points
                </td>
      </tr>
    </table>
  </blockquote>
Reference implementation:
    <b>bigg_nate</b>
<BR/>
<h4>Implementation</h4>
<p>
                The key to the solution of this problem was to develop an efficient data structure for holding previous
                scores and computing ranks of new scores on the fly.  When inserting a value into this data structure,
                it must be possible to compute the number of values greater than the value being inserted that have
                already been inserted into the structure.
            </p>
<p>
                One approach is to use a binary tree.  Each node in the tree is associated with a score value.
                Each node's left child and all its descendants represent values less than that node's score value,
                while the right descendants represent values greater than that node's score value.  With each node
                is also maintained a count of values that have been inserted to the right of that node in the tree,
                as well as a count of the number of times the node's value has been inserted.
            </p>
<p>
                When a score is generated, it is inserted into the tree.  Insertion consists of walking the tree until
                a node representing that score is encountered or the traversal has no place to go.  Traversal consists
                of moving to the left child of a node if its score value is greater than the score we're inserting,
                or the right child if its score value is less.  If there is no such child, we must insert a new node
                at this location representing the score to be inserted.  Whenever we traverse to the right child, we
                increment the parent node's count of values greater than it.
            </p>
<p>
                As we insert we also maintain a running total representing the rank of the score we're inserting, to
                be returned once the value is inserted.  If we traverse to a left child, we increment the rank counter
                by the parent node's number of instances and by the number of values that have been inserted to the right
                of the parent.  If we traverse to a right child, we do not increment the rank counter.
            </p>


<IMG SRC="/i/m/Logan_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;Logan<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=112902" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
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


