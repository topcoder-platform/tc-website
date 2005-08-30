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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm93_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" CLASS="bodyText">Editorial Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm93_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm93_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
       <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm93_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
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
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<P><B>Single Round Match 93</B><BR/>
May 30, 2002</P>
<P><B>Room 1 Review</B></P>

    <b>Coding Phase</b>
  <p>
            The Coding Phase begain as usual, with everybody starting on the Level 1 problem
            except for <b>dmwright</b>, who began with his regular strategy of starting
            on the Level 2 problem.  <b>doeth</b>, <b>John Dehtridge</b>,
            and <b>reid</b> did not start until over five minutes into the contest.
        </p>
  <p>
            Twenty seconds after <b>reid</b> opened the Level 1 problem,
            <b>SnapDragon</b> made the first submission, for 286.08 points.
            <b>ZorbaTHut</b> followed close behind with 281.42 points
            Next in line for Level 1 submissions were (in order of scores rather
            than chronology):
            <b>John Dethridge</b> (283.46 points);
            <b>malpt</b>;
            <b>doeth</b>;
            <b>venco</b>;
            and <b>ambrose</b>.
            At this point in time, this left <b>dmwright</b> and <b>reid</b> without
            any submissions yet.
        </p>
  <p>
            <b>SnapDragon</b> also made the first submission of the Level 2 problem,
            submitting his solution at the 18 minute mark for 437.76 points.  This was
            shortly followed by <b>reid</b>'s relatively poor showing of 252.74 points for
            the Level 1 problem.  Next in line for Level 2 submissions were (in order of score again):
            <b>malpt</b>;
            <b>reid</b>;
            <b>ambrose</b>;
            <b>doeth</b>;
            <b>John Dethridge</b>;
            <b>ZorbaTHut</b>;
            <b>venco</b>;
            <b>and far behind, dmwright, for a mere 260.05 points</b>.
            At this point everyone had solutions for the Level 1 and Level 2 problems except for <b>dmwright</b>.
        </p>
  <p>
            The Level 3 problem proved especially difficult.  <b>ZorbaTHut</b> had the quickest time,
            spending 35 minutes on the problem for 521.33 points.  <b>SnapDragon</b> had the next
            submission, for 435.33.
            With three minutes remaining, <b>reid</b> submitted his Level 3 solution for 481.55 points,
            and <b>dmwright</b> submitted his Level 1 solution for 260.05 points.
        </p>
  <p>
        At the end of the Coding Phase, the scores were:
    </p>
  <ol>
    <li>
      <b>ZorbaTHut</b>
            - 1161.94</li>
    <li>
      <b>reid</b>
            - 1160.36</li>
    <li>
      <b>SnapDragon</b>
            - 1159.17</li>
    <li>
      <b>malpt</b>
            - 706.80</li>
    <li>
      <b>John Dethridge</b>
            - 667.77</li>
    <li>
      <b>doeth</b>
            - 659.65</li>
    <li>
      <b>ambrose</b>
            - 652.55</li>
    <li>
      <b>venco</b>
            - 568.59</li>
    <li>
      <b>dmwright</b>
            - 557.80</li>
  </ol>

    <b>Challenge Phase</b>
  <p>
        The first challenge of the night came from <b>dmwright</b> against
        <b>SnapDragon</b>.  <b>dmwright</b> successfully challenged <b>SnapDragon</b>'s
        Level 1 problem with a test case with repeated values for the purchased tickets.
        <b>SnapDragon</b> obviously did not test his solution on all the sample cases, else he would have
        caught this simple mistake.  <b>dmwright</b> then lost the 50 points he had just gained by
        unsuccessfully challenging <b>ambrose</b>'s Level 1 problem with a similar test case.
        Unfortunately <b>dmwright</b> made a minor mistake in constructing his test case, accidentally
        building a case for which <b>ambrose</b>'s flawed solution actually succeeds.
        </p>
  <p>
        <b>venco</b> was next to pick on <b>ambrose</b>, attacking his Level 2 problem.
        Perhaps <b>venco</b> actually spotted <b>ambrose</b>'s mistake, but if so, he failed
        to form a good test case to exploit it, because his challenge failed.
        The last challenge came from <b>John Dethridge</b>, who succeeded against <b>ambrose</b>'s
        Level 1 problem where <b>dmwright</b> had failed.
        </p>
  <p>
        At the end of the Challenge Phase, the scores were:
    </p>
  <ol>
    <li>
      <b>ZorbaTHut</b>
            - 1161.94</li>
    <li>
      <b>reid</b>
            - 1160.36</li>
    <li>
      <b>SnapDragon</b>
            - 873.09</li>
    <li>
      <b>John Dethridge</b>
            - 717.77</li>
    <li>
      <b>malpt</b>
            - 706.80</li>
    <li>
      <b>doeth</b>
            - 659.65</li>
    <li>
      <b>dmwright</b>
            - 557.80</li>
    <li>
      <b>venco</b>
            - 518.59</li>
    <li>
      <b>ambrose</b>
            - 393.00</li>
  </ol>

    <b>System Test Phase</b>
  <p>Three submissions failed to pass all of the system tests.  As alluded to before, <b>ambrose</b>'s
        Level 2 submission was flawed, due to a mistake in <b>ambrose</b>'s treatment of aces.
        <b>dmwright</b>'s Level 1 problem, like <b>SnapDragon</b>'s and <b>ambrose</b>'s,
        failed to address duplicate purchases properly (which perhaps explains why he was first to spot the same
        mistake in the submissions of others).
        Finally, <b>ZorbaTHut</b>'s Level 2 submission failed due to a very obscure fence-post error.
        </p>
  <b>Final Results</b>
  <ol>
    <li>
      <b>reid</b>
            - 1160.36</li>
    <li>
      <b>SnapDragon</b>
            - 873.09</li>
    <li>
      <b>ZorbaTHut</b>
            - 802.75</li>
    <li>
      <b>John Dethridge</b>
            - 717.77</li>
    <li>
      <b>malpt</b>
            - 706.80</li>
    <li>
      <b>doeth</b>
            - 659.65</li>
    <li>
      <b>venco</b>
            - 518.59</li>
    <li>
      <b>dmwright</b>
            - 297.75</li>
    <li>
      <b>ambrose</b>
            - 0.00</li>
  </ol>
  
<IMG SRC="/i/m/Logan_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;Logan<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=112902" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
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
    <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
      <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- <A HREF="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm92"><IMG SRC="/i/motorola_sidebar.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A> -->
<A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=srm91_room1','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
<BR/>
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


