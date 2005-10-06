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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm101_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" CLASS="bodyText">Editorial Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm101_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm101_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
       <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm101_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
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
<P><B>Single Round Match 101</B><BR/>
June 26, 2002</P>
<P><B>Rookie Review</B></P>

<b>Coding Phase</b>
<p>
            Only 20 rookies participated in SRM 101, distributed across three rooms.
            Of these 20, only six managed to submit solutions to all three problems.
        </p>
<p>
        At the end of the Coding Phase, the scores were:
    </p>
<ul>
            Room 60:
            <ol>
    <li>
      <b>Simon90210</b>
                    - 1260.33</li>
    <li>
      <b>JHui</b>
                    - 1134.95</li>
    <li>
      <b>mgm</b>
                    - 1069.50</li>
  </ol>
            Room 61:
            <ol>
    <li>
      <b>Merlin[Kyiv]</b>
                    - 1111.61</li>
    <li>
      <b>kirbyzhou</b>
                    - 1106.75</li>
  </ol>
            Room 62:
            <ol>
    <li>
      <b>jeffbadge</b>
                    - 1139.51</li>
  </ol>
</ul>
<b>Challenge Phase</b>
<p>
            Only one challenge occurred in Room 60.
            <b>JHui</b>, then in second place, challenged the leader at the time, <b>Simon90210</b>.
            His challenge of <b>Simon90210</b>'s Level 3 submission was unsuccessful, losing <b>JHui</b>
            50 points, but this did not change the relative rankings in Room 60 at all.
        </p>
<p>
            Room 61 saw a slightly more active Challenge Phase, with a total of three challenges occurring.
            Unfortunately, none of these challenges were successful.  <b>ishan_ritchie</b> was responsible
            for the first two challenges, first against <b>Merlin[Kyiv]</b>'s Level 3 submission and then
            against <b>skywalker</b>'s Level 1 submission.  <b>skywalker</b> submitted the third challenge,
            against <b>kirbyzhou</b>'s Level 3 submission.
        </p>
<p>
            There were a total of four challenges in Room 62.
            The first challenge was the only successful rookie challenge of the match.  This came from
            <b>cristi</b> against <b>jeffbadge</b>'s Level 3 submission.  About six minutes
            later, <b>mleveck</b> challenged <b>jeffbadge</b> and <b>d_sher</b>'s
            Level 1 submissions, but both challenges failed.  <b>d_sher</b> also tried a crack at
            <b>jeffbadge</b>'s Level 1 submission during the last minute of the Challenge Phase, but failed as well.
        </p>
<p>
        At the end of the Challenge Phase, the scores were:
    </p>
<ul>
            Room 60:
            <ol>
    <li>
      <b>Simon90210</b>
                    - 1260.33</li>
    <li>
      <b>JHui</b>
                    - 1084.95</li>
    <li>
      <b>mgm</b>
                    - 1069.50</li>
  </ol>
            Room 61:
            <ol>
    <li>
      <b>Merlin[Kyiv]</b>
                    - 1111.61</li>
    <li>
      <b>kirbyzhou</b>
                    - 1106.75</li>
  </ol>
            Room 62:
            <ol>
    <li>
      <b>cristi</b>
                    - 606.50</li>
    <li>
      <b>jeffbadge</b>
                    - 461.76</li>
  </ol>
</ul>
<b>System Test Phase</b>
<p>
            No rookie managed to get all three problems correct.
            Since only one submission was shown to be wrong in the Challenge Phase, there were many solutions invalidated
            by the system tests.
        </p>
<p>
            <b>Simon90210</b> was hit the hardest by the system tests.  Despite initially leading across all rookie
            rooms with over 1200 points, <b>Simon90210</b> lost credit for all three of his problems due to the system tests.
            This left the lead to <b>JHui</b> and <b>mgm</b>, each of which lost his Level 3 solution to the
            system tests.  <b>JHui</b> also lost his Level 1 submission, but <b>mgm</b> lost his Level 2 solution,
            leaving <b>JHui</b> ahead of <b>mgm</b>.
        </p>
<p>
            <b>Merlin[Kyiv]</b> was the only rookie to get the Level 3 problem right, losing only his Level 2 submission
            to the system tests.  <b>kirbyzhou</b> lost both his Level 2 and Level 3 problems, as well as the majority of his points.
        </p>
<p>
            Only two coders lost points in Room 62.  <b>d_sher</b>'s Level 2 submission failed, and <b>mleveck</b>'s
            Level 1 submission failed.  Since <b>mleveck</b> had two unsuccessful challenges during the Challenge Phase, this
            left him with a very unfortunate score of -100 points.
        </p>
<b>Final Results</b>
<ul>
            Room 60:
            <ol>
    <li>
      <b>JHui</b>
                    - 346.79</li>
    <li>
      <b>mgm</b>
                    - 211.34</li>
    <li>
      <b>denny</b>
                    - 195.54</li>
  </ol>
            Room 61:
            <ol>
    <li>
      <b>Merlin[Kyiv]</b>
                    - 666.30</li>
    <li>
      <b>ishan_ritchie</b>
                    - 531.16</li>
    <li>
      <b>skywalker</b>
                    - 428.64</li>
    <li>
      <b>kirbyzhou</b>
                    - 221.91</li>
    <li>
      <b>mickle</b>
                    - 206.47</li>
  </ol>
            Room 62:
            <ol>
    <li>
      <b>cristi</b>
                    - 606.50</li>
    <li>
      <b>jeffbadge</b>
                    - 461.76</li>
    <li>
      <b>d_sher</b>
                    - 122.10</li>
  </ol>
</ul>
<p>
                    All rookies that scored greater than zero points are listed above.  It is clear that Room 61 had the strongest performance,
                    with five out of the six coders that submitted problems getting positive scores, three of which were in the top five rookie
                    scores.  <b>Merlin[Kyiv]</b> is the winner with 666.30 points, mostly due to his correct submission of the Level 3 problem.
                    Nearly half of the rookies this match ended up with a score of zero or worse.
                </p>


<!-- <P>
At the time of this writing, it was not known to ZorbaTHut that jello (the
rookie winner) was disqualified from the match and future competitions for
cheating. Jello's results will not be found in the match results.
</P> -->

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
<!-- <A HREF="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm98"><IMG SRC="/i/motorola_sidebar1.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
<A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=srm91_room1','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A><BR/>
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


