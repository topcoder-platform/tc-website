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
              <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/index?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_banner_white.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
            </TR> -->          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 3 Summary</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">

<P><IMG SRC="/i/2002tccc/tourney_photo4.jpg" ALT="" WIDTH="200" HEIGHT="450" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>Room 3 - malpt Continues West Coast Supremacy!</B></FONT><BR/><BR/>
<!-- <I>subhead goes here</I><BR/><BR/> -->
Friday, April 19, 2002<BR/>
By&#160;Adam Loss,<I>TopCoder Staff Writer</I><BR/>
</P>
<!-- <A HREF="/index?t=statistics&amp;c=2002tccc_cind#" CLASS="bodyGeneric"></A>
<A HREF="/index?t=statistics&amp;c=2002tccc_favs#" CLASS="bodyGeneric"></A>
<A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#" CLASS="bodyGeneric"></A>
<IMG SRC="/i/2002tccc/tourney_photo2.jpg" ALT="" WIDTH="200" HEIGHT="450" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<IMG SRC="/i/2002tccc/coder_quote2.gif" ALT="" WIDTH="140" HEIGHT="140" ALIGN="right" HSPACE="10" VSPACE="3" BORDER="0"/> -->


<P>
As the music of The Pretenders played to open the 3pm round of the 2002 Sun Microsystems and 
TopCoder Collegiate Challenge, all four coders hoped they would end the match known as a 
<IMG SRC="/i/2002tccc/coder_quote4.gif" ALT="" WIDTH="140" HEIGHT="140" ALIGN="right" HSPACE="10" VSPACE="3" BORDER="0"/>
"contender", rather than a "pretender".
</P>

<P>
Even though local favorite <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#milhouse" CLASS="bodyGeneric">milhouse</A>, an MIT graduate student, recovered from his food 
poisoning experience and had a larger cheering section, Cal-Berkeley's <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#malpt" CLASS="bodyGeneric">malpt</A>, who 
attended MIT as an undergraduate, and whose girlfriend still attends MIT and was in 
attendance, earned 845.81 final points and a spot in Saturday's final.
</P>

<P>
"I'm relieved," said <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#malpt" CLASS="bodyGeneric">malpt</A>, when asked about he felt after the match, and who 
showed the most emotion of any winner so far today by raising his hands in victory.  
When asked about his competition in the finals, which includes perennial TopCoder 
tournament finalist <A HREF="/index?t=statistics&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A>, <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#malpt" CLASS="bodyGeneric">malpt</A> remarked, "I beat him in the Regional Finals, 
so I'm not scared."
</P>

<P>
All four coders opened the Level One problem first.  <A HREF="/index?t=statistics&amp;c=2002tccc_cind#po" CLASS="bodyGeneric">po</A> was the first competitor to 
complete it and gained 230.04 points.  The three others, almost sensing that <A HREF="/index?t=statistics&amp;c=2002tccc_cind#po" CLASS="bodyGeneric">po</A> had 
just submitted, all finished their codes in the next few minutes.  <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#malpt" CLASS="bodyGeneric">malpt</A> earned 228.66 
points, <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#milhouse" CLASS="bodyGeneric">milhouse</A> gained 221.02, while <A HREF="/index?t=statistics&amp;c=2002tccc_cind#ante" CLASS="bodyGeneric">ante</A> was awarded 218.60.  
</P>

<P>
Coding by degree of difficulty, all four next opened the Level Two problem.  <A HREF="/index?t=statistics&amp;c=2002tccc_cind#ante" CLASS="bodyGeneric">ante</A>, 
who as just mentioned earned the lowest point total on the Level One problem, was 
the quickest to code the Level Two problem, earning 326.39 points.  <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#malpt" CLASS="bodyGeneric">malpt</A>, with 
317.48 points, once again had the second highest point total for a problem.  
<A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#milhouse" CLASS="bodyGeneric">milhouse</A> was the third quickest with 298.75, while <A HREF="/index?t=statistics&amp;c=2002tccc_cind#po" CLASS="bodyGeneric">po</A> gained 238.07.  When asked 
about being the slowest to code the Level Two problem, after being the quickest to 
code the Level One problem, <A HREF="/index?t=statistics&amp;c=2002tccc_cind#po" CLASS="bodyGeneric">po</A> simply replied, "I just w<A HREF="/index?t=statistics&amp;c=2002tccc_cind#ante" CLASS="bodyGeneric">ante</A>d to be careful."
</P>

<P>
<A HREF="/index?t=statistics&amp;c=2002tccc_cind#ante" CLASS="bodyGeneric">ante</A> and <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#malpt" CLASS="bodyGeneric">malpt</A> were the only two coders to submit code for the Level Three problem.  
<A HREF="/index?t=statistics&amp;c=2002tccc_cind#ante" CLASS="bodyGeneric">ante</A> earned 612.34 points on that problem, for a total of 1157.34 overall, and the 
room lead after the "Coding Phase".  <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#malpt" CLASS="bodyGeneric">malpt</A> was second with 1074.47 points, after 
gaining 528.33 points on the Level Three problem.  <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#milhouse" CLASS="bodyGeneric">milhouse</A> and <A HREF="/index?t=statistics&amp;c=2002tccc_cind#po" CLASS="bodyGeneric">po</A> were third and 
fourth, with 519.77 and 468.11 points, respectively.
</P>

<P>
During the "Challenge Phase", <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#milhouse" CLASS="bodyGeneric">milhouse</A> lost 50 points when his challenge of the 
Level Two submission of <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#malpt" CLASS="bodyGeneric">malpt</A> failed.  <A HREF="/index?t=statistics&amp;c=2002tccc_cind#po" CLASS="bodyGeneric">po</A> then changed the entire complexion of 
the match, when his successful challenge of the Level Three submission of <A HREF="/index?t=statistics&amp;c=2002tccc_cind#ante" CLASS="bodyGeneric">ante</A>, 
cost <A HREF="/index?t=statistics&amp;c=2002tccc_cind#ante" CLASS="bodyGeneric">ante</A> the 612.34 points he earned on the problem, and dropped him from first 
to second place overall.  <A HREF="/index?t=statistics&amp;c=2002tccc_cind#ante" CLASS="bodyGeneric">ante</A> then tried to put himself back in contention, by 
trying to challenge the Level Three submission of <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#malpt" CLASS="bodyGeneric">malpt</A>, who was now the room leader.  
That challenge failed, however, and cost <A HREF="/index?t=statistics&amp;c=2002tccc_cind#ante" CLASS="bodyGeneric">ante</A> an additional 50 points.   
</P>

<P>
After the "Challenge Phase", the point totals were as follows: <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#malpt" CLASS="bodyGeneric">malpt</A> (1074.47), <A HREF="/index?t=statistics&amp;c=2002tccc_cind#po" CLASS="bodyGeneric">po</A> 
(518.11), <A HREF="/index?t=statistics&amp;c=2002tccc_cind#ante" CLASS="bodyGeneric">ante</A> (495.00), and <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#milhouse" CLASS="bodyGeneric">milhouse</A> (469.77). 
</P>

<P>
The Level One submission of <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#malpt" CLASS="bodyGeneric">malpt</A> and the Level Two submission of <A HREF="/index?t=statistics&amp;c=2002tccc_cind#ante" CLASS="bodyGeneric">ante</A> were the 
only submissions to fail the system test.
</P>

          </TD>
            </TR>
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
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR301')"><IMG SRC="/i/2002tccc/SFR301_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR302')"><IMG SRC="/i/2002tccc/SFR302_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR303')"><IMG SRC="/i/2002tccc/SFR303_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR304')"><IMG SRC="/i/2002tccc/SFR304_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR305')"><IMG SRC="/i/2002tccc/SFR305_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR306')"><IMG SRC="/i/2002tccc/SFR306_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR307')"><IMG SRC="/i/2002tccc/SFR307_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR308')"><IMG SRC="/i/2002tccc/SFR308_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR309')"><IMG SRC="/i/2002tccc/SFR309_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR310')"><IMG SRC="/i/2002tccc/SFR310_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR311')"><IMG SRC="/i/2002tccc/SFR311_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR312')"><IMG SRC="/i/2002tccc/SFR312_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A> 
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR313')"><IMG SRC="/i/2002tccc/SFR313_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR314')"><IMG SRC="/i/2002tccc/SFR314_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A> 
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


