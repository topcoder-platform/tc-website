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
<B>Single Round Match 110</B><BR/>
Tuesday, August 27, 2002
<P><B>Problem Set Analysis &amp; Opinion</B></P>

<P>
<B>Division II - Level 1 : Handle (250pt)</B>
</P>

<P>
This was a nice easy warm-up exercise for most people to get their fingers moving. You basically had to code for two possible situations: either a) both testers voted for the same handle, in which case you merely return that handle, or b) the testers voted for different handles, in which case you loop through the myPreferences array and return the first element of myPreferences that matches either vote1 or vote2. 
</P>


<P>
<B>Division-II - Level 2 &amp; Division-I - Level 1 : Saxophone</B> 
</P>

<P>
This problem probably should have been worth about 250 pt in Div-II, and should not have appeared in Div-I at all.  All you have to do is loop through all of the check values, find the maximum value, and record the check number for this maximum value.  Since you know that the collection of check numbers constitutes a set of consecutive numbers, and that the number of the check value that you are looking for appears sequentially after the number of the check for the maximum value; all you have to do is return the check value whose index in the check numbers array corresponds to the check number that is one greater than the check number for the maximum value. 
</P>



<P>
<B>Division-II - Level 3 : CardGame (1000pt)</B>
</P>

<P>
An interesting dichotomy of solutions arose for this problem: C++ coders almost exclusively made use of the next_permutation function to loop through all of the possible card permutations (up to 10! or 3.6 million) and choose the correct one.  Java coders had to do a bit more thinking; they generally examined the order of the cards presented, and calculated the permutation number directly.  
</P>

<P>
Regardless, everyone who solved this problem correctly came up with some form of scoring system for each of the cards.  An easy way to assign values to the cards would be to give 0 points for clubs, 13 points for diamonds, 26 points for hearts and 39 points for spades.  Then add on the numeric value of the card (from 1 to 13) to give you a total ranging from 1 to 52 that is unique for each of the 52 cards.
</P>

<P>
If you were coding in C++, the fastest way to solve this problem would be to use two integer vectors.  The first vector holds the values of the cards as given and the second holds the values of the cards sorted in increasing order.  Then loop through all of the possible permutations of the sorted vector (while incrementing a counting variable), using the next_permutation function until the sorted vector matches the first vector.  Once they match, simply return the value of the counting variable.
</P>

<P>
If you were coding in Java, the best approach would probably be to represent the cards you are given in the form of a zero-based index value for each card.  For example, for four cards your sorted indices would be 0,1,2,3 and the indices of the hand you're given might be 0,3,2,1.  The tricky part is to figure out what permutation number corresponds to the hand that you're given.  All of the Java solutions that I saw did something like this:
</P>

<OL>
	<LI> Setup an array of sorted indices, ex: 0,1,2,3</LI>
	<LI> Setup an array of given indices, ex: 0,3,1,2</LI>
	<LI> Set PermutationNumber to 0 and loop counter i to 0,  then do the following:</LI>
<OL>
	<LI> PermutationNumber+=(index of card i in sorted array)*((n - i -1)!)</LI>
	<LI> Remove card i from sorted array.</LI>
	<LI> i++, if i==n-1 then exit loop, otherwise go back to step 3.1.</LI>
</OL>
	<LI> Return PermutationNumber+1.</LI>
</OL>


<P>
<B>Division-I - Level 2 : Router (500pt)</B>
</P>

<P>
This problem required a fairly careful reading of the problem statement in order to understand exactly the description of the packet routing protocol. To summarize, you are required to find the number of packets forwarded for a collection of hosts that use the same router. Each host starts by trying to send some known number of packets to the router in sequential order. The router can store up to bufferCap packets and can forward up to forwRate packets per turn.  If a host tries to send too many packets (the remaining space in the buffer is less than what the host is trying to send) the extra packets get dropped and the buffer is completely filled. It is necessary to keep track of which host sent what to the buffer, since when the packets are later forwarded it will be necessary to know whose packets are being forwarded. Once packets are forwarded they are removed from the buffer, and the appropriate counts of the numbers of forwarded packets must be updated for the various hosts. It is also necessary to remember that unless a host loses packets on any given turn, it will try to send one additional packet on the next turn. If a host loses n packets it will send (n+1)/2 packets  on the next turn.
</P>

<P>
Basically this problem boils down to a rigorous test of your array-index accounting skills. Just loop through all of the time units and keep track of who put what in the buffer, and what gets forwarded out of the buffer each turn.  A nice elegant example of how to do this is shown in <B>Ambrose</B>'s solution.
</P>


<P>
<B>Division-I - Level 3 : GlassBalls (1000pt)</B>
</P>

<P>
All of the successful solutions to this problem used dynamic programming to compute the "worst-case" number of ball drops required to find the building level beyond which balls will break. For the case in which only one ball is available, the solution is trivial, namely the number of floors in the building, since we can only "re-drop" balls that have not been broken and it will be necessary to try the single ball on the 1st floor, the 2nd floor, and so on, until it either breaks or gets dropped from the top of the building. In the worst case we have to take the ball right up to the top of the building.  
</P>

<P>
For 2 or more balls however things become more interesting. All of the successful solutions contained an equation or algorithm that appeared something like this:
</P>

<P>
<PRE>f (ballnum, dropnum) = f(ballnum,dropnum-1) + f(ballnum-1,dropnum-1) + 1</PRE>
</P>

<P>
where f refers to the size of a building in floors that can be handled by an optimal strategy employing ballnum balls and dropnum drops. This just says that the size of a building that you can handle with ballnum balls and dropnum drops is equal to the size of a building that you can handle with the same number of balls and one less drops plus the size of a building that you can handle with one less balls and one less drops plus one additional floor. After you think about it for a while, it does indeed make sense... 
</P>

<P>
Usage of the above algorithm of course requires that you initialize your values for the case of ballnum=1 to the trivial solution, i.e. f(1,x) = x.
</P>



<IMG SRC="/i/m/Penwiper_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;Penwiper<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=150527" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
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



