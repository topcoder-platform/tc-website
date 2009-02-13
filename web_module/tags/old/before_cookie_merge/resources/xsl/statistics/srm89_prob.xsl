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
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="250" ALIGN="right">
 	<TR>
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
	<TR><TD COLSPAN="2" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
	<TR>
		<TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle">&#160; &#160;</TD>
		<TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">MATCH EDITORIAL LINKS:</TD>
	</TR>                    
	<TR>
    	<TD COLSPAN="4" VALIGN="top" BGCOLOR="#999999">
		<TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#CCCCCC">
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm89_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyText">Editorial Archive</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm89_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm89_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm89_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
			<TD VALIGN="top" CLASS="bodyText">&#160;</TD>
		</TR>
		<TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>    		
		</TABLE>
		</TD>
	</TR>
 	<TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<P><B>Single Round Match 89</B><BR/>
May 18, 2002</P>
<P><B>Problem Set Analysis &amp; Opinion</B></P>

Single Round Match 89 offered a nice diversity of problems, ranging from some simple
mathematics to digital picture processing techniques to some advanced graph theory.
Thus there is much to be learned from this match.<BR/><BR/>
Division 1 coders faired rather poorly, most likely because of misleading point values
and difficult problems.<BR/><BR/>
<DT><B>Div. 2, Level 1: Average</B></DT>
The solution to <TT>Average</TT> was exactly as it seemed: compute the average, and count the number
of children whose total scores were below average.  Common mistakes on this problem were:
<UL>
    <LI>integer division when computing the average</LI>
    <LI>casting the average to an integer</LI>
</UL>
<BR/>
Whenever using the <TT>/</TT> operator, keep in mind that it will be integer division if both
of its operands are of integral types (even when assigning to a <TT>float</TT> or <TT>double</TT>.
Thus, to force floating point division, cast at least one of the arguments to a floating point
type.
<BR/><BR/>
<DT><B>Div. 1, Level 1 / Div. 2, Level 2: Powerful</B></DT>
<DD>
The definition of <TT>Powerful</TT> was to find the largest integer <TT>k &gt; 1</TT> such that
<TT>b</TT><SUP><TT>k</TT></SUP> = <TT>n</TT> for some integer <TT>b</TT> and the given integer <TT>n</TT>.
The main trick to this problem was reducing the search space, and then performing some sort of search
in the reduced search space.  One method was to observe that, since <TT>b &gt; 1</TT> must hold, the
maximum value of <TT>k</TT> must be <TT>log</TT><SUB>2</SUB> <TT>n</TT>.  Given the upper limit of
<TT>n</TT>, we know that <TT>k &lt;= 30</TT>.  Thus one only had to iterate <TT>k</TT> from
<TT>2</TT> to <TT>30</TT> inclusive, and obtain the largest <TT>k</TT> for which
<TT>n</TT><SUP><TT>1 / k</TT></SUP> is an integer (if any).
The main problem with this method was determining <TT>b</TT> from <TT>k</TT>.  Mathematically
this works out to <TT>b = n<SUP>1 / k</SUP></TT>, which is difficult to compute accurately due
to the inability to represent <TT>1 / k</TT> accurately in floating point for most values of <TT>k</TT>.
<BR/><BR/>
Another method was to observe that, since <TT>k &gt; 2</TT> must hold, the maximum value of
<TT>b</TT> is <TT>sqrt(n)</TT>.  This gives an upper bound of <TT>14142</TT>.  For each <TT>b</TT>
between <TT>1</TT> and <TT>14142</TT> inclusive, iterate through the powers <TT>k</TT> of <TT>b</TT>
until <TT>b<SUP>k</SUP> &gt;= n</TT>.  The first <TT>b</TT>, <TT>k</TT> that we find that satisfies
<TT>b<SUP>k</SUP> = n</TT> (if we iterate through values of <TT>b</TT> in ascending order) will be
our answer.
<BR/><BR/>
The most common problems were fencepost errors (upper bounds off by <TT>1</TT>) and floating point
instability (particularly the problem related to the first method described above).
</DD>
<BR/><BR/>
<DT><B>Div. 2, Level 3: Filter</B></DT>
The <TT>Filter</TT> problem in Division 2 is an interesting problem in that it represents a common digital 
picture processing operation called <A HREF="http://www.dai.ed.ac.uk/HIPR2/open.htm" CLASS="bodyText">opening</A>. 
The open operation takes an input image and a <A HREF="http://www.dai.ed.ac.uk/HIPR2/strctel.htm" CLASS="bodyText">structuring element</A>, 
which defines the effect of the opening. The opening operator is defined as an <A HREF="http://www.dai.ed.ac.uk/HIPR2/erode.htm">erosion</A> 
of an image using the structuring element followed by <A HREF="http://www.dai.ed.ac.uk/HIPR2/dilate.htm">dilation</A> 
using the same structuring element. Follow the links given for good definitions, discussions, and examples of these operations.
<BR/><BR/>
The <TT>Filter</TT> problem is equivalent to opening the input image with the following
structuring element (with origin at the center):<BR/><BR/>
<DIV ALIGN="center">
<TABLE WIDTH="30%" BORDER="1" CELLSPACING="0" CELLPADDING="4">
<TR>
	<TD ALIGN="center" CLASS="bodyText">0</TD>
	<TD ALIGN="center" CLASS="bodyText">1</TD>
	<TD ALIGN="center" CLASS="bodyText">0</TD>
</TR>
<TR>
	<TD ALIGN="center" CLASS="bodyText">1</TD>
	<TD ALIGN="center" CLASS="bodyText">1</TD>
	<TD ALIGN="center" CLASS="bodyText">1</TD>
</TR>
<TR>
	<TD ALIGN="center" CLASS="bodyText">0</TD>
	<TD ALIGN="center" CLASS="bodyText">1</TD>
	<TD ALIGN="center" CLASS="bodyText">0</TD>
</TR>
</TABLE>
</DIV>
<BR/><BR/>
The easiest method would be to simply implement the erosion and dilation operators for the structuring element above.
Each could be implemented as a local operator -- that is, a function that, given an image and a location in that image,
returns a pixel value to be placed in the same location in a new image.  The erosion and dilation operators are then:<BR/><BR/>
<DIV STYLE="background: #eee; color: black; padding: 0.1ex 1ex 0.1ex 1ex;">
<PRE>
/* a representation of which pixels are turned on in our structuring element */
int[][] offsets = { { 0, 0 }, { 0, 1 }, { 0, -1 }, { 1, 0 }, { -1, 0 } };

/* pixels outside the image are off */
boolean get_pixel(boolean[][] image, int r, int c)
{
    return r &gt;= 0 &amp;&amp; c &gt;=0 &amp;&amp; r &lt; image.length &amp;&amp; c &lt; image[0].length &amp;&amp; image[r][c];
}

boolean erosion_operator(boolean[][] image, int r, int c)
{
    for(int i = 0; i &lt; offsets.length; i++)
        if(!get_pixel(image, r + offsets[i][0], c + offsets[i][1]))
            return false;
    return true;
}

boolean dilation_operator(boolean[][] image, int r, int c)
{
    for(int i = 0; i &lt; offsets.length; i++)
        if(get_pixel(image, r + offsets[i][0], c + offsets[i][1]))
            return true;
    return false;
}
</PRE>
</DIV><BR/><BR/>
In general solutions to this problem could be seen as some sort of variant of an opening.<BR/><BR/>
<BR/><BR/>
<DT><B>Div. 1, Level 2: HexGolf</B></DT>
The <TT>HexGolf</TT> problem was to find the minimum number of strokes it would take to move a ball to a particular 
position in a hexagonal grid.  For each stroke one can choose from a set of clubs, each of which moves the ball a 
certain distance in any direction parallel to one of the three axes of the hexagonal grid. We are given an upper 
bound of <TT>5</TT> strokes; if the hole cannot be reached in <TT>5</TT> strokes or less, <TT>-1</TT> is returned.
<H4>Algorithm</H4>
The solution consists of performing a breadth-first search.  This consists of maintaining a <I>frontier</I> of all the 
possible locations the ball can be at after <TT>k</TT> strokes.  Initially the ball is somewhere in the tee area.  For 
each stroke, we generate a new frontier from the previous one.  For each location in the frontier, we iterate through 
each club and each direction and compute the location the ball would be at if we struck it with that club in that 
direction.  This new location then goes into the new frontier.  If the new location is where the hole is, we return 
the number of strokes it took to get there. Since this is a breadth-first search, the first solution we find will 
by definition be the one of minimum strokes.
<BR/><BR/>
There are at most <TT>5</TT> clubs, and exactly six directions.  Thus for each location in an old frontier we will 
generate at most <TT><SUP>6n</SUP></TT> new locations for <TT>n</TT> clubs. If there are <TT>x</TT> locations in the old 
frontier, we will obtain at most <TT>6nx</TT> locations in the new frontier.
<BR/><BR/>
Since the complexity of our solution is exponentially proportional to the size of the initial frontier, we want it to 
be <TT>1</TT>. However, we are given as input an area about the origin in which the ball may start.  If we were to use 
this entire area as the initial frontier, our solution would fail to finish in time (and would consume too much memory). 
The upper bound on <TT>teeSize</TT> is <TT>10000</TT>, and <TT>60000<SUP>5</SUP></TT> happens to be a very large number.
<BR/><BR/>
The trick, instead, is to think of the effect of translating the ball to some location within the tee area from 
the origin. We can think of our solution as generating a set of paths (of length less than or equal to <TT>5</TT>) 
through the hexagonal grid. Suppose we have a set of paths originating at the origin (that is, our BFS computed with 
the origin as the only element of the initial frontier).  If we were to translate the ball along the east and southeast 
axes, the effect would be to translate each point in each path in the exact same manner.
<BR/><BR/>
Therefore we can see that there is no point in adding all the points within the tee area to our initial frontier. 
Instead, all we have to do is translate our tee area so that it is centered at each location we reach, and see if the 
hole lies within the tee area.  In other words, for each location we reach, instead of checking if it is the same 
location as the hole, we check if it is within a distance of <TT>teeArea</TT> from the hole.
<BR/><BR/>
So, we begin with a frontier of size <TT>1</TT> and build at most <TT>5</TT> frontiers. Therefore, in the worst-case 
scenario, we will visit <TT>(6n)<SUP>5</SUP> = 7776n<SUP>5</SUP></TT> locations. For <TT>n = 5, </TT> this is 
<TT>7776 * 3125 = 2425000</TT>, meaning that this solution is tractable given its constraints.
<H4>Implementation</H4>
The only real difficulty in implementing the above algorithm is working with the hexagonal coordinate system. For 
representing locations, we will use the same method as that of representing the hole location: a coordinate pair 
<TT>(e, se)</TT> representing a distance of <TT>e</TT> travelled east followed by a distance <TT>se</TT> travelled 
southeast.  Let the location of the hole be <TT>(e<SUB>0</SUB>, se<SUB>0</SUB>)</TT>. We need a way of computing 
the minimum radius of a hexagon centered at <TT>(e<SUB>0</SUB>, se<SUB>0</SUB>)</TT> that contains <TT>(e, se)</TT>. 
To do this, we first find <TT>(e', se') = (e, se) - (e<SUB>0</SUB>, se<SUB>0</SUB>)</TT>. If <TT>e'</TT> and 
<TT>se'</TT> have the same sign, the minimum radius is <TT>|e' + se'|</TT>. Otherwise, the minimum radius is 
<TT>max(|e'|, |se'|)</TT>.  If this minimum radius is less than or equal to <TT>teeArea</TT>, we have hit the hole.
<BR/><BR/>
Most people in fact implemented a depth-first search rather than a breadth-first search, as it is easier to 
implement and requires much less memory.  For this problem, a DFS is equivalent to an exhaustive BFS, so its runtime 
complexity is equivalent to that of the worst-case BFS. Since the DFS implementation requires no maintenance of a 
queue, it is obviously the fastest solution to implement.
<BR/><BR/>
<DT><B>Division 1, Level 3: Buddy</B></DT>
Despite its modest value (<TT>900</TT> points), this was easily one of the most difficult problems ever posed in a 
TopCoder competition.  This problem can be reduced to that of finding the minimum-weight bipartite matching (if any).
<BR/><BR/>
Since I was unable to solve this problem myself, I looked to the few submissions that passed the system tests to see 
how others approached the problem.  There seemed to be two types of solutions: either a depth-first search or a graph 
theoretic solution.
<H3>Depth-First Search</H3>
<H4>Algorithm</H4>
The first step is to precompute the number of row-pairings one can get for any row-pairing configuration. A row-pairing 
configuration can be represented as a binary string, such as <TT>"1100"</TT> for a row of length 4. A <TT>1</TT> bit 
represents a child that is paired with someone in the same row, while a <TT>0</TT> bit represents either an adult or a 
child paired with someone in the same column.  We mark as invalid configurations that do not describe a valid 
row-pairing (e.g. <TT>"1101"</TT> is invalid because the right-most child is not actually paired with anyone); 
otherwise we count the number of pairs in the configuration (e.g. <TT>"1100"</TT>, <TT>"0110"</TT>, and <TT>"0011"</TT> 
each represent <TT>1</TT> pair, and <TT>"1111"</TT> represents two pairs.
<BR/><BR/>
Now we can recursively generate all valid pairings in the square of kids, subject to the constraints of the problem. We 
do this by working from the bottom row up (or the top row down).  For each row, we have a mask which consists of the 
locations occupied by adults or by children paired with children in the previous row. We then iterate through each 
valid row-pairing configuration.  If the configuration does not contain any pairs that occupy the same locations as 
adults or children paired with someone in the previous row, then we generate a new mask and recursively move on to the 
next row.  If we visit all the rows and end up with an empty mask, then we have a valid pairing for all the kids.  We 
can count the number of row-pairs as we go along, and then remember the maximum value found when a valid pairing was 
reached.  Thus our counting function looks something like:
<BLOCKQUOTE>
<PRE>
int numpairs[1 &lt;&lt; n];
int adults[n];
int best = -1;

void count(int row, int mask, int running_total)
{
    if(row == -1) {
        if(mask == 0 &amp;&amp; running_total &gt; best)
            best = running_total;
        return;
    }
    for(int i = 0; i &lt; (1 &lt;&lt; n); i++)
        if(numpairs[i] != INVALID &amp;&amp; fits(i, mask | adults[row]))
            count(row - 1, (1 &lt;&lt; n) - 1 - (i | mask | adults[row]));
}

count(n - 1, 0, 0);
return best;
</PRE>
</BLOCKQUOTE>
Keep in mind that <TT>x &lt;&lt; y</TT> is equivalent to <TT>2<SUP>y</SUP>x</TT>.
<H4>Implementation</H4>
Yarin's solution is an excellent implementation of this algorithm, using bitwise operators to handle all the 
configuration representations and masks.  There are <TT>2<SUP>n</SUP></TT> row-pairing configurations (many of which 
are invalid).  These can be represented as an array indexed by an integer whose binary representation is also that of 
the configuration.  The values stored in the array are then the number of row-pairs in each configuration (or some 
special value to represent invalid configurations).
<BR/><BR/>
The binary representation of an integer can also represent a parent mask or the mask derived from a previous row's 
configuration.  If applying the bitwise and operation to a row-configuration and either of these masks results in a non-zero 
value, then that particular row-configuration does not fit the constraints.  Otherwise the mask for the next row 
can be obtained by taking applying a bitwise or operation to the row configuration and the two masks and computing 
the complement of that value (i.e., <TT>~(rowconfig | parentmask[row] | mask)</TT>). We add to our running sum the 
number of pairs defined by the row configuration, and recurse to the next row. If there is no next row, and our new 
mask is <TT>0</TT>, we remember our sum of row-pairs if it is greater than the best value obtained so far.
<BR/><BR/>
For further optimization, we need to employ memoization techniques for our recursive function.  Since it takes as 
parameters <TT>0 &lt;= row &lt; n</TT> and <TT>0 &lt;= mask &lt; 2<SUP>n</SUP></TT>, we can create an array of 
dimension <TT>n</TT> x <TT>2<SUP>n</SUP></TT> for remembering values. 
<H3>Graph Theoretic</H3>
The group of children can be represented as a graph, where each child is a vertex and there is an edge between each 
pair of adjacent children.
It turns out that this graph is a <A HREF="http://planetmath.org/encyclopedia/BipartiteGraph.html" CLASS="bodyText">bipartite graph</A>. 
A bipartite graph consists of two sets of vertices (we will call them <I>V</I><SUB><TT>1</TT></SUB> and <I>V</I><SUB><TT>2</TT></SUB>), 
such that within each set there exists no adjacent vertices.  If we were to place the children onto a chessboard, 
<I>V</I><SUB><TT>1</TT></SUB> would consist of children standing on white squares and <I>V</I><SUB><TT>2</TT></SUB> 
would consist of children standing on black squares.
<BR/><BR/>
The definition of the problem gives that each child (vertex) should have at most one partner (edge) (to be valid, every 
child should have exactly one partner, but we will get to that shortly). In graph theoretic terms, this is what is 
known as a <I>matching</I>, which is a set of edges such that no vertex included more than once.  It follows then that 
any pairing of children (even if incomplete) is a bipartite matching.
<BR/><BR/>
A <I>maximum bipartite matching</I> is the matching of maximum cardinality of a bipartite graph. If the maximum 
bipartite matching gives <TT>(n<SUP>2</SUP> - adults) / 2</TT> edges, then there exists a way to pair up all of the 
children. Although simply finding a maximal bipartite matching is insufficient to solve this problem, it might be 
helpful to demonstrate how one might be found.
<BR/><BR/>
The maximum bipartite matching problem can be reduced to the network flow problem. Then attach a source vertex to all 
of the vertices in <I>V</I><SUB><TT>1</TT></SUB> and a sink vertex to all of the vertices in <I>V</I><SUB><TT>2</TT></SUB>. 
Give each edge a capacity of <TT>1</TT>.  The Ford-Fulkerson algorithm or some other flow maximization algorithm can then 
be employed to obtain a maximum flow.  The edges utilized in the maximum flow then constitute the maximum matching.
<BR/><BR/>
However, we cannot stop at simply obtaining a maximal bipartite matching.  We need the matching that gives the most 
horizontal pairings.  To obtain this, we must assign weights to edges in the bipartite graph.  Unfortunately, once we 
do this, we can no longer use the network flow algorithm to solve the problem.  For each edge that is horizontal 
(between children on the same row), we assign a weight of <TT>1</TT>.  Otherwise we assign a weight of <TT>0</TT>. 
The weight of the bipartite matching with the maximum cumulative weight then gives us the answer.
<BR/><BR/>
The solution we need for this particular problem is the solution to the maximum weighted bipartite matching problem, 
also known as the <I>assignment problem</I>.  One algorithm that solves this problem is known as the
<A HREF="http://www.math.uwo.ca/~mdawes/courses/344/kuhn-munkres.html" CLASS="bodyText">Kuhn-Munkres algorithm</A> (also described 
<A HREF="http://www.math.uwo.ca/~mdawes/courses/344/kuhn-munkres.pdf" CLASS="bodyText">here</A>).<BR/><BR/>

<IMG SRC="/i/m/Logan_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;Logan<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/stat?c=member_profile&amp;cr=112902" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
          <P><BR/></P>
          
<P><B>Member Comments</B></P>

<P>Just wanted to comment that the SRM 89 Problem Set Analysis was fantastic! Very 
detailed, and a great analysis of the correct algorithms involved. Keep up the 
good work!</P>

<P><A HREF="/stat?c=member_profile&amp;cr=154075" CLASS="bodyGeneric">BlueTDimly</A></P>
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


