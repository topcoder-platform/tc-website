<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>
  <xsl:import href="../includes/modules/2002tccc_seminav.xsl"/>    
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
<script Language="JavaScript">


function open_window(url) {
mywin =
window.open(url,"win",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=433,height=288');

}


</script>      
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
  <xsl:with-param name="title">&#160;Room&#160;1:&#160;Summary&#160;&amp;&#160;Photos</xsl:with-param>
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
              <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/index?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_banner_white.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
            </TR> -->          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 1 Summary</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<P><IMG SRC="/i/2002tccc/tourney_photo2.jpg" ALT="" WIDTH="200" HEIGHT="450" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>Room 1 - Upset City!</B></FONT><BR/>
<I>Well rested derkuci advances to finals.</I><BR/><BR/>
Friday, April 19, 2002<BR/>
By&#160;Adam Loss,<I>TopCoder Staff Writer</I><BR/>
</P>
<!-- <A HREF="/index?t=statistics&amp;c=2002tccc_cind#" CLASS="bodyGeneric"></A>
<A HREF="/index?t=statistics&amp;c=2002tccc_favs#" CLASS="bodyGeneric"></A>
<A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#" CLASS="bodyGeneric"></A> -->

<P>
While they yawned and wiped the sleep out from their eyes, the four coders in the 8am round of the 2002 Sun 
Microsystems and TopCoder Collegiate Challenge performed before a crowd reminiscent <IMG SRC="/i/2002tccc/coder_quote2.gif" ALT="" WIDTH="140" HEIGHT="140" ALIGN="right" HSPACE="10" VSPACE="3" BORDER="0"/>of a Montreal Expos home 
game, although the tension filled atmosphere provided as much passion as Game Seven of The World Series.
</P>

<P>
At about 9:50 am, everyone's eyes had cleared enough to see that Cal Tech's <A HREF="/index?t=statistics&amp;c=2002tccc_cind#derkuci" CLASS="bodyGeneric">derkuci</A> had pulled off a huge 

upset and advanced to Saturday's final with 600.27 final points.  <A HREF="/index?t=statistics&amp;c=2002tccc_cind#derkuci" CLASS="bodyGeneric">derkuci</A>, who began the competition as 
the 13th Seed in the West region, defeated <A HREF="/index?t=statistics&amp;c=2002tccc_favs#DjinnKahn" CLASS="bodyGeneric">DjinnKahn</A>
 (466.07 final points), who was the top-seed in the 
MidWest region and the Regional Champion, <A HREF="/index?t=statistics&amp;c=2002tccc_favs#ambrose" CLASS="bodyGeneric">ambrose</A> (180.11), the top-seed in Southeast region, and <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#zoidal" CLASS="bodyGeneric">zoidal</A> 
(93.30), the MidWest's second seed.
</P>

<P>
The competition started with all four coders opening the Level One problem.  After compiling and testing 
for over 20 minutes, <A HREF="/index?t=statistics&amp;c=2002tccc_favs#DjinnKahn" CLASS="bodyGeneric">DjinnKahn</A>
, followed minutes after by <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#zoidal" CLASS="bodyGeneric">zoidal</A>, stopped coding the Level One problem 
and opened the Level Two problem.  "It was just too tedious," said <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#zoidal" CLASS="bodyGeneric">zoidal</A>.  "I had already spent plenty 
of time on it, and needed to move on."  <A HREF="/index?t=statistics&amp;c=2002tccc_favs#ambrose" CLASS="bodyGeneric">ambrose</A> was the first to submit code for the Level One problem, 
and earned 180.11 points.  <A HREF="/index?t=statistics&amp;c=2002tccc_cind#derkuci" CLASS="bodyGeneric">derkuci</A> stuck with the problem for a long time and ended up earning 140.90.
</P>

<P>
Following suit, everyone next opened, compiled and submitted the Level Two problem.  <A HREF="/index?t=statistics&amp;c=2002tccc_favs#ambrose" CLASS="bodyGeneric">ambrose</A> was the 
quickest to submit and earned 476.36 points.  <A HREF="/index?t=statistics&amp;c=2002tccc_cind#derkuci" CLASS="bodyGeneric">derkuci</A> was the fourth to open the problem, but earned 
the second highest point total, 459.37.  <A HREF="/index?t=statistics&amp;c=2002tccc_favs#DjinnKahn" CLASS="bodyGeneric">DjinnKahn</A>
 earned 416.07 and <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#zoidal" CLASS="bodyGeneric">zoidal</A> earned 407.77.
</P>

<P>
All four coders had enough time to open the Level Three problem, but only <A HREF="/index?t=statistics&amp;c=2002tccc_favs#ambrose" CLASS="bodyGeneric">ambrose</A>, 491.61 points, 
and <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#zoidal" CLASS="bodyGeneric">zoidal</A>, 483.41, were able to submit their codes before the "Coding Phase" ended.  As a matter 
of fact, <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#zoidal" CLASS="bodyGeneric">zoidal</A> submitted his Level Three code with just seconds remaining.
</P>

<P>
At the end of the "Coding Phase", <A HREF="/index?t=statistics&amp;c=2002tccc_favs#ambrose" CLASS="bodyGeneric">ambrose</A> led with 1148.08 points.  He was followed by <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#zoidal" CLASS="bodyGeneric">zoidal</A> 
(984.48), <A HREF="/index?t=statistics&amp;c=2002tccc_cind#derkuci" CLASS="bodyGeneric">derkuci</A> (600.27), and <A HREF="/index?t=statistics&amp;c=2002tccc_favs#DjinnKahn" CLASS="bodyGeneric">DjinnKahn</A>
 (416.07).  
</P>

<P>
Although there was a lot of activity during the "Challenge Phase", the <A HREF="/index?t=statistics&amp;c=2002tccc_favs#DjinnKahn" CLASS="bodyGeneric">DjinnKahn</A>
 challenge of 
the Level Two submission of <A HREF="/index?t=statistics&amp;c=2002tccc_favs#ambrose" CLASS="bodyGeneric">ambrose</A> was the only success of the phase.  That challenge cost 
<A HREF="/index?t=statistics&amp;c=2002tccc_favs#ambrose" CLASS="bodyGeneric">ambrose</A> the 466.07 points he earned on that problem, and caused him to drop to second place.  
<A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#zoidal" CLASS="bodyGeneric">zoidal</A> was the leader heading to the "System Test Phase".
</P>

<P>
The Level One submissions of <A HREF="/index?t=statistics&amp;c=2002tccc_cind#derkuci" CLASS="bodyGeneric">derkuci</A>, <A HREF="/index?t=statistics&amp;c=2002tccc_favs#ambrose" CLASS="bodyGeneric">ambrose</A>, and <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#zoidal" CLASS="bodyGeneric">zoidal</A> all passed the system test.  <A HREF="/index?t=statistics&amp;c=2002tccc_cind#derkuci" CLASS="bodyGeneric">derkuci</A> 
also had his Level Two submission pass, as did <A HREF="/index?t=statistics&amp;c=2002tccc_favs#DjinnKahn" CLASS="bodyGeneric">DjinnKahn</A>
, but <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#zoidal" CLASS="bodyGeneric">zoidal</A> failed.  <A HREF="/index?t=statistics&amp;c=2002tccc_favs#ambrose" CLASS="bodyGeneric">ambrose</A> and <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#zoidal" CLASS="bodyGeneric">zoidal</A>, 
the only two to submit code for the Level Three problem, saw their codes fail.  "I thought my Level 
Two submission was right, but it ended up timing out," said <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#zoidal" CLASS="bodyGeneric">zoidal</A>.  "I knew my Level Three submission was wrong."
</P>

<P>
"I feel great," said <A HREF="/index?t=statistics&amp;c=2002tccc_cind#derkuci" CLASS="bodyGeneric">derkuci</A>.  "I brought my lap-top with me and last night went to the library 
and practiced two problems in the TopCoder practice rooms.  I then got a good nights rest to sleep 
off the jet lag.  I usually go to bed at 3 or 4am, but last night was in bed at 11pm."
</P>

          </TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><A NAME="photo"></A></TD>
            </TR>          
            
          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 1 Photos</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR101')"><IMG SRC="/i/2002tccc/SFR101_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR102')"><IMG SRC="/i/2002tccc/SFR102_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR103')"><IMG SRC="/i/2002tccc/SFR103_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR104')"><IMG SRC="/i/2002tccc/SFR104_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR105')"><IMG SRC="/i/2002tccc/SFR105_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR106')"><IMG SRC="/i/2002tccc/SFR106_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR107')"><IMG SRC="/i/2002tccc/SFR107_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR108')"><IMG SRC="/i/2002tccc/SFR108_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR109')"><IMG SRC="/i/2002tccc/SFR109_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR110')"><IMG SRC="/i/2002tccc/SFR110_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR111')"><IMG SRC="/i/2002tccc/SFR111_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>                  
          </TABLE>
          <P><br/></P>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>     
  <TR>
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>      
  <TR>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>   
  <TR>
    <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
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


