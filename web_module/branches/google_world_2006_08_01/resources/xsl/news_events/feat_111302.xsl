<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/pr_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder Feature: King of the Silicon Hill: Today's High-End Microprocessors</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY>
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
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
  <xsl:with-param name="image">press_room</xsl:with-param>
  <xsl:with-param name="title">&#160;TopCoder Feature</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>          
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="21" BORDER="0"/></TD></TR>						
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">
<!-- <IMG SRC="/i/f/feat_050102_tn3.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="3" ALIGN="right" BORDER="0"/> -->

<P><FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>King of the Silicon Hill:<BR/>Today's High-End Microprocessors</B></FONT><BR/>
<!-- <I>"If you take it slow you'll move up."</I><BR/><BR/> -->
Wednesday, November 13, 2002<BR/>
By&#160;RevenantChaos,<I>TopCoder Member</I><BR/>
</P>

<P>
All of the optimizations in the world are nothing compared to one simple truth: your code is only as good as the microprocessor 
that's chewing on it.  In the CPU game, there are two (well, maybe three) major players: AMD, Intel, and (if you're feeling generous) Cyrix.
</P>

<P>
AMD is best known for its high-end "Athlon" line (which utilizes the Thoroughbred core), which currently is topped by the 
XP 2600+ at 2.133 gigahertz.  The XP 2800+ is currently being launched.  AMD also produces the performance "Duron" line 
(which employs the Morgan core) and is in the process of getting a new set of processor lines on the market.  
AMD's processors consistently benchmark at the top of the pack, as will be demonstrated below.
</P>

<P>
Intel, which is AMD's major competition largely because of their advertising budget and deals with prefab system makers, 
produces the Pentium line, which is currently in its fourth generation.  The Pentium IV line tops off at 2.53 gigahertz; 
a 2.8Ghz model has enjoyed a paper release, but isn't really in circulation yet.  They also produce the Celeron line, 
which more or less consists of Pentiums minus most of their cache.  Intel also makes some specialty lines, such as the 
expensive Xeon server processor line.
</P>

<P>
There are three major differences between the Intel and AMD lines.  First, the Intel processors tend to reach 
significantly higher clock speeds.  Also, the Intels have significantly higher FSB speeds; however, there is 
debate as to whether or not it really detriments much from the AMD chips' relative performance.  Finally, the 
AMD processors tend to be much more efficient per cycle.  An Intel machine might complete up to 2.5 billion 
cycles per second compared to an AMD-based system's 2.13 billion, but the AMD tends to get an appreciably larger 
amount of work done with each cycle.  Also, the top-of-the-line AMD chip is over a hundred dollars less expensive 
than the top-of-the-line Pentium IV.
</P>

<P>
Van's Hardware has developed a set of third-party independent benchmarks, and this suite provides a perfect example 
of how the two chipmakers' products fare against each other.  These were run on a Windows XP system, using the 
2.13-gigahertz Athlon (the XP 2600+) and the 2.5-gigahertz Pentium 4.
</P>

<P>
<B>Benchmarks from Van's Hardware</B> (<A HREF="http://www.vanshardware.com" CLASS="bodyText" TARGET="_blank">www.vanshardware.com</A>)
</P>


<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#CCCCCC" WIDTH="100%" CLASS="bodyText">
	<TR>
		<TD HEIGHT="15" VALIGN="middle" BGCOLOR="#000000" CLASS="statTextBig">Application</TD>
		<TD VALIGN="middle" BGCOLOR="#000000" CLASS="statTextBig">Victor</TD>
		<TD VALIGN="middle" BGCOLOR="#000000" CLASS="statTextBig">Margin</TD>
	</TR>
	<TR>
		<TD HEIGHT="15" VALIGN="middle">Photoshop</TD>
		<TD VALIGN="middle">AMD</TD>
		<TD VALIGN="middle">13%</TD>
	</TR>
	<TR>
		<TD HEIGHT="15" VALIGN="middle">Illustrator</TD>
		<TD VALIGN="middle">AMD</TD>
		<TD VALIGN="middle">21%</TD>
	</TR>	
	<TR>
		<TD HEIGHT="15" VALIGN="middle">AutoCAD</TD>
		<TD VALIGN="middle">AMD</TD>
		<TD VALIGN="middle">25%</TD>
	</TR>
	<TR>
		<TD HEIGHT="15" VALIGN="middle">POV-Ray</TD>
		<TD VALIGN="middle">AMD</TD>
		<TD VALIGN="middle">35%</TD>
	</TR>	
	<TR>
		<TD HEIGHT="15" VALIGN="middle">Phase2</TD>
		<TD VALIGN="middle">AMD</TD>
		<TD VALIGN="middle">25%</TD>
	</TR>	
	<TR>
		<TD HEIGHT="15" VALIGN="middle">BrainMaker Pro</TD>
		<TD VALIGN="middle">AMD</TD>
		<TD VALIGN="middle">14%</TD>
	</TR>			
</TABLE>

<P>
As you can see, the Intel chip looses all of these tests - more expensive, hotter-running, and less efficient.  
The SysMark 2000 tests (below) were run using the same hardware.
</P>


<P>
<B>Benchmarks from SysMark 2000 (by BAPCo)</B>
</P>

<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#CCCCCC" WIDTH="100%" CLASS="bodyText">
	<TR>
		<TD HEIGHT="15" VALIGN="middle" BGCOLOR="#000000" CLASS="statTextBig">Application</TD>
		<TD VALIGN="middle" BGCOLOR="#000000" CLASS="statTextBig">Victor</TD>
		<TD VALIGN="middle" BGCOLOR="#000000" CLASS="statTextBig">Margin</TD>
	</TR>
	<TR>
		<TD HEIGHT="15" VALIGN="middle">Windows Media Encoder*</TD>
		<TD VALIGN="middle">Intel</TD>
		<TD VALIGN="middle">30%</TD>
	</TR>
	<TR>
		<TD HEIGHT="15" VALIGN="middle">Photoshop</TD>
		<TD VALIGN="middle">AMD</TD>
		<TD VALIGN="middle">10%</TD>
	</TR>	
	<TR>
		<TD HEIGHT="15" VALIGN="middle">Paradox</TD>
		<TD VALIGN="middle">AMD</TD>
		<TD VALIGN="middle">20%</TD>
	</TR>
	<TR>
		<TD HEIGHT="15" VALIGN="middle">Communicator</TD>
		<TD VALIGN="middle">AMD</TD>
		<TD VALIGN="middle">1%</TD>
	</TR>	
	<TR>
		<TD HEIGHT="15" VALIGN="middle">NaturallySpeaking</TD>
		<TD VALIGN="middle">Intel</TD>
		<TD VALIGN="middle">6%</TD>
	</TR>	
	<TR>
		<TD HEIGHT="15" VALIGN="middle">CorelDraw</TD>
		<TD VALIGN="middle">AMD</TD>
		<TD VALIGN="middle">38%</TD>
	</TR>
	<TR>
		<TD HEIGHT="15" VALIGN="middle">Bryce</TD>
		<TD VALIGN="middle">AMD</TD>
		<TD VALIGN="middle">13%</TD>
	</TR>				
</TABLE>

<P>
The Windows Media Encoder test is broken; WME does not detect some of the AMD's capabilities and it is 
therefore unfairly handicapped.  Otherwise, the AMD does quite well.  The Intel does manage to pull ahead 
in the NaturallySpeaking test; it excels at bandwidth-intensive tasks.  This is the Intel chip's one strength.  
It tends to excel at content creation as well.  One might visit the AnandTech review referenced below for more about this.
</P>

<P>
The SysMark 2002 tests tell a different story: AMD barely wins any.  BAPCo, which produces the SysMark suite, 
is more or less an Intel tool for distributing propaganda; there is BAPCo correspondence (a photo of one such 
letter appears in the relevant Van's Hardware article, as well as in various other places) sent from Intel's 
internal post office.  While the BAPCo-SysMark story certainly makes for interesting reading, it is beyond 
the scope of this article, which is focused on the products' performance.
</P>

<P>
Therefore, it becomes painfully obvious that the Athlon processor line is well ahead of the current Intel 
competition.  Some of the gaps (up to a 38% difference, in the SysMark 2000 CorelDraw test) are so large that 
the 2.8 gigahertz Pentium won't even stand a chance, much less the 2.5 gigahertz models that are currently 
in circulation.  Intel puts out the SysMarks and other such corrupt benchmarks to convince us otherwise; 
look at some third-party figures (as above) and decide for yourself.  Computers are expensive and your 
time should be occupied with coding; why pay more for an inferior product that'll only make you wait longer?
</P>


<P><B>References:</B></P>
<OL>
<LI>Van's Hardware <A HREF="http://www.vanshardware.com" CLASS="bodyText" TARGET="_blank">www.vanshardware.com</A><BR/>
<A HREF="http://www.vanshardware.com/reviews/2002/08/020821_AthlonXP2600/020821_AthlonXP2600.htm" CLASS="bodyText" TARGET="_blank">article 1</A><BR/>
<A HREF="http://www.vanshardware.com/reviews/2002/08/020822_AthlonXP2600/020822_AthlonXP2600.htm" CLASS="bodyText" TARGET="_blank">article 2</A>
</LI>
<LI>
OC Workbench <A HREF="http://www.ocworkbench.com" CLASS="bodyText" TARGET="_blank">www.ocworkbench.com</A><BR/>
<A HREF="http://www.ocworkbench.com/2002/intel/p42.8g/p42.8gp2.htm" CLASS="bodyText" TARGET="_blank">http://www.ocworkbench.com/2002/intel/p42.8g/p42.8gp2.htm</A>
</LI>
<LI>
AnandTech <A HREF="http://www.anandtech.com" CLASS="bodyText" TARGET="_blank">www.anandtech.com</A><BR/>
<A HREF="http://www.anandtech.com/cpu/showdoc.html?i=1685" CLASS="bodyText" TARGET="_blank">http://www.anandtech.com/cpu/showdoc.html?i=1685</A>
</LI>

</OL>

<IMG SRC="/i/m/RevenantChaos_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;RevenantChaos<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=295939" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
      
<P><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">Would you like to write a feature?</A></P>
						</TD></TR>                                                                 
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
		<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="pr_right_col"/>       
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

