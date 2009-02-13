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
<B>Single Round Match 106</B><BR/>
Thursday August 1, 2002
<P><B>Problem Set Analysis &amp; Opinion</B></P>

<P>
<B>Division-II, Level 1: Insomnia</B> (250pt)<BR/>
Submission rate - 91% (169/186)<BR/>
Success rate - 93% (158/169)<BR/>
Avg. Score - 216.78pt<BR/>
Best Score - <B>dre2xl</B>, 248.09pt<BR/>
</P>

<P>
I'll have to try this creative cure for insomnia somtime...
</P>

<P>
This problem can be simply solved by looping through all of the minutes and adding or 
subtracting sheep (+15 or -10) depending on where you are in the count.  
For the first hour, third hour, fifth hour, etc. add 15 sheep per minute.  
At all other times subtract 10 sheep per minute.  Just make sure to switch 
from +15 to -10 and vice-versa every 60 minutes.
</P>


<P>
<B>Division-II, Level 2 &amp; Division-I, Level 1: Auction</B>
</P>

<P>
Div-II (500pt)<BR/>
Submission rate - 75% (140/186)<BR/>
Success rate - 59% (83/140)<BR/>
Avg. Score - 313pt<BR/>
Best Score - <B>leibniz</B>, 440.19pt<BR/>
</P>

<P>
Div-I (250pt)<BR/>
Submission rate - 99% (106/107)<BR/>
Success rate - 79% (84/106)<BR/>
Avg. Score - 196.67pt<BR/>
Best Score - <B>b0b0b0b</B>, 241.02pt<BR/>
</P>

<P>
A clever scheme for selling "counter-intuitive math problems" to math geeks was 
described in this problem.  Given a number of email bids for a math paper, the 
task is to find the maximum possible profit, also given that the selling price 
will be equal to the maximum non-winning bid, and anyone bidding higher than the 
maximum non-winning bid will pay the non-winning bid price for the paper.
</P>

<P>
Probably the fastest and simplest way to solve this problem is to make a copy of 
the bids input, sort the copy, then iterate through the copy, looking for consecutive 
elements that are non-identical.  In the event that consecutive elements differ, 
compute the profit which would ensue from using the lower of the two elements as the 
maximum non-winning bid.  If the profit is greater than the maximum profit calculated 
so far, then store the maximum non-winning bid.  After this loop simply generate the 
output by finding all of the indices with bids greater than the maximum non-winning bid.
</P>


<P>
<B>Division-II, Level 3: Handles</B> (1000pt)<BR/>
Submission rate - 35% (66/186)<BR/>
Success rate - 23% (15/66)<BR/>
Avg. Score - 481.4pt<BR/>
Best Score - Gojira, 578.12pt<BR/>
</P>

<P>
This problem was a straightforward parsing exercise to determine the complexity of 
a given string based on 11 pre-defined rules.  None of these rules in themselves poses 
an extreme challenge, but coding all of them takes some time, and of course it only 
takes one bug to mess up your solution.  Familiarity with easy-to-use text parsing 
routines in the language of your choice would be a definite asset for solving this problem in a timely fashion.
</P>


<P>
<B>Division-I, Level 2: Dance</B> (500pt)<BR/>
Submission rate - 49% (52/107)<BR/>
Success rate - 63% (33/52)<BR/>
Avg. Score - 283.76pt<BR/>
Best Score - leibniz, 440.19pt<BR/>
</P>

<P>
TopCoders need to have fun at dances too... 
</P>

<P>
This problem asked you to find the total number of distinct combinations of 
dancing pairs, given a list of who everyone would be willing to dance with.  
The problem can be broken down by counting the number of distinct combinations 
with just 1 pair, the number of distinct combinations with 2 pairs, and so on.  
There are at most 10 elements to the input of this problem, so no more than 10 
people are willing to dance with others.  One good way to keep track of things 
for this problem (inspired by kv) would be to parse the input strings and form 
a bitmask for each of the dancers which describes which other dancers they were 
willing to dance with.  Then start an array list whose elements describe all of 
the various dance combinations.  Loop through all of the possible dancing pairs 
(in which person A is willing to dance with B and vice-versa) and if there is an  
element in the list whose bitmask does NOT indicate person A dancing with person B, 
then add an element to the list whose bitmask is the same as the previous bitmask, 
in addition to  including person A dancing with person B.  Also create an element in 
the list whose mask indicates just A dancing with B.  The total number of dance combos 
will just be the number of elements in the list.
</P>


<P><B>Division-I, Level 3: FakeCoin</B> (900pt)<BR/>
Submission rate - 23% (25/107)<BR/>
Success rate - 52% (13/25)<BR/>
Avg. Score - 515pt<BR/>
Best Score - SnapDragon, 679.06pt<BR/>
</P>

<P>
Given that one coin out of twelve is known to be a fake, how do you figure out from 
a series of balance weighings which one is the fake, and whether it is heavier, 
lighter, etc.?  dmwright came up with a rather elegant solution to this problem.  
He basically used two status flags for each coin to indicate whether or not that coin 
could be (a)"fake and heavier" or "not fake and heavier" and (b)"fake and lighter" or 
"not fake and lighter".  All status flags for all 12 coins were initialized as being both 
fake and heavier and fake and lighter.   Each of the balance readings were parsed, and the 
following steps were taken for the coins in each equation:
<OL>
	<LI><P>If a coin appears on either side of an "=" sign, then it must be real (since there can only be one fake coin) so set the flags for this coin to be "not fake and heavier" and "not fake and lighter".</P></LI>
	<LI><P>If a coin appears to the left of a "&lt;" sign or to the right of a "&gt;" sign then there is no way that it can be fake and heavier, so set the "not fake and heavier" flag for this coin.</P></LI>  
	<LI><P>If a coin appears to the right of a "&lt;" sign or to the left of a "&gt;" sign then there is no way that it can be fake and lighter, so set the "not fake and lighter" flag for this coin.</P></LI>
	<LI><P>If a coin does NOT appear to the left or right of any given "&lt;" or "&gt;" sign then it can not be a fake, once again for the reason that there can be only one fake coin. Set the flags for this coin to be "not fake and heavier" and "not fake and lighter".</P></LI>
</OL>
</P>

<P>
Once these steps are completed for each of the balance equations, enough information 
exists to solve the problem.  Count the number of fake coins by checking to see if either 
the "fake and heavier" or "fake and lighter" flags are set for each of the coins.  If the 
number of fake coins is zero, then this is obviously a contradiction of the problem statement.  
Output "CONTRADICTION".  Otherwise, output one of the following for each coin, depending on the 
status of its flags and the total number of fakes counted:
<OL>
	<LI><P>If both flags for the coin are set to "not fake and heavier" and "not fake and lighter" then this coin is obviously not a fake, so output 'R'.</P></LI>
	<LI><P>Otherwise, one of the flags indicates a fake; if there is more than one fake counted (out of 12), then you have not been given enough equations to determine which coin is the fake, so output 'U' for this coin.</P></LI>
	<LI><P>If only one fake was counted and the "fake and heavier" flag is set, output 'H'.</P></LI>
	<LI><P>If only one fake was counted and the "fake and lighter" flag is set, output 'L'.</P></LI>
	<LI><P>If only one fake was counted and both the "fake and heavier" and "fake and lighter" flags are set, you are sure the coin is a fake, but have not been given enough equations to determine whether or not it is heavier or lighter, so output 'F'.</P></LI>
</OL>
</P>

<P><BR/></P>
<IMG SRC="/i/m/Penwiper_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;Penwiper<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=150527" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
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


