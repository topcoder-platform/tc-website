<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>
  <xsl:import href="../includes/modules/invit02_nav.xsl"/>   
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Tournament</TITLE>
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
    <TD WIDTH="180" VALIGN="top">
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
    <TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">tournaments</xsl:with-param>
  <xsl:with-param name="title">&#160;Room&#160;3:&#160;Problems&#160;&amp;&#160;Chrono&#160;Logs</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

    <!-- Global Seconday Nav Begins -->        
        <xsl:call-template name="seminav"/>
  <!-- Global Seconday Nav Ends --> 
<BR CLEAR="all"/>         
          
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%"> 
            <TR>
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 3 Problem Analysis &amp; Opinion</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
<P>
Friday, November 22, 2002
</P>

<a name="Travel"></a><font size="+2"><b>Travel</b></font><BR/><font size="-1">
    Used as: Level 1</font><h4>Implementation</h4>
<p>
                This problem is the well-known
                <a href="http://www.nist.gov/dads/HTML/travelingSalesman.html" target="_blank" class="bodyText">traveling salesman</a> problem.
                More formally, the problem is to find the 
                <a href="http://planetmath.org/encyclopedia/HamiltonianCycle.html" target="_blank" class="bodyText">Hamiltonian cycle</a> of least weight.
                This problem is NP-complete, but that's no big deal, since there are only up to 9 cities.  Thus we
                simply iterate through all orderings of the non-starting cities (there may be up to 8 of these), and
                evaluate the cost of the Hamiltonian cycle described by each ordering.
                Generating these orderings is easy, using C++'s <tt>next_permutation</tt> function from <tt>&lt;algorithm&gt;</tt>.
            </p>
<p>
                The rest of the problem consists of calculating weights for each edge.  This is useful code to have
                sitting around for reuse, as I have seen a number of ACM problems that deal with computing distances
                between latitude and longitude coordinates on a sphere.  The problem statement gives the formulas
                for transforming latitude and longitude into Cartesian coordinates.  However, some more geometry
                is necessary to determine the distance on the sphere between the two points.
            </p>
<p>
                Imagine a triangle formed by drawing two lines from the center of the sphere to two cities, and
                a third line directly between the two cities (cutting through the sphere).  Each of the lines from
                the center of the sphere has a known length (the radius of the sphere).  We can determine the length
                of the third line easily enough by computing Euclidean distance between the Cartesian coordinates of
                the two cities (the square root of the squares of the differences between the values for each coordinate).
                Since we know the lengths of all three sides of this isosceles triangle, we can easily determine the
                angles of all three corners.  If we know the angle of the corner located at the center of the sphere, we
                can determine the length of the arc defined by this angle.  The length of this arc will give us the
                shortest distance on the sphere between the two cities.
            </p>
<p>
                To find this angle, we will use the law of cosines.  This is a formula that pops up in many, many
                geometry problems:
            </p>
<blockquote>
                <i>c<sup>2</sup> = a<sup>2</sup> + b<sup>2</sup> + 2ab</i> cos <i>C</i>
            </blockquote>
<p>
                In the above, lowercase variables refer to side lengths, while uppercase variables refer to angles
                opposite a particular side (e.g., <i>C</i> is the angle of the corner opposite the side with length
                <i>c</i>).  We know <i>a</i>, <i>b</i>, and <i>c</i> (<i>c</i> is the Euclidean distance between
                    the two cities), and need to know <i>C</i>.  So a little rearranging gives us:
            </p>
<blockquote>
                <i>C =</i> cos<i><sup>-1</sup>( (c<sup>2</sup> - a<sup>2</sup> - b<sup>2</sup>) / (2ab) )</i>
            </blockquote>
<p>
                Or, in C:
            </p>
<pre>
C = acos((c * c - a * a - b * b) / (2 * a * b));
            </pre>
<p>
                Now, once we know <i>C</i>, we can determine the length of the arc defined by <i>C</i>.  The ratio
                of the arc length to the circumference of the sphere is equal to the ratio of the arc angle to <i>2<tt>pi</tt></i>.
                That is:
            </p>
<blockquote>
                <i>d / (2<tt>pi</tt>r) = C / (2<tt>pi</tt>)</i>
            </blockquote>
<p>
                In the above, <i>d</i> is the length of the arch.
                The <i>2<tt>pi</tt></i> cancels out on both sides, so we get <i>d = Cr</i>.
            </p>
<p>&#160;</p>
<a name="Hexagons"></a><font size="+2"><b>Hexagons</b></font><BR/><font size="-1">
    Used as: Level 2</font><h4>Implementation</h4>
<p>
                This problem has a very straight-forward solution.  First, we iterate through each possible orientation of
                each possible choice for the center piece.  On each iteration, we iterate through all orderings of the remaining
                six pieces.  Each ordering will specify how the pieces will be laid out around the center piece.  Choose an
                arbitrary starting point and direction (e.g., start at the top and proceed clockwise).  As with
                <a href="#Travel">Travel</a>, C++'s <tt>next_permutation</tt> would be very useful here.
            </p>
<p>
                Each ordering will dictate the orientation of the pieces surrounding the center piece.  So all we do for each ordering
                is determine if it represents a placement that can be made without violating the rules.  So, we find the position
                of the value in the top piece that matches the top value in the center piece.  The value next to it (proceeding
                counter-clockwise about the piece) will be the value that must be adjacent to the next piece.  So, we find the
                position of the the value in the next piece that matches the top-right value in the center piece.  The value
                that follows it in a clockwise manner in the second piece must match the value we found in the first piece.  If not,
                this ordering cannot be a valid placement.  Otherwise, we proceed in the same fashion for all the pieces, remembering
                to check the final piece against the first piece as well.
            </p>
<p>&#160;</p>
<a name="TopCraft"></a><font size="+2"><b>TopCraft</b></font><BR/><font size="-1">
    Used as: Level 3</font><h4>Implementation</h4>
<p>
                There exists an <tt>O(n log<sup>2</sup> n)</tt> algorithm for solving this problem, but the bounds are
                so low that it makes no sense to deal with the mess of such an algorithm.  Instead, I will describe a
                simpler but more expensive solution.
            </p>
<p>
                First, we generate a lot of rectangles by iterating over all choices of 4 1-units (with duplicates allowed),
                and use the locations of these units to form bounds for a rectangle.  We can do this with
                four nested <tt>for</tt> loops, a simple process that generates up to <tt>20<sup>4</sup></tt> rectangles.
                We immediately discard any rectangle that contains a 2-unit, and any duplicate rectangles.  This leaves
                us with at most 385 rectangles (summation of <i>i<sup>2</sup></i> for <i>1 &lt;= i &lt;= 10</i>).
                Next we must remove all rectangles that are completely enclosed by another rectangle.  This is a simple
                <tt>O(n<sup>2</sup>)</tt> process.
            </p>
<p>
                Now we must examine the remaining rectangles to determine the subset of minimum size that selects all
                the 1-units.  At this point we must do a little dynamic programming.  For each rectangle, determine the
                set of 1-units it encloses.  This set can be represented by an integer: if the rectangle encloses the
                <i>i</i>th 1-unit, then the <i>i</i>th bit of the integer's binary representation is 1.  We then create
                an array <tt>mins</tt>, where <tt>mins[x]</tt> is the minimum number of rectangles required to enclose
                all the points in the set represented by <tt>x</tt>.  Initialize each element of <tt>mins</tt> to be
                a number greater than the number of rectangles (so we can recognize sets we haven't generated yet),
                and initialize <tt>mins[0] = 0</tt> (because it takes zero rectangles to enclose zero points).
            </p>
<p>
                Now, for each rectangle, we iterate through each set with a generated value in <tt>mins</tt> and determine
                if the set obtained by adding the current rectangle has fewer rectangles.  That is, for each <tt>x</tt>
                in <tt>mins</tt> where <tt>mins[x]</tt> is not greater than the number of rectangles, we perform the logical
                or operation with the representation of the set of units enclosed by the current rectangle to get a new set,
                <tt>y</tt>.  If <tt>mins[x] + 1 &lt; mins[y]</tt>, we replace <tt>mins[y]</tt> with <tt>mins[x] + 1</tt>.
                After we do this for all rectangles, the value of <tt>mins[(1 &lt;&lt; n) - 1]</tt> (where <tt>n</tt> is the number
                of 1-units) will contain the answer.
            </p>


<IMG SRC="/i/m/Logan_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;Logan<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=112902" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
          <P><BR/></P>
          </TD>
            </TR>                  
            <!-- <TR>
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 3 Problems</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
<IMG SRC="/i/pdf_iconw.gif" ALT="" WIDTH="31" HEIGHT="31" BORDER="0"/><BR/>
Level One (250) - <A HREF="/i/invit02/Betting.pdf" CLASS="bodyText">Betting</A><BR/>
Level Two (500) - <A HREF="/i/invit02/Roadmap.pdf" CLASS="bodyText">Roadmap</A><BR/>
Level Three (1000) - <A HREF="/i/invit02/Omaha.pdf" CLASS="bodyText">Omaha</A><BR/>

          </TD>
            </TR> -->
            <TR>
              <TD VALIGN="middle"><A NAME="log"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 3 Chrono Logs</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
              
<BR/><B>CODING PHASE</B><BR/>
3:00:02 PM - moira opens the Level One problem <BR/>
3:00:03 PM - obfuscator opens the Level One problem <BR/>
3:00:04 PM - radeye opens the Level One problem <BR/>
3:00:11 PM - NDBronson opens the Level One problem <BR/>
3:12:46 PM - NDBronson opens the Level Two problem <BR/>
3:26:12 PM - obfuscator submits the Level One problem for 184.78 points (final submission) <BR/>
3:26:20 PM - obfuscator opens the Level Three problem <BR/>
3:29:44 PM - moira submits the Level One problem for 171.79 points (final submission) <BR/>
3:29:52 PM - moira opens the Level Two problem <BR/>
3:34:33 PM - radeye submits the Level One problem for 157.46 points (final submission) <BR/>
3:35:15 PM - radeye opens the Level Two problem <BR/>
3:41:35 PM - NDBronson submits the Level Two problem for 291.30 points (final submission) <BR/>
3:41:36 PM - obfuscator opens the Level Two problem <BR/>
3:41:42 PM - NDBronson opens the Level Three problem <BR/>
3:54:56 PM - moira submits the Level Two problem for 315.22 points (final submission) <BR/>
3:55:10 PM - moira opens the Level Three problem <BR/>
4:14:22 PM - obfuscator submits the Level Two problem for 270.31 points (final submission) <BR/><BR/>

<B>CHALLENGE PHASE</B><BR/>
No Activity <BR/>

          </TD>
            </TR>            
                                   
          </TABLE>
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


