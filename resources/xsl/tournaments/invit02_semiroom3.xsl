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

<script Language="JavaScript">
  function changeImage(image, newImage) {
    document[image].src=newImage;
    return;
  }
</script>
     
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
  <xsl:with-param name="title">&#160;Room&#160;3:&#160;Summary&#160;&amp;&#160;Photos</xsl:with-param>
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
            <!-- <TR>
              <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/index?t=tournaments&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_banner_white.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
            </TR> -->          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 3 Summary</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<P><IMG SRC="/i/tournament/invit02/tourney_photo_SFR3.jpg" ALT="" WIDTH="200" HEIGHT="435" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>And the woman has her way!</B></FONT><BR/>
by MaryBeth Biondi, <I>TopCoder Staff</I><BR/>
Friday, November 22, 2002<BR/>
</P>

<P>
The answer to my last question has been answered in a resounding way - the surprises are 
anything but over.  In the biggest upset of the day, the lowest ranked coder onsite, 
<B>moira</B>, has overcome the odds and will be advancing to the finals for the chance to win $50,000.
</P>

<P>
This round seemed to possess particularly troublesome problem statements, and we 
unexpectedly saw <B>NDBronson</B> pass on the 300-point problem early on in the contest.  
<B>obfuscator</B> was the first to submit code 26 minutes into the coding phase, and earned 
himself 184.78 points.  He then employed dmwright's strategy by opening the 1000-point 
problem next.  <B>moira</B> followed close behind <B>obfuscator</B> by submitting her 300-point answer
 three minutes later for 171.79 points.  She, however, moved on to the 500-point problem. 
  34 minutes into the contest, <B>radeye</B> submitted his 300-point problem for 157.46 points, 
  and then also moved on to the 500-pointer.  Meanwhile, <B>NDBronson</B> continued diligently 
  coding the 500-point problem, which he finally submitted at 41 minutes for 291.29 points.
</P>

<P>
<B>moira</B> was the next to submit code 13 minutes later - her 500-point problem for 315.21 
points.  Having passed on the 1000-point problem, <B>obfuscator</B> submitted his 500-pointer
 for 270.31 points with only one minute to go in the contest.  At the end of the coding 
 phase, the first female ever to make it to the onsite finals had finished in first 
 place with 487 points.  Her boyfriend and referrer, <B>obfuscator</B>, was in second with 
 455.09.  <B>NDBronson</B> and <B>radeye</B> rounded out the field with 291.29 and 157.46, respectively.
</P>

<P>
Again the challenge phase produced no changes since no action was taken.  Tension 
mounted as the system tests were run.  Everyone wondered if either of the 500-point 
submissions would fail, allowing the once #1 ranked <B>NDBronson</B> to advance to the finals.
  But when the results were broadcast, we saw that all competitors had submitted flawless 
  code, and <B>moira</B> had stunned the crowd with an impressive victory!
</P>

<P>
One room remains.  Can <B>ZorbaTHut</B> make his third trip onsite a charm and advance to 
the finals?  Will <B>John Dethridge</B> get the chance to compete on Saturday against his
 rival, <B>SnapDragon</B>?  Or can <B>DjinnKahn</B> or <B>jms137</B> make it three upsets in a row?  
 If you haven't logged in to watch the action unfold live, now is the time!
</P>
 


          </TD>
            </TR>
          </TABLE>
                      
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">            
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><A NAME="photo"></A></TD>
            </TR>          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 3 Photos</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center">
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR301.jpg');"><IMG SRC="/i/tournament/invit02/SFR301_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR302.jpg');"><IMG SRC="/i/tournament/invit02/SFR302_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR303.jpg');"><IMG SRC="/i/tournament/invit02/SFR303_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR304.jpg');"><IMG SRC="/i/tournament/invit02/SFR304_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR305.jpg');"><IMG SRC="/i/tournament/invit02/SFR305_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
              <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" BGCOLOR="#000000">
	<TR>
		<TD><IMG SRC="/i/tournament/invit02/SFR301.jpg" NAME="bigVersion" WIDTH="432" HEIGHT="288" BORDER="0"/></TD>
	</TR>
</TABLE>
              <BR/></TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center">
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR306.jpg');"><IMG SRC="/i/tournament/invit02/SFR306_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR307.jpg');"><IMG SRC="/i/tournament/invit02/SFR307_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR308.jpg');"><IMG SRC="/i/tournament/invit02/SFR308_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/tournament/invit02/SFR309.jpg');"><IMG SRC="/i/tournament/invit02/SFR309_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
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


