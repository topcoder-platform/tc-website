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
<B>Single Round Match 122</B><BR/>
Wednesday, December 4, 2002
<P><B>Problem Set Analysis &amp; Opinion</B></P>

<a name="Alcohol"></a><font size="+2"><b>Alcohol</b></font><BR/>
    Used as: Division-II, Level 1
            :<blockquote>
<table cellspacing="2">
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Value</b></td>
<td CLASS="bodyText" style="background: #eee;">300</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Submission Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">161
    /
    186
    (86.56%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Success Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">141
    /
    161
    (87.58%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>High Score</b></td>
<td CLASS="bodyText" style="background: #eee;">
<b>TangentZ</b> for
                    296.11 points
                </td>
</tr>
</table></blockquote>Reference implementation:
    <b>see Logan's solution in the practice room</b><BR/><P><B>Implementation</B></P>
<p>
                To solve this problem, simply iterate through the input list, keeping track of how many parties
                each group has accumulated.  This can be done by using a mapping container.  For each group in
                the list, increment the value associated with that group in the map.  If no value is associated,
                initialize it to zero and then increment.  As soon as a group's value is incremented to 3, return
                that group's name.  If, after processing the input, no group's value reached 3, return <tt>&quot;&quot;</tt>.
            </p>
<p>&#160;</p>
<a name="Booksale"></a><font size="+2"><b>Booksale</b></font><BR/>
    Used as: Division-II, Level 2
            :<blockquote><table cellspacing="2">
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Value</b></td>
<td CLASS="bodyText" style="background: #eee;">500</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Submission Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">127
    /
    186
    (68.28%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Success Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">113
    /
    127
    (88.98%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>High Score</b></td>
<td CLASS="bodyText" style="background: #eee;">
<b>Sleeve</b> for
                    476.79 points
                </td>
</tr>
</table></blockquote>Reference implementation:
    <b>see Logan's solution in the practice room</b><BR/><P><B>Implementation</B></P>
<p>
                This problem turns out to be more of a parsing problem than anything else.
                For each combination in the list, you must parse it to determine the price and
                which books are included.  Then it's a simple matter of looking up the cost for
                each book and subtracting from the sum the combination cost.  Do this for each
                combination and return the greatest difference.  Also note that if the greatest difference
                is negative, the value <tt>0</tt> should be what is actually returned.
            </p>
<p>
                For parsing each combination, one could tokenize with the <tt>':'</tt> and <tt>','</tt>
                characters as delimiters.  Or, if using C++, one could replace all instances of these delimiters with
                whitespace and then extract the elements with a <tt>stringstream</tt>.
            </p>
<p>&#160;</p>
<a name="Bikepath"></a><font size="+2"><b>Bikepath</b></font><BR/>
    Used as: Division-II, Level 3
            :<blockquote><table cellspacing="2">
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Value</b></td>
<td CLASS="bodyText" style="background: #eee;">1000</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Submission Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">39
    /
    186
    (20.97%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Success Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">13
    /
    39
    (33.33%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>High Score</b></td>
<td CLASS="bodyText" style="background: #eee;">
<b>ps31</b> for
                    755.46 points
                </td>
</tr>
</table></blockquote>Reference implementation:
    <b>see Logan's solution in the practice room</b><BR/><P><B>Implementation</B></P>
<p>
                This is the classic breadth-first search problem, seen numerous times on TopCoder and in various
                other programming contests.  The map can be interpreted as a graph.  Each location in the map is
                a vertex, and an implicit edge of weight 1 exists between it and each of its 4-neighbors (the neighbors
                in the four cardinal directions).  When all edges have weight 1,
                breadth-first search consists of starting at some set of points and
                generating all the unvisited points adjacent to points in that set.  The process then repeats with this new
                set, until the destination point becomes included in the set.  The number of iterations to generate each
                set is then the minimum distance from any point in the original set to each point in that set.
            </p>
<p>
                So, we construct a queue with a maximum capacity which is the size of the map (this is actually more
                than we need).  The queue will contain tuples, each tuple representing a location in the map and an
                integer representing the cost of reaching this location from the starting point.
                Initially the queue contains exactly one tuple, representing the start location and the
                value 0.
                We also maintain a boolean array that, for each point in the map, specifies whether or not it has been
                visited by the breadth-first search.
            </p>
<p>
                Then, while the queue is not empty, we remove the first tuple and examine its location.  We iterate through
                its 4-neighbors, and for each neighbor that has not been visited, we add it to the queue.  When adding a
                location to the queue, we mark it as visited in the boolean array.  We then add one to the previous location's
                cost to get the cost of reaching its neighbor.  If the neighbor is the destination point, we can immediately
                return its cost.  Otherwise we combine the location with the cost into a tuple and add it to the queue, and
                continue searching.
            </p>
<p>
                If the queue ever becomes empty, then that means there is no path from the source to the destination and return <tt>-1</tt>.
            </p>
<p>&#160;</p>
<a name="Probation"></a><font size="+2"><b>Probation</b></font><BR/>
    Used as: Division-I, Level 1
            :<blockquote><table cellspacing="2">
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Value</b></td>
<td CLASS="bodyText" style="background: #eee;">250</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Submission Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">93
    /
    96
    (96.88%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Success Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">65
    /
    93
    (69.89%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>High Score</b></td>
<td CLASS="bodyText" style="background: #eee;">
<b>b0b0b0b</b> for
                    247.57 points
                </td>
</tr>
</table></blockquote>Reference implementation:
    <b>see Logan's solution in the practice room</b><BR/><P><B>Implementation</B></P>
<p>
                This problem is the more difficult counterpart to Division-II's <a href="#Alcohol" CLASS="bodyText">Alcohol</a> problem.
                In this problem, a group goes on probation only if it has three parties within a span of five days or less.
                Furthermore, rather than returning the first group that goes on probation, you must find all groups that go
                on probation, sort them in order of when they go on probation, and return this list.
            </p>
<p>
                One method is to build a map from the information in the input.  The mapping will be from group names to
                lists of days on which they hold parties.  To build this map, iterate through the input (keeping track of which
                day we're on).  For the group that throws a party on day <i>i</i>, append the value <i>i</i> to that group's list.
            </p>
<p>
                Once we have a list of party days for each group, we can then determine on which day, if any, that group goes on
                probation.  Suppose that a group's list has length <tt>n</tt>.  We then see if <tt>list[i + 2] - list[i] &lt; 5</tt>
                for any <tt>0 &lt;= i &lt; n - 2</tt> (if using 0-based indexing).  If so, we only consider the minimum <tt>i</tt> for
                which this holds, construct a tuple consisting of the group's name and <tt>list[i + 2]</tt>, and add it to our list of groups
                on probation.
            </p>
<p>
                Once we do this for each group, we can then sort the list of tuples representing groups on probation.  Simply sort them
                in ascending order of the second value in the tuple.
                We can then throw away the second values and simply return a list of group names.
            </p>
<p>&#160;</p>
<a name="Bookstore"></a><font size="+2"><b>Bookstore</b></font><BR/>
    Used as: Division-I, Level 2
            :<blockquote><table cellspacing="2">
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Value</b></td>
<td CLASS="bodyText" style="background: #eee;">500</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Submission Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">69
    /
    96
    (71.88%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Success Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">42
    /
    69
    (60.87%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>High Score</b></td>
<td CLASS="bodyText" style="background: #eee;">
<b>radeye</b> for
                    458.32 points
                </td>
</tr>
</table></blockquote>Reference implementation:
    <b>see Logan's solution in the practice room</b><BR/><P><B>Implementation</B></P>
<p>
                Although this problem shares some of the same concepts as its Division-II counterpart,
                <a href="#Booksale" CLASS="bodyText">Booksale</a>, its solution is actually very different.  First, we
                parse each of the book combinations and store them in a list.  Note that the statement
                specifies that there will be at most 15 such combinations.  Therefore we can easily
                iterate through each combination of book combinations in under eight seconds.
            </p>
<p>
                To do this we iterate from <tt>0</tt> to <tt>2<sup>n</sup> - 1</tt> inclusive, where <tt>n</tt>
                is the number of book combinations there are.  The binary representation of each iterated value
                represents a combination of book combinations; if bit <i>i</i> in the binary representation is
                <tt>1</tt>, then the <i>i</i>th book combination is present in that combination.
            </p>
<p>
                For each combination of book combinations, we determine if it is valid and how much money it
                saves us.  We count how many references there are to each book in each book combination in the
                combination, and ensure that no book is referenced more times than it is being bought.  If
                the combination of book combinations passes this test, then it is easy to calculate how much
                money is being saved.  We then subtract this from the amount it would cost to purchase all of
                the books without any deals, and see if it's less than the best price found so far.
            </p>
<p>&#160;</p>
<a name="Bikeroute"></a><font size="+2"><b>Bikeroute</b></font><BR/>
    Used as: Division-I, Level 3
            :<blockquote>
<table cellspacing="2">
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Value</b></td>
<td CLASS="bodyText" style="background: #eee;">900</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Submission Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">42
    /
    96
    (43.75%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>Success Rate</b></td>
<td CLASS="bodyText" style="background: #eee;">23
    /
    42
    (54.76%)
</td>
</tr>
<tr>
<td CLASS="bodyText" style="background: #eee;"><b>High Score</b></td>
<td CLASS="bodyText" style="background: #eee;">
<b>WishingBone</b> for
                    746.86 points
                </td>
</tr>
</table></blockquote>Reference implementation:
    <b>see Logan's solution in the practice room</b><BR/><P><B>Implementation</B></P>
<p>
                The solution to this problem just consists of some very minor changes to our solution to
                Division-II's <a href="#Bikepath" CLASS="bodyText">Bikepath</a> problem.  The major difference in this problem
                is that our edges no longer have the same weights.  The type of surface we are biking on affects
                how long it takes to traverse it.  To keep the problem as similar as possible to how it was described
                for the Division-II version, we will specify that the surface type of a location (vertex) specifies the
                weights associated with each of its <i>incoming</i> edges.
            </p>
<p>
                Now, we must adapt our breadth-first traversal so that it works for edges of different weights.
                We can no longer use a simple queue, because an ordinary queue simply orders vertices so that we
                visit them in ascending order of distance defined in terms of number of edges.  This will not work
                for this problem, because there may be one path that traverses 3 edges that has
                a smaller cost than one that traverses 2 edges.  Therefore we need a data structure that will
                order vertices based on the actual cost of reaching them.
            </p>
<p>
                For this we need a <i>priority queue</i>.  This is just a queue where elements are removed in order
                of descending priority.  For elements with the same priority, they are ordered just like in an ordinary
                queue.  In this problem, a location has higher priority if it has a lower cost.
            </p>
<p>
                C++ provides a <tt>priority_queue</tt> data type, for which we can define a custom comparison operator
                (because by default our tuples will be ordered in the reverse of what we need).  For other languages,
                one would have to implement one's own priority queue.  This isn't too difficult.  Priority queues are
                typically implemented with a <a href="http://planetmath.org/encyclopedia/Heap.html" CLASS="bodyText">heap</a>.  The
                preceding link gives a reasonably thorough overview of what a heap is, and provides algorithms for
                building a heap data structure.
            </p>
<p>
                If one already has a solution for <a href="#Bikepath" CLASS="bodyText">Bikepath</a>, changing it to solve this problem
                is simple.  First, change the queue data type to a priority queue.  Second, instead of adding <tt>1</tt>
                to generate a new cost each time, add the cost associated with travelling over the terrain of the vertex
                we just reached.  Third, add <tt>'P'</tt> locations to the list of types of terrain that are impassible.
                Finally, prevent traversal of terrains with a travel cost &gt;= 5 that are 8-adjacent to a location of
                type <tt>'P'</tt>.  Each of these changes are fairly simple to do, making this problem only marginally
                more difficult than the Division-II version.
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
