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
<B>Single Round Match 130</B><BR/>
Saturday, January 25, 2003
<P><B>Problem Set Analysis &amp; Opinion</B></P>

<a name="Collatz"></a><font size="+2"><b>Collatz</b></font><br/><font size="-1">
    Used as: Division-II, Level 1:<blockquote><table cellspacing="2">
<tr>
<td style="background: #eee;" class="bodyText"><b>Value</b></td>
<td style="background: #eee;" class="bodyText">300</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
<td style="background: #eee;" class="bodyText">148
    /
    150
    (98.67%)
</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
<td style="background: #eee;" class="bodyText">146
    /
    148
    (98.65%)
</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
<td style="background: #eee;" class="bodyText">
<b>Karshikinpa</b> for
                    298.54 points
                </td>
</tr>
</table></blockquote></font><h4>Implementation</h4>
<p>
                The solution to this problem was a straight-forward implementation of the function as described.
                TopCoder takes care of the hard parts, ensuring that the value goes to 1 in a reasonable number
                of steps and that no intermediate values overflow a 32 bit signed integer.
                This problem had one of the highest success rates I've ever seen.  Only two people submitted it,
                and only two people that submitted it got it wrong.
            </p>
<p>&#160;</p>
<a name="Complete"></a><font size="+2"><b>Complete</b></font><br/><font size="-1">
    Used as: Division-II, Level 2:<blockquote><table cellspacing="2">
<tr>
<td style="background: #eee;" class="bodyText"><b>Value</b></td>
<td style="background: #eee;" class="bodyText">500</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
<td style="background: #eee;" class="bodyText">133
    /
    150
    (88.67%)
</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
<td style="background: #eee;" class="bodyText">97
    /
    133
    (72.93%)
</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
<td style="background: #eee;" class="bodyText">
<b>skanthak</b> for
                    473.42 points
                </td>
</tr>
</table></blockquote></font><h4>Implementation</h4>
<p>
                For this problem, all of the special cases are described.  There are several.  First, we have to
                add the right letters for the day of the month.  The problem statement specifies which values get
                which letters, so it's just a matter of writing the switch statement that follows from this specification.
                Next, we have to determine the right century for the year.  If the year is greater than or equal to 70,
                then it belongs to the 1900s, otherwise the year occurred on or after 2000.
            </p>
<p>
                We do not have to worry about the date being valid, so all that is needed is to parse the input date and
                build the return value.  The parsing can be done with a simple tokenizer that splits the string on the
                <tt>'/'</tt> character.  Once the parsing is done, the only trick is to be careful that the special cases
                described above get implemented correctly.
            </p>
<p>&#160;</p>
<a name="GoldConj"></a><font size="+2"><b>GoldConj</b></font><br/><font size="-1">
    Used as: Division-II, Level 3:<blockquote><table cellspacing="2">
<tr>
<td style="background: #eee;" class="bodyText"><b>Value</b></td>
<td style="background: #eee;" class="bodyText">900</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
<td style="background: #eee;" class="bodyText">83
    /
    150
    (55.33%)
</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
<td style="background: #eee;" class="bodyText">62
    /
    83
    (74.7%)
</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
<td style="background: #eee;" class="bodyText">
<b>Doomhammer</b> for
                    877.56 points
                </td>
</tr>
</table></blockquote></font><font size="-1">
    Used as: Division-I, Level 1:<blockquote><table cellspacing="2">
<tr>
<td style="background: #eee;" class="bodyText"><b>Value</b></td>
<td style="background: #eee;" class="bodyText">250</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
<td style="background: #eee;" class="bodyText">82
    /
    89
    (92.13%)
</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
<td style="background: #eee;" class="bodyText">73
    /
    82
    (89.02%)
</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
<td style="background: #eee;" class="bodyText">
<b>John Dethridge</b> for
                    244.78 points
                </td>
</tr>
</table></blockquote></font><h4>Implementation</h4>
<p>
                The first step is to precompute all of the relevant primes.  The largest prime that will be useful will be the
                largest prime that is smaller than the upper bound of our input, which is <tt>2000</tt>.  A simple algorithm
                for computing primes is <tt>O(n<sup>2</sup>)</tt>, which is sufficient for computing primes in the range of
                <tt>2..2000</tt>.  One such method, which is very easy to implement, is known as the
                <a href="http://planetmath.org/encyclopedia/SieveOfEratosthenes.html" class="bodyText" target="_blank">sieve of Eratosthenes</a>.  See the
                preceding link for a description of this method.
            </p>
<p>
                Once the primes are known, we can then iterate through all pairs of primes whose sum is less than the input value.
                Whenever we have selected two primes, we can check if the difference between the input value and the sum of the two primes
                is also prime.  If so, we have a possible solution.  We compare this to our best solution so far by looking at the product
                of the three primes, and if it is better we save it.
            </p>
<p>&#160;</p>
<a name="Proleolytic"></a><font size="+2"><b>Proleolytic</b></font><br/><font size="-1">
    Used as: Division-I, Level 2:<blockquote><table cellspacing="2">
<tr>
<td style="background: #eee;" class="bodyText"><b>Value</b></td>
<td style="background: #eee;" class="bodyText">450</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
<td style="background: #eee;" class="bodyText">58
    /
    89
    (65.17%)
</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
<td style="background: #eee;" class="bodyText">42
    /
    58
    (72.41%)
</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
<td style="background: #eee;" class="bodyText">
<b>vorthys</b> for
                    411.34 points
                </td>
</tr>
</table></blockquote></font><h4>Implementation</h4>
<p>
                The solution to this problem is a depth-first traversal of all the ways in which the protein can be
                split up by the available enzymes.  Thus a typical implementation will define a recursive function
                that takes a portion of the protein, applies every possible enzyme and,
                for each enzyme, recursively calls itself on each of the fragments of protein that result from the
                splitting.
            </p>
<p>
                The splitting can be done by walking the string.  Initialize a variable <tt>begin</tt> to 0, representing
                the index <i>after</i> the last character of the previous split.  Thus, the first character of the next
                protein fragment will always be at index <tt>begin</tt>.  Then iterate through the protein.  For each
                character we encounter that is in the enzyme we are applying, we split the string.  We get a protein
                fragment by taking the substring from <tt>begin</tt> to the current index (not including the character
                at the current index).  We add this fragment to the set of fragments we've generated, then recursively
                split it up with all possible enzymes as well.  Then we move on to the next index, setting <tt>begin</tt> to the
                value of that index.
            </p>
<p>
                For each recursive call to the splitting function, we do the above for each enzyme.  When the top-level
                call to this recursive function finally returns, we will have built a set containing all the possible
                protein fragments that could be generated with the given enzymes, and return its size.  Note that if
                you maintain this set in such a way that the original protein gets added, you should subtract one from
                the size.
            </p>
<p>&#160;</p>
<a name="GPS"></a><font size="+2"><b>GPS</b></font><br/><font size="-1">
    Used as: Division-I, Level 3:<blockquote><table cellspacing="2">
<tr>
<td style="background: #eee;" class="bodyText"><b>Value</b></td>
<td style="background: #eee;" class="bodyText">1050</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
<td style="background: #eee;" class="bodyText">17
    /
    89
    (19.1%)
</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
<td style="background: #eee;" class="bodyText">7
    /
    17
    (41.18%)
</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
<td style="background: #eee;" class="bodyText">
<b>John Dethridge</b> for
                    751.92 points
                </td>
</tr>
</table></blockquote></font><h4>Implementation</h4>
<p>
                This problem can be reduced to finding the shortest path between a vertex and a set of vertices
                in a graph.  In this graph, the intersections, the location of the caller, and the locations of
                ambulances are vertices.  Each of these vertices can be represented as the road(s) they are on
                and their location along these roads.  From this information the edges can be derived, as any
                vertices that share a road are directly connected, and the weight of this edge can be determined
                by the difference between their locations on the common road and the speed limit on that road.
            </p>
<p>
                Once we build this graph, we can approach the shortest path problem in several ways.  This particular
                problem is known as the single source shortest paths (SSSP) problem, because it is solved by finding the
                shortest paths to all vertices from a single source vertex (contrast this with the all pairs
                shortest paths problem, which comes up more often in these contests).  A very well-known algorithm
                for solving the SSSP problem is
                <a href="http://ciips.ee.uwa.edu.au/~morris/Year2/PLDS210/dijkstra.html" class="bodyText" target="_blank">Dijkstra's algorithm</a>,
                explained in the preceding link.
            </p>
<p>
                Clearly the hardest part to this problem is building the graph from the input.  The rest has been solved
                by most programmers many times before.  To find road intersections, we iterate through all pairs of roads.
                For each pair, we can only have an intersection if one road is horizontal and the other is vertical.  If
                the pair meets this requirement, we look at the horizontal road and see if the <i>y</i> component of its
                two endpoints lies between the <i>y</i> components of the vertical road's endpoints.  If this is the case,
                we then look at the vertical road and see if the <i>x</i> component of its two endpoints lies between the
                <i>x</i> components of the horizontal road's endpoints.  If these conditions are met, then these roads intersect
                at the <i>x</i> component of the vertical road and the <i>y</i> component of the horizontal road.
            </p>
<p>
                After we find all intersections, we have to deal with the ambulances.  Some are located at intersections; for these
                we don't have to build a new vertex, but can simply mark an existing intersection vertex as a target.  Ambulances
                not located at intersections require a new vertex to be built using the road the ambulance is on and its location
                along that road.  In either case we have to iterate through all the roads to find the one or two roads that the
                ambulance is on.  This requires math similar to that used to determine if roads intersect (you could think of an ambulance
                as both a horizontal and vertical road of zero length).
            </p>
<p>&#160;</p>
         
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
    <TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- <A HREF="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm98"><IMG SRC="/i/motorola_sidebar1.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
<A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=srm91_room1','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A><BR/>
<A HREF="/index?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/></A> -->
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
