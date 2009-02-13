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
  <xsl:with-param name="title">&#160;Room&#160;4:&#160;Summary&#160;&amp;&#160;Photos</xsl:with-param>
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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 4 Summary</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">

<P><IMG SRC="/i/2002tccc/tourney_photo5.jpg" ALT="" WIDTH="200" HEIGHT="450" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>Room 4 - Go Joe!</B></FONT><BR/>
<I>3 from the West and 1 from the Midwest Advance to the Finals.</I><BR/><BR/>
Friday, April 19, 2002<BR/>
By&#160;Adam Loss,<I>TopCoder Staff Writer</I><BR/>
</P>
<!-- <A HREF="/index?t=statistics&amp;c=2002tccc_cind#" CLASS="bodyGeneric"></A>
<A HREF="/index?t=statistics&amp;c=2002tccc_favs#" CLASS="bodyGeneric"></A>
<A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#" CLASS="bodyGeneric"></A>
<IMG SRC="/i/2002tccc/tourney_photo2.jpg" ALT="" WIDTH="200" HEIGHT="450" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<IMG SRC="/i/2002tccc/coder_quote2.gif" ALT="" WIDTH="140" HEIGHT="140" ALIGN="right" HSPACE="10" VSPACE="3" BORDER="0"/> -->


<P>
Three is a very popular number in the 2002 Sun Microsystems and TopCoder Collegiate Challenge.  
It was easy to determine that out of the 16 semifinalists, there were three competitors each 
<IMG SRC="/i/2002tccc/coder_quote5.gif" ALT="" WIDTH="140" HEIGHT="140" ALIGN="right" HSPACE="10" VSPACE="3" BORDER="0"/>
from Stanford University and the California Institute of Technology.  Through the first three 
rounds, one student each from those schools, <A HREF="/index?t=statistics&amp;c=2002tccc_cind#derkuci" CLASS="bodyGeneric">derkuci</A> from Cal Tech and <A HREF="/index?t=statistics&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A> from Stanford, 
has advanced to the finals.  What wasn't common knowledge, however, was that there was another 
group of three involved in the tournament, the contingent from the state of Michigan.  
<A HREF="/index?t=statistics&amp;c=2002tccc_favs#DjinnKahn" CLASS="bodyGeneric">DjinnKahn</A> is a student at the University of Michigan, <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#milhouse" CLASS="bodyGeneric">milhouse</A> is a Michigan resident, 
and the 6pm round winner, <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A>, is a student at Michigan Tech.  Following the pattern 
set by <A HREF="/index?t=statistics&amp;c=2002tccc_cind#derkuci" CLASS="bodyGeneric">derkuci</A> and <A HREF="/index?t=statistics&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A>, who were the one member of their groups of three to advance 
to the finals, <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A> seemed destined to make the finals, after <A HREF="/index?t=statistics&amp;c=2002tccc_favs#DjinnKahn" CLASS="bodyGeneric">DjinnKahn</A> and <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#milhouse" CLASS="bodyGeneric">milhouse</A> were 
eliminated earlier in the day.
</P>

<P>
The 6pm round turned out to be the closest match of the day, with <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A> surviving the 
failure of his Level One and Two problems to advance to the finals with 510.29 final 
points.  <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A>, who was the second seed in the MidWest at the beginning of the Collegiate 
Challenge, is the only finalist who is not from the West Region.
</P>

<P>
"Surprised and ecstatic" were the first words <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A> used when asked to describe how he felt 
about advancing to the finals.  "However, I am a little nervous about the finals," added <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A>.  
"Matching up against the likes of TopCoder veterans <A HREF="/index?t=statistics&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A> and <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#malpt" CLASS="bodyGeneric">malpt</A> will be quite a challenge."
</P>

<P>
<A HREF="/index?t=statistics&amp;c=2002tccc_favs#ZorbaTHut" CLASS="bodyGeneric">ZorbaTHut</A>, 
the Northeast Regional Champion, actually would have won the match 
had he not attempted an ill-fated challenge.  Entering the "Challenge Phase" with 
525.69 points from his Level One and Two submissions, which would eventually pass the 
system test, <A HREF="/index?t=statistics&amp;c=2002tccc_favs#ZorbaTHut" CLASS="bodyGeneric">ZorbaTHut</A> 
attempted to challenge the Level One submission of <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A>, which he 
noticed had been submitted with only seconds left in the "Coding Phase".  <A HREF="/index?t=statistics&amp;c=2002tccc_favs#ZorbaTHut" CLASS="bodyGeneric">ZorbaTHut</A> 
ended up being unsuccessful in his challenge, thereby losing 50 points.  That one move 
has cost <A HREF="/index?t=statistics&amp;c=2002tccc_favs#ZorbaTHut" CLASS="bodyGeneric">ZorbaTHut</A> anywhere from $4,000 to $99,000 he could have additionally won in the 
finals, since the Level One and Two submissions of <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A> ended up failing the system test, 
leaving him with just the 510.29 points he earned on the Level Three problem.  Had 
<A HREF="/index?t=statistics&amp;c=2002tccc_favs#ZorbaTHut" CLASS="bodyGeneric">ZorbaTHut</A> not challenged the Level One submission of <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A>, he would have won the room 
by 15.40 points, 525.69 to 510.29.  Instead of advancing to the finals, 
<A HREF="/index?t=statistics&amp;c=2002tccc_favs#ZorbaTHut" CLASS="bodyGeneric">ZorbaTHut</A> 
finished third with 475.60 points.  <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#Wasteland" CLASS="bodyGeneric">Wasteland</A> successfully coded the Level One and 
Two problems for 489.35 points and a second place finish, while evd earned 449.66 
points, also from successfully coding the Level One and Two problems. 
</P>

<P>
"I thought there was a bug and thought it was a good idea at the time," said <A HREF="/index?t=statistics&amp;c=2002tccc_favs#ZorbaTHut" CLASS="bodyGeneric">ZorbaTHut</A>, 
when asked about his unsuccessful challenge.   "Looking at it now, I see that I didn't 
need to do anything."
</P>
          </TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><A NAME="photo"></A></TD>
            </TR>          
            
          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 4 Photos</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR401')"><IMG SRC="/i/2002tccc/SFR401_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR402')"><IMG SRC="/i/2002tccc/SFR402_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR403')"><IMG SRC="/i/2002tccc/SFR403_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR404')"><IMG SRC="/i/2002tccc/SFR404_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR405')"><IMG SRC="/i/2002tccc/SFR405_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR406')"><IMG SRC="/i/2002tccc/SFR406_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR407')"><IMG SRC="/i/2002tccc/SFR407_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR408')"><IMG SRC="/i/2002tccc/SFR408_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR409')"><IMG SRC="/i/2002tccc/SFR409_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR410')"><IMG SRC="/i/2002tccc/SFR410_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR411')"><IMG SRC="/i/2002tccc/SFR411_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR412')"><IMG SRC="/i/2002tccc/SFR412_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A> 
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR413')"><IMG SRC="/i/2002tccc/SFR413_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A> 
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


