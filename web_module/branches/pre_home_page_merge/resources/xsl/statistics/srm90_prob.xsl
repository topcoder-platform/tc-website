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
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm90_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyText">Editorial Archive</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm90_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm90_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
		</TR>
		<TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>    		
		</TABLE>
		</TD>
	</TR>
 	<TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<P><B>Single Round Match 90</B><BR/>
May 21, 2002</P>
<P><B>Problem Set Analysis &amp; Opinion</B></P>

<P>
The Level One was simply to write the algorithm they described - not hard at all. One could 
keep a "current index" for the roaster and move it forward, or simply calculate it at each point 
with a modulus. Probably the hardest part was the formatting for the output. 
<A HREF="/stat?c=member_profile&amp;cr=152347" CLASS="bodyGeneric">ZorbaTHut's</A> 
solution used the C++ sprintf() function, while 
<A HREF="/stat?c=member_profile&amp;cr=270505" CLASS="bodyGeneric">John Dethridge</A> did the conversion by hand. 
For Java, <A HREF="/stat?c=member_profile&amp;cr=154754" CLASS="bodyGeneric">kv's</A> solution 
demonstrates a clever solution - adding 256 to it, thereby forcing 
a 0 in the second place if it's less than 16, converting it to hex, and chopping the first 
character off. <B>kv's</B> solution was also the fastest.
</P>

<P>
The Level Two, on the other hand, was a simple simulation - follow the instructions, code the 
program. Keep an array of everyone's score, keep track of the current "3-man", current player, 
and current place in the pickValues, and just do it. You could code it slightly faster if you 
realized that "add one to everyone's score" didn't actually need to be done - since all you 
care about is the lowest score, obviously writing that isn't going to change anything. 
<A HREF="/stat?c=member_profile&amp;cr=269554" CLASS="bodyGeneric">Yarin's</A>
 solution, the fastest, is also quite easy to read.
</P>

<P>
As for the Level Three, only two solutions survived - <B>John Dethridge's</B> and
<B>ZorbaTHut's</B> - and both of them are basically unreadable, though I believe
John's is slightly better than mine. I don't know what his solution involves - however, 
I'll try to explain mine a little bit. I've got it set up to organize the components by 
name, not by adding ID numbers or anything, and the pin identifiers I used are, in fact, 
the same ones used in the input. (I was slightly worried about speed, but I didn't think 
it would be an issue - it wasn't.)
</P>

<P>
First I simplified the wiring into what I termed "melanges" - a pretty lousy term overall, 
but it serves its purpose. If A is connected to B, and B is connected to C, then logically 
speaking, A is connected to C also. Therefore, I don't care about the internal setup; I only 
care what's contained in the "networks" that are connected to each other. So I went through 
and found what all the connections were in each group - start with the "first" wire in the 
group, then add more things if they're directly connected until you've passed through the 
entire remaining wires once without having to add anything. Repeat until all the wires are 
in one group or another. The random_shuffle is simply to get rid of a potential worst-case 
scenario - it may have been unnecessary, but I didn't feel it worth the risk.
</P>

<P>
After that, I went through and parsed all the components, connecting each pin to a melange. 
I'd already defined "melange 0" as "nothing connected", and therefore undefined - the real 
melanges started at #1. This meant I could use C++'s std::map to default to 0, since that's 
the behavior if you access something that doesn't yet exist.
</P>

<P>
Once all the pins were connected, I simply started at the output component (which I'd 
stored when parsing the components) and recursively descended down. Calculating a melange, 
I started with the first output pin it was connected to and set the overall melange to that. 
Then I went through the rest of the output pins, and if any conflicted with its current value, 
I set it to UNDEFINED. An output pin was obviously a recursive call of its own - AND gates and 
OR gates were calculated according to the given rules, using their own melanges as input. 
Through all this I cached the results to avoid speed problems. I did INPUTs simply as 
precached results, with no logic behind them to recalculate them otherwise.
</P>

<P>
And then it was just a matter of translating from the constant values I'd come up with 
to the output strings, and that was the solution.
</P>

<IMG SRC="/i/m/ZorbaTHut_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;ZorbaTHut<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/stat?c=member_profile&amp;cr=152347" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
          <P><BR/></P>
          
<!-- <P><B>Member Comments</B></P> 

          <P><BR/></P>-->
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
    <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
		<TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- <A HREF="/index?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/></A> -->
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


