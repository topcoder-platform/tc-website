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
		    <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">&#160;Comments/Ideas/Want&#160;to&#160;Write?&#160;</A></TD>
		</TR>    		
		</TABLE>
		</TD>
	</TR>               
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<B>Single Round Match 108</B><BR/>
Thursday August 12, 2002
<P><B>Problem Set Analysis &amp; Opinion</B></P>

<P>This set of problems was unusually easy, and correct solutions mostly came 
about from an ability to follow directions. Surprisingly, considering the low 
level of difficulty of the problems, only one person (out of 167) successfully 
solved the Division-II Level 3 problem. The remaining problems generally showed 
high success rates. </P>
<P>Despite the easiness of the problems, only four coders solved all three of 
their problems (all in Division-I): <B>bstanescu</B>, with a final score of 
1421.7; <B>Yarin</B> with 1347.74; <B>ZorbaTHut</B> with 1302.99; and 
<B>ShakeSpace</B> with 1077.79. In Division-II the competition was much more 
intense, with most room leaders scoring in the 600s. </P>
<B>The Problems</B><BR/><BR/>
<B>Lars</B> (value 300) <BR/>
Used as: Division-II, Level 2 :<BR/><BR/>
<P>
Submission Rate - 145/167 (86.83%) <BR/>
Success Rate - 90/145 (62.07%) <BR/>
High Score - <B>RajAjmani</B> for 297.03 points<BR/>
</P>
Reference implementation: <B>RajAjmani</B><BR/><BR/>
<B>Implementation</B>
<P>This problem is a simple matter of dealing with ASCII values of letters and 
following directions. The easiest mistakes to make were probably to use 
inclusive comparison operations rather than exclusive operations (e.g., 
<TT>length &gt;= 20</TT> as opposed to <TT>length &gt; 20</TT>). </P>

<B>StemChange</B> <BR/>
Used as: Division-II, Level 2 (Value 500):<BR/><BR/>
<P>
Submission Rate - 118 / 167 (70.66%)<BR/>
Success Rate - 87 / 118 (73.73%)<BR/>
High Score <B>UFP2161</B> for 400.96 points 
</P>
Used as: Division-I, Level 1 (Value 250):<BR/><BR/>
<P>
Submission Rate - 91 / 96 (94.79%)<BR/>
Success Rate - 77 / 91 (84.62%)<BR/>
High Score - <B>radeye</B> for 241.83 points 
</P>
Reference implementation: <B>radeye</B> <BR/><BR/>
<B>Implementation</B>
<P>This problem was a good demonstration of how crazy natural languages tend to 
be. Like the previous problem, solving this problem was primarily a matter of 
carefully following directions. The problem provided the necessary data 
structure. </P>
<P>If the conjugation is singular and not third-person, the stem change needs to 
be performed. This consists of locating the next to last vowel in the word (a 
simple linear search from the end of the word) and replacing it with the given 
replacement. It is then a simple matter of dropping the last two characters and 
appending the proper ending obtained from one of the given tables. </P>
<B>Packyman</B> <BR/> Used as: Division-II, Level 3<BR/><BR/>Reference 
implementation: <B>fiddlybit</B> <BR/><BR/>
<B>Implementation</B>
<P>Only once before have I noticed an event where only one coder successfully 
solved a particular problem. It's rather surprising that this was the case with 
this particular problem. The logic of the solution is reasonably simple. One has 
to be able to compute the result of pitting one Packyman against another, and 
then return the Packyman with the three highest scores. </P>
<P>The former task consists of accumulating a bonus percentage by iterating 
through the four type combinations (primary and secondary types between two 
opponents). This could be simple cut and paste coding, as in fiddlybit's 
solution. </P>
<P>The latter task consists if imposing the prescribed ordering on the Packymen, 
once you've computed how they would fare against their opponents. Once the best 
three have been selected, sort them by name and return them. </P>
<B>WordSearch</B> (Value 450) <BR/>
Used as: Division-I, Level 2 :<BR/><BR/>
<P>
Submission Rate - 73 / 96 (76.04%)<BR/>
Success Rate - 19 / 73 (26.03%)<BR/>
High Score - <B>ZorbaTHut</B> for 369.81 points 
</P>
Reference implementation: <B>ZorbaTHut</B> <BR/><BR/>
<B>Implementation</B>
<P>This problem poses an interesting slant (if you will pardon the pun) on word 
searches. The problem is to locate an occurance of a word where each successive 
letter of that word occurs in a fixed distance in a particular direction from 
the preceding letter. Furthermore, there is a restriction on what this distance 
can be: it must be the minimum distance between lattice points intersected by 
the line formed by the letters. </P>
<P>In other words, one needs to iterate through all the reasonable slopes that 
can be constructed from two relatively prime values. That is, each slope is 
constructed from two values, <TT>dx</TT> and <TT>dy</TT>, representing offset in 
columns and rows respectively between each letter. These two values then 
describe how a successive letter in the word will be reached. The reason that 
these values must be relatively prime is that, if they are not, then the line 
segment described will intersect at least one lattice point before the 
successive letter is reached. </P>
<P>As the search area is of finite size, there are a finite number of reasonable 
relatively prime pairs that we can form. Our values for <TT>dx</TT> and 
<TT>dy</TT> each must be between <TT>1</TT> and <TT>20</TT> inclusive, and there 
can only be far fewer than <TT>400</TT> possible directions. </P>
<P>For each combination of direction <TT>(+/-dx, +/-dy)</TT> and location 
<TT>(x, y)</TT> in the puzzle, we check to see if the word exists there. The 
direction tells us how to increment/decrement <TT>x</TT> and <TT>y</TT> between 
each successive letter in the word. As long as we are careful about not going 
out of bounds, it is easy to determine if the word exists at a particular 
location in a particular orientation. We must also not forget to deal with the 
horizontal and vertical directions, represented by <TT>(+/-1, 0)</TT> and 
<TT>(0, +/-1)</TT> respectively. </P>
<B>LeftMoves</B> (Value 900) <BR/>
Used as: Division-I, Level 3 :<BR/><BR/>
<P>
Submission Rate - 32 / 96 (33.33%) <BR/>
Success Rate - 18 / 32 (56.25%) <BR/>
High Score - <B>bstanescu</B> for 687.40 points 
</P>
Reference implementation: <B>bstanescu</B> <BR/><BR/>
<B>Implementation</B>
<P>Despite its added complexity, this problem is still nothing more than a 
simple optimal-path-through-a-maze finding problem. This can be easily tackled 
with a breadth-first search. In this case, distance becomes a tuple <TT>(keys, 
leftMoves)</TT>, giving simultaneously minimum number of keys required and the 
minimum number of left moves for that number of keys. Initially we know the 
distance to any 'V' location is <TT>(0, 0)</TT>, and it is easy update the 
minimum distance to each of its neighbors. We then repeat the process for each 
updated neighbor in the next step. We continue this until no more updates occur. 
At this point we will know the minimum distance from some 'V' location to the 
'W' location (or, if this distance was never updated, it will be some preset 
value representing infinity). </P>








<IMG SRC="/i/m/Logan_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;Logan<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=112902" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
          <P><BR/></P>


<!-- <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="100%">
 	<TR>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
	<TR><TD COLSPAN="2" BGCOLOR="#43515E" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
	<TR>
		<TD VALIGN="top" BGCOLOR="#43515E" CLASS="moduleTitle">&#160;</TD>
		<TD BGCOLOR="#43515E" VALIGN="top" CLASS="moduleTitle">COMMENTS</TD>
	</TR>                                   
</TABLE>

          <P><BR/></P> -->          
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


