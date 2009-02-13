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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm98_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" CLASS="bodyText">Editorial Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm98_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm98_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
       <!-- <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm98_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
         <TD VALIGN="top" CLASS="bodyText">&#160;</TD>
      </TR> -->
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<P><B>Single Round Match 98</B><BR/>
June 19, 2002</P>
<P><B>Room 1 Review</B></P>

<B>Coding Phase</B>
<p>
            The first six submissions came rather close together at around the eight minute mark.
            <B>derkuci</B>, <B>Yarin</B>, <B>John Dethridge</B>, <B>bigg_nate</B>,
            <B>SnapDragon</B>, and <B>DjinnKahn</B> all submitted a solution for the Level 1
            problem for approximately 180-190 points each.  <B>malpt</B> and <B>jonmac</B>
            followed not too far behind with their Level 1 submissions shortly thereafter.
        </p>
<p>
            Almost immediately after <B>jonmac</B>'s Level 1 submission, <B>Yarin</B> and
            <B>bigg_nate</B> each submitted a Level 2 submission, giving <B>Yarin</B> the lead.
            Four more submissions followed closely behind, within a span of thirty seconds:
            <B>malpt</B>, <B>derkuci</B>, <B>DjinnKahn</B>, and <B>SnapDragon</B>.
            Four minutes followed before <B>jonmac</B> submitted his Level 2 submission.
        </p>
<p>
            Things were quiet for the next eight minutes, until <B>John Dethridge</B> became the first
            to submit a solution for the Level 3 problem.  A minute later and <B>dmwright</B> finally submitted
            his first submission (he had not started until nearly 18 minutes into the contest, however).
            <B>SnapDragon</B> was next to finish the Level 3 problem, managing to get over 40 more points than <B>John Dethridge</B>
            on his Level 3 submission.  As <B>SnapDragon</B> was the first coder to complete all three problems, he immediately took
            over the lead.
            <B>John Dethridge</B> responded by quickly submitting a solution to the Level 2 problem faster than <B>SnapDragon</B>
            had earlier, but this was not sufficient to recover the lead.
        </p>
<p>
            Ten minutes followed before <B>bigg_nate</B>, the next coder to complete the problem set, submitted his
            solution to the Level 3 problem.  This was shortly followed by <B>dmwright</B>'s second submission of
            the match, which was also for the Level 3 problem.  At this point, <B>John Dethridge</B> found a mistake
            in his Level 3 submission, and was forced to resubmit it, knocking a devastating 441 points off of his score.
        </p>
<p>
            <B>malpt</B> was fourth to finish the problem set, followed by <B>Yarin</B> and <B>dmwright</B> five minutes later.
            However, <B>malpt</B> was unsatisfied with his solution to the Level 1 problem and resubmitted it,
            earning only 60 points for that problem.  At the end of the contest, <B>jonmac</B> was the only coder to not
            complete the entire problem set.
        </p>
<p>
        At the end of the Coding Phase, the scores were:
    </p>
<ol>
  <li>
    <B>SnapDragon</B>
            - 1398.97</li>
  <li>
    <B>dmwright</B>
            - 1285.84</li>
  <li>
    <B>bigg_nate</B>
            - 1204.10</li>
  <li>
    <B>Yarin</B>
            - 1056.25</li>
  <li>
    <B>DjinnKahn</B>
            - 1027.53</li>
  <li>
    <B>malpt</B>
            - 977.47</li>
  <li>
    <B>John Dethridge</B>
            - 973.70</li>
  <li>
    <B>derkuci</B>
            - 946.24</li>
  <li>
    <B>jonmac</B>
            - 599.39</li>
</ol>
<B>Challenge Phase</B>
<p>
            <B>malpt</B> challenged <B>SnapDragon</B>'s Level 1 submission approximately one minute into
            the Challenge Phase.  <B>SnapDragon</B> made the common mistake of simulating contestants challenging
            themselves.  <B>derkuci</B> challenged <B>jonmac</B>'s Level 1 submission approximately five minutes
            into the Challenge Phase, for the exact same mistake.  A few minutes later <B>SnapDragon</B> spotted the
            same error in <B>DjinnKahn</B>'s Level 1 submission, earning back some of the points he lost earlier.
        </p>
<p>
            The first challenge of a Level 3 submission came from <B>bigg_nate</B>, against <B>DjinnKahn</B>'s submission.
            <B>John Dethridge</B> was next, successfully challenging <B>Yarin</B>'s Level 3 submission.
            <B>bigg_nate</B> then attempted to challenge <B>derkuci</B>'s Level 3 submission to close the Challenge Phase,
            but was unsuccessful, thus losing the 50 points he had earned from the previous challenge.
        </p>
<p>
        At the end of the Challenge Phase, the scores were:
    </p>
<ol>
  <li>
    <B>dmwright</B>
            - 1285.84</li>
  <li>
    <B>SnapDragon</B>
            - 1269.13</li>
  <li>
    <B>bigg_nate</B>
            - 1204.10</li>
  <li>
    <B>malpt</B>
            - 1027.47</li>
  <li>
    <B>John Dethridge</B>
            - 1023.70</li>
  <li>
    <B>derkuci</B>
            - 996.24</li>
  <li>
    <B>Yarin</B>
            - 621.58</li>
  <li>
    <B>DjinnKahn</B>
            - 428.39</li>
  <li>
    <B>jonmac</B>
            - 423.50</li>
</ol>
<B>System Test Phase</B>
<p>
            Who would win money in this match was still very much in question as the contest ended.
            <B>dmwright</B> lead with 1285.84 points, but was followed very closely by <B>SnapDragon</B> with 1269.13 points
            and <B>bigg_nate</B> with 1204.10 points.  <B>malpt</B> and <B>John Dethridge</B> each also had a chance,
            with scores of 1027.47 and 1023.70 respectively.  It would come down to who had made the fewest mistakes
            that had not been caught in the Challenge Phase.
        </p>
<p>
            <B>dmwright</B>, the apparent leader, was hit hardest by the system tests, failing the Level 3 problem which had made up
            the majority of his points.  <B>derkuci</B> lost two submissions, his Level 1 and Level 3, but still lost fewer points
            than <B>dmwright</B>.  <B>malpt</B> also lost his Level 3 submission, which made up nearly half his points.
            And <B>John Dethridge</B>, despite his care in resubmitting his solution to the Level 3 problem, still failed, losing
            a little over a third of his points.
        </p>
<p>
            After it was all over, <B>bigg_nate</B> remained the only coder in 
        Room 1 to get all three problems correct.
            However, his excellent performance was not sufficient to win first place.
            Because he was overall the fastest coder, and was able to successfully challenge a problem, <B>SnapDragon</B> was able
            to maintain a high enough score to win the room, despite losing his Level 1 submission.  This performance propelled
            <B>SnapDragon</B> beyond the 3000 point rating barrier.  <B>John Dethridge</B> came in a distant third, beating
            <B>Yarin</B> by a challenge and a 0.13 points.
        </p>
<B>Final Results</B>
<ol>
  <li>
    <B>SnapDragon</B>
            - 1269.13</li>
  <li>
    <B>bigg_nate</B>
            - 1204.10</li>
  <li>
    <B>John Dethridge</B>
            - 671.65</li>
  <li>
    <B>Yarin</B>
            - 621.58</li>
  <li>
    <B>dmwright</B>
            - 590.65</li>
  <li>
    <B>malpt</B>
            - 545.84</li>
  <li>
    <B>derkuci</B>
            - 468.63</li>
  <li>
    <B>DjinnKahn</B>
            - 428.39</li>
  <li>
    <B>jonmac</B>
            - 423.50</li>
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
<A HREF="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm92"><IMG SRC="/i/motorola_sidebar1.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
<!-- <A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=srm91_room1','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A><BR/>
<A HREF="/index?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/></A> -->
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


